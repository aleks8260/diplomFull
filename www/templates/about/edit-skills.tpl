
<?php
function skillItem($name, $title){ 
global $skills;
	?>
	<div class="col-md-3 technology-edit-form__item"><label class="label"><?=$title;?><input class="input-text input-text--width" type="text" placeholder="0" name="<?=$name;?>" value="<?=$skills[$name]?>"/></label>
		<div class="percent-sign"><span class="percent-sign__item">%</span></div>
	</div>
<?php	} ?>
<div class="sticky-footer-content">
	<div class="container user-content pt-45 pl-0">
		<div class="row">
			<div class="offset-md-1 col-md-8">
				<h1 class="title-1">Редактировать - Технологии</h1>
				
				<?php require ROOT . "templates/_parts/_errors.tpl" ?>

				<form action="edit-skills" method="POST" class="technology-edit-form">

					<div class="row technology-edit-form__row">
						<?php skillItem('html', 'HTML5'); ?>
						<?php skillItem('css', 'CSS3'); ?>
						<?php skillItem('js', 'JS'); ?>
						<?php skillItem('jquery', 'jQuery'); ?>
						<?php skillItem('less', 'LESS'); ?>
						<?php skillItem('sass', 'SASS'); ?>
						<?php skillItem('bootstrap', 'Bootstrap'); ?>
					</div>
					<div class="row technology-edit-form__row mb-30">
						<?php skillItem('php', 'PHP'); ?>
						<?php skillItem('mysql', 'MySql'); ?>
						<?php skillItem('wordpress', 'WordPress'); ?>
					</div>
					<div class="row technology-edit-form__row mb-30">
						<?php skillItem('git', 'Git'); ?>
						<?php skillItem('gulp', 'Gulp'); ?>
						<?php skillItem('bower', 'Bower'); ?>
						<?php skillItem('webpack', 'WebPack'); ?>
					</div>
					<div class="row technology-edit-form__row">
						<div class="technology-edit-form__button"><input class="button button-save" type="submit" value="Сохранить" name="skillsUpdate" /></div>
						<div class="technology-edit-form__button-cancel"><button class="button" type="reset">Отмена</button></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>