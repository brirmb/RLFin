using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using RLFin.Common;
using RLFin.Models;
using System.Data.SqlClient;
using System.Data;

namespace RLFin.Web
{
    public partial class InvoiceEdit : LocalDialog
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
        /// 序号
        /// </summary>
        private string CurrentSeq
        {
            get
            {
                object tempObject = ViewState["CurrentSeq"];
                return (tempObject != null) ? (string)tempObject : string.Empty;
            }
            set
            {
                ViewState["CurrentSeq"] = value;
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

                string seq = Request.QueryString["Seq"];
                if (seq != null && seq.Trim().Length != 0)
                {
                    this.CurrentSeq = seq;
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

            if (this.CurrentID.Length == 0)
            {
                //新增
                this.ShowErrorMessage("参数错误");
                return;
            }
            else
            {
                //编辑
                ORDNO.Text = this.CurrentID;
                Seq.Text = this.CurrentSeq;

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
                var table = contProvider.GetKpInfo(this.CurrentID, this.CurrentSeq);
                ViewState["ViewDT"] = table;
                BindTempData();
            }
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

        protected void List_PreRender(object sender, EventArgs e)
        {
            if (this.List.Rows.Count == 0) //无数据时需特殊处理
            {
                BindEmptyList();
            }
        }

        protected void List_Load(object sender, EventArgs e)
        {
        }

        #endregion

        #region 操作

        /// <summary>
        /// 新增行，保存到临时datatable中
        /// </summary>
        protected void CreateRow_Click(object sender, EventArgs e)
        {
            var table = ViewState["ViewDT"] as DataTable;
            var newRow = table.NewRow();
            newRow["kpno"] = ((TextBox)this.List.FooterRow.FindControl("kpno")).Text.Trim();
            newRow["kpqty"] = ((TextBox)this.List.FooterRow.FindControl("kpqty")).Text.Trim();
            newRow["kpamt"] = ((TextBox)this.List.FooterRow.FindControl("kpamt")).Text.Trim();
            newRow["kpdate"] = ((TextBox)this.List.FooterRow.FindControl("kpdate")).Text.Trim();

            //保存临时数据后重新绑定gridview
            table.Rows.Add(newRow);
            ViewState["ViewDT"] = table;
            BindTempData();
        }

        /// <summary>
        /// 删除临时datatable中的行
        /// </summary>
        protected void DeleteRow_Click(object sender, EventArgs e)
        {
            DataTable table = ViewState["ViewDT"] as DataTable;

            bool deleted = false;
            foreach (GridViewRow row in List.Rows)
            {
                HtmlInputCheckBox rowCheckControl = (HtmlInputCheckBox)row.FindControl("RowCheck");
                if (rowCheckControl.Checked)
                {
                    var kpno = ((DataBoundLiteralControl)row.Cells[2].Controls[0]).Text.Trim(); //发票号码
                    foreach (DataRow dr in table.Rows)
                    {
                        if (dr["kpno"].ToString().Trim() == kpno)
                        {
                            table.Rows.Remove(dr);
                            break;
                        }
                    }
                    //有项被删除
                    deleted = true;
                }
            }
            if (deleted)
            {
                ViewState["ViewDT"] = table;
                BindTempData();
            }
            else
            {
                this.ShowInfoMessage(this.GetGlobalResourceString("NotSelectMessage"));
            }
        }

        /// <summary>
        /// 确定
        /// </summary>
        protected void OKButton_Click(object sender, EventArgs e)
        {
            if (ORDNO.Text.Trim().Length == 0 || Seq.Text.Trim().Length == 0)
            {
                this.ShowErrorMessage("参数错误");
                return;
            }

            SqlConnection con = LocalGlobal.DbConnect();
            con.Open();
            SqlTransaction tran = con.BeginTransaction();//使用事务
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.Transaction = tran;

            try
            {
                using (ContractProvider contProvider = new ContractProvider())
                {
                    string orno = ORDNO.Text.Trim();
                    string orSeq = Seq.Text.Trim();

                    cmd.CommandText = contProvider.DeleteKpSql(orno, orSeq);
                    cmd.ExecuteNonQuery();

                    var table = ViewState["ViewDT"] as DataTable;
                    int seq = 0;
                    foreach (DataRow row in table.Rows)
                    {
                        seq++;
                        cmd.CommandText = contProvider.InsertKpSql(orno, orSeq, seq.ToString(), row["kpno"].ToString().Trim(), row["kpqty"].ToString(), row["kpamt"].ToString(), row["kpdate"].ToString());

                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception error)
            {
                tran.Rollback();
                this.ShowErrorMessage("保存失败！" + error.Message);
                return;
            }

            tran.Commit();

            //回调
            this.DialogCallback("'CloseRefresh'", "window");
        }

        #endregion

        #region 创建表结构及空数据
        protected DataTable CreateTable()
        {
            //定义table结构   
            DataTable dt1 = new DataTable();
            //不设置 默认为System.String  
            dt1.Columns.Add("kpseq");
            dt1.Columns.Add("kpno");
            dt1.Columns.Add("kpqty");
            dt1.Columns.Add("kpamt");
            dt1.Columns.Add("kpdate");

            //dt1.Rows.Add(dt1.NewRow());
            //ViewState["ViewDT"] = dt1;
            return dt1;
        }

        private void BindEmptyList()
        {
            var table = CreateTable();
            //表格无数据时添加一空行，否则footer不显示
            //空行不需要显示，所以隐藏掉
            table.Rows.Add(table.NewRow());
            List.DataSource = table;
            List.DataBind();
            List.Rows[0].Visible = false;

            ViewState["ViewDT"] = CreateTable();
        }

        protected void BindTempData()
        {
            this.List.DataSource = ViewState["ViewDT"] as DataTable;
            this.List.DataBind();
        }
        #endregion

    }
}