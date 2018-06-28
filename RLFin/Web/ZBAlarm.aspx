<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZBAlarm.aspx.cs" Inherits="RLFin.Web.ZBAlarm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>质保金到期提醒</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Page">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="质保金到期提醒"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Caption">工令号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ORDNO" runat="server"></asp:TextBox>
                    </li>
                    <li class="Caption">到期选择
                    </li>
                    <li class="Content">
                        <asp:DropDownList ID="Limit" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Limit_SelectedIndexChanged">
                            <asp:ListItem Value="1">15天到期</asp:ListItem>
                            <asp:ListItem Value="2">30天到期</asp:ListItem>
                            <asp:ListItem Value="3">选择到期日</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="LimitDate" runat="server" CssClass="Date" Visible="False"></asp:TextBox>
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
                        <asp:TextBox ID="CUSTNAME" runat="server" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>

                    <li class="Caption">未收质保金总额
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ZbRemainTotal" runat="server" Enabled="False" ForeColor="#D32626"></asp:TextBox>元
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
                    EnableModelValidation="True" OnPageIndexChanging="List_PageIndexChanging" DataKeyNames="zbordno" OnRowDataBound="List_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="<%$ Resources:iiWeb, EditCaption %>">
                            <ItemTemplate>
                                <asp:LinkButton ID="RowEditButton" runat="server" CssClass="ImageButton ImageButtonEdit"
                                    ToolTip='<%# Eval("zbordno").ToString().Trim() %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="zbordno" HeaderText="工令号" />
                        <asp:BoundField DataField="zbseq" HeaderText="项号" />
                        <asp:BoundField DataField="zbcustno" HeaderText="客户代码" />
                        <asp:BoundField DataField="zbcustname" HeaderText="客户名称" />
                        <asp:BoundField DataField="zbstno" HeaderText="发货单号" />
                        <asp:BoundField DataField="zbqty" HeaderText="发货数量" />
                        <asp:BoundField DataField="zbamt" HeaderText="发货金额" />
                        <asp:BoundField DataField="zbname" HeaderText="货物名称" />
                        <asp:BoundField DataField="zbmapno" HeaderText="图号" />
                        <asp:BoundField DataField="um" HeaderText="单位" />
                        <asp:BoundField DataField="sch_zb" HeaderText="质保金比例%" />
                        <asp:BoundField DataField="zbtotal" HeaderText="质保金总额" />
                        <asp:BoundField DataField="zbskamt" HeaderText="已收质保金额" />
                        <asp:BoundField DataField="remainzb" HeaderText="未收质保金额" />
                        <asp:BoundField DataField="zbshipdate" HeaderText="发货日期" />
                        <asp:BoundField DataField="" HeaderText="质保期限" />
                        <asp:BoundField DataField="zblastdate" HeaderText="质保到期日" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
