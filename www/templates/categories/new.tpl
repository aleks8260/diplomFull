<div class="container user-content pt-80 pb-120">
	<div class="row">
		<div class="col-10 offset-1">
			<div class="title-1 post-add__title">Создать новую категорию</div>
			<?php require ROOT . "templates/_parts/_errors.tpl" ?>
<!-- 			<?php
				echo "<pre>";
				print_r($_POST);
				echo "</pre>";
			?> -->
			<form actio="<?=HOST?>category-new" method="POST" class="post-add-form">
				<div class="post-add-form__name">
					<label class="label">Название категории<input class="input-text" type="text" placeholder="Введите название категории" name="catTitle" /></label>
				</div>
				<div class="post-add-form-button"><input class="button button-save" type="submit" value="Сохранить" name="catNew" />
					<div class="post-add-form-button__cancel"><input class="button" type="reset" name="cansel" value="Отмена" /></div>
				</div>
			</form>
		</div>
	</div>
</div>