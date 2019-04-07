<form class="registration-form" method="POST" action="<?=HOST?>lost-password">
	<h1 class="title-1 registration-form__caption">Забыл пароль</h1>
	<!-- Вывод ошибок -->
	<?php require ROOT . "templates/_parts/_errors.tpl" ?>
	<!-- <?php require ROOT . "templates/_parts/_success.tpl" ?> -->
<!-- 
	<?php
		echo "<pre>";
		print_r($_POST);
		echo "</pre>";
	?> -->
	<div class="registration-form__email"><input name="email" class="input-text" type="text" placeholder="E-mail"/></div>
	<div class="password-remember-wrapper">
		<span><a class="registration-form__password-recovery" href="<?=HOST?>login">Перейти на страницу входа</a></span>
	</div>
	<div class="registration-form__button">
		<input class="button button-enter button-small" type="submit" value="Восстановить пароль" name="lost-password" />
	</div>
</form>