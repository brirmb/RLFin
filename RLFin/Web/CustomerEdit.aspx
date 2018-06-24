<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerEdit.aspx.cs" Inherits="RLFin.Web.CustomerEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客户维护</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Dialog">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="客户维护"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="CaptionMiddle">客户代码
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="rccust" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">客户名称
                    </li>
                    <li class="ContentBig">
                        <asp:TextBox ID="rcnam" runat="server" CssClass="Required"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">区域
                    </li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="rcarea" runat="server" CssClass="Required">
                        </asp:DropDownList>
                    </li>
                    <li class="CaptionMiddle">省份
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="rcprov" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">县市
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="rccoty" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">地址
                    </li>
                    <li class="ContentLarge">
                        <asp:TextBox ID="rcadr1" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">电话号码</li>
                    <li class="Content">
                        <asp:TextBox ID="rcpon1" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle"></li>
                    <li class="ContentLarge">
                        <asp:TextBox ID="rcadr2" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle"></li>
                    <li class="Content">
                        <asp:TextBox ID="rcpon2" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle"></li>
                    <li class="ContentLarge">
                        <asp:TextBox ID="rcadr3" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle"></li>
                    <li class="Content">
                        <asp:TextBox ID="rcpon3" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">传真号码</li>
                    <li class="Content">
                        <asp:TextBox ID="rcfax1" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="rcfax2" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">业务员</li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="rcsalr" runat="server" CssClass="">
                        </asp:DropDownList>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">电子邮件</li>
                    <li class="Content">
                        <asp:TextBox ID="rcemai1" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="rcemai2" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">联络人</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="rcctat" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">付款方式
                    </li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="rcterm" runat="server" CssClass="">
                        </asp:DropDownList>
                    </li>
                    <li class="CaptionMiddle">交易条件
                    </li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="rctrc" runat="server" CssClass="">
                        </asp:DropDownList>
                    </li>
                    <li class="CaptionMiddle">币别
                    </li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="rccur" runat="server" CssClass="">
                        </asp:DropDownList>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">开户银行</li>
                    <li class="ContentLarge">
                        <asp:TextBox ID="rcbank" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">银行账号</li>
                    <li class="Content">
                        <asp:TextBox ID="rcacct" runat="server" CssClass="Integer"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">行业别</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="rchyb" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">税率代码</li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="rctax" runat="server" CssClass="">
                        </asp:DropDownList>
                    </li>
                    <li class="CaptionMiddle">税号</li>
                    <li class="Content">
                        <asp:TextBox ID="rctcod" runat="server" CssClass="Integer"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">可用额度</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="rcamt" runat="server" CssClass="Float"></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">信用额度</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="rccrd" runat="server" CssClass="Float"></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">客户级别</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="rcgrad" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">是否有额度限制</li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="rcdflg" runat="server" CssClass="">
                            <asp:ListItem>Y</asp:ListItem>
                            <asp:ListItem>N</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li class="CaptionMiddle">行销通路类别</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="rckind" runat="server" CssClass=""></asp:TextBox>
                    </li>
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
