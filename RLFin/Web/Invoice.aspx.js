// 对话框回调

function iiWeb_DialogCallback(command, args) {
    switch (command) {
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

    // 编辑

    $(".ImageButtonEdit").click(function () {
        var seq = $(this).parent().parent().find('td:eq(1)').text();
        iiWeb_ShowDialog(
            "InvoiceEdit.aspx?ID={0}&Seq={1}".format(escape($(this).attr("title")), seq),
            900,
            600
            );
        return false;
    });


});