<div class="header__nav ml-55">
<!-- 	"<?=$uri[0]?>"

	<?= ($uri[0] == "blog") ? "active" : "" ?> -->
	<nav class="navigation">
		<ul>
			<li class="navigation__item">
				<a class="<?= ($uri[0] == "") ? "active" : "" ?>" href="<?=HOST?>">Главная</a>
			</li>
			<li class="navigation__item">
				<a class="<?= ($uri[0] == "about") ? "active" : "" ?>" href="<?=HOST?>about">Обо мне</a>
			</li>
<!-- 			<li class="navigation__item">
				<a class="<?= ($uri[0] == "portfolio") ? "active" : "" ?>" href="<?=HOST?>portfolio">Работы</a>
			</li> -->
			<li class="navigation__item <?= ($uri[0] == "blog") ? "active" : "" ?>">
				<a class="<?= ($uri[0] == "blog") ? "active" : "" ?>" href="<?=HOST?>blog">Блог</a>
			</li>
			<li class="navigation__item">
				<a class="<?= ($uri[0] == "contacts") ? "active" : "" ?>" href="<?=HOST?>contacts">Контакты</a>
			</li>			
			<li class="navigation__item">
				<a class="<?= ($uri[0] == "shop") ? "active" : "" ?>" href="<?=HOST?>shop">Магазин</a>
			</li>
		</ul>
	</nav>
</div>