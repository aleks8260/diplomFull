<div class="sticky-footer-content">
	<div class="container user-content pt-80 pb-120">
		<div class="row">
			<div class="col-10 offset-1">
				<?php 
					if(isset($_GET['result'])){
						include ROOT . "templates/about/_results.tpl";
					}
				?>
				<div class="title-1 work-experience-title">Редактировать - Образование</div>
				<?php foreach ($educations as $education) { ?>
					<?php include ROOT . "templates/about/_card-education-edit.tpl" ?>
				<?php } ?>
<!-- 				<div class="work-experience-post">
					<div class="work-experience-post-wrap">
						<div class="work-experience-post-wrap__date">февраль 2017 — по настоящее время</div>
						<div class="work-experience-post-button"><a class="button button-delete" href="#!">Удалить</a></div>
					</div>
					<div class="work-experience-post__title">Frontend разработчик, Вконтактe, mail.ru group</div>
					<div class="work-experience-post__message">Работы в команде Вконтакте. Работал в команде над обновление сервиса Музыка, работа над видео разделом. Создание видеоплеера. Создание кроссбраузерных компонентов. Работа над оптимизацией скорости загрузки медиа контента. </div>
				</div>
				<div class="work-experience-post">
					<div class="work-experience-post-wrap">
						<div class="work-experience-post-wrap__date">февраль 2017 — по настоящее время</div>
						<div class="work-experience-post-button"><a class="button button-delete" href="#!">Удалить</a></div>
					</div>
					<div class="work-experience-post__title">Frontend разработчик, Вконтактe, mail.ru group</div>
					<div class="work-experience-post__message">Работы в команде Вконтакте. Работал в команде над обновление сервиса Музыка, работа над видео разделом. Создание видеоплеера. Создание кроссбраузерных компонентов. Работа над оптимизацией скорости загрузки медиа контента. </div>
				</div> -->


				<div class="work-experience-title-2">Добавить новое учёбы</div>
				<?php require ROOT . "templates/_parts/_errors.tpl" ?>
				<form  action="<?=HOST?>edit-education" method="POST" class="work-experience-form">
					<div class="work-experience-form__item">
						<label class="label">Период
							<input class="input-text" type="text" placeholder="Введите даты начала и окончания учёбы" name="period" value="<?=@$_POST['period']?>" />
						</label>
					</div>
					<div class="work-experience-form__item">
						<label class="label">Квалификация
							<input class="input-text" type="text" placeholder="Введите название полученной профессии" name="title" value="<?=@$_POST['title']?>"/></label>
						</div>
					<div class="work-experience-form__item">
						<label class="label">Описание места учебы, специальность, достигнутые результаты
							<textarea class="textarea" type="text" placeholder="Напишите интересное краткое содержательное описание" name="description"><?=@$_POST['description']?></textarea>
						</label>
					</div>
					<input class="button button-save" type="submit" value="Добавить" name="newEducation" />
				</form>
				</form>
			</div>
		</div>
	</div>
</div>