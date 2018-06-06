<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="RLFin.Framework.User" %>

<%@ Register Src="RoleSelector.ascx" TagName="RoleSelector" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="Page">
        <div class="Title">
            <asp:Label ID="PageTitle" runat="server" Text="<%$ Resources:iiWeb, UserTitle %>"></asp:Label>
        </div>
        <div class="Operating">
            <ul>
                <li class="Caption">
                    <asp:Label ID="UIDCaption" runat="server" Text="<%$ Resources:iiWeb, UIDCaption %>"></asp:Label>
                </li>
                <li class="Content">
                    <asp:TextBox ID="UID" runat="server"></asp:TextBox>
                </li>
                <li class="Caption">
                    <asp:Label ID="NameCaption" runat="server" Text="<%$ Resources:iiWeb, NameCaption %>"></asp:Label>
                </li>
                <li class="Content">
                    <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                </li>
                <li class="LineFeed"></li>
                <li class="Caption">
                    <asp:Label ID="RemarkCaption" runat="server" Text="<%$ Resources:iiWeb, RemarkCaption %>"></asp:Label>
                </li>
                <li class="Content">
                    <asp:TextBox ID="Remark" runat="server"></asp:TextBox>
                </li>
                <%--<li class="Caption">
                    <asp:Label ID="Property1Caption" runat="server" Text="<%$ Resources:iiWeb, Property1Caption %>"></asp:Label>
                </li>
                <li class="Content">
                    <asp:TextBox ID="Property1" runat="server"></asp:TextBox>
                </li>--%>
                <li class="LineFeed"></li>
                <li class="Caption">
                    <asp:Label ID="RoleCaption" runat="server" Text="<%$ Resources:iiWeb, RoleCaption %>"></asp:Label>
                </li>
                <li class="ContentLong">
                    <div class="Panel">
                        <uc1:RoleSelector ID="RoleSelector1" runat="server" EnableAuthority="True" />
                    </div>
                </li>
                <li class="LineFeed"></li>
                <li class="Button">
                    <asp:Button ID="OKButton" runat="server" Text="<%$ Resources:iiWeb, OKButton %>"
                        OnClick="OKButton_Click" />
                    <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:iiWeb, CancelButton %>"
                        OnClick="CancelButton_Click" />
                    <asp:Button ID="CreateButton" runat="server" Text="<%$ Resources:iiWeb, CreateButton %>"
                        CssClass="Highlighted" />
                    <asp:Button ID="DeleteButton" runat="server" Text="<%$ Resources:iiWeb, DeleteButton %>"
                        CssClass="Highlighted" OnClick="DeleteButton_Click" />
                </li>
            </ul>
        </div>
        <div class="List">
            <asp:GridView ID="List" runat="server" EmptyDataText="<%$ Resources:iiWeb, EmptyData %>"
                EnableModelValidation="True" OnRowDataBound="List_RowDataBound" OnPageIndexChanging="List_PageIndexChanging"
                DataKeyNames="ID">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <input type="checkbox" id="RowCheckAll" runat="server" class="CheckAll" title="<%$ Resources:iiWeb, DeleteButton %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <input type="checkbox" id="RowCheck" runat="server" class="Check" title="<%$ Resources:iiWeb, DeleteButton %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:iiWeb, EditCaption %>">
                        <ItemTemplate>
                            <asp:LinkButton ID="RowEditButton" runat="server" CssClass="ImageButton ImageButtonEdit"
                                ToolTip='<%# Eval("ID").ToString().Trim() %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:iiWeb, AuthorityCaption %>">
                        <ItemTemplate>
                            <asp:LinkButton ID="RowAuthorityButton" runat="server" CssClass="ImageButton ImageButtonPC"
                                ToolTip='<%# Eval("ID").ToString().Trim() %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="<%$ Resources:iiWeb, UIDCaption %>" />
                    <asp:BoundField DataField="Name" HeaderText="<%$ Resources:iiWeb, NameCaption %>" />
                    <asp:BoundField DataField="Remark" HeaderText="<%$ Resources:iiWeb, RemarkCaption %>" />
                    <%--<asp:BoundField DataField="Property1" HeaderText="<%$ Resources:iiWeb, Property1Caption %>" />--%>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
