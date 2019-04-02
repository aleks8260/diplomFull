<?php 
// Запрос на категорию из одной таблицы категорис и подставляя в другую таблицу постс (и аналогично с юзерс)
$sqlPost = 'SELECT 
	posts.id, posts.title, posts.text, posts.post_img, posts.date_time, posts.author_id, posts.cat,
	users.name, users.secondname,
	categories.cat_title
	FROM posts
	INNER JOIN categories ON posts.cat = categories.id
	INNER JOIN users ON posts.author_id = users.id
	WHERE posts.id = ' . $_GET['id'] . ' LIMIT 1';
$post = R::getAll( $sqlPost );
$post = $post[0];

// Запрос для комментариев
$sqlComments = 'SELECT 
	comments.text, comments.date_time, comments.user_id,
	users.name, users.secondname, users.avatar_smail
	FROM comments
	INNER JOIN users ON comments.user_id = users.id
	WHERE comments.post_id = ' . $_GET['id'];
$comments = R::getAll( $sqlComments );

$postsId=R::getCol('SELECT id FROM posts'); //выбрать колонку айди с таблицы постов
foreach ($postsId as $index => $id) {
	if($id == $post['id']){
		@$nextId = $postsId[$index + 1];
		@$prevId = $postsId[$index - 1];
		break;
	}
}
$title = $post['title'];

if(isset($_POST['addComment'])){
	if(trim($_POST['commentText']) == ''){ // на пустые строки
		$errors[] = ['title' => 'Комментарий не может быть пустым.'];
	}
	if(empty($errors)){
		$comment = R::dispense('comments');
		$comment->postId = htmlentities($_GET['id']);
		$comment->userId = htmlentities($_SESSION['logged_user']['id']);
		$comment->text = htmlentities($_POST['commentText']);
		$comment->dateTime = R::isoDateTime(); //возвращает дату и время

		R::store($comment);
		header('Location: ' . HOST . "blog/post?id=" . $_GET['id']);
		exit();
	}
}
// echo "<pre>";
// print_r($post[0]);
// echo "</pre>";
// die();

// Готовим контент для центральной части

ob_start(); // Буферезированный старт
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/blog/blog-post.tpl"; // Блог шаблон
$content = ob_get_contents(); // Возвращаем контент в переменную
ob_end_clean(); // Прекращаем вывод

// Выводим шаблоны (шапка, общий шаблон, футер)
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
		
 ?>