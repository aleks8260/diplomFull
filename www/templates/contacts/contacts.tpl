<div class="container user-content pt-80 pb-80">
	<?php if(isAdmin()){ ?>
	<div class="row">
		<div class="col contacts-links">
			<div class="contacts-links__button"><a class="button button-edit" href="<?=HOST?>contacts-edit">Редактировать</a></div>
			<div class="contacts-links__button"><a class="button" href="<?=HOST?>messages">Сообщения</a></div>
		</div>
	</div>
	<?php } ?>
	<div class="row">
		<div class="col-md-6 contacts">
			<div class="contacts__title">Контакты </div>
			<div class="row">
				<div class="col-4 contacts__name">Email</div>
				<div class="col-6 contacts__value contacts__value--link"><a href="#"><?=$contacts['email']?></a></div>
			</div>
			<div class="row">
				<div class="col-4 contacts__name">Skype</div>
				<div class="col-6 contacts__value contacts__value--link"><a class="contacts__value--link" href="#"><?=$contacts['skype']?></a></div>
			</div>
			<div class="row">
				<div class="col-4 contacts__name">Социальные сети</div>
				<div class="col-6 contacts__value">
					<?php if(@$contacts['facebook'] != ""){ ?>
					<div class="contacts__value--bold-link"><a href="<?=$contacts['vkontakte']?>">Профиль Вконтакте</a></div>
					<?php } ?>
					<?php if(@$contacts['facebook'] != ""){ ?>
					<div class="contacts__value--bold-link"><a href="<?=$contacts['facebook']?>">Профиль Facebook</a></div>
					<?php } ?>
				</div>
			</div>
			<div class="row mt-15">
				<?php if(@$contacts['phone'] != ""){ ?>
				<div class="col-4 contacts__name">Телефон</div>
				<div class="col-6 contacts__value mb-10"><?=$contacts['phone']?></div>
				<?php } ?>
			</div>
			<div class="row">
				<div class="col-4 contacts__name">Адрес</div>
				<div class="col-6 contacts__value"><?=$contacts['address']?></div>
			</div>
		</div>
		<div class="col-md-4">
			<form action="<?=HOST?>contacts" method="POST" enctype="multipart/form-data" class="form-contact">
				<div class="form-contact__title">Связаться со мной</div>
				<?php require ROOT . "templates/_parts/_errors.tpl" ?>
					<?php 
						if(isset($_GET['result'])){
							include ROOT . "templates/contacts/_results.tpl";
						}
					?>
				<div class="form-contact__name"><input class="input-text" type="text" placeholder="Введите имя" name="name"/></div>
				<div class="form-contact__email"><input class="input-text" type="text" placeholder="Email" name="email"/></div>
				<div class="form-contact__message"><textarea class="textarea" type="text" placeholder="Сообщение" name="message"></textarea></div>
				<div class="form-contact__load-file">
					<div class="load-file-title">Прикрепить файл </div>
					<div class="load-file-opis">jpg, png, pdf, doc, весом до 2Мб.</div>
					<div class="load-file-fieldset"><input class="inputfile inputfile-rad" id="file" type="file" name="file" data-multiple-caption="{count} файлов выбрано" multiple="" /><label for="file">Выбрать файл</label><span>Файл не выбран</span></div>
				</div>
				<div class="form-contact__save"><input class="button button-save" type="submit" value="Отправить" name="newMessage" /></div>
			</form>
		</div>
	</div>
</div>
<!-- <div class="map" id="map"></div>
<script async="async" defer="defer" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIr67yxxPmnF-xb4JVokCVGgLbPtuqxiA&amp;callback=initMap"></script> -->