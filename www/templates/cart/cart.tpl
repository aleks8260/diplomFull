<div class="container mt-70 mb-120">

	<?php if ( count(@$cartProducts) > 0) { ?>
		<div class="title-1">Корзина</div>
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
					<td><?=$cartProductsCount?> шт.</td>
					<td></td>
					<td><?=price_format($cartProductsTotalPrice)?> руб.</td>
					<td></td>
				</tr>
			</tfoot>
			<tbody>
				<?php foreach ($cartProducts as $item) { ?>
				<?php include ROOT . "templates/cart/_cart-item-in-table.tpl" ?>
				<?php } ?>
			</tbody>
		</table>
		<a href="<?=HOST?>order-create" class="button button--save">Оформить заказ</a>



	<?php } else { ?>

		<div class="highlight">
			<div class="title-2">Корзина пуста</div>
		</div>

	<?php } ?>


</div>