<?php if(isLoggedIn()){ ?>
	<div class="leave-comment">
		<div class="leave-comment-avatar">
			<div class="avatar">
				<?php if($_SESSION['logged_user']['avatar_smail'] != ''){ ?>
				<img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logged_user']['avatar_smail']?>" alt="<?=$_SESSION['logged_user']['name']?> <?=$_SESSION['logged_user']['secondname']?>"/>
				<?php } ?>
			</div>
		</div>
		<form class="leave-comment-form" id="commentForm" method="POST" action="<?=HOST?>blog/post?id=<?=$post['id']?>">
			<div class="leave-comment-form__name">
			<?=$_SESSION['logged_user']['name']?>
			<?=$_SESSION['logged_user']['secondname']?>
			</div>
									<!-- <div style="display:none" class="notification__error" data-error-comment-empty>Комментарий не может быть пустым.</div> -->
			<?php require ROOT . "templates/_parts/_errors.tpl" ?>
			<div class="mb-10"></div><textarea name="commentText" class="textarea" type="text" placeholder="Присоединиться к обсуждению..."></textarea>
			<div class="mb-10"></div><input class="button" type="submit" value="Опубликовать" name="addComment" />
		</form>
	</div>
<?php }else{ ?>
	<div class="comment__register text-center">
		<a href="<?=HOST?>login">Войдите</a> или 
		<a href="<?=HOST?>registration">зарегистрируйтесь</a>
		<br />чтобы оставить комментарий
	</div>
<?php } ?>