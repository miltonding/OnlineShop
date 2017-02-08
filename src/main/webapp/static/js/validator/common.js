/* Regex Expression */
var phoneExpress = /^1[34578]\d{9}$/;
var emailExpress = /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;

var Validator = {
    positiveExpress : /^[0-9]*[1-9][0-9]*$/,
    phoneExpress : /^1[34578]\d{9}$/,
    emailExpress : /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/,
    letterExpress : /^[A-Za-z]+$/,
    specialExpress : /[(\ )(\~)(\!)(\@)(\#)(\$)(\%)(\^)(\&)(\*)(\()(\))(\-)(\_)(\+)(\=)(\[)(\])(\{)(\})(\|)(\\)(\;)(\:)(\')(\")(\,)(\.)(\/)(\<)(\>)(\?)(\)]+/,
    creditCardExpress :  /^(\d{16}|\d{19})$/,
    isPositiveNum :  function(param){
        if (this.isEmpty(param)) {
            return false;
        }
        return this.positiveExpress.test(param)
    },
    isPhone : function (param){
        if(!(phoneExpress.test(param.trim()))){
            return false;
        }
        return true;
    },
    isEmail : function (param){
        if(!(emailExpress.test(param.trim()))){
            return false;
        }
        return true;
    },
    isEmpty : function(param) {
        if (param.length === 0) {
            return true;
        }
        return false;
    },
    isCreditCard : function(param) {
        if (this.creditCardExpress.test(param)) {
            return true;
        }
        return false;
    },

    containsNumber : function(param) {
        var result = false;
        for (i = 0; i < param.length; i++) {
            if (param.charAt(i) > '0' && param.charAt(i) < '9') {
                result = true;
            }
        }
        return result;
    },
    containSpecial : function(param) {
        if(this.specialExpress.test(param.trim())){
            return true;
        }
        return false;
    },
    isFile : function(param) {
        param = param.toLocaleLowerCase().trim();
        if (param.endsWith('jpg') || param.endsWith('jif') || param.endsWith('png')
            || param.endsWith('jpeg') || param.endsWith('bmp')) {
            return true;
        }
        return false;
    },
    addError : function(input) {
        var inputGroup = input.closest('.input-group');
        if (inputGroup.hasClass('has-success')) {
            inputGroup.removeClass('has-success');
        }
        inputGroup.addClass('has-error');
    },
    addSuccess : function(input) {
        var inputGroup = input.closest('.input-group');
        if (inputGroup.hasClass('has-error')) {
            inputGroup.removeClass('has-error');
        }
        inputGroup.addClass('has-success');
    }
};

var onKeyDown = function(node, fn) {
    node.on('keydown', function(event) {
        if (event.keyCode == 13) {
            fn();
        }
    });
};
