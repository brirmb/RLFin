using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RLFin.Common;
using RLFin.Models;

namespace RLFin.Web
{
    public partial class ContractSummary : LocalPage
    {
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

                #endregion

                //初始化
                this.Initialize();
            }

            #region 页面标题

            this.Title = PageTitle.Text;

            #endregion

            #region 页面要素


            #endregion
        }

        #region 初始化

        /// <summary>
        /// 初始化
        /// </summary>
        private void Initialize()
        {
            #region 页面内容

            this.ORDNO.Text = string.Empty;
            this.CUSTNO.Text = string.Empty;
            this.CUSTNAME.Text = string.Empty;
            this.DateFrom.Text = string.Empty;
            this.DateTo.Text = string.Empty;
            this.ItemNo.Text = string.Empty;

            #endregion

            //绑定列表
            //this.BindList();
        }

        #endregion

        #region 绑定数据

        /// <summary>
        /// 绑定列表
        /// </summary>
        private void BindList()
        {
            using (ContractProvider contProvider = new ContractProvider())
            {
                string dFrom = string.IsNullOrWhiteSpace(DateFrom.Text.Trim()) ? string.Empty :
                   LocalGlobal.ConvertDateFormat(DateFrom.Text.Trim()).ToString("yyyyMMdd");
                string dTo = string.IsNullOrWhiteSpace(DateTo.Text.Trim()) ? string.Empty :
                    LocalGlobal.ConvertDateFormat(DateTo.Text.Trim()).ToString("yyyyMMdd");
                List.DataSource = contProvider.GetContractSummary(ORDNO.Text.Trim(), CUSTNO.Text.Trim(), CUSTNAME.Text.Trim(), dFrom, dTo, ItemNo.Text.Trim());
            }
            List.DataBind();

            this.List.SelectedIndex = -1;
            DetailList.DataSource = null;
            DetailList.DataBind();
        }

        /// <summary>
        /// 行绑定
        /// </summary>
        protected void List_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                //数据行
                case DataControlRowType.DataRow:
                    #region 数据绑定

                    ////数据
                    //string rowStatus = ((DataRowView)e.Row.DataItem)["Status"].ToString().Trim();

                    ////控件
                    //HtmlInputCheckBox rowCheckControl = (HtmlInputCheckBox)e.Row.FindControl("RowCheck");

                    ////指派
                    //rowCheckControl.Disabled = (rowStatus == "S");

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

        /// <summary>
        /// 翻页
        /// </summary>
        protected void List_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            List.PageIndex = e.NewPageIndex;
            this.BindList();

            //this.List.SelectedIndex = -1;
            //DetailList.DataSource = null;
            //DetailList.DataBind();
        }

        protected void List_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            this.List.SelectedIndex = e.NewSelectedIndex;
            string no = this.List.DataKeys[this.List.SelectedIndex]["ordno"].ToString();

            //绑定详情列表
            DetailLabel.Visible = true;
            using (ContractProvider contProvider = new ContractProvider())
            {
                DetailList.DataSource = contProvider.GetContractDetailInfo(no);
            }
            DetailList.DataBind();
        }

        protected void DetailList_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        #endregion

        #region 操作

        /// <summary>
        /// 确定
        /// </summary>
        protected void OKButton_Click(object sender, EventArgs e)
        {
            this.BindList();
        }

        /// <summary>
        /// 取消
        /// </summary>
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            this.Initialize();
        }

        #endregion

        protected void ExportButton_Click(object sender, EventArgs e)
        {
            this.List.AllowPaging = false;
            this.List.Columns[0].Visible = false;
            this.BindList();
            LocalGlobal.ToExcel(this.List, "合同汇总");
            this.List.AllowPaging = true;
            this.BindList();
            this.List.Columns[0].Visible = true;
        }
    }
}