<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FactoryEdit.aspx.cs" Inherits="RLFin.Web.FactoryEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>厂商维护</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Dialog">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="厂商维护"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="CaptionMiddle">厂商代码
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="avend" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">厂商名称
                    </li>
                    <li class="ContentBig">
                        <asp:TextBox ID="avnam" runat="server" CssClass="Required"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">区域
                    </li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="avarea" runat="server" CssClass="Required">
                        </asp:DropDownList>
                    </li>
                    <li class="CaptionMiddle">省份
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="avprov" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">县市
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="avcoty" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">地址
                    </li>
                    <li class="ContentLarge">
                        <asp:TextBox ID="avadr1" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">电话号码</li>
                    <li class="Content">
                        <asp:TextBox ID="avpon1" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle"></li>
                    <li class="ContentLarge">
                        <asp:TextBox ID="avadr2" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle"></li>
                    <li class="Content">
                        <asp:TextBox ID="avpon2" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle"></li>
                    <li class="ContentLarge">
                        <asp:TextBox ID="avadr3" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle"></li>
                    <li class="Content">
                        <asp:TextBox ID="avpon3" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">传真号码</li>
                    <li class="Content">
                        <asp:TextBox ID="avfax1" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="avfax2" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">采购员</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="avctat" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">电子邮件</li>
                    <li class="Content">
                        <asp:TextBox ID="avemai1" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="avemai2" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">联络人</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="avsalr" runat="server" CssClass="Required"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">付款方式
                    </li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="avterm" runat="server" CssClass="Required">
                        </asp:DropDownList>
                    </li>
                    <li class="CaptionMiddle">交易条件
                    </li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="avtrc" runat="server" CssClass="Required">
                        </asp:DropDownList>
                    </li>
                    <li class="CaptionMiddle">币别
                    </li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="avcur" runat="server" CssClass="Required">
                        </asp:DropDownList>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">开户银行</li>
                    <li class="ContentLarge">
                        <asp:TextBox ID="avbank" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">银行账号</li>
                    <li class="Content">
                        <asp:TextBox ID="avacct" runat="server" CssClass="Integer"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">行业别</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="avhyb" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">税率</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="avtax" runat="server" CssClass="Required Float"></asp:TextBox>%
                    </li>
                    <li class="CaptionMiddle">税号</li>
                    <li class="Content">
                        <asp:TextBox ID="atcod" runat="server" CssClass="Integer"></asp:TextBox>
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
