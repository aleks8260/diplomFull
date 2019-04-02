<div class="sticky-footer-content">
	<div class="container user-content pt-70 make-relative">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="blog__button--edit">
				<?php if(isAdmin()){ ?>
					<a class="button button-edit" href="<?=HOST?>blog/post-edit?id=<?=$post['id']?>">Редактировать</a>
					<a class="button-red button-del" href="<?=HOST?>blog/post-delete?id=<?=$post['id']?>">Удалить</a>
				<?php } ?>
					<!-- <input class="button button-edit" type="submit" value="Редактировать" name="name" /> -->
				</div>
				<div class="blog-post">
					<div class="blog-post-heading-wrapper">
						<!-- отступ если админ, то добавлять для кнопок -->
						<?php 
						if(isAdmin()){
							$additionalHeaderClass = 'mr-330';
						}
						?>
						<h1 class="blog-post__title title-1 <?=@$additionalHeaderClass?>"><?=$post['title']?></h1>
						
						<div class="blog-post__info">
							<div class="blog-post__info-name"><?=$post['name']?> <?=$post['secondname']?></div>
							<div class="blog-post__info-category"><a href="#!"><?=$post['cat_title']?></a></div>
							<div class="blog-post__info-date"><? echo rus_date("j F Y H:i", strtotime($post['date_time'])); ?></div>
							<?php if(count($comments) > 0){ ?>
							<div class="blog-post__info-comment-count"><a href="#comments"><?php commentNumber(count($comments) );?></a></div>
							<?php } ?>
						</div>
					</div>
					<?php if($post['post_img'] != ""){ ?>
						<img class="blog-post__image" src="<?=HOST?>usercontent/blog/<?=$post['post_img']?>"/>
						<div class="blog-post__content">
							<?=$post['text']?>
						</div>
					<?php } else { ?>
						<div class="card-post__image mb-15"><img src="<?=HOST?>usercontent/bg-no-image.png" /></div>
						<div class="blog-post__content">
							<?=$post['text']?>
						</div>
					<?php } ?>

				</div>
<!-- 				<pre><?php print_r($postsId) ?></pre> 
				<pre><?=$nextId; ?></pre> <br>
				<pre><?=$prevId; ?></pre>  -->
				<div class="blog__buttons mt-30 mb-35">
					<?php if($prevId != ''): ?>
					<div class="button__arrow-wrap"><a class="button button-backward" href="<?=HOST?>blog/post?id=<?=$prevId; ?>">Назад</a><i class="fas fa-arrow-left"></i></div>
					<?php else: ?>
					<div></div>
					<?php endif ?>
					<?php if($nextId != ''): ?>
					<div class="button__arrow-wrap"><a class="button button-forward" href="<?=HOST?>blog/post?id=<?=$nextId; ?>">Вперед</a><i class="fas fa-arrow-right"></i></div>
					<?php endif ?>
				</div>

				<!-- <pre> -->
				<!-- <?php print_r($comments) ?> -->
				<!-- </pre> -->
				<!-- Список комментов -->
				<?php if(count($comments) > 0){ ?>
					<div class="two-comments__title" id="comments"><?php commentNumber(count($comments) );?></div>
					<?php foreach ($comments as $comment){ 
						include ROOT . "templates/blog/_comment-card.tpl";
					} ?>

				<?php } ?>
				<!-- // Список комментов -->
				<!-- Оставить комментарий -->
				<div class="comment mt-35 mb-120">
					<div class="leave-comment-title">Оставить комментарий</div>
					<?php include ROOT . "templates/blog/_add-comment-form.tpl" ?>
				</div>
				<!-- // Оставить комментарий -->
			</div>
		</div>
	</div>
</div>