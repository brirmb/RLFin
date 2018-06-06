using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Plusii.iiWeb;
using Plusii.iiWeb.Framework;

namespace RLFin.Framework
{
    /// <summary>
    /// 修改密码
    /// </summary>
    public partial class Password : iiPage
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

            UID.Text = iiGlobal.CurrentUserID;
            UID.Enabled = false;
            Name.Text = iiGlobal.CurrentUser;
            Name.Enabled = false;

            NewPassword.Text = string.Empty;
            ConfirmPassword.Text = string.Empty;

            #endregion
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
            using (iiUser userProvider = new iiUser())
            {
                try
                {
                    userProvider.Update(UID.Text, NewPassword.Text);
                }
                catch (Exception error)
                {
                    this.ShowErrorMessage(this.GetGlobalResourceString("UpdateErrorMessage") + error.Message);
                    return;
                }
            }
            this.ShowInfoMessage(this.GetGlobalResourceString("PasswordChangedMessage"));
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