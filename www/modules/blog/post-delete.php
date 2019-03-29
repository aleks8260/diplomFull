<?php 
if(!isAdmin()){ 
	header('Location: ' . HOST);
	exit();
}
$title = "Удалить пост";

$post = R::load('posts', $_GET['id']); // получаем посты


if(isset($_POST['postDelete'])){
	$postImgFolderLocation = ROOT . 'usercontent/blog/';
	$postImg = $post->post_img;
	// Если установлено изображение, то меняем
	if($postImg != ""){
		$picurl = $postImgFolderLocation . $postImg; //usercontent/avatar/foto.png
		//Удаляем аватар
		// die($picurl);
		if(file_exists($picurl)){
			unlink($picurl);
		}
		$picurl320 = $postImgFolderLocation . '320-' . $postImg;		
		if(file_exists($picurl320)){
			unlink($picurl320);
		}
	}
	R::trash($post);
	header('Location: ' . HOST . "blog?result=postDeleted");
	exit();
}
// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/blog/post-delete.tpl"; // Блог шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
		
 ?>