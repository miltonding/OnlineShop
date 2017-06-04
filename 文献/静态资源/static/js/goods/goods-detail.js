$(function() {
    function validateNum(value) {
        if (Validator.isPositiveNum(value)) {
            return true;
        }

        $('.fixed-message-error').removeClass('hidden').show();
        errorMessage('请输入正确数字！');
        return false;
    }

    $('.quantity-input').on('blur', function() {
        validateNum($('.quantity-input').val().trim());
    });

    $('.add-cart').on('click', function() {
        if (validateNum($('.quantity-input').val().trim())) {
            addCart($('#goods-detail').attr('goodsid').trim(), $('.quantity-input').val().trim());
            if (addSuccess) {
                okMessage('添加成功！');
            } else {
                errorMessage('添加失败！');
            }
        }
    });

    $('#addBtn').on('click', function() {
        var qtyController = $('.quantity-input');
        var value = qtyController.val().trim();
        if (validateNum(value)) {
            qtyController.val(parseInt(value) + 1);
        }
    });

    $('#deleteBtn').on('click', function() {
        var qtyController = $('.quantity-input');
        var value = qtyController.val().trim();
        if (validateNum(value) && parseInt(value) > 1) {
            qtyController.val(parseInt(value) - 1);
        }
    });
});