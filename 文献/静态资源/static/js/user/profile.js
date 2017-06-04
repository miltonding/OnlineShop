$(function() {
    $('#profile_menu li').on('click', function() {
        if (!$(this).hasClass('active')) {
/*            var seletedItem = $('#profile_menu li.active');
            var seletedFormId = '#' + seletedItem.attr('form');*/
            var newSelectedId = '#' + $(this).attr('form');
            $('#profile_menu li').removeClass('active');
            $('form').addClass('hidden');
            $(this).addClass('active');
            $(newSelectedId).removeClass('hidden');
        }
    });

    /* profile form validate */
    $('#profile-form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        /* fields start*/
        fields: {
            screenName: {
                message: 'screenName is not valid',
                validators: {
                    notEmpty: {
                        message: '昵称不能为空'
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
            email: {
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    emailAddress: {
                        message: '请输入正确的邮箱地址'
                    }
                }
            }
        }
        /* fields end*/
    });

    /* update-password-form validate */
    $('#update-password-form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        /* fields start*/
        fields: {
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

    // Delete address
    function okMessage(message) {
        $('.fixed-message-ok').removeClass('hidden').show().find('span').html(message);
        setTimeout(function() {
            $('.fixed-message-ok').fadeOut(1000);
        }, 2000);
    }

    function errorMessage(message) {
        $('.fixed-message-error').removeClass('hidden').show().find('span').html(message);
        setTimeout(function() {
            $('.fixed-message-error').fadeOut(1000);
        }, 2000);
    }

    var deleteSuccess = false;
    function deleteAddress(addressid) {
        $.ajax({
            url:"/miltonshop/page/address/deleteAddress",
            async: false,
            type: 'post',
            data: {'addressid': addressid},
            success: function(data) {
                // Success
                if (data === true) {
                    deleteSuccess = true;
                }
            },
            error: function() {
                console.log('error...');
            }
        });
    }

    $('.delete-address').on('click', function() {
        $('.disable-screen').removeClass('hidden');
        $('.confirm-message').removeClass('hidden');
        $('.confirm-message .ok').attr('addressid', $(this).attr('addressid'));
    });

    $('.confirm-message .cancel').on('click', function() {
        $('.disable-screen').addClass('hidden');
        $('.confirm-message').addClass('hidden');
    });

    $('.confirm-message .ok').on('click', function() {
        deleteSuccess = false;
        var addressid = $(this).attr('addressid');
        deleteAddress(addressid);

        if (deleteSuccess) {
            $('.delete-address[addressid = ' + addressid + ']').closest('.address').remove();
            okMessage('删除成功!');
        } else {
            errorMessage('删除失败!');
        }
        $('.disable-screen').addClass('hidden');
        $('.confirm-message').addClass('hidden');
    });

    // Change default
    $('.default-address').on('click', function() {
       if (!$(this).prop('checked')) {
           $(this).prop('checked', true);
       } else {
           // Ajax
           var defaultAddress = $(this);
           var addressid = $(this).attr('addressid').trim();
           $.ajax({
               url:"/miltonshop/page/address/upadteDefault",
               async: false,
               type: 'post',
               data: {'addressid': addressid},
               success: function(data) {
                   // Success
                   if (data === true) {
                       okMessage('修改成功！')
                       $('.default-address').prop('checked', false);
                       defaultAddress.prop('checked', true);
                   } else {
                       errorMessage('修改失败！');
                   }
               },
               error: function() {
                   console.log('error...');
               }
           });
       }
    });
});