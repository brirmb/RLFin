using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Plusii.iiWeb;
using Plusii.iiWeb.Framework;
using System.Data;
using System.Web.UI.HtmlControls;

namespace RLFin.Framework
{
    /// <summary>
    /// 配置管理
    /// </summary>
    public partial class Config : iiPage
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
                else
                {
                    this.ShowErrorMessage(this.GetGlobalResourceString("InvalidParameterErrorMessage"));
                    return;
                }

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

            Key.Text = string.Empty;
            Name.Text = string.Empty;
            Remark.Text = string.Empty;

            //数据源
            DataTable configs;
            using (iiConfig configProvider = new iiConfig())
            {
                configs = configProvider.GetList("Config");
            }

            //配置
            iiGlobal.BindListItems(CID, configs.DefaultView, "Name", "Key", false);
            try
            {
                CID.SelectedValue = this.CurrentID;
            }
            catch { }
            CID.Enabled = false;

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
            using (iiConfig configProvider = new iiConfig())
            {
                List.DataSource = configProvider.GetList(CID.SelectedValue, Key.Text, Name.Text, Remark.Text);
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
            using (iiConfig configProvider = new iiConfig())
            {
                foreach (GridViewRow row in List.Rows)
                {
                    HtmlInputCheckBox rowCheckControl = (HtmlInputCheckBox)row.FindControl("RowCheck");
                    if (rowCheckControl.Checked)
                    {
                        try
                        {
                            //删除
                            configProvider.Delete(
                                List.DataKeys[row.RowIndex]["ID"].ToString().Trim(),
                                List.DataKeys[row.RowIndex]["Key"].ToString().Trim()
                                );
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