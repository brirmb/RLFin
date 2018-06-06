
// 初始化

$(function () {

    // 全选

    $(":checkbox.CheckAll").each(function () { //初始化
        var checks = $(":checkbox:visible:enabled:not(.CheckAll)");
        if (checks.size() > 0) {
            $(this).attr(
                "checked",
                checks.size() == checks.filter(":checked").size()
                );
        }
    });
    $(":checkbox.CheckAll").click(function () {
        $(":checkbox:visible:enabled:not(.CheckAll)")
            .attr("checked", $(this).attr("checked"));
    });
    $(":checkbox:not(.CheckAll)").click(function () {
        var checks = $(":checkbox:visible:enabled:not(.CheckAll)");
        $(":checkbox.CheckAll")
            .attr(
                "checked",
                checks.size() == checks.filter(":checked").size()
                );
    });
});