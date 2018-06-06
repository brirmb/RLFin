
// 初始化

$(function () {

    // 自动焦点

    $("#NewPassword").focus();

    // 表单验证

    $("#OKButton").click(function () {
        if (iiWeb_ValidateRequiredField()) {
            if ($("#NewPassword").val() == $("#ConfirmPassword").val()) {
                return true;
            }
            else {
                iiWeb_ShowTip(this, iiWeb_ConfirmPasswordErrorMessage);
                $("#ConfirmPassword").focus();
                return false;
            }
        }
        else {
            iiWeb_ShowTip(this, iiWeb_RequiredFieldValidationErrorMessage);
            return false;
        }
    });
});