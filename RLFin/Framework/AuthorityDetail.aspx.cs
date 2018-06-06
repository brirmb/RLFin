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
    /// 权限详情
    /// </summary>
    public partial class AuthorityDetail : iiDialog
    {
        #region 属性

        /// <summary>
        /// 当前权限类型
        /// </summary>
        private string CurrentAuthority
        {
            get
            {
                object tempObject = ViewState["CurrentAuthority"];
                return (tempObject != null) ? (string)tempObject : string.Empty;
            }
            set
            {
                ViewState["CurrentAuthority"] = value;
            }
        }
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

                string authority = Request.QueryString["Authority"];
                string id = Request.QueryString["ID"];
                if (authority != null && authority.Trim().Length != 0
                    && id != null && id.Trim().Length != 0)
                {
                    this.CurrentAuthority = authority;
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

            //标题
            PageTitle.Text = string.Format("{0} - {1}",
                this.GetGlobalResourceString("AuthorityDetailTitle"),
                this.CurrentID
                );

            #endregion

            //权限树
            Tree.Nodes.Clear();
            using (iiAuthority authorityProvider = new iiAuthority())
            {
                //根节点的PID为框架名称
                this.BindTree(authorityProvider, iiGlobal.FrameworkName, this.CurrentAuthority, this.CurrentID, Tree.Nodes);
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
                    #region 创建模块项

                    string grant = module["Grant"].ToString().Trim(); //获得授权的方式：U-用户；R-角色；(null)-无
                    string mid = module["ID"].ToString().Trim();

                    TreeNode node = new TreeNode();

                    string nodeRemark = string.Empty;
                    if (authority == "U")
                    {
                        switch (grant)
                        {
                            case "U": //权限来自用户，允许维护
                                node.Checked = true;
                                break;

                            case "R": //权限继承自角色，禁止维护
                                node.Checked = false;
                                node.ShowCheckBox = false;
                                nodeRemark = this.GetGlobalResourceString("Inherited"); //备注
                                break;

                            default: //无权限，允许维护
                                node.Checked = false;
                                break;
                        }
                    }
                    else
                    {
                        node.Checked = (grant.Length != 0);
                    }

                    node.Value = mid;
                    node.Text = module["Name"].ToString() + nodeRemark;
                    node.ToolTip = module["Remark"].ToString();
                    node.SelectAction = TreeNodeSelectAction.None;
                    nodes.Add(node);

                    #endregion

                    //递归下一级
                    this.BindTree(authorityProvider, mid, authority, id, node.ChildNodes);
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
            List<string> checkedMIDs = new List<string>();

            #region 选中的模块ID

            //菜单节点
            foreach (TreeNode checkedNode in Tree.CheckedNodes)
            {
                //仅处理叶节点（父节点自然在其路径上）
                if (checkedNode.ChildNodes.Count <= 0)
                {
                    string[] checkedNodeMIDs = checkedNode.ValuePath.Split(new char[] { Tree.PathSeparator }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string checkedNodeMID in checkedNodeMIDs)
                    {
                        if (!checkedMIDs.Contains(checkedNodeMID))
                        {
                            checkedMIDs.Add(checkedNodeMID);
                        }
                    }
                }
            }

            #endregion

            using (iiAuthority authorityProvider = new iiAuthority())
            {
                try
                {
                    authorityProvider.Update(
                        this.CurrentAuthority,
                        this.CurrentID,
                        string.Join(iiGlobal.Separator.ToString(), checkedMIDs.ToArray())
                        );
                }
                catch (Exception error)
                {
                    this.ShowErrorMessage(this.GetGlobalResourceString("UpdateErrorMessage") + error.Message);
                    return;
                }
            }
            //回调
            this.DialogCallback("'CloseRefresh'", "window");
        }

        #endregion
    }
}