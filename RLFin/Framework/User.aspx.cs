﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Plusii.iiWeb;
using System.Data;
using Plusii.iiWeb.Framework;
using System.Web.UI.HtmlControls;

namespace RLFin.Framework
{
    /// <summary>
    /// 用户管理
    /// </summary>
    public partial class User : iiPage
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


            #endregion
        }

        #region 初始化

        /// <summary>
        /// 初始化
        /// </summary>
        private void Initialize()
        {
            #region 页面内容

            UID.Text = string.Empty;
            Name.Text = string.Empty;
            Remark.Text = string.Empty;

            //角色
            RoleSelector1.Initialize();

            #endregion

            //绑定列表
            this.BindList();
        }

        #endregion

        #region 绑定数据

        /// <summary>
        /// 绑定列表
        /// </summary>
        private void BindList()
        {
            using (iiUser userProvider = new iiUser())
            {
                List.DataSource = userProvider.GetList(
                    UID.Text, Name.Text, Remark.Text,
                    string.Empty, string.Empty, string.Empty, string.Empty, string.Empty,
                    RoleSelector1.RIDList
                    );
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

                    //数据
                    string rowStatus = ((DataRowView)e.Row.DataItem)["Status"].ToString().Trim();

                    //控件
                    HtmlInputCheckBox rowCheckControl = (HtmlInputCheckBox)e.Row.FindControl("RowCheck");

                    //指派
                    rowCheckControl.Disabled = (rowStatus == "S");

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
        /// <param name="sender"></param>
        /// <param name="e"></param>
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
        /// <param name="sender"></param>
        /// <param name="e"></param>
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
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            bool deleted = false;
            using (iiUser userProvider = new iiUser())
            {
                foreach (GridViewRow row in List.Rows)
                {
                    HtmlInputCheckBox rowCheckControl = (HtmlInputCheckBox)row.FindControl("RowCheck");
                    if (rowCheckControl.Checked)
                    {
                        try
                        {
                            //删除
                            userProvider.Delete(List.DataKeys[row.RowIndex]["ID"].ToString().Trim());
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

        #endregion
    }
}