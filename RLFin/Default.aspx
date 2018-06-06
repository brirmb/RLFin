<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RLFin._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="Page">
        <div class="iiLogin">
            <ul>
                <li class="iiLoginSide Shadow ShadowLeft"></li>
                <li class="iiLoginCenter">
                    <ul>
                        <li class="iiLoginTop">
                            <asp:Label ID="SystemName" runat="server" Text="<%$ Resources:iiWeb, SystemName %>"></asp:Label></li>
                        <li class="LineFeed"></li>
                        <li class="Caption CaptionRightAlign">
                            <asp:Label ID="UserIDCaption" runat="server" Text="<%$ Resources:iiWeb, UserIDCaption %>"></asp:Label></li>
                        <li class="Content">
                            <asp:TextBox ID="UserID" runat="server" CssClass="Required"></asp:TextBox></li>
                        <li class="LineFeed"></li>
                        <li class="Caption CaptionRightAlign">
                            <asp:Label ID="PasswordCaption" runat="server" Text="<%$ Resources:iiWeb, PasswordCaption %>"></asp:Label></li>
                        <li class="Content">
                            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="Required"></asp:TextBox></li>
                        <li class="LineFeed"></li>
                        <li class="Caption"></li>
                        <li class="Content">
                            <asp:Button ID="OKButton" runat="server" Text="<%$ Resources:iiWeb, OKButton %>"
                                OnClick="OKButton_Click" />
                        </li>
                        <li class="LineFeed"></li>
                        <li class="iiLoginBottom">
                            <asp:Label ID="Powered" runat="server" Text="<%$ Resources:iiWeb, Powered %>"></asp:Label>
                            <asp:Label ID="At" runat="server" Text="<%$ Resources:iiWeb, At %>"></asp:Label>
                            <asp:Label ID="Framework" runat="server"></asp:Label></li>
                    </ul>
                </li>
                <li class="iiLoginSide Shadow ShadowRight"></li>
            </ul>
        </div>
    </div>
    </form>
</body>
</html>
