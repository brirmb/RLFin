
// 初始化

$(function () {

    // 权限维护

    $("[id^=RoleSelector] .ImageButtonPC").click(function () {
        iiWeb_ShowDialog(
            "AuthorityDetail.aspx?Authority={0}&ID={1}".format(escape("R"), escape($(this).attr("title"))),
            400,
            400
            );
        return false;
    });
});