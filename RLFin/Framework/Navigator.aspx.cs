using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Plusii.iiWeb;
using Plusii.iiWeb.Framework;
using System.Data;

namespace RLFin.Framework
{
    /// <summary>
    /// 导航
    /// </summary>
    public partial class Navigator : iiPage
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

            this.Title = this.PageID;

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


            #endregion

            //权限树
            Tree.Nodes.Clear();
            using (iiAuthority authorityProvider = new iiAuthority())
            {
                //根节点的PID为框架名称
                this.BindTree(authorityProvider, iiGlobal.FrameworkName, "U", iiGlobal.CurrentUserID, Tree.Nodes);
            }
        }

        #endregion

        #region 绑定数据

        /// <summary>
        /// 绑定树
        /// </summary>
        /// <param name="authorityProvider">模块及权限服务对象</param>
        /// <param name="mpid">父模块ID</param>
        /// <param name="authority">查询方式：U-用户；R-角色</param>
        /// <param name="id">查询方式的ID</param>
        /// <param name="nodes">本级节点集合</param>
        private void BindTree(iiAuthority authorityProvider, string mpid, string authority, string id, TreeNodeCollection nodes)
        {
            //本级模块
            DataTable modules = authorityProvider.GetModuleList(mpid, authority, id);
            if (modules == null || modules.Rows.Count == 0)
            {
                return; //递归结束
            }
            else
            {
                foreach (DataRow module in modules.Rows)
                {
                    string grant = module["Grant"].ToString().Trim(); //获得授权的方式：U-用户；R-角色；(null)-无
                    if (grant.Length != 0) //不是空白表示有权限
                    {
                        #region 创建模块项

                        string mid = module["ID"].ToString().Trim();
                        string url = module["URL"].ToString();

                        TreeNode node = new TreeNode();
                        node.Value = mid;
                        node.Text = module["Name"].ToString();
                        node.ToolTip = module["Remark"].ToString();
                        node.SelectAction = TreeNodeSelectAction.SelectExpand;
                        if (url.Length > 0)
                        {
                            node.NavigateUrl = string.Format("{0}/{1}",
                                iiGlobal.VirtualPath,
                                url
                                );
                        }
                        else
                        {
                            node.NavigateUrl = "javascript:void(null);";
                        }
                        nodes.Add(node);

                        #endregion

                        //递归下一级
                        this.BindTree(authorityProvider, mid, authority, id, node.ChildNodes);
                    }
                }
            }
        }

        #endregion
    }
}