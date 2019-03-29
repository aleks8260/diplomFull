<?php 
if(!isAdmin()){ 
	header('Location: ' . HOST);
	exit();
}
$title = "Редактировать контакты";

$contacts = R::load('contacts', 1); 

if(isset($_POST['contactsUpdate'])){
	if(trim($_POST['email']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите email'];
	}	
	if(trim($_POST['phone']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите телефон'];
	}	
	if(trim($_POST['address']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите адрес'];
	}
	if(empty($errors)){
		$contacts->email = htmlentities($_POST['email']);
		$contacts->phone = htmlentities($_POST['phone']);
		$contacts->address = htmlentities($_POST['address']);		

		$contacts->name = htmlentities($_POST['name']);
		$contacts->secondname = htmlentities($_POST['secondname']);

		$contacts->skype = htmlentities($_POST['skype']);		
		$contacts->vkontakte = htmlentities($_POST['vkontakte']);
		$contacts->facebook = htmlentities($_POST['facebook']);
		$contacts->github = htmlentities($_POST['github']);		
		$contacts->twitter = htmlentities($_POST['twitter']);
		$contacts->youtube = htmlentities($_POST['youtube']);
		$contacts->intagram = htmlentities($_POST['intagram']);	

		R::store($contacts);
		header('Location: ' . HOST . "contacts");
		exit();
	}
}
//$cats = R::find('categories', 'ORDER BY cat_title ASC'); //вытаскиваем все категории 
// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/contacts/edit.tpl"; // Блог шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
		
 ?>