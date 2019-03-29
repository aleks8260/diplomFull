<?php 
$title = "Контакты";

$contacts = R::load('contacts', 1); 

if(isset($_POST['newMessage'])){
	if(trim($_POST['email']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите email'];
	}	
	if(empty($errors)){
		$message = R:: dispense('messages');
		$message->email = htmlentities($_POST['email']);
		$message->name = htmlentities($_POST['name']);
		$message->message = htmlentities($_POST['message']);		
		$message->dateTime = R::isoDateTime(); // возвращает дату и время создания сообщения

		//Если загружен файл и он имеет имя и файл с временным размещением не пустое, то
		if(isset($_FILES['file']['name']) && $_FILES['file']['tmp_name'] != ""){
			$fileName = $_FILES['file']['name']; // имя файла
			$fileTmpLoc = $_FILES['file']['tmp_name']; // временное размещение
			$fileType = $_FILES['file']['type']; // тип файла
			$fileSize = $_FILES['file']['size']; // размер файла
			$fileErrorMsg = $_FILES['file']['error']; // ошибки если они есть

			$kaboom = explode(".", $fileName); // разбиваем имя на имя и расширение
			$fileExt = end($kaboom); // записываем расширение

			// Перемещаем загруженный файл в директорию
			$db_file_name = rand(100000000,999999999). "." . $fileExt; //создаем уникальное имя (чтобы не затирать с одним и тем же именем)

			// Ограничение в мб (на 4 мб)
			if($fileSize > 4194304){
				$errors[] = ['title' => 'Файл изображения не должен быть более 4 мб'];
			}else if(!preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName)){
				$errors[] = ['title' => 'Неверный формат файла',
							'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg или png</p>'];
			}else if($fileErrorMsg == 1){
				$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку.'];
			}
			// Проверяем ли установлен аватар пользователя
			//$avatar = $user->avatar;
			$postImgFolderLocation = ROOT . 'usercontent/upload_files/';
			$uploadfile = $postImgFolderLocation . $db_file_name;

			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);
			if($moveResult != true){
					$errors[] = ['title' => 'Ошибка загрузки файла'];
			}
			$message->message_file_name_original = $fileName; //записываем оригинальное название файла пользователя
			$message->message_file = $db_file_name; //записываем рандомное имя файла

		R::store($message); // сохраняем в БД
		header('Location: ' . HOST . "contacts?result=newMessage");
		exit();
	}
}
}

// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/contacts/contacts.tpl"; // Блог шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
		
 ?>