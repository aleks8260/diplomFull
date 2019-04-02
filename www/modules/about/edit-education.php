<?php 
if(!isAdmin()){ 
	header('Location: ' . HOST);
	exit();
}
$educations = R::find('educations', 'ORDER BY id DESC');
$title = "Редактировать - образование";

if(isset($_POST['newEducation'])){
	if(trim($_POST['period']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите период работы'];
	}	
	if(trim($_POST['title']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите должность'];
	}
	if(empty($errors)){
		$education = R::dispense('educations'); //создание таблицы
		$education->period = htmlentities($_POST['period']);
		$education->title = htmlentities($_POST['title']);
		$education->description = htmlentities($_POST['description']);

		R::store($education);
		header('Location: ' . HOST . "edit-education?result=newEducation");
		exit();
	}
}
// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/about/edit-education.tpl"; // Блог шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
		
 ?>