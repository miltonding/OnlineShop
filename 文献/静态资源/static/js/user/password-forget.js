$(function() {
    $('#update-password-form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        /* fields start*/
        fields: {
            username: {/*键名username和input name值对应*/
                message: 'Username is not valid',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '用户名长度在6到30之间'
                    },
                    threshold :  6 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                    remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                        url: '/miltonshop/page/user/checkUserName',//验证地址
                        message: '用户不存在',//提示消息
                        delay :  2000,
                        type: 'POST',
                        date: {'username': $('#username').val()}
                    }
                }
            },
            phone: {
                message: 'The phone is not valid',
                validators: {
                    notEmpty: {
                        message: '手机号码不能为空'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: '请输入11位手机号码'
                    },
                    regexp: {
                        regexp: /^1[34578]\d{9}$/,
                        message: '请输入正确的手机号码'
                    }
                }
            },
            password: {
                message:'Password is not valid',
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '用户名长度必须在6到30之间'
                    }
                }
            },
            repeatPassword: {
                message:'Repeat password is not valid',
                validators: {
                    notEmpty: {
                        message: '确认密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '用户名长度必须在6到30之间'
                    },
                    identical: {//相同
                        field: 'password',
                        message: '密码不一致'
                    }
                }
            }
        }
        /* fields end*/
    });
});/**
 * Created by milton.ding on 2017/2/15.
 */
