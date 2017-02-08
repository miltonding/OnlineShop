/**
 * Created by milton.ding on 2016/10/30.
 */
Array.prototype.indexOf = function(val) {
    for (var i = 0; i < this.length; i ++) {
        if (this[i] == val) {
            return i;
        }
    }

    return -1;
};

Array.prototype.remove = function(val) {
    var index = this.indexOf(val);
    if (index != -1) {
        this.splice(index, 1);
    }
};

$(function() {
    function initMenu(menuArr) {
        $.each(menuArr, function(i, value) {
           var showUl = $('.' + value).find('ul');
            if (showUl) {
                showUl.show();
            }
        });
    }
    var localStorage = window.localStorage;
    var arrStr = localStorage.getItem('menuArr');

    if (arrStr == null || arrStr.length == 0) {
        arrStr = '[]';
    }
    var menuArr = JSON.parse(arrStr);
    initMenu(menuArr);

    function setItem(menuArr) {
        if (menuArr.length != 0) {
            var arrStr = JSON.stringify(menuArr);
            localStorage.setItem('menuArr', arrStr);
        } else {
            localStorage.removeItem('menuArr');
        }
    }

    $('.nav').on('click', function () {
        var ul = $(this).next();
        var item = $(this).parent().attr('class');
        var displayCss = ul.css('display');
        if (displayCss === 'none') {
            ul.show(500);
            menuArr.push(item);
            setItem(menuArr);
        } else {
            ul.hide(500);
            menuArr.remove(item);
            setItem(menuArr);
        }
    });

});
