<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Navigator.aspx.cs" Inherits="RLFin.Framework.Navigator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="Page">
        <div class="iiNavigator">
            <asp:TreeView ID="Tree" runat="server" SkinID="Menu" ExpandDepth="1" Target="MainFrame">
            </asp:TreeView>
        </div>
    </div>
    </form>
</body>
</html>
