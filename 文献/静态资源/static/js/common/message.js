function okMessage(message) {
    $('.fixed-message-ok').removeClass('hidden').show().find('span').html(message);
    setTimeout(function() {
        $('.fixed-message-ok').fadeOut(1000);
    }, 1000);
}

function errorMessage(message) {
    $('.fixed-message-error').removeClass('hidden').show().find('span').html(message);
    setTimeout(function() {
        $('.fixed-message-error').fadeOut(1000);
    }, 1000);
}

function hideConfirm() {
    $('.disable-screen').hide();
    $('.confirm-message ').hide();
}

function showConfirm() {
    $('.disable-screen').removeClass('hidden').show();
    $('.confirm-message ').removeClass('hidden').show();
}