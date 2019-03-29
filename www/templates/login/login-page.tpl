<body class="content-page">
	<div class="registration-wrapper">
		<div class="registration-header-wrapper">
			<div class="logo">
				<div class="logo__icon"><span class="ml-0"><i class="far fa-paper-plane"></i></span><span>Супер Сайт</span></div>
				<div class="logo__text"><span></span></div>
			</div>
			<div class="login">
			<!-- Если на странице регистрации, то вход -->
			<?php if($uri[0] == 'registration'){ ?>
				<a href="<?=HOST?>login">Вход</a>
			<?php }else{ ?>
				<a href="<?=HOST?>registration">Регистрация</a>
			<?php } ?>
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-4">
					
				<?=$content?>

				</div>
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-4">
					<div class="footer__text text-center">
						<p>© 2019. Все права защищены</p>
						<p>Создано в <a href="https://gomel.itstep.by/" target="_blank">Компьютерной академии шаг</a> в 2019 году</p>
					</div>
				</div>
			</div>
		</div>
	</div>
