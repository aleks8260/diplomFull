<?php if(@$_GET['result'] == 'catCreated'){ ?>
	<div class="notification__success--text2">
		<div class="notification__success notification__success--top notification__success--top-border-radius" data-notify-hide>Категория успешно добавлена</div>
	</div>
<?php } ?>

<?php if(@$_GET['result'] == 'catUpdate'){ ?>
	<div class="notification__warning--text2">
		<div class="notification__warning notification__warning--top notification__warning--top-border-radius" data-notify-hide>Категория успешно изменена</div>
	</div>
<?php } ?>

<?php if(@$_GET['result'] == 'catDeleted'){ ?>
	<div class="notification__error--text2">
		<div class="notification__error notification__error--top notification__error--top-border-radius" data-notify-hide>Категория успешно удалена</div>
	</div>
<?php } ?>