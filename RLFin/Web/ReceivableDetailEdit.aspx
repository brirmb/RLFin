<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceivableDetailEdit.aspx.cs" Inherits="RLFin.Web.ReceivableDetailEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>明细信息维护</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Dialog">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="明细信息维护"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Caption">项次
                    </li>
                    <li class="Content">
                        <asp:DropDownList ID="cboItem" runat="server" CssClass="Required" AutoPostBack="True" OnSelectedIndexChanged="cboItem_SelectedIndexChanged">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="T1">预收款</asp:ListItem>
                            <asp:ListItem Value="T2">进度款</asp:ListItem>
                            <asp:ListItem Value="T3">提货款</asp:ListItem>
                            <asp:ListItem Value="T4">质保金</asp:ListItem>
                            <asp:ListItem Value="T5">其它</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">序号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="Seq" runat="server" CssClass="Required Integer"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">收款比例(%)
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="Per" runat="server" CssClass="Required Float"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">预计收款金额
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="SAmt" runat="server" CssClass="Required Float"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">实际收款日
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ActualDate" runat="server" CssClass="Required Date"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">实际收款金额
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ActualAmt" runat="server" CssClass="Required Float"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">收款方式
                    </li>
                    <li class="Content">
                        <asp:DropDownList ID="cboType" runat="server" CssClass="Required">
                            <asp:ListItem>银行汇款</asp:ListItem>
                            <asp:ListItem>银行承兑汇票</asp:ListItem>
                            <asp:ListItem>现金</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">备注
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="Remark" runat="server"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Button">
                        <asp:Button ID="OKButton" runat="server" Text="<%$ Resources:iiWeb, OKButton %>"
                            OnClick="OKButton_Click" />
                        <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:iiWeb, CancelButton %>" />
                    </li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
