using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Plusii.iiWeb.Framework;
using System.Data;
using System.Web.UI.HtmlControls;
using Plusii.iiWeb;
using System.ComponentModel;

namespace RLFin.Framework
{
    /// <summary>
    /// 角色选择器
    /// </summary>
    public partial class RoleSelector : iiUserControl
    {
        #region 属性

        /// <summary>
        /// 启用
        /// </summary>
        [DefaultValue(true), Browsable(true), Description("启用")]
        public bool Enabled
        {
            get
            {
                object tempObject = ViewState["Enabled"];
                return (tempObject != null) ? (bool)tempObject : true;
            }
            set
            {
                ViewState["Enabled"] = value;
                //绑定列表
                this.BindList();
            }
        }

        /// <summary>
        /// 启用权限维护
        /// </summary>
        [DefaultValue(false), Browsable(true), Description("启用权限维护")]
        public bool EnableAuthority
        {
            get
            {
                object tempObject = ViewState["EnableAuthority"];
                return (tempObject != null) ? (bool)tempObject : false;
            }
            set
            {
                ViewState["EnableAuthority"] = value;
                //绑定列表
                this.BindList();
            }
        }

        /// <summary>
        /// 分隔符
        /// </summary>
        [DefaultValue(iiGlobal.Separator), Browsable(true), Description("分隔符")]
        public char Separator
        {
            get
            {
                object tempObject = ViewState["Separator"];
                return (tempObject != null) ? (char)tempObject : iiGlobal.Separator;
            }
            set
            {
                ViewState["Separator"] = value;
            }
        }

        /// <summary>
        /// 角色ID列表（例如：R001|R002|R003）
        /// </summary>
        [DefaultValue(""), Browsable(true), Description("角色ID列表（例如：R001|R002|R003）")]
        public string RIDList
        {
            get
            {
                string ridList = this.GetRIDList();
                ViewState["RIDList"] = ridList;
                return ridList;
            }
            set
            {
                string ridList = value;
                if (!ridList.StartsWith(this.Separator.ToString()))
                {
                    ridList = this.Separator.ToString() + ridList;
                }
                if (!ridList.EndsWith(this.Separator.ToString()))
                {
                    ridList = ridList + this.Separator.ToString();
                }
                ViewState["RIDList"] = ridList;
                //绑定列表
                this.BindList();
            }
        }

        #endregion

        #region 初始化

        /// <summary>
        /// 初始化
        /// </summary>
        public void Initialize()
        {
            #region 页面内容


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
                List.DataSource = configProvider.GetList("Role");
            }
            List.DataBind();
        }
        /// <summary>
        /// 项绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void List_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            switch (e.Item.ItemType)
            {
                //数据行
                case ListItemType.Item:
                case ListItemType.AlternatingItem:
                case ListItemType.SelectedItem:
                case ListItemType.EditItem:
                    #region 数据绑定

                    //数据
                    string rowStatus = ((DataRowView)e.Item.DataItem)["Status"].ToString().Trim();
                    string rowKey = ((DataRowView)e.Item.DataItem)["Key"].ToString().Trim();

                    //控件
                    LinkButton itemAuthorityButtonControl = (LinkButton)e.Item.FindControl("ItemAuthorityButton");
                    HtmlInputCheckBox itemCheckControl = (HtmlInputCheckBox)e.Item.FindControl("ItemCheck");
                    HtmlGenericControl itemCheckLabelControl = (HtmlGenericControl)e.Item.FindControl("ItemCheckLabel");

                    //指派
                    object tempObject = ViewState["RIDList"];
                    string ridList = (tempObject != null) ? (string)tempObject : string.Empty;
                    string pattern = string.Format("{0}{1}{0}", this.Separator, rowKey);
                    itemCheckControl.Checked = (ridList.IndexOf(pattern) >= 0);
                    itemCheckControl.Disabled = !this.Enabled;

                    itemAuthorityButtonControl.Enabled = this.Enabled && (rowStatus != "S");
                    itemAuthorityButtonControl.Visible = this.EnableAuthority;

                    itemCheckLabelControl.Attributes.Add("for", itemCheckControl.ClientID); //体验增强

                    #endregion
                    break;

                case ListItemType.Header:
                    #region 数据绑定

                    //控件
                    HtmlInputCheckBox itemCheckAllControl = (HtmlInputCheckBox)e.Item.FindControl("ItemCheckAll");

                    //指派
                    itemCheckAllControl.Disabled = !this.Enabled;

                    #endregion
                    break;

                case ListItemType.Separator:
                case ListItemType.Pager:
                case ListItemType.Footer:
                default:
                    break;
            }
        }

        #endregion

        #region 方法

        /// <summary>
        /// 获取已选中的角色ID列表（例如：R001|R002|R003）
        /// </summary>
        /// <returns></returns>
        private string GetRIDList()
        {
            List<string> result = new List<string>();
            foreach (DataListItem item in List.Items)
            {
                HtmlInputCheckBox itemCheckControl = (HtmlInputCheckBox)item.FindControl("ItemCheck");
                if (itemCheckControl.Checked)
                {
                    result.Add(List.DataKeys[item.ItemIndex].ToString().Trim()); //DataKeyField="Key"
                }
            }
            return string.Join(this.Separator.ToString(), result.ToArray());
        }

        #endregion
    }
}