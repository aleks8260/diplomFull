<?php 
if(!isAdmin()){ 
	header('Location: ' . HOST);
	exit();
}
$skills=R::load('skills',1);

$title = "Редактировать - Технологии";
if(isset($_POST['skillsUpdate'])){
	//intval($_POST['html5']);
	// index - name поля; $value - само поле которое вводим значение;
	foreach ($_POST as $index => $value){
		if(intval($value) > 100 || intval($value) < 0){ // проверка на число
			$errors[] = ['title' => "Введите число для поля $index от 0 до 100"];
		}	
	}

	if(empty($errors)){
		//$skills = R::dispense('skills'); //создание таблицы
		$skills->html = htmlentities($_POST['html']);
		$skills->css = htmlentities($_POST['css']);
		$skills->js = htmlentities($_POST['js']);
		$skills->jquery = htmlentities($_POST['jquery']);
		$skills->php = htmlentities($_POST['php']);
		$skills->mysql = htmlentities($_POST['mysql']);
		$skills->git = htmlentities($_POST['git']);
		$skills->gulp = htmlentities($_POST['gulp']);
		$skills->bower = htmlentities($_POST['bower']);
		$skills->webpack = htmlentities($_POST['webpack']);
		$skills->less = htmlentities($_POST['less']);
		$skills->sass = htmlentities($_POST['sass']);
		$skills->bootstrap = htmlentities($_POST['bootstrap']);
		$skills->wordpress = htmlentities($_POST['wordpress']);

		R::store($skills);
		header('Location: ' . HOST . "about");
		exit();
	}
}

// Готовим контент для центральной части
ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/about/edit-skills.tpl"; // Блог шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
		
 ?>