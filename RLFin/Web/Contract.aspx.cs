﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Plusii.iiWeb;
using Plusii.iiWeb.Framework;
using RLFin.Common;
using RLFin.Models;
using System.Data.SqlClient;

namespace RLFin.Web
{
    /// <summary>
    /// 合同维护
    /// </summary>
    public partial class Contract : LocalPage
    {

        /// <summary>
        /// 类型
        /// </summary>
        private string CurrentType
        {
            get
            {
                object tempObject = ViewState["CurrentType"];
                return (tempObject != null) ? (string)tempObject : string.Empty;
            }
            set
            {
                ViewState["CurrentType"] = value;
            }
        }

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

                string type = Request.QueryString["pageType"];
                if (type != null && type.Trim().Length != 0)
                {
                    this.CurrentType = type;
                }

                #endregion

                //初始化
                this.Initialize();
            }

            #region 页面标题

            if (CurrentType == "2")
            {
                PageTitle.Text = "直接开票";
            }
            else
            {
                PageTitle.Text = "合同维护";
            }
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

            //数据源
            //DataTable configs;
            //using (ContractProvider contProvider = new ContractProvider())
            //{
            //    configs = contProvider.GetOrnoList();
            //}

            //配置
            //LocalGlobal.BindListItems(drpNo, configs.DefaultView, "ordno", "ordno", true);

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
                List.DataSource = contProvider.GetContractHeadList(ORDNO.Text.Trim());
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

        /// <summary>
        /// 删除
        /// </summary>
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            bool deleted = false;
            var dateModel = LocalGlobal.GetDateModel();

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
                    foreach (GridViewRow row in List.Rows)
                    {
                        HtmlInputCheckBox rowCheckControl = (HtmlInputCheckBox)row.FindControl("RowCheck");
                        if (rowCheckControl.Checked)
                        {
                            string orno = List.DataKeys[row.RowIndex]["ORDNO"].ToString().Trim();

                            //合同
                            cmd.CommandText = contProvider.DeleteContractSql(orno);
                            cmd.ExecuteNonQuery();
                            cmd.CommandText = contProvider.DeleteContractDetailSql(orno);
                            cmd.ExecuteNonQuery();

                            //收款进度
                            cmd.CommandText = contProvider.DeleteArprocessSql(orno, LocalGlobal.CurrentUserID, dateModel.DateStr, dateModel.TimeStr);
                            cmd.ExecuteNonQuery();
                            cmd.CommandText = contProvider.DeleteArprocessDetailSql(orno, LocalGlobal.CurrentUserID, dateModel.DateStr, dateModel.TimeStr);
                            cmd.ExecuteNonQuery();

                            //有项被删除
                            deleted = true;
                        }
                    }
                }
            }
            catch (Exception error)
            {
                tran.Rollback();
                this.ShowErrorMessage(this.GetGlobalResourceString("DeleteErrorMessage") + error.Message);
                return;
            }

            tran.Commit();

            if (deleted)
            {
                this.BindList();
            }
            else
            {
                this.ShowInfoMessage(this.GetGlobalResourceString("NotSelectMessage"));
            }
        }

        #endregion
    }
}