<div class="container user-content pt-80 pb-120">
	<div class="row">
		<div class="col-10 offset-1">
			<div class="title-1 post-add__title">Редактировать товар</div>
			<?php require ROOT . "templates/_parts/_errors.tpl" ?>
			<form actio="<?=HOST?>shop/item-edit?id=<?=$item['id']?>" method="POST" enctype="multipart/form-data" class="post-add-form">
				<div class="post-add-form__name">
					<label class="label">Название товара
						<input class="input-text" type="text" placeholder="Введите имя" name="title" value="<?=$item['title']?>"/>
					</label>
				</div>				
				<div class="post-add-form__name">
					<label class="label">Цена
						<input class="input-text" type="text" placeholder="Введите цену" name="price" value="<?=$item['price']?>"/>
					</label>
				</div>			
				<div class="post-add-form__name">
					<label class="label">Старая цена
						<input class="input-text" type="text" placeholder="Введите цену" name="priceOld" value="<?=$item['priceOld']?>"/>
					</label>
				</div>
				<div class="post-add-form__file">
					<div class="load-file-title">Изображение </div>
					<div class="load-file-opis">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</div>
					<div class="load-file-fieldset">
						<input class="inputfile" id="itemImg" type="file" name="itemImg" data-multiple-caption="{count} файлов выбрано" multiple="" /><label for="itemImg">Выбрать файл</label><span>Файл не выбран</span>
					</div>
				</div>
				<div class="section-ui">
					<div class="load-file-wrap">
						<div class="load-file-wrap-img">
							<?php if($item['img_small'] != ""){ ?>
							<div class="card-post__image mb-15">
								<img src="<?=HOST?>usercontent/shop/<?=$item['img_small']?>" alt="Загруженное изображение" />
							</div>
							<div class="load-file-wrap__button"><a class="button button-delete button-small" href="#!">Удалить</a></div>
							<?php } ?>
						</div>
					</div>
				</div>
				<div class="post-add-form__textarea">
					<label class="label">Описание
						<textarea id="ckEditor" class="textarea" type="text" placeholder="Введите описание" name="itemDesc"><?=$item['desc']?></textarea>
					</label>
				</div>
				<div class="post-add-form-button">
					<input class="button button-save" type="submit" value="Сохранить" name="itemUpdate" />
					<div class="post-add-form-button__cancel">
						<input class="button" type="reset" name="cansel" value="Отмена" />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>