<div class="sign-in-user">
	<div class="user__avatar">
		<div class="avatar">
			<!-- Если автарки нет, не выводим ошибку -->
			<?php if($_SESSION['logged_user']['avatar_smail'] != ''){ ?>
			<img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logged_user']['avatar_smail']?>" alt="<?=$_SESSION['logged_user']['name']?> <?=$_SESSION['logged_user']['secondname']?>" />
			<?php } ?>
		</div>
	</div>
	<div class="user__desc">
		<div class="user__text">
			<span class="name">
				<?=$_SESSION['logged_user']['name']?>
				<?=$_SESSION['logged_user']['secondname']?>
				<!--  <?=@$currentUser->name?> <?=@$currentUser->secondname?>  -->
			</span><span class="desc">Пользователь</span>
		</div>
		<div class="user__buttons"><a class="button button-profile" href="<?=HOST?>profile-edit">Профиль</a><a class="button button-profile" href="<?=HOST?>logout">Выход</a></div>
	</div>
</div>