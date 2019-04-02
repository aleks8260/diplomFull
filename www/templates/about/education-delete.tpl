<div class="container user-content pt-80 pb-120">
	<div class="row">
		<div class="col-10 offset-1">
			<div class="title-1 post-add__title">Удалить образование</div>
			<?php require ROOT . "templates/_parts/_errors.tpl" ?>
			<form action="<?=HOST?>about/education-delete?id=<?=$education['id']?>" method="POST" class="post-add-form">
				<div class="post-add-form__name">
					<p>Вы действительно хотите удалить образование <strong><?=$education['title']?></strong></p>
					<!-- с айди <?=$education['id']?>? -->
				</div>
				<div class="post-add-form-button">
					<input class="button-red button-del" type="submit" value="Удалить" name="educationDelete" />
					<div class="post-add-form-button__cancel">
						<a class="button" href="<?=HOST?>edit-education">Отмена</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>