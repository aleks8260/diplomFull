<div class="container user-content pt-80 pb-120">
	<div class="row">
		<div class="col-10 offset-1">
			<div class="title-1 post-add__title">Добавить пост</div>
			<?php require ROOT . "templates/_parts/_errors.tpl" ?>
<!-- 			<?php
				echo "<pre>";
				print_r($_POST);
				echo "</pre>";
			?> -->
			<form actio="<?=HOST?>blog/post-new" method="POST" enctype="multipart/form-data" class="post-add-form">
				<div class="post-add-form__name">
					<label class="label">Название<input class="input-text" type="text" placeholder="Введите имя" name="postTitle" /></label>
				</div>
				<div class="post-add-form__name">
					<label for="cat" class="label">Категория</label>
					<select name="postCat">
						<?php foreach ($cats as $cat): ?>
						<option value="<?=$cat['id']?>"><?=$cat['cat_title']?></option>
						<?php endforeach ?>
					</select>
				</div>
				<div class="post-add-form__file">
					<div class="load-file-title">Изображение </div>
					<div class="load-file-opis">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</div>
					<div class="load-file-fieldset">
						<input class="inputfile" id="postImg" type="file" name="postImg" data-multiple-caption="{count} файлов выбрано" multiple="" /><label for="postImg">Выбрать файл</label><span>Файл не выбран</span>
					</div>
				</div>
				<div class="post-add-form__textarea">
					<label class="label">Содержание<textarea id="ckEditor" class="textarea" type="text" placeholder="Введите описание" name="postText"></textarea></label>
				</div>
				<div class="post-add-form-button"><input class="button button-save" type="submit" value="Сохранить" name="postNew" />
					<div class="post-add-form-button__cancel"><input class="button" type="reset" name="cansel" value="Отмена" /></div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- ckEditor -->
<script src="<?=HOST?>libs/ckeditor/ckeditor.js"></script>