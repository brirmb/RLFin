
// 对话框回调

function iiWeb_DialogCallback(command, args) {
    switch (command) {
        case "OK":
            $(args.host.frameElement.parentNode).dialog("close");

            var returnStr = args.returnStr;
            //alert(returnStr);
            var cust = returnStr.split(',');
            $('#CUSTNO').val(cust[0]);
            $('#CUSTNAME').val(cust[1]);

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
    if (pageType == 2) {
        $('#cpFP').show();
        $('#FP').show();
        $('#DeleteRow').hide();
    } else {
        $('#cpFP').hide();
        $('#FP').hide();
        $('#DeleteRow').show();
    }

    //选择客户
    $("#selCust").click(function () {
        iiWeb_ShowDialog(
            "SelectCust.aspx",
            720,
            500
            );
        return false;
    });

    // 表单验证
    $("#CreateRow").click(function () {
        if (iiWeb_ValidateRequiredField($('#List'))) {
            return true;
        }
        else {
            iiWeb_ShowTip(this, iiWeb_RequiredFieldValidationErrorMessage);
            return false;
        }
    });

    // 表单验证
    $("#OKButton").click(function () {
        if (ValidateRequiredFieldNew($('#dvCont'))) {
            return true;
        }
        else {
            iiWeb_ShowTip(this, iiWeb_RequiredFieldValidationErrorMessage);
            return false;
        }
    });

    $("#SCH_YF").blur(function () {
        GetZB();
    });
    $("#SCH_JD").blur(function () {
        GetZB();
    });
    $("#SCH_TH").blur(function () {
        GetZB();
    });

    $(".sum1").blur(function () {
        Sum();
    });
    $(".sum2").blur(function () {
        Sum();
    });

});

//计算质保金比例
function GetZB() {
    var yf = $('#SCH_YF').val();
    var jd = $('#SCH_JD').val();
    var th = $('#SCH_TH').val();
    yf = $.trim(yf) == '' ? 0 : parseFloat(yf);
    jd = $.trim(jd) == '' ? 0 : parseFloat(jd);
    th = $.trim(th) == '' ? 0 : parseFloat(th);
    $('#SCH_ZB').val(100 - yf - jd - th);
}

//明细计算总价
function Sum() {
    var qty = $('.sum1').val();
    var price = $('.sum2').val();
    qty = $.trim(qty) == '' ? 0 : parseFloat(qty);
    price = $.trim(price) == '' ? 0 : parseFloat(price);
    $('.sum3').val(price * qty);
}

//根据QueryString参数名称获取值
function getQueryStringByName(name) {
    var result = location.search.match(new RegExp("[\?\&]" + name + "=([^\&]+)", "i"));
    if (result == null || result.length < 1) {
        return "";
    }
    return result[1];
}

var ValidateRequiredFieldNew = function (parent) {
    /// <summary>
    /// 验证必要栏位
    /// </summary>
    if (typeof (parent) != "object") {
        parent = document;
    }
    var result = true;
    $(parent).find(".Required:visible").each(function () {
        var value = $(this).val();
        if (!value || value.length == 0) {
            $(this).addClass("ValidationError");
            if (result) {
                $(this).focus(); //友好性焦点
            }
            result = false;
        }
        else {
            $(this).removeClass("ValidationError");
        }
    });
    return result;
};