<?php
	// Очищаем сессию по нажатию кнопки ВЫХОД
	unset($_SESSION['logged_user']);
	unset($_SESSION['login']);
	unset($_SESSION['role']);
	SetCookie("cart", ""); //очищаем при логауте
	session_destroy();
	// И зачищаем куки, связь с сессиями
	setcookie(session_name(). ''. time() - 60*60*24*32, '/');
	// Перенаправление на главную страницу
	header("Location: " . HOST)
?>