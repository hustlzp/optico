function init_ps(level, id) {
    if (level == 1) {
        $('.ps-lv1').each(function (index, mt) {

            if ($(this).attr('data-id') == id) {
                // hilight itself
                $(this).children('a').css('color', 'red');

                // show level 2 list
                $(this).children('.li-header').removeClass('li-header-right').addClass('li-header-down');
                $(this).children('ul').show();
            }
        });
    }

    if (level == 2) {
        $('.ps-lv2').each(function (index, st) {
            if ($(this).attr('data-id') == id) {
                // hilight itself
                $(this).children('a').css('color', 'red');

                // show level 3 list
                $(this).children('.li-header').removeClass('li-header-right').addClass('li-header-down');
                $(this).children('ul').show();

                // show level 2 list
                $(this).parents('.ps-lv2-list').prev().prev().removeClass('li-header-right').addClass('li-header-down');
                $(this).parents('.ps-lv2-list').show();
            }
        });
    }

    if (level == 3) {
        $('.ps-lv3').each(function (index, p) {
            if ($(this).attr('data-id') == id) {
                // hilight itself
                $(this).children('a').css('color', 'red');

                // show level 3 list
                $(this).parents('.ps-lv3-list').prev().prev().removeClass('li-header-right').addClass('li-header-down');
                $(this).parents('.ps-lv3-list').show();

                // show level 2 list
                $(this).parents('.ps-lv2-list').prev().prev().removeClass('li-header-right').addClass('li-header-down');
                $(this).parents('.ps-lv2-list').show();
            }
        });
    }
}

$(document).ready(function () {

    // show list
    $(document.body).on('click', '.li-header-right', function () {
        $(this).removeClass('li-header-right').addClass('li-header-down');
        $(this).next().next().show();
    });

    // hide list
    $(document.body).on('click', '.li-header-down', function () {
        $(this).removeClass('li-header-down').addClass('li-header-right');
        $(this).next().next().hide();
    });
});