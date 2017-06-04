$(function() {
    function validateNum() {
        var goalInput = $('#goalInput').val().trim();
        if (Validator.isPositiveNum(goalInput)) {
            return true;
        }

        $('.fixed-message-error').removeClass('hidden').show();
        setTimeout(function() {
            $('.fixed-message-error').fadeOut(1000);
        }, 1000);
        return false;

    }

    function searchGoods(pageIndex) {
        var goalPage = $('#listForm').find('input[name="goalPage"]');
        goalPage.val(pageIndex);
        $('#listForm').submit();
    }

    $('#previousPage').on('click', function() {
        var goalPage = $('#listForm').find('input[name="goalPage"]');
        searchGoods(parseInt(goalPage.val()) - 1);
    });

    $('#nextPage').on('click', function() {
        var goalPage = $('#listForm').find('input[name="goalPage"]');
        searchGoods(parseInt(goalPage.val()) + 1);
    });

    function submitForm() {
        if (validateNum()) {
            var inputPage = parseInt($('#goalInput').val().trim());
            var currentPage = parseInt($('#listForm').find('input[name="goalPage"]').val().trim());
            if (currentPage !== inputPage) {
                searchGoods(inputPage);
            }
        }
    }

    $('#goalInput').on('blur', validateNum);
    onKeyDown($('#goalInput'), function() {
        submitForm();
    });

    $('#confirmBtn').on('click', function() {
        submitForm();
    });

    $('.common-page').on('click', function() {
        searchGoods($(this).html().trim());
    });

    $('.add-btn').on('click', function() {
        addCart($(this).attr('goodsid').trim(), 1);
        if (addSuccess) {
            mui.fixedMessageOk('添加成功！');
            mui.hiddenScreen(1000);
        } else {
            mui.fixedMessageError('添加失败！');
        }
    });
});