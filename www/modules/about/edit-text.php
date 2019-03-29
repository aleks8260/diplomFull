<?php 
if(!isAdmin()){ 
	header('Location: ' . HOST);
	exit();
}
$title = "Редактировать - О авторе";

$about = R::load('about', 1); //загрузить данные
if(isset($_POST['textUpdate'])){
	if(trim($_POST['name']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите имя'];
	}	
	if(trim($_POST['description']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите описание'];
	}	
	if(empty($errors)){
		// $about = R::dispense('about'); //создание таблицы
		$about->name = htmlentities($_POST['name']);
		$about->description = $_POST['description'];

		// Добавление изображения в посте
		if(isset($_FILES['photo']['name']) && $_FILES['photo']['tmp_name'] != ""){
			$fileName = $_FILES['photo']['name']; // имя файла
			$fileTmpLoc = $_FILES['photo']['tmp_name']; // временное размещение
			$fileType = $_FILES['photo']['type']; // тип файла
			$fileSize = $_FILES['photo']['size']; // размер файла
			$fileErrorMsg = $_FILES['photo']['error']; // ошибки если они есть

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
			$postImgFolderLocation = ROOT . 'usercontent/about/';
			// Перемещаем загруженный файл в директорию
			$db_file_name = rand(100000000,999999999). "." . $fileExt; //создаем уникальное имя (чтобы не затирать с одним и тем же именем)
			$uploadfile = $postImgFolderLocation . $db_file_name;
			// перемещаем временный файл в постоянное место деслокации
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);
			if($moveResult != true){
				$errors[] = ['title' => 'Ошибка загрузки файла'];
			}
			//Обработка картинки
			include_once(ROOT . "/libs/image_resize_imagick.php");
			//Итоговый файл который сохраняем
			$target_file = $postImgFolderLocation . $db_file_name;
			//Куда мы сохраняем итоговую картинку
			$resized_file = $postImgFolderLocation . $db_file_name;
			//Значение основного изображения поста
			$wmax = 222;
			$hmax = 222;
			//Создаем тумбочку аватарки с нашими размерами из либа берется функция
			$img = createThumbnail($target_file, $wmax, $hmax);
			//Вызываем метод для перезаписываения уже нужной нам картинки с размерами
			$img->writeImage($target_file);
			// В аватарку записываем путь к картинке с аватаркой (большую)
			$about->photo = $db_file_name;
		}


		R::store($about);
		header('Location: ' . HOST . "about");
		exit();
	}

}
// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/about/edit-text.tpl"; // Блог шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
		
 ?>