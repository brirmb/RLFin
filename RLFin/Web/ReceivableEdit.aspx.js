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

    // 页面传参 工令号
    var orNO = getQueryStringByName('ID');

    // 新增

    $("#CreateRow").click(function () {
        iiWeb_ShowDialog(
            "ReceivableDetailEdit.aspx?ID={0}".format(escape(orNO)),
            450,
            390
            );
        return false;
    });

    // 编辑

    $(".ImageButtonEdit").click(function () {
        var seq = $(this).parent().parent().find('td:eq(3)').text();
        iiWeb_ShowDialog(
            "ReceivableDetailEdit.aspx?ID={0}&Item={1}&Seq={2}".format(escape(orNO), escape($(this).attr("title")), $.trim(seq)),
            450,
            390
            );
        return false;
    });

    // 删除

    $("#DeleteRow").click(function () {
        return confirm(iiWeb_ConfirmMessage);
    });

});

//根据QueryString参数名称获取值
function getQueryStringByName(name) {
    var result = location.search.match(new RegExp("[\?\&]" + name + "=([^\&]+)", "i"));
    if (result == null || result.length < 1) {
        return "";
    }
    return result[1];
}