$(document).ready(function() {
	
	$(".left-panel").customScrollbar({preventDefaultScroll: true});
	
	// Плавное скрытие категории об успешном добавлении
	setTimeout(function(){
		$('[data-notify-hide]').slideUp(400);
	}, 2000);
	$('[data-notify-hide]').dblclick(function(){
		$(this).slideUp(400);
	});
	// Подключение ckEditor
	CKEDITOR.replace( 'ckEditor',{
		language: 'ru',
		uiColor: '#9AB8F3'
	} );
});