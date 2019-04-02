<?php if(@$_GET['result'] == 'newMessage'){ ?>
	<div class="notification__success--text2">
		<div class="notification__success notification__success--top notification__success--top-border-radius" data-notify-hide>Сообщение успешно отправлено</div>
	</div>
<?php } ?>
<?php if(@$_GET['result'] == 'messageDeleted'){ ?>
	<div class="notification__error--text2">
		<div class="notification__error notification__error--top notification__error--top-border-radius" data-notify-hide>Сообщение успешно удалено</div>
	</div>
<?php } ?>