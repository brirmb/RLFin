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
    public partial class ZBAlarm : LocalPage
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
            this.Limit.SelectedIndex = 0;
            this.CUSTNO.Text = string.Empty;
            this.CUSTNAME.Text = string.Empty;
            this.ZbRemainTotal.Text = string.Empty;

            #endregion

            //绑定列表
            //this.BindList();
        }

        #endregion

        #region 绑定数据

        protected void Limit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Limit.SelectedValue == "3")
            {
                LimitDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                LimitDate.Visible = true;
            }
            else
            {
                LimitDate.Visible = false;
            }
        }

        /// <summary>
        /// 绑定列表
        /// </summary>
        private void BindList()
        {
            using (ContractProvider contProvider = new ContractProvider())
            {
                string date = DateTime.Now.ToString("yyyy-MM-dd");
                if (Limit.SelectedValue == "1")
                {
                    date = DateTime.Now.AddDays(15).ToString("yyyy-MM-dd");
                }
                else if (Limit.SelectedValue == "2")
                {
                    date = DateTime.Now.AddDays(30).ToString("yyyy-MM-dd");
                }
                else
                {
                    date = LimitDate.Text.Trim();
                }

                var table = contProvider.GetZbAlarmList(ORDNO.Text.Trim(), CUSTNO.Text.Trim(), date);
                List.DataSource = table;

                //剩余质保金总额
                decimal remainTotal = 0;
                foreach (DataRow row in table.Rows)
                {
                    remainTotal += Util.ToDecimal(row["remainzb"].ToString());
                }
                ZbRemainTotal.Text = remainTotal.ToString();
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

                    //数据
                    string zblimit = ((DataRowView)e.Row.DataItem)["zblimit"].ToString().Trim();

                    if (Util.ToDecimal(zblimit) < 1)
                    {
                        e.Row.Cells[16].Text = (Util.ToDecimal(zblimit) * 12).ToString() + "个月";
                    }
                    else
                    {
                        e.Row.Cells[16].Text = zblimit + "年";
                    }

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
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            this.Initialize();
        }
        #endregion


    }
}