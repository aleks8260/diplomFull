<div class="container user-content pt-80 pb-120">
	<div class="row">
		<div class="col-10 offset-1">
			<div class="title-1 post-add__title">Редактировать категорию</div>
			<?php require ROOT . "templates/_parts/_errors.tpl" ?>
<!-- 			<?php
				echo "<pre>";
				print_r($_POST);
				echo "</pre>";
			?> -->
			<form action="<?=HOST?>blog/category-edit?id=<?=$cat['id']?>" method="POST" class="post-add-form">
				<div class="post-add-form__name">
					<label class="label">Название категории<input class="input-text" type="text" placeholder="Введите название категории" name="catTitle" value="<?=$cat['cat_title']?>" /></label>
				</div>
				<div class="post-add-form-button"><input class="button button-save" type="submit" value="Изменить" name="catEdit" />
					<div class="post-add-form-button__cancel"><input class="button" type="reset" name="cansel" value="Отмена" /></div>
				</div>
			</form>
		</div>
	</div>
</div>