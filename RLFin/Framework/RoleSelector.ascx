<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RoleSelector.ascx.cs"
    Inherits="RLFin.Framework.RoleSelector" %>
<asp:DataList ID="List" runat="server" RepeatColumns="3" OnItemDataBound="List_ItemDataBound"
    DataKeyField="Key">
    <HeaderTemplate>
        <label>
            <ul>
                <li>
                    <input type="checkbox" id="ItemCheckAll" runat="server" class="CheckAll" title="<%$ Resources:iiWeb, RoleCaption %>" /></li>
                <li>
                    <asp:Label ID="ItemCheckAllCaption" runat="server" CssClass="Highlighted Pointer"
                        Text="<%$ Resources:iiWeb, CheckAllCaption %>"></asp:Label></li>
            </ul>
        </label>
    </HeaderTemplate>
    <ItemTemplate>
        <ul>
            <li>
                <input type="checkbox" id="ItemCheck" runat="server" class="Check" title="<%$ Resources:iiWeb, RoleCaption %>" /></li>
            <li>
                <asp:LinkButton ID="ItemAuthorityButton" runat="server" CssClass="ImageButton ImageButtonPC"
                    ToolTip='<%# Eval("Key").ToString().Trim() %>'></asp:LinkButton></li>
            <li>
                <label id="ItemCheckLabel" runat="server">
                    <asp:Label ID="ItemName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </label>
            </li>
        </ul>
    </ItemTemplate>
</asp:DataList>