
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

    // 1合同维护，2直接开票
    var pageType = getQueryStringByName('pageType');

    // 新增

    $("#CreateButton").click(function () {
        iiWeb_ShowDialog(
            "ContractEdit.aspx?pageType={0}".format(pageType),
            900,
            600
            );
        return false;
    });

    // 编辑

    $(".ImageButtonEdit").click(function () {
        iiWeb_ShowDialog(
            "ContractEdit.aspx?pageType={0}&ID={1}".format(pageType, escape($(this).attr("title"))),
            900,
            600
            );
        return false;
    });

    // 删除

    $("#DeleteButton").click(function () {
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