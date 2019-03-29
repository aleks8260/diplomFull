<div class="two-comments-container">
	<div class="two-comments-container__avatar">
		<div class="avatar">
			<?php if($_SESSION['logged_user']['avatar_smail'] != ''){ ?>
			<img src="<?=HOST?>usercontent/avatar/<?=$comment['avatar_smail']?>" alt="$comment['name']?> $comment['secondname']"/>
			<?php } ?>
			<!-- <img src="../img/avatars/avatar-2.png" /> -->
		</div>
	</div>
	<div class="two-comments-container-block">
		<div class="two-comments-container-block-wrap">
			<div class="two-comments-container-block-wrap__name">
				<?=$comment['name']?>
				<?=$comment['secondname']?>
			</div>
			<div class="two-comments-container-block-wrap__date"><i class="far fa-clock two-comments-container-block-wrap-icon"></i>
			<!-- <?=$comment['date_time']?> -->
			<? echo rus_date("j F Y H:i", strtotime($post['date_time'])); ?>
		</div>
		</div>
		<div class="two-comments-container-block__message"><?=$comment['text']?></div>
	</div>
</div>