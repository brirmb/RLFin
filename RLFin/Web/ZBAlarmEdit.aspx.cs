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
    public partial class ZBAlarmEdit : LocalDialog
    {
        #region 属性

        /// <summary>
        /// 发货单号
        /// </summary>
        private string CurrentStNo
        {
            get
            {
                object tempObject = ViewState["CurrentStNo"];
                return (tempObject != null) ? (string)tempObject : string.Empty;
            }
            set
            {
                ViewState["CurrentStNo"] = value;
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
                    this.ORDNO.Text = id;
                }

                string seq = Request.QueryString["Seq"];
                if (seq != null && seq.Trim().Length != 0)
                {
                    Seq.Text = seq;
                }

                string stNo = Request.QueryString["StNo"];
                if (stNo != null && stNo.Trim().Length != 0)
                {
                    CurrentStNo = stNo;
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

            if (this.CurrentStNo.Length == 0)
            {
                //新增
                this.ShowErrorMessage("参数错误");
                return;
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
                var row = contProvider.GetZbSkInfo(this.ORDNO.Text.Trim(), this.CurrentStNo, this.Seq.Text.Trim());
                this.CUSTNO.Text = row["CUSTNO"].ToString();
                this.CUSTNAME.Text = row["CUSTNAME"].ToString();
                this.zbname.Text = row["zbname"].ToString();
                this.zbtotal.Text = row["zbtotal"].ToString();
                this.zbskamt.Text = row["zbskamt"].ToString();
                this.remainzb.Text = row["remainzb"].ToString();

                var table = contProvider.GetZbSkList(this.ORDNO.Text.Trim(), this.CurrentStNo, this.Seq.Text.Trim());
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
            newRow["zbskamt"] = ((TextBox)this.List.FooterRow.FindControl("zbskamt")).Text.Trim();
            newRow["zbskdate"] = ((TextBox)this.List.FooterRow.FindControl("zbskdate")).Text.Trim();

            //保存临时数据后重新绑定gridview
            table.Rows.Add(newRow);
            ViewState["ViewDT"] = table;
            BindTempData();

            RefreshZbAmt();
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
                    var zbskamt = ((DataBoundLiteralControl)row.Cells[2].Controls[0]).Text.Trim();
                    var zbskdate = ((DataBoundLiteralControl)row.Cells[3].Controls[0]).Text.Trim();
                    foreach (DataRow dr in table.Rows)
                    {
                        if (dr["zbskamt"].ToString().Trim() == zbskamt && dr["zbskdate"].ToString().Trim() == zbskdate)
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

                RefreshZbAmt();
            }
            else
            {
                this.ShowInfoMessage(this.GetGlobalResourceString("NotSelectMessage"));
            }
        }

        /// <summary>
        /// 更新已收未收质保金额
        /// </summary>
        private void RefreshZbAmt()
        {
            DataTable table = ViewState["ViewDT"] as DataTable;
            decimal total = 0;
            foreach (DataRow row in table.Rows)
            {
                total += Util.ToDecimal(row["zbskamt"].ToString());
            }

            this.zbskamt.Text = total.ToString();
            this.remainzb.Text = (Util.ToDecimal(zbtotal.Text.Trim()) - total).ToString();
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

                    cmd.CommandText = contProvider.DeleteZbSkSql(orno, this.CurrentStNo, orSeq);
                    cmd.ExecuteNonQuery();

                    var table = ViewState["ViewDT"] as DataTable;
                    int seq = 0; decimal total = 0;
                    foreach (DataRow row in table.Rows)
                    {
                        seq++;
                        cmd.CommandText = contProvider.InsertZbSkSql(orno, orSeq, seq.ToString(), this.CurrentStNo, row["zbskamt"].ToString(), row["zbskdate"].ToString());

                        cmd.ExecuteNonQuery();

                        total += Util.ToDecimal(row["zbskamt"].ToString());
                    }

                    cmd.CommandText = contProvider.UpdateZbSkAmtSql(orno, orSeq, this.CurrentStNo, total.ToString());
                    cmd.ExecuteNonQuery();
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
            dt1.Columns.Add("zbskseq");
            dt1.Columns.Add("zbskamt");
            dt1.Columns.Add("zbskdate");

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