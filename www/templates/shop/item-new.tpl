<div class="container user-content pt-80 pb-120">
	<div class="row">
		<div class="col-10 offset-1">
			<div class="title-1 post-add__title">Добавить товар</div>
			<?php require ROOT . "templates/_parts/_errors.tpl" ?>
			<form actio="<?=HOST?>shop/new" method="POST" enctype="multipart/form-data" class="post-add-form">
				<div class="post-add-form__name">
					<label class="label">Название товара
						<input class="input-text" type="text" placeholder="Введите имя" name="title" />
					</label>
				</div>				
				<div class="post-add-form__name">
					<label class="label">Цена
						<input class="input-text" type="text" placeholder="Введите цену" name="price" />
					</label>
				</div>			
				<div class="post-add-form__name">
					<label class="label">Старая цена
						<input class="input-text" type="text" placeholder="Введите цену" name="priceOld" />
					</label>
				</div>
				<div class="post-add-form__file">
					<div class="load-file-title">Изображение </div>
					<div class="load-file-opis">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</div>
					<div class="load-file-fieldset">
						<input class="inputfile" id="itemImg" type="file" name="itemImg" data-multiple-caption="{count} файлов выбрано" multiple="" /><label for="itemImg">Выбрать файл</label><span>Файл не выбран</span>
					</div>
				</div>
				<div class="post-add-form__textarea">
					<label class="label">Описание
						<textarea id="ckEditor" class="textarea" type="text" placeholder="Введите описание" name="itemDesc"></textarea>
					</label>
				</div>
				<div class="post-add-form-button">
					<input class="button button-save" type="submit" value="Сохранить" name="itemNew" />
					<div class="post-add-form-button__cancel">
						<input class="button" type="reset" name="cansel" value="Отмена" />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>