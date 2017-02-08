$(function() {
    $('#kindid').on('change', function() {
        if (validate($(this).attr('id'))) {
            findCategoryList($(this).val());
            findProductList($('#categoryid').val());
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
        validate($(this).attr('id'));
    });

    var upload = mui.get('upload_file');
    if(upload != null) {
        upload.addField(['productid', 'description']);
        upload.addValidate(function() {
            var result = true;
            if (!validate('kindid')) {
                result = false;
            }
            if (!validate('categoryid')) {
                result = false;
            }
            if (!validate('productid')) {
                result = false;
            }
            return result;
        });
    }
});