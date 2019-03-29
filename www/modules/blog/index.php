<?php 
$title = "Блог - все записи";
// Массив постов из бд сортировка свежие впереди
$posts = R::find('posts', 'ORDER BY id DESC');

// $content ="Содержимое блог страницы";

// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/blog/blog-all-posts.tpl"; // Блог шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
		
 ?>