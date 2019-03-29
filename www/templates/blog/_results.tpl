<?php if(@$_GET['result'] == 'postDeleted'){ ?>
	<div class="notification__error--text2">
		<div class="notification__error notification__error--top notification__error--top-border-radius" data-notify-hide>Пост успешно удалена</div>
	</div>
<?php } ?>

<?php if(@$_GET['result'] == 'postCreated'){ ?>
	<div class="notification__success--text2">
		<div class="notification__success notification__success--top notification__success--top-border-radius" data-notify-hide>Пост успешно создан</div>
	</div>
<?php } ?>

<?php if(@$_GET['result'] == 'postUpdate'){ ?>
	<div class="notification__warning--text2">
		<div class="notification__warning notification__warning--top notification__warning--top-border-radius" data-notify-hide>Пост успешно изменен</div>
	</div>
<?php } ?>