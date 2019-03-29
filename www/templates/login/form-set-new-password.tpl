<form id="setNewPasswordForm" class="registration-form" method="POST" action="<?=HOST?>set-new-password">
	<?php if ($newPasswordReady == false) ?>
		<h1 class="title-1 registration-form__caption">Введите новый пароль</h1>
	<?php endif?>

	<?php require ROOT . "templates/_parts/_errors.tpl"?>
	<?php require ROOT . "templates/_parts/_success.tpl"?>

	<?php if ($newPasswordReady == false) ?>
		<div class="registration-form__email">
			<input class="input-text" type="password" placeholder="Новый пароль" name="resetpassword" />
		</div>
	<?php endif?>

	<div class="password-remember-wrapper d-flex justify-content-center mt-20">
		<span><a class="registration-form__password-recovery" href="<?=HOST?>login">Перейти на страницу входа</a></span>
	</div>
	<div class="registration-form__button">
		<?php if ($newPasswordReady == false) ?>
			<input type="hidden" name="resetemail" value="<?=$_GET['email']?>">
			<input type="hidden" name="onetimecode" value="<?=$_GET['code']?>">
			<input class="button button-enter button-small button--set-new-password" type="submit" value="Установить новый пароль" name="set-new-password" />
		<?php endif?>
		
		
	</div>
</form>

