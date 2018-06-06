
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

    // 新增

    $("#CreateButton").click(function () {
        iiWeb_ShowDialog(
            "UserDetail.aspx",
            700,
            300
            );
        return false;
    });

    // 编辑

    $(".ImageButtonEdit").click(function () {
        iiWeb_ShowDialog(
            "UserDetail.aspx?ID={0}".format(escape($(this).attr("title"))),
            700,
            300
            );
        return false;
    });

    // 删除

    $("#DeleteButton").click(function () {
        return confirm(iiWeb_ConfirmMessage);
    });

    // 权限维护

    $("#List .ImageButtonPC").click(function () {
        iiWeb_ShowDialog(
            "AuthorityDetail.aspx?Authority={0}&ID={1}".format(escape("U"), escape($(this).attr("title"))),
            400,
            400
            );
        return false;
    });
});