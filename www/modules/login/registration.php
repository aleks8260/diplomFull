<?php

$title = "Регистрация";
// echo "Hello registration.php";
// Если форма отправлена, то делаем регистрацию
if(isset($_POST['register'])){
	// echo "<pre>";
	// print_r($_POST);
	// echo "</pre>";
	if(trim($_POST['email']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите E-mail', 'desc' => 'Email обязателен для регистрации на сайте'];
	}	
	if(trim($_POST['password']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите Пароль'];
	}

	// Проверка что пользователь уже существует
	if(R::count('users', 'email = ?', array($_POST['email'])) > 0){
		$errors[] = [
			'title' => 'Пользователь с таким email зарегистрирован',
			'desc' => '<span>Используйте другой email чтобы создать новый аккаунт. Или воспользуйтесь <a href="#{link}">восстановлением пароля</a>, чтобы войти на сайт.</span>'
		];
	}



	if(empty($errors)){
		// Если пустой, то регаем
		$user = R::dispense('users');
		$user->email = htmlentities($_POST['email']);
		$user->role = 'user'; //всегда при регистрации user роль
		$user->password = password_hash($_POST['password'], PASSWORD_DEFAULT);
		R::store($user); // сохранение юзера

		$_SESSION['logged_user'] = $user;
		$_SESSION['login'] = '1';
		$_SESSION['role'] = $user->role;

		header('Location: ' . HOST . "profile-edit"); // перенаправление на редактирование профиля
		exit();
	}
}
// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/login/form-registration.tpl"; // Формы регистрации шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

include ROOT . "templates/_parts/_head.tpl"; //подключаем шапку со всеми стилями (не пользовательский хеад)
// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/login/login-page.tpl";
include ROOT . "templates/_parts/_foot.tpl"; //подключаем footer со всеми скриптами (не пользовательский foot)
?>