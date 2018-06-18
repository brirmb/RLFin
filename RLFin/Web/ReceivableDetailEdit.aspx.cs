using RLFin.Common;
using RLFin.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RLFin.Web
{
    public partial class ReceivableDetailEdit : LocalDialog
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
        /// 当前项次
        /// </summary>
        private string CurrentItem
        {
            get
            {
                object tempObject = ViewState["CurrentItem"];
                return (tempObject != null) ? (string)tempObject : string.Empty;
            }
            set
            {
                ViewState["CurrentItem"] = value;
            }
        }

        /// <summary>
        /// 当前序号
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

                string item = Request.QueryString["Item"];
                if (item != null && item.Trim().Length != 0)
                {
                    this.CurrentItem = item;
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

            if (this.CurrentItem.Length == 0)
            {
                //新增

            }
            else
            {
                //编辑
                cboItem.Enabled = false;
                Seq.Enabled = false;
                Per.Enabled = false;
                SAmt.Enabled = false;

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
                var row = contProvider.GetArprocessDetailItem(this.CurrentID, this.CurrentItem, this.CurrentSeq);
                if (row != null)
                {
                    cboItem.SelectedValue = row["lflag"].ToString().Trim();
                    Seq.Text = row["lseq"].ToString();
                    Per.Text = row["lper"].ToString();
                    SAmt.Text = row["lsamt"].ToString();
                    ActualAmt.Text = row["lramt"].ToString();
                    ActualDate.Text = row["lrdte"].ToString().Trim().Substring(0, row["lrdte"].ToString().Trim().IndexOf("."));
                    cboType.SelectedValue = row["ltype"].ToString().Trim();
                    Remark.Text = row["lnote"].ToString();
                }
            }
        }

        protected void cboItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboItem.SelectedValue.Trim().Length != 0)
            {
                using (ContractProvider contProvider = new ContractProvider())
                {
                    var row = contProvider.GetNewArprocessDetail(CurrentID, cboItem.SelectedValue.Trim());
                    if (row != null)
                    {
                        Seq.Text = row["lseq"].ToString();
                        Per.Text = row["lper"].ToString();
                        SAmt.Text = row["lsamt"].ToString();
                    }
                }
            }
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
            using (ContractProvider contProvider = new ContractProvider())
            {
                var dateModel = LocalGlobal.GetDateModel();

                string aDate = LocalGlobal.ConvertDateFormat(ActualDate.Text.Trim()).ToString("yyyyMMdd");
                if (this.CurrentItem.Length == 0)
                {
                    //新增
                    if (contProvider.GetArprocessDetailItem(this.CurrentID, cboItem.SelectedValue.Trim(), Seq.Text.Trim()) == null) //不存在
                    {
                        try
                        {
                            contProvider.InsertArprocessDetail(Seq.Text.Trim(), CurrentID, cboItem.SelectedValue.Trim(), SAmt.Text.Trim(), Per.Text.Trim(), aDate, ActualAmt.Text.Trim(), cboType.SelectedValue.Trim(), Remark.Text.Trim(), LocalGlobal.CurrentUserID, dateModel.DateStr, dateModel.TimeStr);
                        }
                        catch (Exception error)
                        {
                            this.ShowErrorMessage(this.GetGlobalResourceString("CreateErrorMessage") + error.Message);
                            return;
                        }
                    }
                    else
                    {
                        this.ShowWarningMessage(this.GetGlobalResourceString("ExistedErrorMessage"));
                        return;
                    }
                }
                else
                {
                    //编辑
                    try
                    {
                        contProvider.UpdateArprocessDetail(CurrentID, CurrentItem, CurrentSeq, aDate, ActualAmt.Text.Trim(), cboType.SelectedValue.Trim(), Remark.Text.Trim(), LocalGlobal.CurrentUserID, dateModel.DateStr, dateModel.TimeStr);
                    }
                    catch (Exception error)
                    {
                        this.ShowErrorMessage(this.GetGlobalResourceString("UpdateErrorMessage") + error.Message);
                        return;
                    }
                }
            }
            //回调
            this.DialogCallback("'CloseRefresh'", "window");
        }

        #endregion


    }
}