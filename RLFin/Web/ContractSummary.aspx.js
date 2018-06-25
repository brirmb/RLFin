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

});