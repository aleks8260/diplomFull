<?php 

$title = "Создать заказ - Магазин";

/* • • • • • • • • • • • • • • • •  • • • • • • 
	ПОЛУЧАЕМ ДАННЫЕ ДЛЯ ВЫВОДА ТОВАРОВ ЗАКАЗА
 • • • • • • • • • • • • • • • •  • • • • • •  */

if (isset($_COOKIE['cart'])) {
	$cookieCartArray = json_decode($_COOKIE['cart'], true);

	// echo "<pre>";
	// print_r($cookieCartArray);
	// echo count( $cookieCartArray );
	// echo "</pre>";

	// Запрашиваем Cookie
	if ( count( $cookieCartArray ) > 0 ) {
		$cartItems = array();
		foreach ( $cookieCartArray as $key => $value) {
			$cartItems[] = $key; // [1, 5, 10]
		}

		// На основе Cookie отправляем запрос в БД на товрары в корзине
		$cartProducts = R::findLike('products', [
		   // 'id' => ['10', '11']
		    'id' => $cartItems
		], ' ORDER BY id ASC ');

	} else {
		$cartProducts = array();
	}
}

$cartItemsArray = json_decode($_COOKIE['cart'], true);
$cartProductsCount = 0;
$cartProductsCount = array_sum($cartItemsArray);
$cartProductsTotalPrice = 0;
foreach ($cartProducts as $item) {
	$cartProductsTotalPrice += $cartItemsArray[$item->id ] * $item->price;
}
// Не показываем страницу, если корзина пуста
if ( $cartProductsCount <= 0 ) {
	header("Location: " . HOST . 'cart');
	exit();
}


/* • • • • • • • • • • • • • • • • • • • • • • • • • • •
	МАССИВ ТОВАРОВ В ЗАКАЗЕ ПОЛЬЗОВАТЕЛЯ 
 • • • • • • • • • • • • • •  • • • • • • • • • • • • • */

$orderedProductsSummary = array();

foreach ($cartProducts as $item) {
	$newItem = array();
	$newItem['id'] = $item->id;
	$newItem['price'] = $item->price;
	$newItem['count'] = $cartItemsArray[$item->id];
	$newItem['title'] = $item->title;
	$orderedProductsSummary[] = $newItem;
}

/* • • • • • • • • • • • • • • • • • • • • • • • • • • •
	ОБРАБОТКА POST ЗАПРОСА, СОХРАНЯЕМ ЗАКАЗ В БД 
• • • • • • • • • • • • • • •  • • • • • • • • • • • • • */

if ( isset($_POST['createOrder'])) {

	if ( $cartProductsCount <= 0) {
		$errors[] = [
			'title' => 'Заказ не может быть пустым.', 
			'desc' => 'Добавьте товары в корзину чтобы сделать заказ.' 
		];
	}

	if ( trim($_POST['name']) == '') {
		$errors[] = ['title' => 'Введите Имя' ];
	}

	if ( trim($_POST['secondname']) == '') {
		$errors[] = ['title' => 'Введите Фамилию' ];
	}

	if ( trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email' ];
	}

	if ( trim($_POST['phone']) == '') {
		$errors[] = ['title' => 'Введите телефон' ];
	}

	if ( empty($errors)) {

		$order = R::dispense('orders');

		$order->name = htmlentities($_POST['name']);
		$order->secondname = htmlentities($_POST['secondname']);
		$order->email = htmlentities($_POST['email']);
		$order->phone = htmlentities($_POST['phone']);
		$order->address = htmlentities($_POST['address']);
		$order->items = json_encode($orderedProductsSummary);

		if ( isLoggedIn() ) {
			$order->userId = $_SESSION['logged_user']['id'];
		}

		$order->itemsCount = $cartProductsCount;
		$order->totalPrice = $cartProductsTotalPrice;

		$order->status = 'new';
		$order->payment = 'no';
		$order->dateTime = R::isoDateTime();

		R::store($order);

		// Очистить   корзину в COOKIES
		SetCookie("cart", "");

		// Очистить   корзину в БД
		if ( isLoggedIn() ) {
			$currentUser = $_SESSION['logged_user'];
			$user = R::load('users', $currentUser->id);
			$user->cart = "";
			R::store($user);
		}

		// Сохраняем ID заказа в сессию чтобы  после идентифицировать   заказ при оплате
		$_SESSION['current_order'] = $order['id'];
		
		header('Location: ' . HOST . "order-created-success");
		exit();

	}





}





// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/orders/order-create.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";


?>