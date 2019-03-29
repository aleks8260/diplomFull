<div class="card-post">
	<?php if($post['post_img_smail'] != ""){ ?>
		<div class="card-post__image mb-15"><img src="<?=HOST?>usercontent/blog/<?=$post['post_img_smail']?>" alt="<?=$post['title']?>" /></div>
	<?php } else { ?>
		<div class="card-post__image mb-15"><img src="<?=HOST?>usercontent/bg-no-image.png"" /></div>
	<?php } ?>
	<div class="card-post__title">
		<?=mbCutString($post['title'], 42)?>
	</div>
		<a class="button" href="<?=HOST?>blog/post?id=<?=$post['id']?>">Читать</a>
</div>