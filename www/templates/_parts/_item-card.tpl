<div class="col-4">
	<div class="section-ui">	
		<div class="card-post">
			<?php if ( $item->img_small != "") { ?>
			<img class="card-post__img" src="<?=HOST?>usercontent/shop/<?=$item->img_small?>" alt="<?=$item->title?>" />
			<?php } else { ?>
			<img class="card-post__img" src="<?=HOST?>usercontent/blog-no-image.png" alt="<?=$item->title?>" />
			<?php } ?>
			<div class="card-post__title">
				<?=mbCutString($item['title'], 42)?>
			</div>
			<div class="card__price">
				<?=price_format($item['price'])?> <span>рублей</span></div>
				<a class="button" href="<?=HOST?>shop/item?id=<?=$item->id?>">Смотреть</a>
		</div>
	</div>
</div>