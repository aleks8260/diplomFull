<?php 

$pagintation = pagination(3, 'products');
$title = "Все товары - Магазин";

$products = R::find('products', 'ORDER BY id DESC ' . $pagintation['sql_pages_limit']);


// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/shop/all-items.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>