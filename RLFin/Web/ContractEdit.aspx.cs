﻿using RLFin.Common;
using RLFin.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace RLFin.Web
{
    /// <summary>
    /// 合同明细维护
    /// </summary>
    public partial class ContractEdit : LocalDialog
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
                ORDNO.Text = LocalGlobal.NewOrno(true);
                ORDNAME.Text = "加工定做合同";
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
            DataRow contract;
            using (ContractProvider contProvider = new ContractProvider())
            {
                var table = contProvider.GetContractHeadInfo(this.CurrentID);
                if (table != null && table.Rows.Count == 1)
                {
                    contract = table.Rows[0];
                }
                else
                {
                    contract = null;
                }

                //合同明细
                var detailList = contProvider.GetContractDetailInfo(this.CurrentID);
                ViewState["ViewDT"] = detailList;
                BindTempData();
            }

            ORDNO.Text = contract["ORDNO"].ToString().Trim();
            ORDNAME.Text = contract["ORDNAME"].ToString().Trim();
            SIGNDATE.Text = contract["SIGNDATE"].ToString().Trim();
            CUSTNO.Text = contract["CUSTNO"].ToString().Trim();
            CUSTNAME.Text = contract["CUSTNAME"].ToString().Trim();
            ORDAMT.Text = contract["ORDAMT"].ToString().Trim();
            DELIVERYDATE.Text = contract["DELIVERYDATE"].ToString().Trim();
            SCH_YF.Text = contract["SCH_YF"].ToString().Trim();
            SCH_JD.Text = contract["SCH_JD"].ToString().Trim();
            SCH_TH.Text = contract["SCH_TH"].ToString().Trim();
            SCH_ZB.Text = contract["SCH_ZB"].ToString().Trim();
            PROTECTTERM.Text = contract["PROTECTTERM"].ToString().Trim();
            Remark.Text = contract["Remark"].ToString();

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
                    DropDownList UM = (DropDownList)e.Row.FindControl("UM");
                    using (ContractProvider contProvider = new ContractProvider())
                    {
                        var table = contProvider.GetBaseParam("UM");
                        LocalGlobal.BindListItems(UM, table.DefaultView, "code", "code", false);
                    }
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
            //#region 检测
            //var itemName = ((TextBox)this.List.FooterRow.FindControl("ITEMNO")).Text.Trim();
            //#endregion

            var table = ViewState["ViewDT"] as DataTable;
            var newRow = table.NewRow();
            newRow["ITEMNO"] = ((TextBox)this.List.FooterRow.FindControl("ITEMNO")).Text.Trim();
            newRow["DRAWNO"] = ((TextBox)this.List.FooterRow.FindControl("DRAWNO")).Text.Trim();
            newRow["ORDQTY"] = ((TextBox)this.List.FooterRow.FindControl("ORDQTY")).Text.Trim();
            newRow["UM"] = ((DropDownList)this.List.FooterRow.FindControl("UM")).SelectedValue.Trim();
            newRow["UNITPRICE"] = ((TextBox)this.List.FooterRow.FindControl("UNITPRICE")).Text.Trim();
            newRow["AMT"] = ((TextBox)this.List.FooterRow.FindControl("AMT")).Text.Trim();
            newRow["Remark"] = ((TextBox)this.List.FooterRow.FindControl("Remark")).Text.Trim();

            //保存临时数据后重新绑定gridview
            table.Rows.Add(newRow);
            ViewState["ViewDT"] = table;
            BindTempData();
        }

        protected void DeleteRow_Click(object sender, EventArgs e)
        {
            DataTable table = ViewState["ViewDT"] as DataTable;

            bool deleted = false;
            foreach (GridViewRow row in List.Rows)
            {
                HtmlInputCheckBox rowCheckControl = (HtmlInputCheckBox)row.FindControl("RowCheck");
                if (rowCheckControl.Checked)
                {
                    var itemName = ((DataBoundLiteralControl)row.Cells[2].Controls[0]).Text.Trim(); //名称
                    foreach (DataRow dr in table.Rows)
                    {
                        if (dr["ITEMNO"].ToString().Trim() == itemName)
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
            var totalPer = Convert.ToDecimal(SCH_YF.Text.Trim()) + Convert.ToDecimal(SCH_JD.Text.Trim()) + Convert.ToDecimal(SCH_TH.Text.Trim()) + Convert.ToDecimal(SCH_ZB.Text.Trim());
            if (totalPer != 100)
            {
                this.ShowErrorMessage("比例输入不正确，请确保各项总额为100！");
                return;
            }

            var signDate = Convert.ToDateTime(SIGNDATE.Text.Trim()).ToString("yyyyMMdd");
            var deliverDate = Convert.ToDateTime(DELIVERYDATE.Text.Trim()).ToString("yyyyMMdd");
            var dateModel = LocalGlobal.GetDateModel();

            SqlConnection con = LocalGlobal.DbConnect();
            con.Open();
            SqlTransaction tran = con.BeginTransaction();//使用事务
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.Transaction = tran;

            using (ContractProvider contProvider = new ContractProvider())
            {
                if (this.CurrentID.Length == 0)
                {
                    //新增
                    try
                    {
                        string orno = LocalGlobal.NewOrno(false);

                        #region 合同、收款进度头表

                        cmd.CommandText = contProvider.InsertContractSql(orno, ORDNAME.Text.Trim(), CUSTNO.Text.Trim(), CUSTNAME.Text.Trim(), CURR.SelectedValue.Trim(), signDate, deliverDate, PROTECTTERM.SelectedValue.Trim(), SCH_YF.Text.Trim(), SCH_JD.Text.Trim(), SCH_TH.Text.Trim(), SCH_ZB.Text.Trim(), ORDAMT.Text.Trim(), Remark.Text.Trim(), LocalGlobal.CurrentUser, dateModel.DateStr, dateModel.TimeStr);
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = contProvider.InsertArprocessSql(orno, ORDNAME.Text.Trim(), CUSTNO.Text.Trim(), CUSTNAME.Text.Trim(), CURR.SelectedValue.Trim(), ORDAMT.Text.Trim(), LocalGlobal.CurrentUser, dateModel.DateStr, dateModel.TimeStr);
                        cmd.ExecuteNonQuery();

                        #endregion

                        #region 收款进度明细

                        cmd.CommandText = contProvider.InsertArprocessDetailSql(orno, "T1", Util.ToDecimal(ORDAMT.Text.Trim()), Util.ToDecimal(SCH_YF.Text.Trim()), LocalGlobal.CurrentUser, dateModel.DateStr, dateModel.TimeStr);
                        cmd.ExecuteNonQuery();
                        cmd.CommandText = contProvider.InsertArprocessDetailSql(orno, "T2", Util.ToDecimal(ORDAMT.Text.Trim()), Util.ToDecimal(SCH_JD.Text.Trim()), LocalGlobal.CurrentUser, dateModel.DateStr, dateModel.TimeStr);
                        cmd.ExecuteNonQuery();
                        cmd.CommandText = contProvider.InsertArprocessDetailSql(orno, "T3", Util.ToDecimal(ORDAMT.Text.Trim()), Util.ToDecimal(SCH_TH.Text.Trim()), LocalGlobal.CurrentUser, dateModel.DateStr, dateModel.TimeStr);
                        cmd.ExecuteNonQuery();
                        cmd.CommandText = contProvider.InsertArprocessDetailSql(orno, "T4", Util.ToDecimal(ORDAMT.Text.Trim()), Util.ToDecimal(SCH_ZB.Text.Trim()), LocalGlobal.CurrentUser, dateModel.DateStr, dateModel.TimeStr);
                        cmd.ExecuteNonQuery();
                        cmd.CommandText = contProvider.InsertArprocessDetailSql(orno, "T5", Util.ToDecimal(ORDAMT.Text.Trim()), 0, LocalGlobal.CurrentUser, dateModel.DateStr, dateModel.TimeStr);
                        cmd.ExecuteNonQuery();

                        #endregion

                        #region 合同明细

                        cmd.CommandText = contProvider.DeleteContractDetailSql(orno);
                        cmd.ExecuteNonQuery();

                        bool flag = true;
                        if (List.Rows.Count == 1)
                        {
                            var name = ((DataBoundLiteralControl)List.Rows[0].Cells[2].Controls[0]).Text.Trim();
                            if (name.Length == 0) //自动创建的空行
                            {
                                flag = false;
                            }
                        }

                        if (flag)
                        {
                            for (int i = 0; i < List.Rows.Count; i++)
                            {
                                var row = List.Rows[i];
                                cmd.CommandText = contProvider.InsertContractDetailSql(orno, ((Label)row.FindControl("SEQ")).Text.Trim(), ((DataBoundLiteralControl)row.Cells[2].Controls[0]).Text.Trim(), ((DataBoundLiteralControl)row.Cells[4].Controls[0]).Text.Trim(), ((DataBoundLiteralControl)row.Cells[3].Controls[0]).Text.Trim(), ((DataBoundLiteralControl)row.Cells[5].Controls[0]).Text.Trim(), ((DataBoundLiteralControl)row.Cells[6].Controls[0]).Text.Trim(), ((DataBoundLiteralControl)row.Cells[7].Controls[0]).Text.Trim(), ((DataBoundLiteralControl)row.Cells[8].Controls[0]).Text.Trim());

                                cmd.ExecuteNonQuery();
                            }

                        }

                        #endregion
                    }
                    catch (Exception error)
                    {
                        tran.Rollback();
                        this.ShowErrorMessage(this.GetGlobalResourceString("CreateErrorMessage") + error.Message);
                        return;
                    }

                }
                else
                {
                    //编辑
                    try
                    {

                    }
                    catch (Exception error)
                    {
                        this.ShowErrorMessage(this.GetGlobalResourceString("UpdateErrorMessage") + error.Message);
                        return;
                    }
                }

                tran.Commit();
            }

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
            dt1.Columns.Add("SEQ");
            dt1.Columns.Add("ITEMNO");
            dt1.Columns.Add("DRAWNO");
            dt1.Columns.Add("ORDQTY");
            dt1.Columns.Add("UM");
            dt1.Columns.Add("UNITPRICE");
            dt1.Columns.Add("AMT");
            dt1.Columns.Add("Remark");

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