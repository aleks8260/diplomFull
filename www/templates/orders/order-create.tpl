
<div class="container mt-70 mb-120">
	<?php require ROOT . "templates/_parts/_errors.tpl" ?>
	<div class="title-2">Состав заказа</div>
	<table class="table cart-table">
		<thead>
			<tr class="table-total">
				<td></td>
				<td>Наименование</td>
				<td>Количество</td>
				<td width="200">Стоимость за ед.</td>
				<td width="200">Стоимость всего</td>
				<td></td>
			</tr>
		</thead>
		<tfoot>
			<tr class="table-total">
				<td></td>
				<td></td>
				<td>
					<?=$cartProductsCount?> шт.</td>
				<td></td>
				<td>
					<?=price_format($cartProductsTotalPrice)?> руб.</td>
				<td></td>
			</tr>
		</tfoot>
		<tbody>
			<?php foreach ($cartProducts as $item) { ?>
			<?php include ROOT . "templates/cart/_cart-item-in-table.tpl" ?>
			<?php } ?>
		</tbody>
	</table>

	<div class="title-1">Оформить заказ</div>

	<form action="<?=HOST?>order-create" method="POST">
		<!-- row -->
		<div class="row">
			<div class="col-6">
				<label class="label">
					<div class="fieldset__title">Имя</div>
					<?php if (isset($_SESSION['logged_user']['name'])) {?>
					<input name="name" class="input" placeholder="Введите имя" value="<?=$_SESSION['logged_user']['name']?>">
					<?php } else { ?>
					<input name="name" class="input" placeholder="Введите имя">
					<?php } ?>
				</label>
			</div>
			<div class="col-6">
				<label class="label">
					<div class="fieldset__title">Фамилия</div>
					<?php if (isset($_SESSION['logged_user']['secondname'])) {?>
					<input name="secondname" class="input" placeholder="Введите фамилию" value="<?=$_SESSION['logged_user']['secondname']?>">
					<?php } else { ?>
					<input name="secondname" class="input" placeholder="Введите фамилию">
					<?php } ?>
				</label>
			</div>
		</div>
		<!-- // row -->
		<!-- row -->
		<div class="row">
			<div class="col-6">
				<label class="label">
					<div class="fieldset__title">Email</div>
					<?php if (isset($_SESSION['logged_user']['email'])) {?>
					<input name="email" class="input" placeholder="Введите email" value="<?=$_SESSION['logged_user']['email']?>">
					<?php } else { ?>
					<input name="email" class="input" placeholder="Введите email">
					<?php } ?>
				</label>
			</div>
			<div class="col-6">
				<label class="label">
					<div class="fieldset__title">Телефон</div>
					<input name="phone" class="input" placeholder="Введите телефон" value="555-55-55">
				</label>
			</div>
		</div>
		<!-- // row -->
		<label class="label">
			<div class="fieldset__title">Адрес доставки</div>
			<input name="address" class="input" placeholder="Введите адрес доставки">
		</label>
		<input name="createOrder" type="submit" class="button button--save" value="Оформить заказ">

	</form>

</div>