Array.prototype.contains = function(item){
    return RegExp(item).test(this);
};

var mui = {
    url: {
        staticUrl : '',
        apacheUrl : ''
    },
    node : {
        hiddenNode: '<div class="hidden-screen"></div>',
        disableNode : '<div class="disable-screen"></div>',
        confirmNode: "<div class='confirm-message text-center'>" +
            '<div id="message"></div>' +
            '<div>' +
            '<a class="ok" href="#">' +
            '<span class="glyphicon glyphicon-ok"></span>确定' +
            '</a>' +
            '<font>&nbsp;&nbsp;&nbsp;&nbsp;</font><font>&nbsp;&nbsp;&nbsp;&nbsp;</font>' +
            "<a class='cancel' href='#'>" +
            "<span class='glyphicon glyphicon-remove'></span>取消" +
            "</a>" +
            '</div>' +
            '</div>',
        fixedOkNode : '<div class="fixed-message-ok text-center">' +
            '<span class="glyphicon glyphicon-ok"></span>' +
            '</div>',
        fixedErrorNode : '<div class="fixed-message-error text-center">' +
            '<span class="glyphicon glyphicon-remove"></span>' +
            '</div>'
    },
    flag: {
        fixedinUse : false
    },
    componentArray : [],

    setStaticUrl : function(staticUrl) {
        mui.url.staticUrl = staticUrl;
    },
    getStaticUrl : function() {
        return mui.url.staticUrl;
    },
    setApacheUrl : function(apacheUrl) {
        mui.url.apacheUrl = apacheUrl;
    },
    getApacheUrl : function() {
        return mui.url.apacheUrl;
    },
    createCode : function(digit) {
        var codes = [];
        //数字:48-57;
        for (i = 48; i < 58; i++) {
            codes.push(i);
        }

        for (i = 65; i < 91; i++) {
            codes.push(i);
        }

        for (i = 97; i < 123; i++) {
            codes.push(i);
        }

        var arr = [];
        for(var  i= 0; i < digit; i++) {   //从0-61之间取随机数
            var size = codes.length;
            var index = Math.floor(Math.random() * (size) + 0);
            var char = String.fromCharCode(codes[index]);
            arr.push(char);
        }
        return arr.join('');
    },

    exist : function(node) {
        if (node == null || node.length == 0) {
            return false;
        }
        return true;
    },

    rename : function(text) {
        return text + '_' + mui.createCode(6);
    },

    getComponents : function() {
        return this.componentArray;
    },

    getFileName : function(param) {
        var lastIndex = param.lastIndexOf('\\') + 1;
        return  param.substring(lastIndex);
    },

    component : function(component) {
        var key = component.getComponentName();
        if (!this.componentArray.contains(key)) {
            key = 'component_' + key;
        } else {
            key = 'component_' + key + '_proxy';
        }
        this.componentArray[key] = component;
    },

    get : function(id) {
        if (id == null ||Validator.isEmpty(id)) {
            return null;
        }
        id = 'component_' + id;
        return this.componentArray[id];
    },

    initial : function(componentArray) {
        var idArray = [];
        if (componentArray) {
            $.each(componentArray, function() {
                var component = $(this);
                var id = component.attr('id');
                if (idArray.contains(id)) {
                    id = mui.rename(id);
                    component.attr('id', id);
                }
                idArray.push(id);
            });
        }
        return idArray;
    },

    insertFirst : function(node, parent) {
        node.insertBefore(parent.children(":first"));
    },

    hiddenScreen : function(time) {
        if (!time || !Validator.isPositiveNum(time)) {
            time = 1000;
        }
        var hiddenNode = $(mui.node.hiddenNode);
        if (this.exist($('body .wrapper'))) {
            this.insertFirst(hiddenNode, $(".wrapper"));
        }
        setTimeout(function() {
            hiddenNode.remove();
        }, time);
    },

    disableScreen : function() {
        if (this.exist($('body .wrapper'))) {
            this.insertFirst($(mui.node.disableNode), $(".wrapper"));
        }
    },

    ableScreen : function() {
        var screen = $('.disable-screen');
        if (this.exist(screen)) {
            screen.remove();
        }
    },

    confirmMessage : function(message, callback) {
        this.disableScreen();
        var confirm = $('.confirm-message');

        var confirmNode = $(this.node.confirmNode);
        confirmNode.find('#message').text(message);
        confirmNode.find('.ok').on('click', function() {
            if (callback) {
                callback();
            }
            confirmNode.remove();
            mui.ableScreen();
        });
        confirmNode.find('.cancel').on('click', function() {
            confirmNode.remove();
            mui.ableScreen();
        });
        this.insertFirst($(confirmNode), $(".wrapper"));
    },

    fixedMessageOk : function(message, time) {
        if (mui.flag.fixedinUse) {
            return;
        }
        if (!time || !Validator.isPositiveNum(time)) {
            time = 1000;
        }
        var fixedMessageOk = $(mui.node.fixedOkNode);
        fixedMessageOk.find('span.glyphicon-ok').text(message);
        this.insertFirst(fixedMessageOk, $(".wrapper"));

        mui.flag.fixedinUse = true;
        setTimeout(function() {
            fixedMessageOk.fadeOut(time);
            fixedMessageOk.remove();
            mui.flag.fixedinUse = false;
        }, time);
    },

    fixedMessageError : function(message, time) {
        if (mui.flag.fixedinUse) {
            return;
        }
        if (!time || !Validator.isPositiveNum(time)) {
            time = 1000;
        }
        var fixedMessageError = $(mui.node.fixedErrorNode);
        fixedMessageError.find('span.glyphicon-remove').text(message);
        this.insertFirst(fixedMessageError, $(".wrapper"));

        mui.flag.fixedinUse = true;
        setTimeout(function() {
            fixedMessageError.fadeOut(time);
            fixedMessageError.remove();
            mui.flag.fixedinUse = false;
        }, time);
    }
};