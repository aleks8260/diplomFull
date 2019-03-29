<div class="container user-content pt-80">
	<?php 
		if(isset($_GET['result'])){
			include ROOT . "templates/blog/_results.tpl";
		}
	?>
	<div class="blog__header mb-50"><span>Блог веб-разработчика</span>

		<?php if(isAdmin()){ ?>
			<a href="<?=HOST?>blog/post-new" class="button button-edit">Добавить пост</a>
		<?php } ?>
		
	</div>
	<div class="row justify-content-between mb-50">
		<?php foreach ($posts as $post){ ?>
<!-- 		<?php
				echo "<pre>";
				print_r($post);
				echo "</pre>";
		?> -->
			<?php include ROOT . "templates/_parts/_blog-card.tpl" ?>
		<?php } ?>
	</div>
</div>