using RLFin.Common;
using RLFin.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace RLFin.Web
{
    public partial class ReceivableEdit : LocalDialog
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

            if (this.CurrentID.Length == 0)
            {

            }
            else
            {
                //编辑
                this.BindItem();
                BindList();
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
                var row = contProvider.GetArprocess(this.CurrentID);
                if (row != null)
                {
                    ORDNO.Text = row["ORDNO"].ToString().Trim();
                    ORDNAME.Text = row["scont"].ToString().Trim();
                    CURR.Text = row["scurr"].ToString().Trim();
                    CUSTNO.Text = row["scust"].ToString().Trim();
                    CUSTNAME.Text = row["scnme"].ToString().Trim();
                    ORDAMT.Text = row["stotal"].ToString().Trim();
                }
            }
        }

        /// <summary>
        /// 绑定列表
        /// </summary>
        private void BindList()
        {
            using (ContractProvider contProvider = new ContractProvider())
            {
                List.DataSource = contProvider.GetArprocessDetail(this.CurrentID);
            }
            List.DataBind();
        }

        /// <summary>
        /// 行绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void List_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                //数据行
                case DataControlRowType.DataRow:
                    #region 数据绑定
                    var item = e.Row.Cells[2].Text.Trim();
                    switch (item)
                    {
                        case "T1":
                            e.Row.Cells[2].Text = "预收款";
                            break;
                        case "T2":
                            e.Row.Cells[2].Text = "进度款";
                            break;
                        case "T3":
                            e.Row.Cells[2].Text = "提货款";
                            break;
                        case "T4":
                            e.Row.Cells[2].Text = "质保金";
                            break;
                        case "T5":
                            e.Row.Cells[2].Text = "其它";
                            break;
                        default:
                            e.Row.Cells[2].Text = "其它";
                            break;
                    }

                    e.Row.Cells[6].Text = e.Row.Cells[6].Text.Trim().Substring(0, e.Row.Cells[6].Text.Trim().IndexOf("."));
                    #endregion
                    break;
                case DataControlRowType.Footer:
                    break;
                case DataControlRowType.EmptyDataRow:
                case DataControlRowType.Header:
                case DataControlRowType.Separator:
                case DataControlRowType.Pager:
                default:
                    break;
            }
        }

        #endregion

        #region 操作

        /// <summary>
        /// 删除明细
        /// </summary>
        protected void DeleteRow_Click(object sender, EventArgs e)
        {
            bool deleted = false;
            using (ContractProvider contProvider = new ContractProvider())
            {
                foreach (GridViewRow row in List.Rows)
                {
                    HtmlInputCheckBox rowCheckControl = (HtmlInputCheckBox)row.FindControl("RowCheck");
                    if (rowCheckControl.Checked)
                    {
                        try
                        {
                            //删除
                            contProvider.DeleteArprocessDetail(List.DataKeys[row.RowIndex]["ORDNO"].ToString().Trim(), List.DataKeys[row.RowIndex]["lflag"].ToString().Trim(), List.DataKeys[row.RowIndex]["lseq"].ToString().Trim());
                        }
                        catch (Exception error)
                        {
                            this.ShowErrorMessage(this.GetGlobalResourceString("DeleteErrorMessage") + error.Message);
                            return;
                        }
                        //有项被删除
                        deleted = true;
                    }
                }
            }
            if (deleted)
            {
                this.BindList();
            }
            else
            {
                this.ShowInfoMessage(this.GetGlobalResourceString("NotSelectMessage"));
            }
        }

        /// <summary>
        /// 隐藏按钮，用于回调刷新列表数据
        /// </summary>
        protected void OKButton_Click(object sender, EventArgs e)
        {
            BindList();
        }
        #endregion

    }
}