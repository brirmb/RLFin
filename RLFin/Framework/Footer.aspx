<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Footer.aspx.cs" Inherits="RLFin.Framework.Footer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="iiFooter">
            <asp:Label ID="Copyright" runat="server" Text="<%$ Resources:iiWeb, Copyright %>"></asp:Label>
            <asp:Label ID="Year" runat="server"></asp:Label>
            <asp:Label ID="SystemID" runat="server"></asp:Label>
            <asp:Label ID="At" runat="server" Text="<%$ Resources:iiWeb, At %>"></asp:Label>
            <asp:Label ID="Framework" runat="server"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
