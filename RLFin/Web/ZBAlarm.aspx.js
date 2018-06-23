// 对话框回调

function iiWeb_DialogCallback(command, args) {
    switch (command) {
        case "OK": //选择客户回调
            $(args.host.frameElement.parentNode).dialog("close");

            var returnStr = args.returnStr;
            var cust = returnStr.split(',');
            $('#CUSTNO').val(cust[0]);
            $('#CUSTNAME').val(cust[1]);

            break;
        case "CloseRefresh": //关闭并刷新
            $(args.frameElement.parentNode).dialog("close");
            $("#OKButton").click();
            break;
        case "Close": //关闭
            $(args.frameElement.parentNode).dialog("close");
            break;
    }
}

// 初始化

$(function () {

    //选择客户
    $("#selCust").click(function () {
        iiWeb_ShowDialog(
            "SelectCust.aspx",
            720,
            500
            );
        return false;
    });

    // 编辑

    $(".ImageButtonEdit").click(function () {
        var orNo = $.trim($(this).parent().parent().find('td:eq(1)').text()); //工令号
        var seq = $.trim($(this).parent().parent().find('td:eq(2)').text());  //序号
        var stNo = $.trim($(this).parent().parent().find('td:eq(5)').text()); //发货单号
        iiWeb_ShowDialog(
            "ZBAlarmEdit.aspx?ID={0}&Seq={1}&StNo={2}".format(orNo, seq, stNo),
            800,
            400
            );
        return false;
    });


});