using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RLFin.Common;
using RLFin.Models;
using System.Data;

namespace RLFin.Web
{
    public partial class FactoryEdit : LocalDialog
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
                    this.CurrentID = id.Trim();
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

            using (ContractProvider contProvider = new ContractProvider())
            {
                var area = contProvider.GetBaseParam("AR", "");
                LocalGlobal.BindListItems(avarea, area.DefaultView, "Description", "Description", true);
                var payType = contProvider.GetBaseParam("PY", "");
                LocalGlobal.BindListItems(avterm, payType.DefaultView, "Description", "Description", true);
                var tradeCond = contProvider.GetBaseParam("TC", "");
                LocalGlobal.BindListItems(avtrc, tradeCond.DefaultView, "Description", "Description", true);
                var curr = contProvider.GetBaseParam("CY", "");
                LocalGlobal.BindListItems(avcur, curr.DefaultView, "Description", "Description", true);
            }

            #endregion

            if (this.CurrentID.Length == 0)
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
            using (ContractProvider contProvider = new ContractProvider())
            {
                DataRow row = contProvider.GetFactoryByNo(this.CurrentID);
                if (row != null)
                {
                    avend.Text = row["avend"].ToString();
                    avnam.Text = row["avnam"].ToString();
                    avarea.SelectedValue = row["avarea"].ToString();
                    avprov.Text = row["avprov"].ToString();
                    avcoty.Text = row["avcoty"].ToString();
                    avadr1.Text = row["avadr1"].ToString();
                    avadr2.Text = row["avadr2"].ToString();
                    avadr3.Text = row["avadr3"].ToString();
                    avpon1.Text = row["avpon1"].ToString();
                    avpon2.Text = row["avpon2"].ToString();
                    avpon3.Text = row["avpon3"].ToString();
                    avfax1.Text = row["avfax1"].ToString();
                    avfax2.Text = row["avfax2"].ToString();
                    avctat.Text = row["avctat"].ToString();
                    avemai1.Text = row["avemai1"].ToString();
                    avemai2.Text = row["avemai2"].ToString();
                    avsalr.Text = row["avsalr"].ToString();
                    avterm.SelectedValue = row["avterm"].ToString();
                    avtrc.SelectedValue = row["avtrc"].ToString();
                    avcur.SelectedValue = row["avcur"].ToString();
                    avbank.Text = row["avbank"].ToString();
                    avacct.Text = row["avacct"].ToString();
                    avhyb.Text = row["avhyb"].ToString();
                    avtax.Text = row["avtax"].ToString();
                    atcod.Text = row["atcod"].ToString();
                }

            }
        }

        #endregion

        #region 操作

        /// <summary>
        /// 确定
        /// </summary>
        protected void OKButton_Click(object sender, EventArgs e)
        {
            using (ContractProvider contProvider = new ContractProvider())
            {
                if (this.CurrentID.Length == 0)
                {
                    //新增
                    try
                    {
                        int facNo = contProvider.GetMaxFactoryNo();

                        contProvider.InsertFactory(facNo.ToString(), avnam.Text, avarea.SelectedValue, avprov.Text, avcoty.Text, avadr1.Text, avadr2.Text, avadr3.Text, avpon1.Text, avpon2.Text, avpon3.Text, avfax1.Text, avfax2.Text, avemai1.Text, avemai2.Text, avctat.Text, avsalr.Text, avcur.SelectedValue, avterm.SelectedValue, avtrc.SelectedValue, avbank.Text, avacct.Text, atcod.Text, avhyb.Text, avtax.Text);
                    }
                    catch (Exception error)
                    {
                        this.ShowErrorMessage(this.GetGlobalResourceString("CreateErrorMessage") + error.Message);
                        return;
                    }
                }
                else
                {
                    //编辑
                    try
                    {
                        contProvider.UpdateFactory(this.CurrentID, avnam.Text, avarea.SelectedValue, avprov.Text, avcoty.Text, avadr1.Text, avadr2.Text, avadr3.Text, avpon1.Text, avpon2.Text, avpon3.Text, avfax1.Text, avfax2.Text, avemai1.Text, avemai2.Text, avctat.Text, avsalr.Text, avcur.SelectedValue, avterm.SelectedValue, avtrc.SelectedValue, avbank.Text, avacct.Text, atcod.Text, avhyb.Text, avtax.Text);
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