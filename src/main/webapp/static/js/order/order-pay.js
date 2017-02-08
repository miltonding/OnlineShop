$(function() {
    $('#pay-order').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        /* fields start*/
        fields: {
            creditcard: {/*键名username和input name值对应*/
                message: 'Creditcard is not valid',
                validators: {
                    notEmpty: {
                        message: '卡号不能为空'
                    },
                    /* 自定义 validator*/
                    callback: {
                        message: '请输入正确的银行卡号',
                        callback: function(value, validator) {
                            if (Validator.isCreditCard(value)) {
                                return true;
                            }
                            return false;
                        }
                    }
                }
            },
            cardPassword: {
                message: 'CardPassword is not valid',
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    }
                }
            }
        }
    });

    $('#cancelBtn').on('click', function() {
        mui.confirmMessage('确定取消？', function () {
            var orderid = $(':hidden[name="orderid"]').val();
            window.top.location.href = 'orderCancel?orderid=' + orderid;
        });
    });
});