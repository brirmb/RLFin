<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZBAlarmEdit.aspx.cs" Inherits="RLFin.Web.ZBAlarmEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>质保金收款</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Dialog">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="质保金收款"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Caption">工令号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ORDNO" runat="server" CssClass="Required" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="Caption">序号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="Seq" runat="server" CssClass="Required" Enabled="false"></asp:TextBox>
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
                    <li class="Caption">名称
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="zbname" runat="server" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="Caption">质保金总额
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="zbtotal" runat="server" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">已收质保金
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="zbskamt" runat="server" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="Caption">未收质保金
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="remainzb" runat="server" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                </ul>
            </div>
            <div class="List">
                <div style="">
                    <asp:Button ID="CreateRow" runat="server" Text="添加行" OnClick="CreateRow_Click" />
                    <asp:Button ID="DeleteRow" runat="server" Text="删除行" OnClick="DeleteRow_Click" />
                </div>
                <asp:GridView ID="List" runat="server" EmptyDataText="<%$ Resources:iiWeb, EmptyData %>"
                    EnableModelValidation="True" DataKeyNames="zbskseq" PageSize="100" AllowPaging="false" OnRowDataBound="List_RowDataBound" ShowFooter="true" OnPreRender="List_PreRender" OnLoad="List_Load">
                    <Columns>
                        <asp:TemplateField HeaderText="删除">
                            <ItemTemplate>
                                <input type="checkbox" id="RowCheck" runat="server" class="Check" title="<%$ Resources:iiWeb, DeleteButton %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="序号">
                            <ItemTemplate>
                                <asp:Label ID="zbskseq" runat="server" Text="<%# Container.DataItemIndex +1%>"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="收款金额">
                            <ItemTemplate>
                                <%#Eval("zbskamt") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="zbskamt" runat="server" Width="90%" CssClass="Required Float"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="收款日期">
                            <ItemTemplate>
                                <%#Eval("zbskdate") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="zbskdate" runat="server" Width="90%" CssClass="Required Date"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Button">
                        <asp:Button ID="OKButton" runat="server" Text="<%$ Resources:iiWeb, OKButton %>"
                            OnClick="OKButton_Click" />
                        <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:iiWeb, CancelButton %>" />
                    </li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
