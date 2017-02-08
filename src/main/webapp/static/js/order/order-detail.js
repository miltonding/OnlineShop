$(function() {
   function countTotal() {
       var sum = 0;
       var goodsList = $('.order-list ul li');
       if (goodsList == null || goodsList.size == 0) {
           return;
       }

       $.each(goodsList, function() {
          var price = $(this).find('.goods-price').text();
          var quantity = $(this).find('.goods-quantity').text();
           sum += price * quantity;
       });
       $('.pay-price').text('￥' + sum.toFixed(1));
   }

    countTotal();
});