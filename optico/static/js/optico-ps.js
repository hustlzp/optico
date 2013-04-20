function init_ps(level, mtype_id, stype_id, p_id){
	if(level >= 1){
		$('.ps-mtype').each(function(index, mt){
			if($(this).attr('data-mtype-id') == mtype_id){
				$(this).find('.li-header').removeClass('li-header-right').addClass('li-header-down');
				$(this).next().show();

				if(level == 1){
					$(this).find('a').css('color', 'red');
				}
			}
		});
	}

	if(level >= 2){
		$('.ps-stype').each(function(index, st){
			if($(this).attr('data-stype-id') == stype_id){
				$(this).find('.li-header').removeClass('li-header-right').addClass('li-header-down');
				$(this).next().show();

				if(level == 2){
					$(this).find('a').css('color', 'red');
				}
			}
		});
	}

	if(level == 3){
		$('.ps-product').each(function(index, p){
			if($(this).attr('data-p-id') == p_id){
				$(this).find('a').css('color', 'red');
			}
		});
	}
}

$(document).ready(function(){

	// show & hide
	$(document.body).on('click', '.li-header-right', function(){
		$(this).removeClass('li-header-right');
		$(this).addClass('li-header-down');
		$(this).parent().next().show();
	});

	$(document.body).on('click', '.li-header-down', function(){
		$(this).removeClass('li-header-down');
		$(this).addClass('li-header-right');
		$(this).parent().next().hide();
	});
});