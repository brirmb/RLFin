<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthorityDetail.aspx.cs"
    Inherits="RLFin.Framework.AuthorityDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="Dialog">
        <div class="Title">
            <asp:Label ID="PageTitle" runat="server" Text="<%$ Resources:iiWeb, AuthorityDetailTitle %>"></asp:Label>
        </div>
        <div class="Operating">
            <asp:TreeView ID="Tree" runat="server" SkinID="Menu" ShowCheckBoxes="Leaf">
            </asp:TreeView>
            <ul>
                <li class="Button">
                    <asp:Button ID="OKButton" runat="server" Text="<%$ Resources:iiWeb, OKButton %>"
                        OnClick="OKButton_Click" />
                    <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:iiWeb, CancelButton %>" />
                    <label>
                        <input type="checkbox" id="ItemCheckAll" runat="server" class="CheckAll" />
                        <asp:Label ID="ItemCheckAllCaption" runat="server" CssClass="Highlighted Pointer"
                            Text="<%$ Resources:iiWeb, CheckAllCaption %>"></asp:Label>
                    </label>
                </li>
            </ul>
        </div>
    </div>
    </form>
</body>
</html>
