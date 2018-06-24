// 初始化

$(function () {


    // 表单验证
    $("#OKButton").click(function () {

        var taxNo = $.trim($('#rctcod').val()); //税号
        var taxRate = $.trim($('#rctax').val()); //税率代码

        var flag = true;

        if (taxNo.length == 0) {
            flag = confirm("你没有输入税号，因此该客户将不能打印增值税发票，你要继续吗？");
        }
        if (flag) {
            if (taxRate.length == 0) {
                flag = confirm("你没有选择税率代码，因此该客户将不能做应收帐款事务，你要继续吗？");
            }
        }

        if (flag) {
            if (iiWeb_ValidateRequiredField()) {
                return true;
            }
            else {
                iiWeb_ShowTip(this, iiWeb_RequiredFieldValidationErrorMessage);
                return false;
            }
        }
    });

});