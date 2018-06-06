<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Password.aspx.cs" Inherits="RLFin.Framework.Password" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="Page">
        <div class="Title">
            <asp:Label ID="PageTitle" runat="server" Text="<%$ Resources:iiWeb, PasswordTitle %>"></asp:Label>
        </div>
        <div class="Operating">
            <ul>
                <li class="Caption">
                    <asp:Label ID="UIDCaption" runat="server" Text="<%$ Resources:iiWeb, UIDCaption %>"></asp:Label></li>
                <li class="Content">
                    <asp:TextBox ID="UID" runat="server" CssClass="Required"></asp:TextBox></li>
                <li class="Caption">
                    <asp:Label ID="NameCaption" runat="server" Text="<%$ Resources:iiWeb, NameCaption %>"></asp:Label></li>
                <li class="Content">
                    <asp:TextBox ID="Name" runat="server"></asp:TextBox></li>
                <li class="LineFeed"></li>
                <li class="Caption">
                    <asp:Label ID="NewPasswordCaption" runat="server" Text="<%$ Resources:iiWeb, PasswordCaption %>"></asp:Label>
                </li>
                <li class="Content">
                    <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" CssClass="Required"></asp:TextBox>
                </li>
                <li class="LineFeed"></li>
                <li class="Caption">
                    <asp:Label ID="ConfirmPasswordCaption" runat="server" Text="<%$ Resources:iiWeb, ConfirmPasswordCaption %>"></asp:Label>
                </li>
                <li class="Content">
                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="Required"></asp:TextBox>
                </li>
                <li class="LineFeed"></li>
                <li class="Button">
                    <asp:Button ID="OKButton" runat="server" Text="<%$ Resources:iiWeb, OKButton %>"
                        OnClick="OKButton_Click" />
                    <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:iiWeb, CancelButton %>"
                        OnClick="CancelButton_Click" />
                </li>
            </ul>
        </div>
    </div>
    </form>
</body>
</html>
