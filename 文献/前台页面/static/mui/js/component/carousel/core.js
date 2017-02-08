/**
 * Created by milton.ding on 2016/10/24.
 */
$(function() {
    var plainCarsousel = function(componentid) {
        var timeInterval;
        var id, componentName;
        var target, itemAnimation;
        var imgItemArray, indicatorArray;
        var previousBtn, nextBtn;
        var itemSize;
        var itemInChanging = false;

        /*  私有方法*/
        var _setComponentName = function(id) {
            componentName = id;
        };

        var _init = function(componentid) {
            id = componentid;
            _setComponentName(id);
            target =  $('#' + id);
            imgItemArray = target.find('ul li.slider_item');
            indicatorArray = target.find('ul li.slider_indicator_btn');
            itemSize = imgItemArray.size();
            previousBtn =  target.find("a.slider_control_prev");
            nextBtn =  target.find("a.slider_control_next");
            itemAnimation = target.find("#item-animation");
        };

        var _handleOverflow = function(index) {
            if (!index || isNaN(index)) {
                index = 0;
            }

            if (index < 0) {
                index = itemSize - 1;
            } else if (index >= itemSize) {
                index = 0;
            }
            return index;
        };

        var _itemChange = function(index) {
            if (itemInChanging) {
                return;
            }
            itemInChanging = true;
            imgItemArray.removeClass('slider_show').addClass('slider_hide');
            indicatorArray.removeClass("slider_indicator_active");
            index = _handleOverflow(index);

            imgItemArray.eq(index).removeClass('slider_hide').addClass('slider_show');
            indicatorArray.eq(index).addClass("slider_indicator_active");
            setTimeout(function() {
                itemInChanging = false;
            }, 300);
        };

        var _itemIncrease = function() {
            var index = target.find("ul li.slider_show").index();
            _itemChange(index + 1);
        };

        var _itemDecrease = function() {
            var index = target.find("ul li.slider_show").index();
            _itemChange(index - 1);
        };

        var _setTimer = function() {
            timeInterval = setInterval(function() {
                _itemIncrease();
            }, 3000);
        };

        var _removeTimer = function() {
            clearInterval(timeInterval);
        };

        var _bindEvents = function() {
            previousBtn.on("click", function() {
                _itemDecrease();
            });
            nextBtn.on("click", function() {
                _itemIncrease();
            });
            itemAnimation.on("mouseover", function() {
                _removeTimer();
                previousBtn.show();
                nextBtn.show();
            });
            itemAnimation.on("mouseleave", function() {
                _setTimer();
                previousBtn.hide();
                nextBtn.hide();
            });
            indicatorArray.on("mouseover", function() {
                _removeTimer();
                var index = $(this).index();
                _itemChange(index);
            });
        };

        var _instance = function(componentid) {
            _init(componentid);
            _setTimer();
            _bindEvents();
        };

        /* 公共方法 */
        this.getComponentName = function() {
            return componentName;
        };
        this.instance = function(componentid) {
            _instance(componentid);
        };
        this.getId = function() {
            return id;
        };
        this.getTarget = function() {
            return target;
        };
        this.getImgItemArray = function() {
            return imgItemArray;
        };
        this.getIndicatorArray = function() {
            return indicatorArray;
        };

        _instance(componentid);
    };

    var carouselGroup = $('[class="carousel-wrapper"][role="plain-carousel"]');
    var idArray = mui.initial(carouselGroup);
    if (idArray) {
        $.each(idArray, function(index, value) {
            mui.component(new plainCarsousel(value));
        });
    }
});
