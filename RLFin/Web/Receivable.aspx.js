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
        iiWeb_ShowDialog(
            "ReceivableEdit.aspx?ID={0}".format(escape($(this).attr("title"))),
            900,
            450
            );
        return false;
    });

});
