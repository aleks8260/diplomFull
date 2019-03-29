<?php 
if(!isAdmin()){ 
	header('Location: ' . HOST);
	exit();
}
$title = "Создать новую категорию";

if(isset($_POST['catNew'])){
	if(trim($_POST['catTitle']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите название категории'];
	}
	if(empty($errors)){
		$cat = R::dispense('categories');
		$cat->cat_title = htmlentities($_POST['catTitle']);
		R::store($cat);
		header('Location: ' . HOST . "blog/categories?result=catCreated");
		exit();
	}
}
// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/categories/new.tpl"; // Блог шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
		
 ?>