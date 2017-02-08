/**
 * Created by milton.ding on 2016/10/24.
 */
$(function() {
    var timeInterval;

    function ItemCssChange(currentItem, goalItem) {
        currentItem.removeClass('slider_show');
        currentItem.addClass('slider_hide');
        goalItem.removeClass('slider_hide');
        goalItem.addClass('slider_show');
    }

    function indicatorCssChange(currentIndicator, goalIndicator) {
        currentIndicator.removeClass("slider_indicator_active");
        goalIndicator.addClass("slider_indicator_active");
    }

    function itemIncrease() {
        var currentItem = $(".slider_show");
        var currentIndicator = $(".slider_indicator_active");
        var goalItem;
        var goalIndicator;

        // The last item
        if(currentItem.next().length == 0 && currentIndicator.next().length == 0) {
            goalItem = $("#move_block li:eq(0)");
            goalIndicator =  $(".slider_indicator li:eq(0)");
        } else {
            goalItem = currentItem.next();
            goalIndicator = currentIndicator.next();
        }

        ItemCssChange(currentItem, goalItem);
        indicatorCssChange(currentIndicator, goalIndicator)
    }

    function itemDecrease() {
        var currentItem = $(".slider_show");
        var currentIndicator = $(".slider_indicator_active");
        var goalItem;
        var goalIndicator;

        // The first item
        if(currentItem.prev().length == 0 && currentIndicator.prev().length == 0) {
            goalItem = $("#move_block li:last");
            goalIndicator =  $(".slider_indicator li:last");
        } else {
            goalItem = currentItem.prev();
            goalIndicator = currentIndicator.prev();
        }

        ItemCssChange(currentItem, goalItem);
        indicatorCssChange(currentIndicator, goalIndicator)
    }
    timeInterval = window.setInterval(itemIncrease, 3000);

    $(".slider_indicator_btn").on("mouseover", function() {
        clearInterval(timeInterval);
        $(".slider_indicator li").removeClass("slider_indicator_active");
        $(this).addClass("slider_indicator_active");
        var index = $(this).index();

        var showItem = $(".slider_show");
        showItem.removeClass("slider_show");
        showItem.addClass("slider_hide");
        var goalItem = $("#move_block li").eq(index);
        goalItem.removeClass("slider_hide");
        goalItem.addClass("slider_show");
    });

    $(".slider_control_prev").on("click", function() {
        itemDecrease();
    });

    $(".slider_control_next").on("click", function() {
        itemIncrease();
    });

    $(".move_menu").on("mouseover", function() {
        clearInterval(timeInterval);
        $(".slider_control_prev").show();
        $(".slider_control_next").show();
    });

    $(".move_menu").on("mouseleave", function() {
        timeInterval = window.setInterval(itemIncrease, 3000);
        $(".slider_control_prev").hide();
        $(".slider_control_next").hide();
    });

});
