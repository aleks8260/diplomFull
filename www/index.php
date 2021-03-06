<?php 

// Хост сайта
define('HOST', $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . '/');

// Физический путь к корневой директории скрипта
define('ROOT', dirname(__FILE__).'/');

require ROOT . "config.php"; // подключение конфигов
require ROOT . "db.php"; // подключение БД
require ROOT . "libs/functions.php";
session_start();

/* ..........................................

РОУТЕР

............................................. */
$errors = array();
$contacts = R::load('contacts', 1);  //чтобы загружать на всех страницах ссылки
// request URL = http://project/blog/post?id=15
$uri =  $_SERVER["REQUEST_URI"];
$uri = rtrim($uri, "/"); 
$uri = filter_var($uri, FILTER_SANITIZE_URL);
$uri = substr($uri, 1);
$uri = explode('?', $uri);
// В зависимости от запроса открываем тот модуль, который пользователь запрашивает
switch ( $uri[0]) {
	case '':
		include ROOT . "modules/main/index.php";
		break;
	// ::::::::::::::: USERS :::::::::::::::
	case 'login': // логиниться
		include ROOT . "modules/login/login.php";
		break;

	case 'registration': // регистрация
		include ROOT . "modules/login/registration.php";
		break;

	case 'logout': // разлогинивание
		include ROOT . "modules/login/logout.php";
		break;

	case 'lost-password': // восстановление пароля
		include ROOT . "modules/login/lost-password.php";
		break;

	case 'set-new-password': // установка нового пароля
		include ROOT . "modules/login/set-new-password.php";
		break;

	case 'profile': // страница профиля
		include ROOT . "modules/profile/index.php";
		break;

	case 'profile-edit': // страница изменения профиля
		include ROOT . "modules/profile/edit.php";
		break;


	// ::::: ABOUT :::::
	case 'about':
		include "modules/about/index.php";
		break;

	case 'edit-text':
		include "modules/about/edit-text.php";
		break;	

	case 'edit-skills':
		include "modules/about/edit-skills.php";
		break;	

	case 'edit-jobs':
		include "modules/about/edit-jobs.php";
		break;		

	case 'about/job-delete':
		include "modules/about/job-delete.php";
		break;	

	case 'edit-education':
		include "modules/about/edit-education.php";
		break;

	case 'about/education-delete':
		include "modules/about/education-delete.php";
		break;	


	// ::::: CONTACTS :::::
	case 'contacts':
		include "modules/contacts/index.php";
		break;	

	case 'contacts-edit':
		include "modules/contacts/edit.php";
		break;	

	case 'messages':
		include "modules/contacts/messages.php";
		break;

	case 'contacts/message-delete':
		include "modules/contacts/message-delete.php";
		break;	

	// ::::: CATEGORIES :::::

	case 'blog/categories': // все категории
		include "modules/categories/all.php";
		break;	

	case 'blog/category-new': // новая категория
		include "modules/categories/new.php";
		break;	

	case 'blog/category-edit': // редактировать категорию
		include "modules/categories/edit.php";
		break;	

	case 'blog/category-delete': // удалить категорию
		include "modules/categories/delete.php";
		break;


	// ::::: BLOG :::::
	case 'blog':
		include ROOT . "modules/blog/index.php";
		break;

	case 'blog/post-new':
		include ROOT . "modules/blog/post-new.php";
		break;

	case 'blog/post-edit':
		include ROOT . "modules/blog/post-edit.php";
		break;	

	case 'blog/post-delete':
		include ROOT . "modules/blog/post-delete.php";
		break;

	case 'blog/post':
		include ROOT . "modules/blog/post.php";
		break;

	// SHOP
	case 'shop': // все товары
		include ROOT . "modules/shop/index.php";
		break;

	case 'shop/new': // создание нового товара
		include ROOT . "modules/shop/item-new.php";
		break;

	case 'shop/item': // отдельная страница товара
		include ROOT . "modules/shop/item.php";
		break;

	case 'shop/item-edit': // редактирование товара
		include ROOT . "modules/shop/item-edit.php";
		break;

	case 'shop/item-delete': // удаление товара
		include ROOT . "modules/shop/item-delete.php";
		break;
// SHOPPPPP
// CART
	case 'addtocart': // добавление в корзину
		include ROOT . "modules/cart/addtocart.php";
		break;

	case 'cart': // добавление в корзину
		include ROOT . "modules/cart/cart.php";
		break;	

	case 'removefromcart': // добавление в корзину
		include ROOT . "modules/cart/removefromcart.php";
		break;
	// ORDERS
	case 'order-create': // создание заказа
		include ROOT . "modules/orders/order-create.php";
		break;

	case 'order-created-success': // перенаправление на успешно оформленный заказ
		include ROOT . "modules/orders/order-created-success.php";
		break;

	case 'orders': // все заказы в админке
		include ROOT . "modules/orders/orders.php";
		break;

	case 'order': // заказ по айди выводит в админке
		include ROOT . "modules/orders/order.php";
		break;

	case 'myorders': // заказ по айди выводит в админке
		include ROOT . "modules/orders/myorders.php";
		break;

	case 'myorder': // заказ по айди выводит пользователю
		include ROOT . "modules/orders/myorder.php";
		break;

	// PAYMENT
	case 'payment-choice': // заказ по айди выводит пользователю
		include ROOT . "modules/payments/payment-choice.php";
		break;

	case 'payment-yandex': // для олпаты яндекс
		include ROOT . "modules/payments/yandex-payment.php";
		break;

	case 'after-payment': // перенаправление об успешной оплате
		include ROOT . "modules/payments/after-payment.php";
		break;



	default:
		include ROOT . "modules/main/index.php";
		break;
}

?>