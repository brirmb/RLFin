<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Config.aspx.cs" Inherits="RLFin.Framework.Config" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="Page">
        <div class="Title">
            <asp:Label ID="PageTitle" runat="server" Text="<%$ Resources:iiWeb, ConfigTitle %>"></asp:Label>
        </div>
        <div class="Operating">
            <ul>
                <li class="Caption">
                    <asp:Label ID="KeyCaption" runat="server" Text="<%$ Resources:iiWeb, KeyCaption %>"></asp:Label>
                </li>
                <li class="Content">
                    <asp:TextBox ID="Key" runat="server"></asp:TextBox>
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
                <li class="Caption">
                    <asp:Label ID="CIDCaption" runat="server" Text="<%$ Resources:iiWeb, CIDCaption %>"></asp:Label>
                </li>
                <li class="Content">
                    <asp:DropDownList ID="CID" runat="server">
                    </asp:DropDownList>
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
                        CssClass="Highlighted" onclick="DeleteButton_Click" />
                </li>
            </ul>
        </div>
        <div class="List">
            <asp:GridView ID="List" runat="server" EmptyDataText="<%$ Resources:iiWeb, EmptyData %>"
                EnableModelValidation="True" OnRowDataBound="List_RowDataBound" 
                OnPageIndexChanging="List_PageIndexChanging" DataKeyNames="ID,Key">
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
                                ToolTip='<%# Eval("Key").ToString().Trim() %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Key" HeaderText="<%$ Resources:iiWeb, KeyCaption %>" />
                    <asp:BoundField DataField="Name" HeaderText="<%$ Resources:iiWeb, NameCaption %>" />
                    <asp:BoundField DataField="Remark" HeaderText="<%$ Resources:iiWeb, RemarkCaption %>" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
