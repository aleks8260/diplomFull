<div class="sticky-footer-content">
	<div class="container user-content pt-80 pb-120">
		<div class="row">
			<div class="col-10 offset-1">
				<?php 
					if(isset($_GET['result'])){
						include ROOT . "templates/about/_results.tpl";
					}
				?>
				<div class="title-1 work-experience-title">Редактировать - Опыт работы</div>

				<?php foreach ($jobs as $job) { ?>
					<?php include ROOT . "templates/about/_card-job-edit.tpl" ?>
				<?php } ?>

				<div class="work-experience-title-2">Добавить новое место</div>
				<?php require ROOT . "templates/_parts/_errors.tpl" ?>
				<form action="<?=HOST?>edit-jobs" method="POST" class="work-experience-form">
					<div class="work-experience-form__item">
						<label class="label">Период
							<input class="input-text" type="text" placeholder="Введите даты начала и окончания работы" name="period" value="<?=@$_POST['period']?>" />
						</label>
					</div>
					<div class="work-experience-form__item">
						<label class="label">Название должности
							<input class="input-text" type="text" placeholder="Введите название должности" name="title" value="<?=@$_POST['title']?>" />
						</label>
						</div>
					<div class="work-experience-form__item">
						<label class="label">Описание работы, должностные обязанности, достигнутые результаты
							<textarea class="textarea" type="text" placeholder="Напишите интересное краткое содержательное описание" name="description"><?=@$_POST['description']?></textarea>
						</label>
					</div>
					<input class="button button-save" type="submit" value="Добавить" name="newJob" />
				</form>
			</div>
		</div>
	</div>
</div>