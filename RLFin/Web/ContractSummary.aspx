<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractSummary.aspx.cs" Inherits="RLFin.Web.ContractSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>合同汇总</title>
</head>
<body>
    <form id="form1" runat="server">
     <div class="Page">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="合同汇总"></asp:Label>
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
                        <asp:Button ID="OKButton" runat="server" Text="<%$ Resources:iiWeb, OKButton %>"
                            OnClick="OKButton_Click" />
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

            <div class="List">
                <asp:Label ID="DetailLabel" runat="server" Text="合同明细" Font-Bold="True" Font-Size="15px" ForeColor="Red" Visible="false"></asp:Label>
                <asp:GridView ID="DetailList" runat="server" EmptyDataText="<%$ Resources:iiWeb, EmptyData %>"
                    EnableModelValidation="True" DataKeyNames="SEQ,ITEMNO" AllowPaging="false" OnRowDataBound="DetailList_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="<%$ Resources:iiWeb, EditCaption %>">
                            <ItemTemplate>
                                <asp:LinkButton ID="RowEditButton" runat="server" CssClass="ImageButton ImageButtonEdit"
                                    ToolTip='<%# Eval("ORDNO").ToString().Trim() %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SEQ" HeaderText="序号" />
                        <asp:BoundField DataField="ITEMNO" HeaderText="名称" />
                        <asp:BoundField DataField="DRAWNO" HeaderText="图号/代号" />
                        <asp:BoundField DataField="ORDQTY" HeaderText="数量" />
                        <asp:BoundField DataField="UM" HeaderText="单位" />
                        <asp:BoundField DataField="UNITPRICE" HeaderText="单价" />
                        <asp:BoundField DataField="AMT" HeaderText="总价" />
                        <asp:BoundField DataField="sumqty" HeaderText="已开票数量" />
                        <asp:BoundField DataField="sumamt" HeaderText="已开票金额" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
