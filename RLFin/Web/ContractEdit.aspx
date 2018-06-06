<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractEdit.aspx.cs" Inherits="RLFin.Web.ContractEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同明细维护</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Dialog">
            <div class="Title">
                <asp:Label ID="PageTitle" runat="server" Text="合同明细维护"></asp:Label>
            </div>
            <div class="Operating">
                <ul>
                    <li class="Caption">工令号
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="Serial" runat="server"></asp:TextBox>
                    </li>
                    <li class="Caption">合同名称
                    </li>
                    <li class="Content">
                        <asp:DropDownList ID="RecordCode" runat="server" ToolTip="选取原料检测报告带出茶多酚和碎茶平均值" AutoPostBack="True" OnSelectedIndexChanged="RecordCode_SelectedIndexChanged"></asp:DropDownList>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">币别
                    </li>
                    <li class="Content">
                        <asp:DropDownList ID="ProductNo" runat="server" CssClass="Required" OnSelectedIndexChanged="ProductNo_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </li>
                    <li class="Caption">签订日期
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="ProductCode" runat="server" CssClass="Required" Enabled="false"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">客户代码
                    </li>
                    <li class="Content">
                        <asp:DropDownList ID="Supplier" runat="server" CssClass=""></asp:DropDownList>
                    </li>
                    <li class="Caption">客户名称
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="WarehouseDate" runat="server" CssClass="Required Date"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">合同总金额
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="Specification" runat="server" CssClass="Required Float"></asp:TextBox>
                    </li>
                    <li class="Caption">交货日期
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="Quantity" runat="server" CssClass="Required Float"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">结算方式(预付款
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="CDF" runat="server"></asp:TextBox>
                    </li>
                    <li class="Caption">进度款
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="SC" runat="server"></asp:TextBox>
                    </li>
                    <li class="Caption">提货款
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </li>
                    <li class="Caption">质保金
                    </li>
                    <li class="Content">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">质保期限
                    </li>
                    <li class="Content">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass=""></asp:DropDownList>
                    </li>
                    <li class="LineFeed"></li>
                    <li class="Caption">备注
                    </li>
                    <li class="ContentLong">
                        <asp:TextBox ID="Remark" runat="server"></asp:TextBox>
                    </li>
                    <li class="Button">
                          <asp:Button ID="CreateRow" runat="server" Text="添加行" OnClick="CreateRow_Click" />
                        <asp:Button ID="DeleteRow" runat="server" Text="删除行" OnClick="DeleteRow_Click" />
                    </li>
                </ul>
            </div>
               <div class="List">
                <asp:GridView ID="List" runat="server" EmptyDataText="<%$ Resources:iiWeb, EmptyData %>"
                    EnableModelValidation="True" DataKeyNames="ID,IsCalculate" PageSize="100" AllowPaging="false" OnRowDataBound="List_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="删除">
                            <ItemTemplate>
                                <input type="checkbox" id="RowCheck" runat="server" class="Check" title="<%$ Resources:iiWeb, DeleteButton %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="序号">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex +1%>"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="批次" HeaderStyle-Width="5%">
                            <ItemTemplate>
                                <asp:TextBox ID="Batch" runat="server" Text='<%# Eval("Batch").ToString().Trim() %>' Width="90%"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="茶多酚(%)">
                            <ItemTemplate>
                                <asp:TextBox ID="CDF" runat="server" Text='<%# Eval("CDF").ToString().Trim() %>' Width="90%"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="水分(%)">
                            <ItemTemplate>
                                <asp:TextBox ID="SF" runat="server" Text='<%# Eval("SF").ToString().Trim() %>' Width="90%"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="灰分(%)">
                            <ItemTemplate>
                                <asp:TextBox ID="HF" runat="server" Text='<%# Eval("HF").ToString().Trim() %>' Width="90%"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="茶梗(%)">
                            <ItemTemplate>
                                <asp:TextBox ID="CG" runat="server" Text='<%# Eval("CG").ToString().Trim() %>' Width="90%"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="碎茶(%)">
                            <ItemTemplate>
                                <asp:TextBox ID="SC" runat="server" Text='<%# Eval("SC").ToString().Trim() %>' Width="90%"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="备注" HeaderStyle-Width="15%">
                            <ItemTemplate>
                                <asp:TextBox ID="Remark" runat="server" Text='<%# Eval("Remark").ToString().Trim() %>' Width="90%"></asp:TextBox>
                            </ItemTemplate>
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
