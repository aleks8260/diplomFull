<form class="registration-form" method="POST" action="<?=HOST?>login">
	<h1 class="title-1 registration-form__caption">Вход на сайт</h1>
	<!-- Вывод ошибок -->
	<?php require ROOT . "templates/_parts/_errors.tpl" ?>
<!-- 	<div class="registration-form__error">
		<div class="notification__error">Введите email</div>
	</div> -->
	<div class="registration-form__email"><input name="email" class="input-text" type="text" placeholder="E-mail" /></div>
	<div class="registration-form__password"><input name="password" class="input-text" type="password" placeholder="Пароль" /></div>
	<div class="password-remember-wrapper">
		<div class="registration-form__remember"><label class="form-label"><input class="form-input-checkbox" type="checkbox" name="checkbox" checked="checked" /><span class="form__checkbox"></span>Запомнить меня</label></div><span><a class="registration-form__password-recovery" href="<?=HOST?>lost-password">Забыл пароль</a></span>
	</div>
	<div class="registration-form__button"><input class="button button-enter button-small" type="submit" value="Войти" name="login" /></div>
</form>