<div class="sticky-footer-content">
	<div class="container user-content pt-70 make-relative">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="blog__button--edit">
					<?php if(isAdmin()){ ?>
						<a class="button button-edit" href="<?=HOST?>shop/item-edit?id=<?=$item['id']?>">Редактировать</a>
						<a class="button-red button-del" href="<?=HOST?>shop/item-delete?id=<?=$item['id']?>">Удалить</a>
					<?php } ?>
				</div>
				<div class="row">
			<?php if ( $item['img'] != "") { ?>
			<div class="col">
				<div class="blog__image">
					<img src="<?=HOST?>usercontent/shop/<?=$item['img']?>" alt="<?=$item['title']?>" />
				</div>
			</div>
			<?php } ?>
			
			<!-- Item desc  -->
			<div class="col pt-60">
				<h1 class="blog__heading"><?=$item['title']?></h1>

				<div class="price-holder">
					<?php if ( $item['price_old'] ): ?>
					<div class="price-old">
						<?=price_format($item['price_old'])?>
					</div>
					<?php endif ?>

					<div class="price">
						<?=price_format($item['price'])?> <span>рублей</span>
					</div>
				</div>

				<form id="addToCart" method="POST" action="<?=HOST?>addtocart">
					<input type="hidden" name="itemId" id="itemId" value="<?=$item['id']?>">
					<input type="submit"  class="button mb-15" name="addToCart" value="В корзину">
				</form>
			</div>

			<!-- // Item desc  -->
		</div>
		<div class="user-content user-content--desc pt-40 pb-60">Описание товара:
			<?=$item['desc']?>
		</div>
		<!-- // row -->

			</div>
		</div>
	</div>
</div>
