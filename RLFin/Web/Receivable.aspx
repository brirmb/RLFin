﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receivable.aspx.cs" Inherits="RLFin.Web.Receivable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>收款</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Page">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="收款"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Caption">工令号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ORDNO" runat="server"></asp:TextBox>
                    </li>
                    <li class="Caption">合同名称
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ORDNAME" runat="server"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">客户代码
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="CUSTNO" runat="server"></asp:TextBox>
                    </li>
                    <li class="Caption">客户名称
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="CUSTNAME" runat="server"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">币别
                    </li>
                    <li class="Content">
                        <asp:DropDownList ID="CURR" runat="server">
                            <asp:ListItem>RMB</asp:ListItem>
                            <asp:ListItem>USD</asp:ListItem>
                            <asp:ListItem>EUR</asp:ListItem>
                            <asp:ListItem>JPY</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li class="Caption">合同总金额
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ORDAMT" runat="server"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Button">
                        <asp:Button ID="OKButton" runat="server" Text="<%$ Resources:iiWeb, OKButton %>"
                            OnClick="OKButton_Click" />
                        <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:iiWeb, CancelButton %>"
                            OnClick="CancelButton_Click" />
                        <%--   <asp:Button ID="CreateButton" runat="server" Text="<%$ Resources:iiWeb, CreateButton %>"
                            CssClass="Highlighted" />
                        <asp:Button ID="DeleteButton" runat="server" Text="<%$ Resources:iiWeb, DeleteButton %>"
                            CssClass="Highlighted" OnClick="DeleteButton_Click" />--%>
                    </li>
                </ul>
            </div>
            <div class="List">
                <asp:GridView ID="List" runat="server" EmptyDataText="<%$ Resources:iiWeb, EmptyData %>"
                    EnableModelValidation="True" OnPageIndexChanging="List_PageIndexChanging" DataKeyNames="ORDNO" OnRowDataBound="List_RowDataBound">
                    <Columns>
                        <%--              <asp:TemplateField>
                            <HeaderTemplate>
                                <input type="checkbox" id="RowCheckAll" runat="server" class="CheckAll" title="<%$ Resources:iiWeb, DeleteButton %>" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <input type="checkbox" id="RowCheck" runat="server" class="Check" title="<%$ Resources:iiWeb, DeleteButton %>" />
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="<%$ Resources:iiWeb, EditCaption %>">
                            <ItemTemplate>
                                <asp:LinkButton ID="RowEditButton" runat="server" CssClass="ImageButton ImageButtonEdit"
                                    ToolTip='<%# Eval("ORDNO").ToString().Trim() %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ORDNO" HeaderText="工令号" />
                        <asp:BoundField DataField="scont" HeaderText="合同名称" />
                        <asp:BoundField DataField="scust" HeaderText="客户代码" />
                        <asp:BoundField DataField="scnme" HeaderText="客户名称" />
                        <asp:BoundField DataField="scurr" HeaderText="币别" />
                        <asp:BoundField DataField="stotal" HeaderText="合同总金额" />
                        <asp:BoundField DataField="amt" HeaderText="收款总金额" />
                        <asp:BoundField DataField="lamt" HeaderText="未收总金额" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
