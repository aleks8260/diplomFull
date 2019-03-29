<!-- Показывать админ панель, если юзер есть и роль админ 
isset($_SESSION['logged_user']) && $_SESSION['login'] == 1 && $_SESSION['role'] == 'admin'
-->
<?php
	if(isAdmin()){
		include ROOT . "templates/_parts/_admin-panel.tpl";
	}
?>
<!-- // Показывать админ панель, если юзер есть и роль админ -->
<!-- Header для всех пользователей -->
<div class="header">
	<div class="header__left-side">
		<!-- Логотип страницы -->
		<?php include ROOT . "templates/_parts/_header-logo.tpl"; ?>
		<!-- Навигация, вынесена в header-nav.tpl -->
		<?php include ROOT . "templates/_parts/_header-nav.tpl"; ?>
	</div>
	<?php 
		if(isLoggedIn()){
			if($_SESSION['role'] !== 'admin'){
				// На сайте пользователь
				include ROOT . "templates/_parts/_header-user-profile.tpl";
			}
		}
		else{
			// Нет пользователя
			include ROOT . "templates/_parts/_header-user-login-links.tpl";
		}
	?>

</div>
<!-- // Header для всех пользователей -->