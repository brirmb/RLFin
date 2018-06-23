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
                        <asp:TextBox ID="ORDNO" runat="server" CssClass="Required"></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">厂商名称
                    </li>
                    <li class="ContentBig">
                        <asp:TextBox ID="Seq" runat="server" CssClass="Required"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">区域
                    </li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="CURR" runat="server" CssClass="Required">
                        </asp:DropDownList>
                    </li>
                    <li class="CaptionMiddle">省份
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">县市
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">地址
                    </li>
                    <li class="ContentLarge">
                        <asp:TextBox ID="TextBox3" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">电话号码</li>
                    <li class="Content">
                        <asp:TextBox ID="TextBox6" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle"></li>
                    <li class="ContentLarge">
                        <asp:TextBox ID="TextBox4" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle"></li>
                    <li class="Content">
                        <asp:TextBox ID="TextBox7" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle"></li>
                    <li class="ContentLarge">
                        <asp:TextBox ID="TextBox5" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle"></li>
                    <li class="Content">
                        <asp:TextBox ID="TextBox8" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">传真号码</li>
                    <li class="Content">
                        <asp:TextBox ID="TextBox9" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="TextBox10" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">采购员</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="TextBox13" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">电子邮件</li>
                    <li class="Content">
                        <asp:TextBox ID="TextBox11" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="TextBox12" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">联络人</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="TextBox14" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">付款方式
                    </li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="Required">
                        </asp:DropDownList>
                    </li>
                    <li class="CaptionMiddle">交易条件
                    </li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="Required">
                        </asp:DropDownList>
                    </li>
                    <li class="CaptionMiddle">币别
                    </li>
                    <li class="ContentMiddle">
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="Required">
                        </asp:DropDownList>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">开户银行</li>
                    <li class="ContentLarge">
                        <asp:TextBox ID="TextBox15" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">银行账号</li>
                    <li class="Content">
                        <asp:TextBox ID="TextBox17" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="CaptionMiddle">行业别</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="TextBox18" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">税率</li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="TextBox19" runat="server" CssClass=""></asp:TextBox>%
                    </li>
                    <li class="CaptionMiddle">税号</li>
                    <li class="Content">
                        <asp:TextBox ID="TextBox16" runat="server" CssClass=""></asp:TextBox>
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
