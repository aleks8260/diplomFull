<?php if ( isset($_COOKIE['cart']) ) { ?>
<?php 
	$cartFromCookie = $_COOKIE['cart']; // JSON string считываем куки кард
	$cartArray = json_decode($cartFromCookie, true);  // преобразуем в массив
	$itemsInCart = array_sum($cartArray); // суммируем элементы массива
?>
	<?php if ( $itemsInCart > 0 ) { ?>
		<div class="cart">
			<a href="<?=HOST?>cart">
				<i class="fas fa-shopping-cart"></i>
				<?=$itemsInCart?> товаров
			</a>
		</div>
	<?php }	?>
<?php }	?>
