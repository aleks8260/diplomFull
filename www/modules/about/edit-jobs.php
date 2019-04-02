<?php 
if(!isAdmin()){ 
	header('Location: ' . HOST);
	exit();
}
$jobs = R::find('jobs', 'ORDER BY id DESC');
$title = "Редактировать - Опыт работы";

if(isset($_POST['newJob'])){
	if(trim($_POST['period']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите период работы'];
	}	
	if(trim($_POST['title']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите должность'];
	}
	if(empty($errors)){
		$job = R::dispense('jobs'); //создание таблицы
		$job->period = htmlentities($_POST['period']);
		$job->title = htmlentities($_POST['title']);
		$job->description = $_POST['description'];

		R::store($job);
		header('Location: ' . HOST . "edit-jobs?result=newJob");
		exit();
	}
}


// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/about/edit-jobs.tpl"; // Блог шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
		
 ?>