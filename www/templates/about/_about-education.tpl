<div class="container user-content pb-120">
	<div class="row mb-35">
		<div class="col-md-9 offset-md-3">
			<div class="work-experience">
				<div class="work-experience-block">
					<div class="work-experience-block__title">Образование</div>
					<?php if(isAdmin()){ ?>
					<div class="work-experience-block__button"><a class="button button-edit" href="<?=HOST?>edit-education">Редактировать</a></div>
					<?php } ?>
				</div>
				<?php foreach ($educations as $education) { ?>
					<?php include ROOT . "templates/about/_card-education.tpl" ?>
				<?php } ?>
			</div>
		</div>
	</div>
<!-- 	<div class="row mb-35">
		<div class="col-md-9 offset-md-3">
			<div class="work-experience">
				<div class="work-experience__date">сентябрь 2011 — июль 2016</div>
				<div class="work-experience__title">БелГУТ (бывш. БииЖТ)</div>
				<div class="work-experience__description">Инженер-электрик</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-9 offset-md-3">
			<div class="work-experience">
				<div class="work-experience__date">март 2013 — август 2015</div>
				<div class="work-experience__title">Веб-разработчик, Cloud studio</div>
				<div class="work-experience__description">Frontend и Backend для клиентских проектов студии. Работа над студийной CMS для интернет магазинов. Участие в разработке CRM системы “Sky CRM”. Стек используемых технологий: Git, JS, Angular. </div>
			</div>
		</div>
	</div> -->
</div>