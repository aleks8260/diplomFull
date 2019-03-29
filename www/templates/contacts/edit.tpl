<div class="sticky-footer-content">
	<div class="container user-content pt-70">
		<h1 class="title-1">Редактировать данные</h1>

		<?php require ROOT . "templates/_parts/_errors.tpl" ?>

		<form action="<?=HOST?>contacts-edit" method="POST" class="contacts-edit-form">
			<div class="row contacts-edit-form__row">
				<div class="col-md-3"><label class="label">Имя<input class="input-text" type="text" placeholder="Введите имя" name="name" value="<? echo @$_POST['name'] != '' ? $_POST['name'] : $contacts['name']; ?>" /></label></div>
				<div class="col-md-3"><label class="label">Фамилия<input class="input-text" type="text" placeholder="Введите фамилию" name="secondname" value="<? echo @$_POST['secondname'] != '' ? $_POST['secondname'] : $contacts['secondname']; ?>"/></label></div>

		<!-- 		<? echo $_POST['secondname'] != '' ? $_POST['secondname'] : $contacts['secondname']; ?> -->
			</div>
			<div class="row contacts-edit-form__row">
				<div class="col-md-3"><label class="label">Email<input class="input-text" type="text" placeholder="Введите email" name="email" value="<? echo @$_POST['email'] != '' ? $_POST['email'] : $contacts['email']; ?>"/></label></div>
				<div class="col-md-3"><label class="label">Skype<input class="input-text" type="text" placeholder="Введите skype" name="skype" value="<? echo @$_POST['skype'] != '' ? $_POST['skype'] : $contacts['skype']; ?>"/></label></div>
			</div>
			<div class="row contacts-edit-form__row">
			

				
				<div class="col-md-3"><label class="label">Вконтакте<input class="input-text" type="text" placeholder="Введите ссылку на профиль" name="vkontakte" value="<? echo @$_POST['vkontakte'] != '' ? $_POST['vkontakte'] : $contacts['vkontakte']; ?>"/></label></div>

				<div class="col-md-3"><label class="label">Facebook<input class="input-text" type="text" placeholder="Введите ссылку на профиль" name="facebook" value="<? echo @$_POST['facebook'] != '' ? $_POST['facebook'] : $contacts['facebook']; ?>"/></label></div>
				
				<div class="col-md-3"><label class="label">Github<input class="input-text" type="text" placeholder="Введите ссылку на профиль" name="github" value="<? echo @$_POST['github'] != '' ? $_POST['github'] : $contacts['github']; ?>"/></label></div>

				<div class="col-md-3"><label class="label">Twitter<input class="input-text" type="text" placeholder="Введите ссылку на профиль" name="twitter" value="<? echo @$_POST['twitter'] != '' ? $_POST['twitter'] : $contacts['twitter']; ?>"/></label></div>

				<div class="col-md-3"><label class="label">Youtube<input class="input-text" type="text" placeholder="Введите ссылку на профиль" name="youtube" value="<? echo @$_POST['youtube'] != '' ? $_POST['youtube'] : $contacts['youtube']; ?>"/></label></div>

				<div class="col-md-3"><label class="label">Intagram<input class="input-text" type="text" placeholder="Введите ссылку на профиль" name="intagram" value="<? echo @$_POST['intagram'] != '' ? $_POST['intagram'] : $contacts['intagram']; ?>"/></label></div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="col-md-3"><label class="label">Телефон<input class="input-text" type="text" placeholder="Введите телефон" name="phone" value="<? echo @$_POST['phone'] != '' ? $_POST['phone'] : $contacts['phone']; ?>"/></label></div>
				<div class="col-md-3"><label class="label">Адрес<input class="input-text" type="text" placeholder="Введите адрес" name="address" value="<? echo @$_POST['address'] != '' ? $_POST['address'] : $contacts['address']; ?>"/></label></div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="form-button-save"><input class="button button-save" type="submit" value="Сохранить" name="contactsUpdate" /></div>
				<div class="form-button-cancel"><button class="button" type="reset">Отмена</button></div>
			</div>
		</form>
	</div>
</div>