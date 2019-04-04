<?php
// echo "<pre>";
// print_r($_POST);
// echo "</pre>";
// die();

$currentItemId = intval($_POST['itemId']); // ID товара  который  добавили в Корзину
// Определяем локальную корзину
if (isset($_COOKIE['cart'])) { //если существует массив кук с карт
	// json_decode - ф-я которая преобразует JSON формат  в Объект
	// json_decode - ф-я которая преобразует JSON формат  в Ассоциативный массив, если 2-й параметр   true
	$cartLocal =  json_decode($_COOKIE['cart'], true); // записываем значение локальной корзины
} else {
	$cartLocal = array(); //создаем пустой массив, который будем наполнять
}

// Если такой товар уже есть в Корзине, тогда увеличеваем его кол-во на 1, если нет, то записываем его колл-во = 1
if ( isset( $cartLocal[$currentItemId] ) ) { // если есть ключ с айди товара
	$items = $cartLocal[$currentItemId]; // пример 2
	$items++; //увелчивиаем 2+1 = 3
	$cartLocal[$currentItemId] = $items; // записали 3
} else { // если его нет, то записываем 1
	$cartLocal[$currentItemId] = 1;
}

// Сохраняем Cookies
/*
json_encode - ф-я кодирует ассоц. массив в JSON строку
// проверка куков через библиотеку jquery.cookies $.cookie('cart');
*/
SetCookie("cart", json_encode($cartLocal));

// Если пользователь залогинен, то  сохраняем в БД
if ( isLoggedIn() ) {
	$currentUser = $_SESSION['logged_user'];
	$user = R::load('users', $currentUser->id);
	$user->cart = json_encode($cartLocal);
	R::store($user);
}

header("Location: " . HOST . "shop/item?id=" . $currentItemId );
exit();




?>