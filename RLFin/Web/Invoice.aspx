<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="RLFin.Web.Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>开票</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Page">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="开票"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Caption">工令号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ORDNO" runat="server"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Button">
                        <asp:Button ID="OKButton" runat="server" Text="<%$ Resources:iiWeb, OKButton %>"
                            OnClick="OKButton_Click" />
                    </li>
                </ul>
            </div>
            <div class="List">
                <asp:GridView ID="List" runat="server" EmptyDataText="<%$ Resources:iiWeb, EmptyData %>" PageSize="5"
                    EnableModelValidation="True" OnPageIndexChanging="List_PageIndexChanging" DataKeyNames="ORDNO" OnRowDataBound="List_RowDataBound">
                    <Columns>
                        <%-- <asp:TemplateField HeaderText="详情">
                            <ItemTemplate>
                                <asp:LinkButton ID="RowDetailButton" runat="server" CssClass="ImageButton ImageButtonDetail" CommandName="Select"
                                    ToolTip='<%# Eval("ORDNO").ToString().Trim() %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:BoundField DataField="ORDNO" HeaderText="工令号" />
                        <asp:BoundField DataField="ORDNAME" HeaderText="合同名称" />
                        <asp:BoundField DataField="CUSTNO" HeaderText="客户代码" />
                        <asp:BoundField DataField="CUSTNAME" HeaderText="客户名称" />
                        <asp:BoundField DataField="ORDAMT" HeaderText="合同总金额" />
                        <asp:BoundField DataField="SIGNDATE" HeaderText="签订日期" />
                        <asp:BoundField DataField="DELIVERYDATE" HeaderText="交货日期" />
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
