<?php 
if(!isAdmin()){ 
	header('Location: ' . HOST);
	exit();
}
$title = "Добавить новый пост";
// получаем категории
$cats = R::find('categories', 'ORDER BY cat_title ASC');

if(isset($_POST['postNew'])){
	if(trim($_POST['postTitle']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите название поста'];
	}
	if(trim($_POST['postText']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Введите текст поста'];
	}
	// Если все ок, то создаем новый пост
	if(empty($errors)){
		$post = R::dispense('posts');
		$post->title = htmlentities($_POST['postTitle']);
		$post->cat = htmlentities($_POST['postCat']); // записываем категорию, записывается id
		$post->text = $_POST['postText']; 
		$post->authorId = $_SESSION['logged_user']['id']; // с сессии забираем админа (автора)
		$post->dateTime = R::isoDateTime(); // возвращает дату и время создания поста

		// Добавление изображения в посте
		if(isset($_FILES['postImg']['name']) && $_FILES['postImg']['tmp_name'] != ""){
			$fileName = $_FILES['postImg']['name']; // имя файла
			$fileTmpLoc = $_FILES['postImg']['tmp_name']; // временное размещение
			$fileType = $_FILES['postImg']['type']; // тип файла
			$fileSize = $_FILES['postImg']['size']; // размер файла
			$fileErrorMsg = $_FILES['postImg']['error']; // ошибки если они есть

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
			$postImgFolderLocation = ROOT . 'usercontent/blog/';
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
			$wmax = 920;
			$hmax = 620;
			//Создаем тумбочку аватарки с нашими размерами из либа берется функция
			$img = createThumbnailBig($target_file, $wmax, $hmax);
			//Вызываем метод для перезаписываения уже нужной нам картинки с размерами
			$img->writeImage($resized_file);
			// В аватарку записываем путь к картинке с аватаркой (большую)
			$post->postImg = $db_file_name;


			// ДЛЯ ПРЕВЬЮ блога!!!
			$target_file = $postImgFolderLocation . $db_file_name;
			$resized_file = $postImgFolderLocation . "320-" . $db_file_name;
			$wmax = 320;
			$hmax = 140;
			$img = createThumbnailCrop($target_file, $wmax, $hmax);
			$img->writeImage($resized_file);
			$post->postImgSmail = "320-" . $db_file_name;
		}

		R::store($post); //сохраняем в БД
		header('Location: ' . HOST . "blog?result=postCreated"); //редирект на блог
		exit();
	}
}
// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/blog/post-new.tpl"; // Блог шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
		
 ?>