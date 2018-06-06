<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="RLFin.Framework.Welcome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="Page">
        <div class="iiWelcome">
            <div class="Title">
                <asp:Label ID="WelcomeTitle" runat="server" Text="<%$ Resources:iiWeb, WelcomeTitle %>"></asp:Label>
                <asp:Label ID="SystemName" runat="server" Text="<%$ Resources:iiWeb, SystemName %>"></asp:Label>
            </div>
            <div class="Text">
                <asp:Label ID="Description" runat="server" Text="<%$ Resources:iiWeb, WelcomeDescription %>"></asp:Label>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
