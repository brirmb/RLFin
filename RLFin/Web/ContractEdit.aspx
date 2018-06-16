<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractEdit.aspx.cs" Inherits="RLFin.Web.ContractEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%--  <script src="../jquery-1.4.1-vsdoc.js"></script>
    <script src="ContractEdit.aspx.js"></script>--%>
    <title>合同明细维护</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Dialog">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="合同明细维护"></asp:Label>
            </div>
            <div id="dvCont" class="Operating">
                <ul>
                    <li class="Caption">工令号
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="ORDNO" runat="server" CssClass="Required" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">合同名称
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ORDNAME" runat="server" CssClass="Required"></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">币别
                    </li>
                    <li class="ContentSmall">
                        <asp:DropDownList ID="CURR" runat="server" CssClass="Required">
                            <asp:ListItem>RMB</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">客户代码
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="CUSTNO" runat="server" CssClass="Required"></asp:TextBox><asp:LinkButton ID="selCust" Style="display: inline-block;" runat="server" CssClass="ImageButton ImageButtonDetail" ToolTip="选择客户"></asp:LinkButton>
                    </li>
                    <li class="CaptionMiddle">客户名称
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="CUSTNAME" runat="server" CssClass=""></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">合同总金额
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="ORDAMT" runat="server" CssClass="Required Float"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">签订日期
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="SIGNDATE" runat="server" CssClass="Required Date"></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">交货日期
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="DELIVERYDATE" runat="server" CssClass="Required Date"></asp:TextBox>
                    </li>
                    <li class="CaptionMiddle">质保期限
                    </li>
                    <li class="ContentSmall">
                        <asp:DropDownList ID="PROTECTTERM" runat="server" CssClass="Required">
                            <asp:ListItem>1</asp:ListItem>
                        </asp:DropDownList>年
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">结算方式(预付款
                    </li>
                    <li class="ContentSmall">
                        <asp:TextBox ID="SCH_YF" runat="server" CssClass="Required Float"></asp:TextBox>%
                    </li>
                    <li class="CaptionSmall">进度款
                    </li>
                    <li class="ContentSmall">
                        <asp:TextBox ID="SCH_JD" runat="server" CssClass="Required Float"></asp:TextBox>%
                    </li>
                    <li class="CaptionSmall">提货款
                    </li>
                    <li class="ContentSmall">
                        <asp:TextBox ID="SCH_TH" runat="server" CssClass="Required Float"></asp:TextBox>%
                    </li>
                    <li class="CaptionSmall">质保金
                    </li>
                    <li class="ContentSmall">
                        <asp:TextBox ID="SCH_ZB" runat="server" CssClass="Required Float"></asp:TextBox>%)
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">备注
                    </li>
                    <li class="ContentBig">
                        <asp:TextBox ID="Remark" runat="server"></asp:TextBox>
                    </li>
                    <li id="cpFP" class="CaptionMiddle">发票号码
                    </li>
                    <li class="ContentMiddle">
                        <asp:TextBox ID="FP" runat="server" CssClass="Required"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                </ul>
            </div>

            <div class="List">
                <div style="">
                    <asp:Button ID="CreateRow" runat="server" Text="添加行" OnClick="CreateRow_Click" />
                    <asp:Button ID="DeleteRow" runat="server" Text="删除行" OnClick="DeleteRow_Click" />
                </div>
                <asp:GridView ID="List" runat="server" EmptyDataText="<%$ Resources:iiWeb, EmptyData %>"
                    EnableModelValidation="True" DataKeyNames="SEQ" PageSize="100" AllowPaging="false" OnRowDataBound="List_RowDataBound" ShowFooter="true" OnPreRender="List_PreRender" OnLoad="List_Load">
                    <Columns>
                        <asp:TemplateField HeaderText="删除" HeaderStyle-Width="5%">
                            <ItemTemplate>
                                <input type="checkbox" id="RowCheck" runat="server" class="Check" title="<%$ Resources:iiWeb, DeleteButton %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="序号" HeaderStyle-Width="5%">
                            <ItemTemplate>
                                <asp:Label ID="SEQ" runat="server" Text="<%# Container.DataItemIndex +1%>"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="名称" HeaderStyle-Width="15%">
                            <ItemTemplate>
                                <%#Eval("ITEMNO") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="ITEMNO" runat="server" Width="90%" CssClass="Required"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="图号/代号" HeaderStyle-Width="15%">
                            <ItemTemplate>
                                <%#Eval("DRAWNO") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="DRAWNO" runat="server" Width="90%" CssClass="Required"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="数量" HeaderStyle-Width="8%">
                            <ItemTemplate>
                                <%#Eval("ORDQTY") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="ORDQTY" runat="server" Width="90%" CssClass="Required Integer sum1"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="单位" HeaderStyle-Width="8%">
                            <ItemTemplate>
                                <%#Eval("UM") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="UM" runat="server" CssClass="Required">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="单价" HeaderStyle-Width="8%">
                            <ItemTemplate>
                                <%#Eval("UNITPRICE") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="UNITPRICE" runat="server" Width="90%" CssClass="Required Float sum2"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="总价" HeaderStyle-Width="8%">
                            <ItemTemplate>
                                <%#Eval("AMT") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="AMT" runat="server" Width="90%" CssClass="Required Float sum3"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="备注" HeaderStyle-Width="20%">
                            <ItemTemplate>
                                <%#Eval("Remark") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="Remark" runat="server" Width="90%"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="Operating">
                <ul>
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
