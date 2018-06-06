
// 初始化

$(function () {

    //折叠，展开

    $("#SplitterButton")
        .focus(function () { //去除虚线框
            $(this).blur();
        })
        .click(function () {
            var button = $(this);
            var parentFrameset = $(window.frameElement.parentNode);
            if (button.hasClass("SplitterButtonCollapse")) { //折叠
                parentFrameset.attr("cols", "0,10,*");
                button.removeClass("SplitterButtonCollapse").addClass("SplitterButtonExpand");
            }
            else { //展开
                parentFrameset.attr("cols", "190,10,*");
                button.removeClass("SplitterButtonExpand").addClass("SplitterButtonCollapse");
            }
            //取消事件
            return false;
        })
});