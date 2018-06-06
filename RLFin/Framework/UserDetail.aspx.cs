using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Plusii.iiWeb;
using System.Data;
using Plusii.iiWeb.Framework;
using System.Web.UI.HtmlControls;

namespace RLFin.Framework
{
    /// <summary>
    /// 用户详情
    /// </summary>
    public partial class UserDetail : iiDialog
    {
        #region 属性

        /// <summary>
        /// 当前ID
        /// </summary>
        private string CurrentID
        {
            get
            {
                object tempObject = ViewState["CurrentID"];
                return (tempObject != null) ? (string)tempObject : string.Empty;
            }
            set
            {
                ViewState["CurrentID"] = value;
            }
        }

        #endregion

        /// <summary>
        /// 页面加载
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                #region 验证权限

                #endregion

                #region 获取参数

                string id = Request.QueryString["ID"];
                if (id != null && id.Trim().Length != 0)
                {
                    this.CurrentID = id;
                }

                #endregion

                //初始化
                this.Initialize();
            }

            #region 页面标题

            this.Title = PageTitle.Text;

            #endregion

            #region 页面要素

            this.AssignDialogCallback(CancelButton, "'Close'", "window");

            #endregion
        }

        #region 初始化

        /// <summary>
        /// 初始化
        /// </summary>
        private void Initialize()
        {
            #region 页面内容

            //角色
            RoleSelector1.Initialize();

            #endregion

            if (this.CurrentID.Length == 0)
            {
                //新增
                Password.CssClass = "Required";
            }
            else
            {
                //编辑
                this.BindItem();
            }
        }

        #endregion

        #region 绑定数据

        /// <summary>
        /// 绑定项目
        /// </summary>
        private void BindItem()
        {
            DataRow user;
            using (iiUser userProvider = new iiUser())
            {
                user = userProvider.GetItem(this.CurrentID);
            }

            UID.Text = user["ID"].ToString().Trim();
            UID.Enabled = false;
            Name.Text = user["Name"].ToString();
            Remark.Text = user["Remark"].ToString();
            //角色
            RoleSelector1.RIDList = user["RIDList"].ToString();
            RoleSelector1.Enabled = (user["Status"].ToString().Trim() != "S");
        }

        #endregion

        #region 操作

        /// <summary>
        /// 确定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OKButton_Click(object sender, EventArgs e)
        {
            using (iiUser userProvider = new iiUser())
            {
                if (this.CurrentID.Length == 0)
                {
                    //新增
                    if (userProvider.GetItem(UID.Text) == null) //不存在
                    {
                        try
                        {
                            userProvider.Create(UID.Text, Name.Text, Password.Text, Remark.Text,
                                string.Empty, string.Empty, string.Empty, string.Empty, string.Empty,
                                RoleSelector1.RIDList
                                );
                        }
                        catch (Exception error)
                        {
                            this.ShowErrorMessage(this.GetGlobalResourceString("CreateErrorMessage") + error.Message);
                            return;
                        }
                    }
                    else
                    {
                        this.ShowWarningMessage(this.GetGlobalResourceString("ExistedErrorMessage"));
                        return;
                    }
                }
                else
                {
                    //编辑
                    try
                    {
                        if (Password.Text.Length != 0) //要修改密码
                        {
                            userProvider.Update(UID.Text, Password.Text);
                        }
                        userProvider.Update(UID.Text, Name.Text, Remark.Text,
                            string.Empty, string.Empty, string.Empty, string.Empty, string.Empty,
                            RoleSelector1.RIDList
                            );
                    }
                    catch (Exception error)
                    {
                        this.ShowErrorMessage(this.GetGlobalResourceString("UpdateErrorMessage") + error.Message);
                        return;
                    }
                }
            }
            //回调
            this.DialogCallback("'CloseRefresh'", "window");
        }

        #endregion
    }
}