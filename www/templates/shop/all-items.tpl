<div class="container user-content pt-80">
	<?php 
		if(isset($_GET['result'])){
			include ROOT . "templates/shop/_results.tpl";
		}
	?>
	<div class="blog__header mb-50"><span>Магазин</span>

		<?php if(isAdmin()){ ?>
			<a href="<?=HOST?>shop/new" class="button button-edit">Добавить товар</a>
		<?php } ?>
		
	</div>
	<div class="row mb-50">
		<?php foreach ($products as $item){ ?>
			<?php include ROOT . "templates/_parts/_item-card.tpl" ?>
		<?php } ?>
	</div>
</div>