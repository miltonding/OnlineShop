var validate = function(selectid) {
    var result = false;
    var select = $('#' + selectid);
    select.css('border-color', '#ccc').css('color', '#555');
    result = select.val() != null && Validator.isPositiveNum(select.val());
    if (!result) {
        select.css('border-color', '#a94442').css('color', ' #a94442');
    }
    return result;
};

function findCategoryList(kindid) {
    if (kindid == null || !Validator.isPositiveNum(kindid)) {
        return;
    }

    $('#categoryid option').remove();

    $.ajax({
        url:"/miltonshop/page/documents/findCategoryList",
        async: false,
        type: 'post',
        data: {'kindid': kindid},
        success: function(data) {
            if (data != null) {
                $.each(data, function(index, item) {
                    var option = '<option value= "' + item.categoryid + '">' + item.categoryName + '</option>';
                    $('#categoryid').append(option);
                });
            }
        }
    });
}

function findProductList(categoryid) {
    $('#productid option').remove();
    if (categoryid == null || !Validator.isPositiveNum(categoryid)) {
        return;
    }

    $.ajax({
        url:"/miltonshop/page/documents/findProductList",
        async: false,
        type: 'post',
        data: {'categoryid': categoryid},
        success: function(data) {
            if (data != null) {
                $('#productid option').remove();
                $.each(data, function(index, item) {
                    var option = '<option value= "' + item.productid + '">' + item.productName + '</option>';
                    $('#productid').append(option);
                });
            }
        }
    });
}

function findGoodsList(kindid, categoryid, productid) {
    if (kindid == null || !Validator.isPositiveNum(kindid)) {
        return;
    }
    if (categoryid == null || !Validator.isPositiveNum(categoryid)) {
        return;
    }
    if (productid == null || !Validator.isPositiveNum(productid)) {
        return;
    }

    $.ajax({
        url:"/miltonshop/page/documents/findProductList",
        async: false,
        type: 'post',
        data: {'categoryid': categoryid},
        success: function(data) {
            if (data != null) {
                $('#productid option').remove();
                $.each(data, function(index, item) {
                    var option = '<option value= "' + item.productid + '">' + item.productName + '</option>';
                    $('#productid').append(option);
                });
            }
        }
    });
}