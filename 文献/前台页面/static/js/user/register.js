$(document).ready(function() {
    /**
     * 下面是进行插件初始化
     * 你只需传入相应的键值对
     * */
    $('#register-form').bootstrapValidator({
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
                    /* 自定义 validator*/
                    callback: {
                        message: '用户名为邮箱或手机号码',
                        callback: function(value, validator) {
                            if (Validator.isEmail(value) || Validator.isPhone(value)) {
                               return true;
                            }
                            return false;
                        }
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '用户名长度必须在6到30之间'
                    },
                    threshold :  6 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                    remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                        url: '/miltonshop/page/user/checkoutUserName',//验证地址
                        message: '用户已存在',//提示消息
                        delay :  2000,
                        type: 'POST',
                        date: {'username': $('#username').val()},
                        /* 返回的对象必须是: {"valid",true}或 {"valid",false} */
                        callback: function(data) {
                            console.log(data);
                        }
                        //请求方式
                        /**自定义提交数据，默认值提交当前input value
                         *  data: function(validator) {
                               return {
                                   password: $('[name="passwordNameAttributeInYourForm"]').val(),
                                   whatever: $('[name="whateverNameAttributeInYourForm"]').val()
                               };
                            }
                         */
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
            receiverName: {
                message: 'The receiver name is not valid',
                validators: {
                    notEmpty: {
                        message: '收货人姓名不能为空'
                    },
                    /* 自定义 validator*/
                    callback: {
                        message: '收货人姓名不包含数字和特殊字符',
                        callback: function(value, validator) {
                            if (!Validator.containsNumber(value) && !Validator.containSpecial(value)) {
                                return true;
                            }
                            return false;
                        }
                    }
                }
            },
            addressCode: {
                message: 'Address code is not valid',
                validators: {
                    notEmpty: {
                        message: '邮编不能为空'
                    },
                    numeric: {message: '邮政编码只包含数字'},
                    stringLength: {
                        min: 6,
                        max: 6,
                        message: '请输入六位邮政编码'
                    }
                }
            },
            detailAddress: {
                message: 'Detail address is not valid',
                validators: {
                    notEmpty: {
                        message: '详细地址不能为空'
                    },
                    callback: {
                        message: '详细地址不包含特殊字符',
                        callback: function(value, validator) {
                            if (!Validator.containSpecial(value)) {
                                return true;
                            }
                            return false;
                        }
                    }
                }
            }
        }
        /* fields end*/
    });

    function validateAddress() {
        $('.address-group small').remove();
        if ('0' === $('#select-province').val()) {
            $('div[class*="select-"]').addClass('has-error');
            $('.address-group').append('<small class="help-block" data-bv-validator="notEmpty">请选择正确收货地址</small>');
            return false;
        } else {
            $('div[class*="select-"]').removeClass('has-error');
            if (!$('#register-form .form-group').hasClass('has-error')) {
                $('button').removeAttr('disabled');
            }
            return true;
        }
    }

    $('#select-province').on('change', validateAddress);

    function findCityList() {
        var url = "/miltonshop/page/user/findCityList";
        var firstCityId = '0';
        $.post(url, {"provinceid":  $('#select-province').val()}, function callback(data){
            $.each(data, function(index, city) {
                if (index === '0') {
                    firstCityId = city.cityid;
                }
                var option = '<option value= "' + city.cityid + '">' + city.cityName + '</option>';
                $('#select-city').append(option);
            });
            findDistrictList(firstCityId);
        }, "json");
    }

    function findDistrictList(cityid) {
        if (cityid === '0') {
            cityid = $('#select-city').val();
        }
        var url = "/miltonshop/page/user/findDistrictList";
        $.post(url, {"cityid": cityid}, function callback(data){
            $.each(data, function(index, district) {
                var option = '<option value= "' + district.districtid + '">' + district.districtName + '</option>';
                $('#select-district').append(option);
            });
        }, "json");
    }
    // 菜单联动
    $('#select-province').on('change', function() {
        $('#select-city option').remove();
        $('#select-district option').remove();

        if ('0' !== $(this).val()) {
            findCityList();
        } else {
            $('#select-city').append('<option value="0">市/区</option>');
            $('#select-district').append('<option value="0">县/乡</option>');
        }
        //$('#select-district').append('<option value="0">县/乡</option>');
    });

    $('#select-city').on('change', function() {
        $('#select-district option').remove();
        findDistrictList('0');

    });

    $('#register-form').on('submit', function() {
        if (!validateAddress()) {
            return false;
        }
        return true;
    });
});
