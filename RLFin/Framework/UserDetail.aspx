<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDetail.aspx.cs" Inherits="RLFin.Framework.UserDetail" %>

<%@ Register Src="RoleSelector.ascx" TagName="RoleSelector" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="Dialog">
        <div class="Title">
            <asp:Label ID="PageTitle" runat="server" Text="<%$ Resources:iiWeb, UserDetailTitle %>"></asp:Label>
        </div>
        <div class="Operating">
            <ul>
                <li class="Caption">
                    <asp:Label ID="KeyCaption" runat="server" Text="<%$ Resources:iiWeb, UIDCaption %>"></asp:Label>
                </li>
                <li class="Content">
                    <asp:TextBox ID="UID" runat="server" CssClass="Required"></asp:TextBox>
                </li>
                <li class="Caption">
                    <asp:Label ID="NameCaption" runat="server" Text="<%$ Resources:iiWeb, NameCaption %>"></asp:Label>
                </li>
                <li class="Content">
                    <asp:TextBox ID="Name" runat="server" CssClass="Required"></asp:TextBox>
                </li>
                <li class="LineFeed"></li>
                <li class="Caption">
                    <asp:Label ID="PasswordCaption" runat="server" Text="<%$ Resources:iiWeb, PasswordCaption %>"></asp:Label>
                </li>
                <li class="Content">
                    <asp:TextBox ID="Password" runat="server"></asp:TextBox>
                </li>
                <li class="Caption">
                    <asp:Label ID="RemarkCaption" runat="server" Text="<%$ Resources:iiWeb, RemarkCaption %>"></asp:Label>
                </li>
                <li class="Content">
                    <asp:TextBox ID="Remark" runat="server"></asp:TextBox>
                </li>
                <li class="LineFeed"></li>
                <li class="Caption">
                    <asp:Label ID="RoleCaption" runat="server" Text="<%$ Resources:iiWeb, RoleCaption %>"></asp:Label>
                </li>
                <li class="ContentLong">
                    <div class="Panel">
                        <uc1:RoleSelector ID="RoleSelector1" runat="server" />
                    </div>
                </li>
                <li class="LineFeed"></li>
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
