<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Header.aspx.cs" Inherits="RLFin.Framework.Header" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="iiHeader">
            <ul>
                <li class="iiHeaderLeft">
                    <asp:Label ID="SystemID" runat="server"></asp:Label>
                </li>
                <li class="iiHeaderCenter">
                    <asp:Label ID="SystemName" runat="server" Text="<%$ Resources:iiWeb, SystemName %>"></asp:Label></li>
                <li class="iiHeaderRight">
                    <asp:Label ID="Powered" runat="server" Text="<%$ Resources:iiWeb, Powered %>"></asp:Label></li>
            </ul>
        </div>
        <div class="iiToolbar">
            <ul>
                <li class="iiToolbarLeft">
                    <asp:Label ID="Hello" runat="server" Text="<%$ Resources:iiWeb, Hello %>"></asp:Label>
                    <asp:Label ID="UserName" runat="server"></asp:Label>
                </li>
                <li class="iiToolbarCenter">
                    <asp:HyperLink ID="LogoutButton" runat="server" Text="<%$ Resources:iiWeb, LogoutButton %>"
                        Target="_top"></asp:HyperLink>
                </li>
                <li class="iiToolbarRight">
                    <asp:Label ID="SystemVersion" runat="server"></asp:Label></li>
            </ul>
        </div>
    </div>
    </form>
</body>
</html>
