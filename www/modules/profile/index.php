<?php

$title = "Профиль пользователя";

$currentUser = $_SESSION['logged_user']; // записываем объект пользователя в сессии

//Запрос на получение комментов. JOIN'им таблицу юзеров
$sqlComments = 'SELECT
			comments.text, comments.date_time, comments.user_id,
			users.name, users.secondname, posts.title, posts.id
		FROM `comments` 
		LEFT JOIN users ON comments.user_id = users.id
		LEFT JOIN posts ON comments.post_id = posts.id';

$comments = R::getAll($sqlComments);

// Готовим контент для центральной части
ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl"; // вывод шапки
include ROOT . "templates/profile/profile.tpl"; // Мейн шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
// include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
?>

