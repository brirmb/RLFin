//  iiWeb公共功能
//  http://plusii.com
//  Copyright 2011, Hedda@Plusii.com
//  
//  (公共)
//      jQuery 1.4.4
//      jQuery.UI 1.8.11
//      下拉框（体验增强）
//      焦点特效（体验增强）
//      特殊字符（功能扩展）
//      整数（功能扩展）
//      浮点数（功能扩展）
//      日期（功能扩展）
//      全选（功能扩展）
//      面板（控件扩展）
//  
//  iiWeb_(资源名)
//      实现脚本多语言支持的变量。在“App_GlobalResources/iiWeb”定义资源，在“Web.config/GlobalizationResourceNames”配置映射
//  
//  String.trimStart(trimming)
//      首截去
//  String.trimEnd(trimming)
//      尾截去
//  String.padLeft(width, padding)
//      左填充
//  String.padRight(width, padding)
//      右填充
//  String.startsWith(matching)
//      起始于
//  String.endsWith(matching)
//      结束于
//  String.format(format, arg0, arg1, arg2, ...)
//      格式化字符串。用法同C#
//  Number.round(precision)
//      按精度四舍五入
//  
//  iiWeb_ValidateRequiredField(parent)
//      表单验证
//  iiWeb_ShowTip(sender, message, icon, duration)
//      提示框
//  iiWeb_ShowMessage(message, title, icon)
//      消息框
//  iiWeb_ShowDialog(url, width, height, title)
//      对话框。子页面基类封装了回调方法，父页面通过iiWeb_DialogCallback(command, args)接口响应回调


// 初始化

$(function () {

    // 自动焦点

    if ($("#UserID").val().length == 0) {
        $("#UserID").focus();
    }
    else {
        $("#Password").focus();
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