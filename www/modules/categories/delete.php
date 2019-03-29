<?php 
if(!isAdmin()){ 
	header('Location: ' . HOST);
	exit();
}
$title = "Удалить категорию";
$cat = R::load('categories', $_GET['id']); //выгржуаем данные из БД категории по айди
if(isset($_POST['catDelete'])){
	R::trash($cat);
	header('Location: ' . HOST . "blog/categories?result=catDeleted");
	exit();
}
// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/categories/delete.tpl"; // Блог шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
		
 ?>