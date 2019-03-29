<div class="brief-resume">
	<div class="sticky-footer-content">
		<div class="container user-content pt-80 pb-80">
			<div class="row">
				<?php require_once ROOT . "templates/about/_about-text.tpl"?>
				<!-- <a class="button" href="<?=HOST?>about">Подробнее</a>
				<div class="brief-resume__button"></div> -->
			</div>
		</div>
	</div>
</div>
<div class="hr-line"></div>
<div class="sticky-footer-content">
	<div class="container user-content mb-100">
		<div class="works__header mb-40 title-1"><span> <strong>Новые записи в <a href="<?=HOST?>blog" target="_blank">блоге</a></strong></span></div>
		<div class="row justify-content-between">
			<?php foreach ($posts as $post){ ?>
			<?php include ROOT . "templates/_parts/_blog-card.tpl" ?>
			<?php } ?>
		</div>
	</div>
</div>