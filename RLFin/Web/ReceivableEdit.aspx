<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceivableEdit.aspx.cs" Inherits="RLFin.Web.ReceivableEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>收款进度明细</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Dialog">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="收款进度明细"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Caption">工令号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ORDNO" runat="server" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="Caption">合同名称
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ORDNAME" runat="server" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">客户代码
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="CUSTNO" runat="server" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="Caption">客户名称
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="CUSTNAME" runat="server" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">币别
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="CURR" runat="server" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="Caption">合同总金额
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ORDAMT" runat="server" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                </ul>
            </div>
            <div class="List">
                <div style="">
                    <asp:Button ID="CreateRow" runat="server" Text="添加行" />
                    <asp:Button ID="DeleteRow" runat="server" Text="删除行" OnClick="DeleteRow_Click" />
                </div>
                <asp:GridView ID="List" runat="server" EmptyDataText="<%$ Resources:iiWeb, EmptyData %>"
                    EnableModelValidation="True" DataKeyNames="ORDNO,lflag,lseq" PageSize="100" AllowPaging="false" OnRowDataBound="List_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="删除" HeaderStyle-Width="5%">
                            <ItemTemplate>
                                <input type="checkbox" id="RowCheck" runat="server" class="Check" title="<%$ Resources:iiWeb, DeleteButton %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="<%$ Resources:iiWeb, EditCaption %>">
                            <ItemTemplate>
                                <asp:LinkButton ID="RowEditButton" runat="server" CssClass="ImageButton ImageButtonEdit"
                                    ToolTip='<%# Eval("lflag").ToString().Trim() %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="lflag" HeaderText="项目" />
                        <asp:BoundField DataField="lseq" HeaderText="序号" />
                        <asp:BoundField DataField="lper" HeaderText="比例" />
                        <asp:BoundField DataField="lsamt" HeaderText="预收金额" />
                        <asp:BoundField DataField="lrdte" HeaderText="实际收款日" />
                        <asp:BoundField DataField="lramt" HeaderText="实收金额" />
                        <asp:BoundField DataField="ltype" HeaderText="收款方式" />
                        <asp:BoundField DataField="lnote" HeaderText="备注" />
                    </Columns>
                </asp:GridView>
            </div>
            <div>
                <asp:Button ID="OKButton" runat="server" Style="display: none;" Text="<%$ Resources:iiWeb, OKButton %>"
                    OnClick="OKButton_Click" />
            </div>
        </div>
    </form>
</body>
</html>
