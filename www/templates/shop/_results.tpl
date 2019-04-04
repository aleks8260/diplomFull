<?php if(@$_GET['result'] == 'itemDeleted'){ ?>
	<div class="notification__error--text2">
		<div class="notification__error notification__error--top notification__error--top-border-radius" data-notify-hide>Товар успешно удален</div>
	</div>
<?php } ?>

<?php if(@$_GET['result'] == 'itemCreated'){ ?>
	<div class="notification__success--text2">
		<div class="notification__success notification__success--top notification__success--top-border-radius" data-notify-hide>Товар успешно создан</div>
	</div>
<?php } ?>

<?php if(@$_GET['result'] == 'itemUpdated'){ ?>
	<div class="notification__warning--text2">
		<div class="notification__warning notification__warning--top notification__warning--top-border-radius" data-notify-hide>Товар успешно изменен</div>
	</div>
<?php } ?>