$(function() {
    function countTotal() {
        var sum = 0;
        var goodsList = $('.order-list .goods-li');
        $.each(goodsList, function() {
            var listPrice = parseFloat($(this).find('.goods-price').text().trim().substring(1));
            var quantity = parseInt($(this).find('.goods-quantity').text().trim());
            var perTotal = listPrice * quantity;
            sum += perTotal;
        });
        $('.pay-price').text('¥' + parseFloat(sum).toFixed(1));
    }
    countTotal();

    $('.address-group .address-btn').on('click', function() {
        //console.log('11111111111111');
        var addressGroup = $(this).closest('.address-group');
        var hiddenInput = addressGroup.find(':hidden');
        var addressSingle = $(this).closest('.address-single');
        if (addressSingle == null) {
            return;
        }
        // Css
        addressGroup.find('.address-btn').removeClass('item-selected');
        $(this).addClass('item-selected');
        var addressid = addressSingle.attr('id').replace('address-', '');
        hiddenInput.val(addressid);
    });

    $('.payment-way .pay-li').on('click', function() {
        $('.payment-way .pay-li').removeClass('item-selected');
        $(this).addClass('item-selected');
        $(':hidden[name="paymentid"]').val($(this).attr('payid').trim());
    });

});
