$(function() {
    var canSubmit = true;
    $('#userName').on('blur', function() {
        var userName = $(this).val();
        var errorMessage = $('.error_message');
        if (Validator.isEmail(userName) || Validator.isPhone(userName)) {
            Validator.addSuccess($(this));
            errorMessage.html('').addClass('hidden');
        } else {
            Validator.addError($(this));
            errorMessage.html('账号为邮箱或手机号码!').removeClass('hidden');
            canSubmit =  false;
        }
    });

    $('#password').on('blur', function() {
        var password = $(this).val();
        if (!Validator.isEmpty(password)) {
            Validator.addSuccess($(this));
        } else {
            Validator.addError($(this));
            $(this).attr('placeholder', '密码为空!');
            canSubmit =  false;
        }
    });

    function login() {
        canSubmit = true;
        $('#userName').trigger('blur');
        $('#password').trigger('blur');
        console.log(canSubmit);
        if (canSubmit) {
            $('#loginForm').submit();
        }

    }
    $('#loginBtn').on('click', login);

    $("#userName").on("keydown", function(e) {
        if (e.keyCode === 13) {
            login();
        }
    })

    $("#password").on("keydown", function(e) {
        if (e.keyCode === 13) {
            login();
        }
    });
});