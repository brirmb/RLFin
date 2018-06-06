<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract.aspx.cs" Inherits="RLFin.Web.Contract" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同维护</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Page">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="合同维护"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Caption">工令号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="Supplier" runat="server"></asp:TextBox>
                    </li>
                    <li class="Caption">原料编号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ProductNo" runat="server"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">入厂日期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 从
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="InspectDateFrom" runat="server" CssClass="Date"></asp:TextBox>
                    </li>
                    <li class="Caption">到
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="InspectDateTo" runat="server" CssClass="Date"></asp:TextBox>
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
                    EnableModelValidation="True" OnPageIndexChanging="List_PageIndexChanging" DataKeyNames="ID" OnRowDataBound="List_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="ProductCode" HeaderText="产品名称" />
                        <asp:BoundField DataField="ProductNo" HeaderText="产品编号" />
                        <asp:BoundField DataField="Supplier" HeaderText="供应商" />
                        <asp:BoundField DataField="InspectDate" HeaderText="入厂日期" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="RecordCode" HeaderText="原料报告编号" />
                        <asp:TemplateField HeaderText="原料检测报告">
                            <ItemTemplate>
                                <asp:LinkButton ID="RowEditButton" runat="server" CssClass="ImageButton ImageButtonDetail"
                                    ToolTip='<%# Eval("ID").ToString().Trim()+"aaaMaterialRecord"+"aaa"+Eval("RecordStatus").ToString().Trim() %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
