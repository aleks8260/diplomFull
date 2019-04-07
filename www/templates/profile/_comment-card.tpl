<?php 

$countYourComments = 0;
foreach ($comments as $comment) {
	if ($currentUser->id == $comment['user_id']) { 
	$countYourComments++; ?>
	<div class="user-comment mb-10">
		<div class="user-comment-wrap">
			<div class="user-comment-wrap__title"> 
				<a class="user-comment-wrap__link" href="<?=HOST?>blog/post?id=<?=$comment['id']?>" target="_blank">
					<?php echo mbCutString($comment['title'], 40) ?>	
				</a>
			</div>
			<div class="user-comment-wrap__date"><i class="far fa-clock user-comment-wrap__icon"></i><?=$comment['date_time']?></div>
		</div>
		<div class="user-comment__content"><?=$comment['text']?></div>
	</div>
<?php } } if ($countYourComments == 0) { ?>
<div class="highlight">
	<div class="title-2">Вы пока не оставляли комментарии на сайте</div>
</div>

<?php }	?>