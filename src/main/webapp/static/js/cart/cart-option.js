var addSuccess = false;
function addCart(goodsid, quantity) {
    addSuccess = false;
    $.ajax({
        url:"/miltonshop/page/cart/addCart",
        async: false,
        type: 'post',
        data: {'goodsid': goodsid, 'quantity' : quantity},
        success: function(data) {
            // Success
            if (data === true) {
                addSuccess = true;
             }
        },
        error: function() {
            console.log('error...');
        }
    });
}
var deleteSuccess = false;
function deleteCart(goodsid, quantity) {
    deleteSuccess = false;
    $.ajax({
        url:"/miltonshop/page/cart/deleteCart",
        async: false,
        type: 'post',
        data: {'goodsid': goodsid, 'quantity' : quantity},
        success: function(data) {
            // Success
            if (data === true) {
                deleteSuccess = true;
            }
        },
        error: function() {
            console.log('error...');
        }
    });
}

var removeSuccess = false;
function removeCart(goodsid) {
    removeSuccess = false;
    $.ajax({
        url:"/miltonshop/page/cart/removeCart",
        async: false,
        type: 'post',
        data: {'goodsid': goodsid},
        success: function(data) {
            // Success
            if (data === true) {
                removeSuccess = true;
            }
        },
        error: function() {
            console.log('error...');
        }
    });
}