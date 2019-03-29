<?php 
$title = "Главная страница";
$about = R::findOne('about', 1); // получаем данные
$posts = R::find('posts', 'ORDER BY id DESC LIMIT 3'); // получаем посты

// Готовим контент для центральной части
ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl"; // вывод шапки
include ROOT . "templates/main/main.tpl"; // Мейн шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
// include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>