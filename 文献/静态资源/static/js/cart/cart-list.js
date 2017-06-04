$(function() {
    function countTotal() {
        var sum = 0;
        var goodsList = $(".cart-list li[class='goods-li-selected']");
        $.each(goodsList, function() {
            if ($(this).find(':checkbox').prop('checked')) {
                var pTotal = parseFloat($(this).find('.p-total').text().trim());
                sum += pTotal;
            }
        });
        $('.total-number').text('¥' + parseFloat(sum).toFixed(1));
    }

    $('.reduceBtn').on('click', function() {
        var originValue = parseInt($(this).next().val());
        if (originValue <= 1) {
            return;
        }
        deleteCart($(this).closest("li[class*='goods-li']").attr('goodsid'), 1);
        if (deleteSuccess) {
            $(this).next().val(originValue - 1);
            var perPrice = parseFloat($(this).closest("li[class^='goods-li']").find('.price-show').text().trim().substring(1));
            $(this).closest("li[class^='goods-li']").find('.p-total').text(parseFloat(perPrice * (originValue - 1)).toFixed(1));
            countTotal();
        }
    });

    $('.addBtn').on('click', function() {
        addCart($(this).closest("li[class*='goods-li']").attr('goodsid'), 1);
        if (addSuccess) {
            var originValue = parseInt($(this).prev().val().trim());
            $(this).prev().val(originValue + 1);
            var perPrice = parseFloat($(this).closest("li[class^='goods-li']").find('.price-show').text().trim().substring(1));
            $(this).closest("li[class^='goods-li']").find('.p-total').text(parseFloat(perPrice * (originValue + 1)).toFixed(1));
            countTotal();
        } else {
            mui.fixedMessageError('库存不够');
        }
    });

    $('.removeBtn').on('click', function() {
        var goodsid = $(this).closest("li[class*='goods-li']").attr('goodsid');
        mui.confirmMessage('确定删除', function() {
            removeCart(goodsid);
            if (removeSuccess) {
                mui.fixedMessageOk('删除成功！');
                $('li[class*="goods-li"][goodsid="' + goodsid + '"]').remove();
                countTotal();

                var quantityNode = $('.cart-group .badge');
                var originQty = parseInt(quantityNode.text());
                quantityNode.text(originQty - 1);
                if (originQty - 1 <= 0) {
                    $('.total-li').addClass('hidden');
                    $('.no-goods').removeClass('hidden');
                }
            }
        });
    });

    // Select All
    function isSelectAll() {
        var checkboxArr = $('.cart-list li[class^="goods-li"] :checkbox');
        var selectAll = true;
        $.each(checkboxArr, function() {
            if (!$(this).prop('checked')) {
                selectAll = false;
                return false;
            }
        });
        return selectAll;
    }

    function isSelectOne() {
        var checkboxArr = $('.cart-list li[class^="goods-li"] :checkbox');
        var isSelectOne = false;
        $.each(checkboxArr, function() {
            if ($(this).prop('checked')) {
                isSelectOne = true;
                return false;
            }
        });
        return isSelectOne;
    }

    $('#selectAll').on('click', function() {
        if ($(this).prop('checked')) {
            $('.cart-list li[class^="goods-li"]').attr('class', 'goods-li-selected');
            $('.cart-list li[class^="goods-li"] :checkbox').prop('checked', true);
            countTotal();
       } else {
            $('.cart-list li[class^="goods-li"]').attr('class', 'goods-li');
            $('.cart-list li[class^="goods-li"] :checkbox').prop('checked', false);
            countTotal();
       }
    });

    $('.cart-list li[class^="goods-li"] :checkbox').on('click', function() {
        $(this).closest("li").toggleClass('goods-li-selected goods-li');
        countTotal();

        var selectAll = isSelectAll();
        var allBtnChecked = $('#selectAll').prop('checked');
        if (allBtnChecked && !selectAll) {
            $('#selectAll').prop('checked', false);
        } else if (!allBtnChecked && selectAll) {
            $('#selectAll').prop('checked', true);
        }
    });

    $('#buyBtn').on('click', function() {
        if ($('li[class^="goods-li"]').size() === 0 || !isSelectOne()) {
            mui.fixedMessageError('请选择！');
            return;
        }
        $('#cartForm').submit();
    });
});