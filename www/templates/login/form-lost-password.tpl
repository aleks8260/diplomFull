<form class="registration-form" method="POST" action="<?=HOST?>lost-password">
	<h1 class="title-1 registration-form__caption">Восстановление пароля</h1>

	<?php require ROOT . "templates/_parts/_errors.tpl"?>
	<?php require ROOT . "templates/_parts/_success.tpl"?>


	<div class="registration-form__email">
		<input class="input-text" type="email" placeholder="E-mail" name="email" value="info@mail.com" />
	</div>
	<div class="password-remember-wrapper d-flex justify-content-center mt-20">
		<span><a class="registration-form__password-recovery" href="<?=HOST?>login">Перейти на страницу входа</a></span>
	</div>
	<div class="registration-form__button">
		<input class="button button-enter button-small" type="submit" value="Восстановить пароль" name="lost-password" />
	</div>
</form>