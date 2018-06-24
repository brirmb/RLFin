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
    public partial class CustomerEdit : LocalDialog
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
                LocalGlobal.BindListItems(rcarea, area.DefaultView, "Description", "Description", true);
                var payType = contProvider.GetBaseParam("PY", "");
                LocalGlobal.BindListItems(rcterm, payType.DefaultView, "Description", "Description", true);
                var tradeCond = contProvider.GetBaseParam("TC", "");
                LocalGlobal.BindListItems(rctrc, tradeCond.DefaultView, "Description", "Description", true);
                var curr = contProvider.GetBaseParam("CY", "");
                LocalGlobal.BindListItems(rccur, curr.DefaultView, "Description", "Description", true);
                var tax = contProvider.GetBaseParam("TX", "");
                LocalGlobal.BindListItems(rctax, tax.DefaultView, "Description", "Description", true);
                var sales = contProvider.GetBaseParam("CK", "");
                LocalGlobal.BindListItems(rcsalr, sales.DefaultView, "Description", "Description", true);
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
                DataRow row = contProvider.GetCustomerByNo(this.CurrentID);
                if (row != null)
                {
                    rccust.Text = row["rccust"].ToString();
                    rcnam.Text = row["rcnam"].ToString();
                    rcarea.SelectedValue = row["rcarea"].ToString();
                    rcprov.Text = row["rcprov"].ToString();
                    rccoty.Text = row["rccoty"].ToString();
                    rcadr1.Text = row["rcadr1"].ToString();
                    rcadr2.Text = row["rcadr2"].ToString();
                    rcadr3.Text = row["rcadr3"].ToString();
                    rcpon1.Text = row["rcpon1"].ToString();
                    rcpon2.Text = row["rcpon2"].ToString();
                    rcpon3.Text = row["rcpon3"].ToString();
                    rcfax1.Text = row["rcfax1"].ToString();
                    rcfax2.Text = row["rcfax2"].ToString();
                    rcctat.Text = row["rcctat"].ToString();
                    rcemai1.Text = row["rcemai1"].ToString();
                    rcemai2.Text = row["rcemai2"].ToString();
                    rcsalr.SelectedValue = row["rcsalr"].ToString();
                    rcterm.SelectedValue = row["rcterm"].ToString();
                    rctrc.SelectedValue = row["rctrc"].ToString();
                    rccur.SelectedValue = row["rccur"].ToString();
                    rcbank.Text = row["rcbank"].ToString();
                    rcacct.Text = row["rcacct"].ToString();
                    rchyb.Text = row["rchyb"].ToString();
                    rctax.SelectedValue = row["rctax"].ToString().PadLeft(2, '0');
                    rctcod.Text = row["rctcod"].ToString();
                    rccrd.Text = row["rccrd"].ToString();
                    rcgrad.Text = row["rcgrad"].ToString();
                    rcdflg.SelectedValue = row["rcdflg"].ToString();
                    rckind.Text = row["rckind"].ToString();
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
                if (!string.IsNullOrWhiteSpace(rccrd.Text.Trim()))
                {
                    decimal d = 0;
                    if (decimal.TryParse(rccrd.Text.Trim(), out d) == false)
                    {
                        this.ShowErrorMessage("信用额度错误,请重新输入!");
                        this.rccrd.Focus();
                        return;
                    }
                }

                if (this.CurrentID.Length == 0)
                {
                    //新增
                    try
                    {
                        int custNO = contProvider.GetMaxCustNo();

                        contProvider.InsertCustomer(custNO.ToString(), rcnam.Text, rctrc.SelectedValue, rcarea.SelectedValue, rcprov.Text, rccoty.Text, rcadr1.Text, rcadr2.Text, rcadr3.Text, rcpon1.Text, rcpon2.Text, rcpon3.Text, rcfax1.Text, rcfax2.Text, rcemai1.Text, rcemai2.Text, rcctat.Text, rcsalr.SelectedValue, rccur.SelectedValue, rcterm.SelectedValue, rcbank.Text, rcacct.Text, rctcod.Text, rccrd.Text, rchyb.Text, rcdflg.SelectedValue, rcgrad.Text, rckind.Text, rctax.SelectedValue);
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
                        contProvider.UpdateCustomer(this.CurrentID, rcnam.Text, rctrc.SelectedValue, rcarea.SelectedValue, rcprov.Text, rccoty.Text, rcadr1.Text, rcadr2.Text, rcadr3.Text, rcpon1.Text, rcpon2.Text, rcpon3.Text, rcfax1.Text, rcfax2.Text, rcemai1.Text, rcemai2.Text, rcctat.Text, rcsalr.SelectedValue, rccur.SelectedValue, rcterm.SelectedValue, rcbank.Text, rcacct.Text, rctcod.Text, rccrd.Text, rchyb.Text, rcdflg.SelectedValue, rcgrad.Text, rckind.Text, rctax.SelectedValue);
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