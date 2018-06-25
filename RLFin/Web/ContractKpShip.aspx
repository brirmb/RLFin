<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractKpShip.aspx.cs" Inherits="RLFin.Web.ContractKpShip" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>开票交货明细</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Page">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="开票交货明细"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Caption">厂商名称
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="FactName" runat="server"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Button">
                        <asp:Button ID="OKButton" runat="server" Text="全部"
                            OnClick="OKButton_Click" />
                        <asp:Button ID="KpNoShip" runat="server" Text="已开票未交货" OnClick="KpNoShip_Click" />
                        <asp:Button ID="ShipNoKp" runat="server" Text="已交货未开票" OnClick="ShipNoKp_Click" />
                        <asp:Button ID="NoKpNoShip" runat="server" Text="未开票未交货" OnClick="NoKpNoShip_Click" />
                        <asp:Button ID="KpShip" runat="server" Text="已开票已交货" OnClick="KpShip_Click" />
                        <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:iiWeb, CancelButton %>"
                            OnClick="CancelButton_Click" />
                    </li>
                </ul>
            </div>
            <div class="List">
                <asp:GridView ID="List" runat="server" EmptyDataText="<%$ Resources:iiWeb, EmptyData %>"
                    EnableModelValidation="True" OnPageIndexChanging="List_PageIndexChanging" DataKeyNames="avend" OnRowDataBound="List_RowDataBound" OnSelectedIndexChanging="List_SelectedIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="详情">
                            <ItemTemplate>
                                <asp:LinkButton ID="RowDetailButton" runat="server" CssClass="ImageButton ImageButtonDetail" CommandName="Select"
                                    ToolTip='<%# Eval("ORDNO").ToString().Trim() %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="avend" HeaderText="厂商代码" />
                        <asp:BoundField DataField="avnam" HeaderText="厂商名称" />
                        <asp:BoundField DataField="avarea" HeaderText="区域" />
                        <asp:BoundField DataField="avsalr" HeaderText="联络人" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
