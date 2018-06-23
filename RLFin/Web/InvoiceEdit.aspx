<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceEdit.aspx.cs" Inherits="RLFin.Web.InvoiceEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>开票维护</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Dialog">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="开票维护"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Caption">工令号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ORDNO" runat="server" CssClass="Required" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="Caption">工令序号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="Seq" runat="server" CssClass="Required" Enabled="false"></asp:TextBox>
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
                    EnableModelValidation="True" DataKeyNames="kpseq" PageSize="100" AllowPaging="false" OnRowDataBound="List_RowDataBound" ShowFooter="true" OnPreRender="List_PreRender" OnLoad="List_Load">
                    <Columns>
                        <asp:TemplateField HeaderText="删除">
                            <ItemTemplate>
                                <input type="checkbox" id="RowCheck" runat="server" class="Check" title="<%$ Resources:iiWeb, DeleteButton %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="序号">
                            <ItemTemplate>
                                <asp:Label ID="kpseq" runat="server" Text="<%# Container.DataItemIndex +1%>"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="发票号码">
                            <ItemTemplate>
                                <%#Eval("kpno") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="kpno" runat="server" Width="90%" CssClass="Required"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="开票数量">
                            <ItemTemplate>
                                <%#Eval("kpqty") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="kpqty" runat="server" Width="90%" CssClass="Required Integer"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="开票金额">
                            <ItemTemplate>
                                <%#Eval("kpamt") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="kpamt" runat="server" Width="90%" CssClass="Required Float"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="开票日期">
                            <ItemTemplate>
                                <%#Eval("kpdate") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="kpdate" runat="server" Width="90%" CssClass="Required Date"></asp:TextBox>
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
