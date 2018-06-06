using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Plusii.iiWeb;
using Plusii.iiWeb.Framework;

namespace RLFin
{
    /// <summary>
    /// 登录
    /// </summary>
    public partial class _Default : iiPage
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

            this.Title = SystemName.Text;

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

            UserID.Text = iiGlobal.CurrentUserID;

            Framework.Text = iiGlobal.FrameworkName;
            Framework.ToolTip = iiGlobal.FrameworkVersion;

            #endregion
        }

        #endregion

        #region 操作

        protected void OKButton_Click(object sender, EventArgs e)
        {
            string id, name;
            if (iiUser.Login(UserID.Text, Password.Text, out id, out name))
            {
                iiGlobal.CurrentUserID = id;
                iiGlobal.CurrentUser = name;
                Response.Redirect(string.Format("{0}/", iiGlobal.FrameworkVirtualPath));
            }
            else
            {
                this.ShowMessage(this.GetGlobalResourceString("LoginErrorMessage"));
            }
        }

        #endregion
    }
}