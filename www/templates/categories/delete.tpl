<div class="container user-content pt-80 pb-120">
	<div class="row">
		<div class="col-10 offset-1">
			<div class="title-1 post-add__title">Удалить категорию</div>
			<?php require ROOT . "templates/_parts/_errors.tpl" ?>
<!-- 			<?php
				echo "<pre>";
				print_r($_POST);
				echo "</pre>";
			?> -->
			<form action="<?=HOST?>blog/category-delete?id=<?=$cat['id']?>" method="POST" class="post-add-form">
				<div class="post-add-form__name">
					<p>Вы действительно хотите удалить категорию <strong><?=$cat['cat_title']?></strong> ?</p>
				</div>
				<div class="post-add-form-button">
					<input class="button-red button-del" type="submit" value="Удалить" name="catDelete" />
					<div class="post-add-form-button__cancel">
						<a class="button" href="<?=HOST?>blog/categories">Отмена</a>
			<!-- 			<input class="button" type="reset" name="cansel" value="Отмена" /> -->
					</div>
				</div>
			</form>
		</div>
	</div>
</div>