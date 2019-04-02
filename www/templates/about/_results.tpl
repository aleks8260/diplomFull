<?php if(@$_GET['result'] == 'jobDeleted'){ ?>
	<div class="notification__error--text2">
		<div class="notification__error notification__error--top notification__error--top-border-radius" data-notify-hide>Работа успешно удалена</div>
	</div>
<?php } ?>
<?php if(@$_GET['result'] == 'newJob'){ ?>
	<div class="notification__success--text2">
		<div class="notification__success notification__success--top notification__success--top-border-radius" data-notify-hide>Работа успешно добавлена</div>
	</div>
<?php } ?>
<?php if(@$_GET['result'] == 'educationDeleted'){ ?>
	<div class="notification__error--text2">
		<div class="notification__error notification__error--top notification__error--top-border-radius" data-notify-hide>Образование успешно удалено</div>
	</div>
<?php } ?>
<?php if(@$_GET['result'] == 'newEducation'){ ?>
	<div class="notification__success--text2">
		<div class="notification__success notification__success--top notification__success--top-border-radius" data-notify-hide>Образование успешно добавлено</div>
	</div>
<?php } ?>