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
    public partial class ContractKpShip : LocalPage
    {
        #region 属性

        /// <summary>
        /// 类型
        /// </summary>
        private int CurrentType
        {
            get
            {
                object tempObject = ViewState["CurrentType"];
                return (tempObject != null) ? (int)tempObject : 0;
            }
            set
            {
                ViewState["CurrentType"] = value;
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
            this.TotalAmt.Text = string.Empty;

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

                List.DataSource = contProvider.GetShipKpDetailList(this.CurrentType, ORDNO.Text.Trim(), CUSTNO.Text.Trim(), CUSTNAME.Text.Trim(), dFrom, dTo);
            }
            List.DataBind();
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

                    var unitPrice = Util.ToDecimal(e.Row.Cells[9].Text.Trim()); //单价
                    var amt = Util.ToDecimal(e.Row.Cells[10].Text.Trim());       //明细 总价
                    var shipqty = Util.ToDecimal(e.Row.Cells[12].Text.Trim());   //已交货数量
                    var kpqty = Util.ToDecimal(e.Row.Cells[13].Text.Trim()); //已开票数量
                    var kpamt = Util.ToDecimal(e.Row.Cells[14].Text.Trim()); //已开票金额

                    //未开票金额
                    e.Row.Cells[15].Text = (amt - kpamt) < 0 ? "" : (amt - kpamt).ToString();
                    //已交货未开票数量
                    e.Row.Cells[16].Text = (shipqty - kpqty) < 0 ? "" : (shipqty - kpqty).ToString();
                    //已交货未开票金额
                    e.Row.Cells[17].Text = (unitPrice * shipqty - kpamt) < 0 ? "" : (unitPrice * shipqty - kpamt).ToString();
                    //已开票未交货数量
                    e.Row.Cells[18].Text = (kpqty - shipqty) < 0 ? "" : (kpqty - shipqty).ToString();
                    //已开票未交货金额
                    e.Row.Cells[19].Text = (kpamt - unitPrice * shipqty) < 0 ? "" : (kpamt - unitPrice * shipqty).ToString();

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
        }

        #endregion

        #region 操作

        protected void OKButton_Click(object sender, EventArgs e)
        {
            this.CurrentType = 0;
            this.BindList();
        }

        protected void KpNoShip_Click(object sender, EventArgs e)
        {
            this.CurrentType = 1;
            this.BindList();
        }

        protected void ShipNoKp_Click(object sender, EventArgs e)
        {
            this.CurrentType = 2;
            this.BindList();
        }

        protected void NoKpNoShip_Click(object sender, EventArgs e)
        {
            this.CurrentType = 3;
            this.BindList();
        }

        protected void KpShip_Click(object sender, EventArgs e)
        {
            this.CurrentType = 4;
            this.BindList();
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            this.Initialize();
        }

        #endregion
    }
}