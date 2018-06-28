<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractStats.aspx.cs" Inherits="RLFin.Web.ContractStats" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同台帐</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Page">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="合同台帐"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Caption">工令号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ORDNO" runat="server"></asp:TextBox>
                    </li>
                    <li class="Caption">合同日期
                    </li>
                    <li class=" ContentMiddle">
                        <asp:TextBox ID="DateFrom" runat="server" CssClass="Date"></asp:TextBox>~
                    </li>
                    <li class=" ContentMiddle">
                        <asp:TextBox ID="DateTo" runat="server" CssClass="Date"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">客户代码
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="CUSTNO" runat="server"></asp:TextBox><asp:LinkButton ID="selCust" Style="display: inline-block;" runat="server" CssClass="ImageButton ImageButtonDetail" ToolTip="选择客户"></asp:LinkButton>
                    </li>
                    <li class="Caption">客户名称
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="CUSTNAME" runat="server"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Button">
                        <asp:Button ID="OKButton" runat="server" Text="<%$ Resources:iiWeb, OKButton %>"
                            OnClick="OKButton_Click" />
                        <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:iiWeb, CancelButton %>"
                            OnClick="CancelButton_Click" />
                        <asp:Button ID="ExportButton" runat="server" Text="导出"
                            CssClass="Highlighted" OnClick="ExportButton_Click" />
                    </li>
                </ul>
            </div>
            <div class="List">
                <asp:GridView ID="List" runat="server" EmptyDataText="<%$ Resources:iiWeb, EmptyData %>"
                    EnableModelValidation="True" OnPageIndexChanging="List_PageIndexChanging" DataKeyNames="ordno" OnRowDataBound="List_RowDataBound" OnSelectedIndexChanging="List_SelectedIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="详情">
                            <ItemTemplate>
                                <asp:LinkButton ID="RowDetailButton" runat="server" CssClass="ImageButton ImageButtonDetail" CommandName="Select"
                                    ToolTip='<%# Eval("ordno").ToString().Trim() %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ordno" HeaderText="工令号" />
                        <asp:BoundField DataField="custno" HeaderText="客户代码" />
                        <asp:BoundField DataField="custname" HeaderText="客户名称" />
                        <asp:BoundField DataField="curr" HeaderText="币别" />
                        <asp:BoundField DataField="ordamt" HeaderText="金额" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="List">
                <asp:Label ID="DetailLabel" runat="server" Text="合同明细" Font-Bold="True" Font-Size="15px" ForeColor="Red" Visible="false"></asp:Label>
                <asp:GridView ID="DetailList" runat="server" EmptyDataText="<%$ Resources:iiWeb, EmptyData %>"
                    EnableModelValidation="True" DataKeyNames="SEQ,ITEMNO" AllowPaging="false" OnRowDataBound="DetailList_RowDataBound">
                    <Columns>
                        <%--<asp:TemplateField HeaderText="<%$ Resources:iiWeb, EditCaption %>">
                            <ItemTemplate>
                                <asp:LinkButton ID="RowEditButton" runat="server" CssClass="ImageButton ImageButtonEdit"
                                    ToolTip='<%# Eval("ITEMNO").ToString().Trim() %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:BoundField DataField="SEQ" HeaderText="序号" />
                        <asp:BoundField DataField="ITEMNO" HeaderText="名称" />
                        <asp:BoundField DataField="DRAWNO" HeaderText="图号/代号" />
                        <asp:BoundField DataField="ORDQTY" HeaderText="数量" />
                        <asp:BoundField DataField="UM" HeaderText="单位" />
                        <asp:BoundField DataField="UNITPRICE" HeaderText="单价" />
                        <asp:BoundField DataField="AMT" HeaderText="金额" />
                        <asp:BoundField DataField="deliverydate" HeaderText="约定交货" />
                        <asp:BoundField DataField="shipqty" HeaderText="已交货数量" />
                        <asp:BoundField DataField="kpqty" HeaderText="已开票数量" />
                        <asp:BoundField DataField="kpamt" HeaderText="已开票金额" />

                        <asp:BoundField DataField="" HeaderText="未开票金额" />
                        <asp:BoundField DataField="" HeaderText="已交货未开票数量" />
                        <asp:BoundField DataField="" HeaderText="已交货未开票金额" />
                        <asp:BoundField DataField="" HeaderText="已开票未交货数量" />
                        <asp:BoundField DataField="" HeaderText="已开票未交货金额" />

                        <asp:BoundField DataField="remark" HeaderText="备注" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
