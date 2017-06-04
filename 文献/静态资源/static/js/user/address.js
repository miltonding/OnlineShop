$(function() {
    $('#address-form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        /* fields start*/
        fields: {
            receiverName: {
                message: 'The receiver name is not valid',
                validators: {
                    notEmpty: {
                        message: '收货人姓名不能为空'
                    },
                    /* 自定义 validator*/
                    callback: {
                        message: '收货人姓名不包含数字和特殊字符',
                        callback: function (value, validator) {
                            if (!Validator.containsNumber(value) && !Validator.containSpecial(value)) {
                                return true;
                            }
                            return false;
                        }
                    }
                }
            },
            phoneNumber: {
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
            zipCode: {
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
            /* fields end*/
        }
    });

    function validateAddress() {
        $('.address-group small').remove();
        if ('0' === $('#select-province').val()) {
            $('div[class*="select-"]').addClass('has-error');
            $('.address-group').append('<small class="help-block" data-bv-validator="notEmpty">请选择正确收货地址</small>');
            return false;
        } else {
            $('div[class*="select-"]').removeClass('has-error');
            if (!$('#address-form .form-group').hasClass('has-error')) {
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

    $('#address-form').on('submit', function() {
        if (!validateAddress()) {
            return false;
        }
        return true;
    });

});