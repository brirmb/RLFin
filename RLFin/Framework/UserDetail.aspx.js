
// 初始化

$(function () {

    // 自动焦点

    if ($("#UID").val().length == 0) {
        $("#UID").focus();
    }
    else {
        $("#Name").focus();
    }

    // 表单验证

    $("#OKButton").click(function () {
        if (iiWeb_ValidateRequiredField()) {
            return true;
        }
        else {
            iiWeb_ShowTip(this, iiWeb_RequiredFieldValidationErrorMessage);
            return false;
        }
    });
});