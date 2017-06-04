$(function() {
    $('#goods-form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        /* fields start*/
        fields: {
            brand: {/*键名username和input name值对应*/
                message: 'Brand is not valid',
                validators: {
                    notEmpty: {
                        message: '品牌不能为空'
                    }
                }
            },
            chineseName: {/*键名username和input name值对应*/
                message: 'chineseName is not valid',
                validators: {
                    notEmpty: {
                        message: '中文名不能为空'
                    }
                }
            },
            englishName: {/*键名username和input name值对应*/
                message: 'englishName is not valid',
                validators: {
                    notEmpty: {
                        message: '英文名不能为空'
                    }
                }
            },
            goodsDescribe: {/*键名username和input name值对应*/
                message: 'goodsDescribe is not valid',
                validators: {
                    notEmpty: {
                        message: '商品描述不能为空'
                    }
                }
            },
            goodsAdvantage: {/*键名username和input name值对应*/
                message: 'goodsAdvantage is not valid',
                validators: {
                    notEmpty: {
                        message: '商品优势不能为空'
                    }
                }
            },
            unitCost: {/*键名username和input name值对应*/
                message: 'unitCost is not valid',
                validators: {
                    notEmpty: {
                        message: '单位成本不能为空'
                    },
                    numeric: {
                        message: '单位成本为数字'
                    }
                }
            },
            listPrice: {/*键名username和input name值对应*/
                message: 'listPrice is not valid',
                    validators: {
                    notEmpty: {
                        message: '单位售价不能为空'
                    },
                    numeric: {
                        message: '单位售价为数字'
                    }
                }
            },
            quantity: {/*键名username和input name值对应*/
                message: 'Quantity is not valid',
                validators: {
                    notEmpty: {
                        message: '库存不能为空'
                    },
                    numeric: {
                        message: '库存为数字'
                    }
                }
            },
            attrOne: {/*键名username和input name值对应*/
                message: 'attrOne is not valid',
                validators: {
                    notEmpty: {
                        message: '属性1不能为空'
                    }
                }
            },
            attrTwo: {/*键名username和input name值对应*/
                message: 'attrTwo is not valid',
                validators: {
                    notEmpty: {
                        message: '属性2不能为空'
                    }
                }
            },
            attrThree: {/*键名username和input name值对应*/
                message: 'attrThree is not valid',
                validators: {
                    notEmpty: {
                        message: '属性3不能为空'
                    }
                }
            }
        }
    });

    $('#addBtn').on('click', function(e) {
        // Validate
        $('#goods-form').data('bootstrapValidator').validate();
        var result = $('#goods-form').data('bootstrapValidator').isValid();
        if (result) {
            var goods = {};
            var data = $("#goods-form").serializeArray();
            $.each(data, function(index, node) {
                goods[node.name] = node.value;
            });

            $.ajax({
                url: '/miltonshop/page/goods/goodsCreate',
                async: false,
                type: 'POST',
                data: goods,
                success: function(result) {
                   if (result) {
                       mui.fixedMessageOk('添加成功！');
                   } else {
                       mui.fixedMessageError('添加失败！');
                   }
                }
            });
        }
    });

    function fimdGoodsEntry(productid) {
        if (productid == null || !Validator.isPositiveNum(productid)) {
            return;
        }
        $('.img-ul li').remove();
        $.ajax({
            url:"/miltonshop/page/documents/findGoodsEntry",
            async: false,
            type: 'post',
            data: {'productid': productid},
            success: function(data) {
                if (data != null && data.length > 0) {
                    $.each(data, function(index, item) {
                        var li = '<li class="img-li" entryid="' + item.entryid + '">' +
                                   '<img src="' + mui.getStaticUrl() + item.srcPath + '"/>' +
                                 '</li>';
                        $('.img-ul').append(li);
                    });
                }
            }
        });
    }

    $('#kindid').on('change', function() {
        if (validate($(this).attr('id'))) {
            findCategoryList($(this).val());
            findProductList($('#categoryid').val());
            fimdGoodsEntry($('#productid').val());
        } else {

            $('#categoryid option').remove();
            $('#categoryid').trigger('change');
            $('#productid option').remove();
            $('#productid').trigger('change');

        }
    });
    $('#categoryid').on('change', function() {
        if (validate($(this).attr('id'))) {
            findProductList($(this).val());
        }
    });
    $('#productid').on('change', function() {
        if (validate($(this).attr('id'))) {
            fimdGoodsEntry($(this).val());
        }
    });

    $('.img-ul').on('click', 'li', function() {
        $('.img-ul .img-li').removeClass('img-selected');
        $(this).addClass('img-selected');
        $('#entryid').val($(this).attr('entryid'));
    })
});