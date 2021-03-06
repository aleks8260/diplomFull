<?php 

$title = "Заказ успешно создан";

//Если заказа нет, то перенаправляем на страницу магазина
if ( !isset($_SESSION['current_order']) ) {
	header('Location: ' . HOST . "shop");
	exit();
}

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/orders/order-created-success.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";


?>