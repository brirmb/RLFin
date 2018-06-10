<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectCust.aspx.cs" Inherits="RLFin.Web.SelectCust" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择客户</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Page">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="客户列表"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Caption">
                        <asp:Label ID="NameCaption" runat="server" Text="客户名称"></asp:Label>
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>

                    <li class="Content">
                        <asp:Button ID="SearchButton" runat="server" Text="搜索" OnClick="SearchButton_Click" />
                        <%--<asp:Button ID="CancelButton" runat="server" Text="取消" />--%>
                        <asp:Button ID="OkButton" runat="server" Text="完成" CssClass="Highlighted" Font-Bold="true"
                            OnClick="OkButton_Click" />
                    </li>
                </ul>
            </div>
            <div class="List">
                <asp:GridView ID="List" runat="server" EmptyDataText="（无数据）"
                    OnPageIndexChanging="List_PageIndexChanging" OnRowDataBound="List_RowDataBound" DataKeyNames="rccust">
                    <Columns>
                        <%-- <asp:TemplateField>
                            <ItemTemplate>
                                <input type="radio" name="RowCheck" id="RowCheck" runat="server" class="" title="选择" />
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="rccust" HeaderText="客户代码" />
                        <asp:BoundField DataField="rcnam" HeaderText="客户名称" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
