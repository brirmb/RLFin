using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Plusii.iiWeb;
using System.Data;
using Plusii.iiWeb.Framework;

namespace RLFin.Framework
{
    /// <summary>
    /// 配置详情
    /// </summary>
    public partial class ConfigDetail : iiDialog
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
        /// <summary>
        /// 当前代码
        /// </summary>
        private string CurrentKey
        {
            get
            {
                object tempObject = ViewState["CurrentKey"];
                return (tempObject != null) ? (string)tempObject : string.Empty;
            }
            set
            {
                ViewState["CurrentKey"] = value;
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
                else
                {
                    this.ShowErrorMessage(this.GetGlobalResourceString("InvalidParameterErrorMessage"));
                    return;
                }

                string key = Request.QueryString["Key"];
                if (key != null && key.Trim().Length != 0)
                {
                    this.CurrentKey = key;
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


            #endregion

            if (this.CurrentKey.Length == 0)
            {
                //新增
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
            DataRow config;
            using (iiConfig configProvider = new iiConfig())
            {
                config = configProvider.GetItem(this.CurrentID, this.CurrentKey);
            }

            Key.Text = config["Key"].ToString().Trim();
            Key.Enabled = false;
            Name.Text = config["Name"].ToString();
            Remark.Text = config["Remark"].ToString();
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
            using (iiConfig configProvider = new iiConfig())
            {
                if (this.CurrentKey.Length == 0)
                {
                    //新增
                    if (configProvider.GetItem(this.CurrentID, Key.Text) == null) //不存在
                    {
                        try
                        {
                            configProvider.Create(this.CurrentID, Key.Text, Name.Text, Remark.Text);
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
                        configProvider.Update(this.CurrentID, Key.Text, Name.Text, Remark.Text);
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