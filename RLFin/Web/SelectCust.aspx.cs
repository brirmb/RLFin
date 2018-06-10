using RLFin.Common;
using RLFin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace RLFin.Web
{
    public partial class SelectCust : LocalDialog
    {
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

                #endregion

                //初始化
                this.Initialize();
            }

            #region 页面标题

            this.Title = PageTitle.Text;

            #endregion

            #region 页面要素

            //this.AssignDialogCallback(CancelButton, "'Close'", "window");

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

            this.BindList();
        }

        #endregion

        #region 绑定数据

        private void BindList()
        {

            using (ContractProvider contProvider = new ContractProvider())
            {
                List.DataSource = contProvider.GetCustomerByName(Name.Text.Trim());
            }

            List.DataBind();
        }

        protected void List_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            List.SelectedIndex = -1;
            List.PageIndex = e.NewPageIndex;
            this.BindList();
        }
        protected void List_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                //数据行
                case DataControlRowType.DataRow:

                    #region 数据绑定

                    #endregion
                    break;

                case DataControlRowType.EmptyDataRow:
                case DataControlRowType.Header:
                case DataControlRowType.Separator:
                case DataControlRowType.Pager:
                case DataControlRowType.Footer:
                default:
                    break;
            }

        }

        #endregion

        #region 操作

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            this.BindList();
        }

        protected void OkButton_Click(object sender, EventArgs e)
        {
            string returnStr = string.Empty;

            //for (int i = 0; i < List.Rows.Count; i++)
            //{
            //    HtmlInputCheckBox rowCheckControl = (HtmlInputCheckBox)this.List.Rows[i].FindControl("RowCheck");

            //    if (rowCheckControl.Checked == true)
            //    {
            //        returnStr = List.Rows[i].Cells[1].Text.Trim() + "," + List.Rows[i].Cells[2].Text.Trim();
            //    }
            //}

            if (List.SelectedRow == null)
            {
                this.ShowErrorMessage("请选择客户");
                return;
            }
            returnStr = List.SelectedRow.Cells[1].Text.Trim() + "," + List.SelectedRow.Cells[2].Text.Trim();
            returnStr = "'" + returnStr + "'";

            //回调
            this.DialogCallback("'OK'", "{host:window,returnStr:" + returnStr + "}");
        }

        #endregion
    }
}