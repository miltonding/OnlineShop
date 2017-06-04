/* File upload */
/* jQuery version must over 2.0 */
$(function() {
    var fileUpload = function(componentid) {
        var componentName, name, id;
        var action, type;
        var target, image, file, tip;
        var chooseBtn, uploadBtn, progress, progressBar;
        var isUploading = false;
        var fieldArray, customJSON;
        var customValidate = null;

        /*  私有方法*/
        var _setComponentName = function(id) {
            componentName = id;
        };

        var _init = function(componentid) {
            id = componentid;
            name = componentid.replace('upload_', '');
            _setComponentName(id);
            target =  $('#' + id);
            type = target.attr('type');
            action = target.attr('action');
            image = target.find('img#image');
            file = target.find(':file#file');
            tip = target.find('.upload-tip');
            chooseBtn = target.find('.choose-btn');
            uploadBtn = target.find('.upload-btn');
            progress = target.find('.progress');
            progressBar = progress.find('.progress-bar');
            customJSON = {};
            fieldArray = [];
        };

        var _isImage = function() {
            var isImage = false;
            var array = ['jpg', 'jif', 'png', 'jpeg', 'bmp'];
            var suffix = _getFileSuffix();
            $.each(array, function(index, value) {
                if (value === suffix) {
                    isImage = true;
                    return false;
                }
            });
            return isImage;
        };

        var _getFileName = function() {
            var fileName = file.val();
            var lastIndex = fileName.lastIndexOf('\\') + 1;
            return  fileName.substring(lastIndex);
        };

        var _getFileSuffix = function() {
            var fileName = _getFileName();
            return  fileName.split('.')[1];
        };

        var _validate = function () {
            if (typeof customValidate === 'function' && !customValidate()) {
                return false;
            }
            var fileName = file.val();
            if (fileName.length === 0) {
                tip.css('color', '#999');
                uploadBtn.removeAttr('disabled');
                mui.fixedMessageError('请选择正确的文件！');
                return false;
            }

            if ('image' === type) {
                if (_isImage()) {
                    tip.css('color', '#999');
                    uploadBtn.removeAttr('disabled');
                    return true;
                } else {
                    tip.css('color', 'red');
                    uploadBtn.attr('disabled', 'disabled');
                    mui.fixedMessageError('请选择正确的文件！');
                    return false;
                }
            }
            return true;
        };

        var _upload = function () {
            isUploading = true;
            var formData = new FormData();
            if (customJSON != null) {
                for (var key in customJSON) {
                    formData.append(key, customJSON[key]);
                }
            }
            if (fieldArray.length > 0) {
                $.each(fieldArray, function(index, node) {
                    formData.append(node.attr('name'), node.val());
                });
            }

            formData.append(file.attr('name'), file[0].files[0]);
            $.ajax({
                url: action,
                type: 'POST',
                data: formData,
                // 告诉jQuery不要去处理发送的数据
                processData: false,
                // 告诉jQuery不要去设置Content-Type请求头
                contentType: false,
                beforeSend: function () {
                    console.log("正在进行，请稍候.....");
                },
                success: function (result) {
                    if (result != null && !Validator.isEmpty(result)) {
                        console.log(result);
                        progress.removeClass('hidden').show();
                        progressBar.css('width', '20%');
                        progressBar.animate({width: '100%'}, 2000);
                        setTimeout(function() {
                            progress.fadeOut(1000);
                            mui.fixedMessageOk('上传成功！');
                            file.val('');
                            if (type === 'image') {
                                image.attr('src', result);
                            }
                            isUploading = false;
                        }, 2000);
                    }
                },
                error: function (responseStr) {
                    console.log("error.............");
                }
            });
        };

        var _bindEvents = function () {
            file.on('change', function() {
                _validate();
                if (type === 'image') {
                    image.attr('src', '').attr('alt', _getFileName());
                }
            });

            uploadBtn.on('click', function() {
                if (isUploading) {
                    return;
                }
                if (_validate()) {
                    _upload();
                }
            });
        };

        var _instance = function(componentid) {
            _init(componentid);
            _bindEvents();
        };

        /* 公共方法 */
        this.getComponentName = function() {
            return componentName;
        };
        this.instance = function(componentid) {
            _instance(componentid);
        };
        this.getId = function() {
            return id;
        };
        this.getTarget = function() {
            return target;
        };
        this.getFile = function() {
            return file;
        };
        this.getImage = function() {
            return image;
        };
        this.addParam = function(obj) {
            if (obj == null || typeof {} !== 'object') {
                return;
            }
            for (var key in obj) {
                customJSON[key] = obj[key];
            }
        };

        this.addField = function(fields) {
            if (fields == null || typeof fields !== 'object') {
                return;
            }
            if (fields instanceof Array) {
                $.each(fields, function(index, value) {
                    if (!fieldArray.contains (value)) {
                        var selector = '#' + value;
                        fieldArray.push($(selector));
                    }
                });
            }
        };
        this.getFieldArray = function() {
            return fieldArray;
        };
        this.getCustomJSON = function() {
            return customJSON;
        };
        this.addValidate = function(fn) {
            customValidate = fn;
        };
        _instance(componentid);
    };


    var uploadGroup = $('[role="upload"]');
    var idArray = mui.initial(uploadGroup);
    if (idArray) {
        $.each(idArray, function(index, value) {
            mui.component(new fileUpload(value));
        });
    }
});