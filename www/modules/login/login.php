<?php

$title = "Вход на сайт";
if(isset($_POST['login'])){
	if(trim($_POST['email']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите E-mail', 'desc' => 'Email обязателен для регистрации на сайте'];
	}	
	if(trim($_POST['password']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите Пароль'];
	}
	if(empty($errors)){
		$user = R::findOne('users', 'email = ?', array($_POST['email']) ); // получили данные о пользователе
		if($user){
			if(password_verify($_POST['password'], $user->password)){
				$_SESSION['logged_user'] = $user; //записываем юзера в сессию
				$_SESSION['login'] = '1';
				$_SESSION['role'] = $user->role; //роль из бд берем
				header("Location: " . HOST); // перенаправляем на главную страницу
				exit();
			}else{
				$errors[] = ['title' => 'Пароль введен неверно'];
			}
		}
	}
}


// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/login/form-login.tpl"; // Формы регистрации шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl"; //подключаем header со всеми стилями (не пользовательский head)
include ROOT . "templates/login/login-page.tpl";
include ROOT . "templates/_parts/_foot.tpl"; //подключаем footer со всеми скриптами (не пользовательский foot)
?>