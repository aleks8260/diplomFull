<?php

$title = "Редактировать профиль";

$currentUser = $_SESSION['logged_user']; // записываем объект пользователя в сессии
$user = R::load('users', $currentUser->id); // получаем данные о пользователе по айди

if(isset($_POST['profile-update'])){
	if(trim($_POST['email']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите E-mail'];
	}
	if(trim($_POST['name']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите Имя'];
	}	
	if(trim($_POST['secondname']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите Фамилию'];
	}
	if(empty($errors)){
		$user->name = htmlentities($_POST['name']);
		$user->secondname = htmlentities($_POST['secondname']);
		$user->email = htmlentities($_POST['email']);
		$user->city = htmlentities($_POST['city']);
		$user->country = htmlentities($_POST['country']);

		// РАБОТА с аватаркой!
		//Если загружен файл и он имеет имя и файл с временным размещением не пустое, то
		if(isset($_FILES['avatar']['name']) && $_FILES['avatar']['tmp_name'] != ""){
			$fileName = $_FILES['avatar']['name']; // имя файла
			$fileTmpLoc = $_FILES['avatar']['tmp_name']; // временное размещение
			$fileType = $_FILES['avatar']['type']; // тип файла
			$fileSize = $_FILES['avatar']['size']; // размер файла
			$fileErrorMsg = $_FILES['avatar']['error']; // ошибки если они есть

			$kaboom = explode(".", $fileName); // разбиваем имя на имя и расширение
			$fileExt = end($kaboom); // записываем расширение
			// Проверка на файл 
			//list - создает из массива переменную
			//getimagesize - получение размера файла передаем туда временный файл
			list($width, $height) = getimagesize($fileTmpLoc);
			// Размер если меньше 10х10
			if($width < 10 || $height <10){
				$errors[] = ['title' => 'Изображение не имеет размера. Загрузите изображение побольше.'];
			}
			// Ограничение в мб (на 4 мб)
			if($fileSize > 4194304){
				$errors[] = ['title' => 'Файл изображения не должен быть более 4 мб'];
			}
			// Тип файла
			if(!preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName)){
				$errors[] = ['title' => 'Неверный формат файла',
							'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg или png</p>'];
			}
			// Если есть ошибка при загрузке
			if($fileErrorMsg == 1){
				$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку.'];
			}
			// Проверяем ли установлен аватар пользователя
			$avatar = $user->avatar;
			$avatarFolderLocation = ROOT . 'usercontent/avatar/';

			// Если установлен аватар, то меняем
			if($avatar != ""){
				$picurl = $avatarFolderLocation . $avatar; //usercontent/avatar/foto.png
				//Удаляем аватар
				// die($picurl);
				if(file_exists($picurl)){
					unlink($picurl);
				}
				$picurl48 = $avatarFolderLocation . '48-' . $avatar;		
				if(file_exists($picurl48)){
					unlink($picurl48);
				}
			}
			// Перемещаем загруженный файл в директорию
			$db_file_name = rand(100000000,999999999). "." . $fileExt; //создаем уникальное имя (чтобы не затирать с одним и тем же именем)
			$uploadfile = $avatarFolderLocation . $db_file_name;
			// перемещаем временный файл в постоянное место деслокации
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);
			if($moveResult != true){
					$errors[] = ['title' => 'Ошибка загрузки файла'];
			}
			//Обработка картинки
			include_once(ROOT . "/libs/image_resize_imagick.php");
			//Итоговый файл который сохраняем
			$target_file = $avatarFolderLocation . $db_file_name;
			//Куда мы сохраняем итоговую картинку
			$resized_file = $avatarFolderLocation . $db_file_name;
			//Значение аватарки
			$wmax = 222;
			$hmax = 222;
			//Создаем тумбочку аватарки с нашими размерами из либа берется функция
			$img = createThumbnail($target_file, $wmax, $hmax);
			//Вызываем метод для перезаписываения уже нужной нам картинки с размерами
			$img->writeImage($resized_file);
			// В аватарку записываем путь к картинке с аватаркой (большую)
			$user->avatar = $db_file_name;


			// ДЛЯ МАЛЕНЬКОЙ АВАТАРКИ!!!
			$target_file = $avatarFolderLocation . $db_file_name;
			$resized_file = $avatarFolderLocation . "48-" . $db_file_name;
			$wmax = 48;
			$hmax = 48;
			$img = createThumbnail($target_file, $wmax, $hmax);
			$img->writeImage($resized_file);
			$user->avatarSmail = "48-" . $db_file_name;

		}

		R::store($user); // сохраняем данные пользователя (измененные в БД)
		$_SESSION['logged_user'] = $user; // применяем их в сессию (если он их изменил)
		header('Location: ' . HOST . "profile"); // переадресуем на страницу с профилем
		exit();
	}
}
// Готовим контент для центральной части
ob_start(); // Буферезированный старт
// include ROOT . "templates/_parts/_header.tpl"; // вывод шапки
include ROOT . "templates/profile/profile-edit.tpl"; // Мейн шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
?>
