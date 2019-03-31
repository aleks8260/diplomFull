<?php
	function showIndicator($title, $value, $color = ''){
		$offset = 289 * (1 - intval($value)/100);
		
	?>
	<!-- value - индикатор счета нашего (дэшоффсет) -->
		<div class="indicator">
			<svg class="circle" viewbox="0 0 112 112">
				<circle class="circle_1" cx="56" cy="56" r="46"></circle>
			 	<circle 
				<?php if($color == ''){ ?>
					class="circle_2 circle_2--<?=$color?>" 
				<? }else{ ?>
					class="circle_2 circle_2--<?=$color?>"
				<?php } ?>
				stroke-dashoffset="<?=$offset?>" cx="56" cy="56" r="46"></circle>
			</svg>
			<div class="indicator__value"><?=$title?></div>
	</div>

<?php }?>
<div class="bg-technology">
	<div class="container user-content">
		<div class="technology">
			<div class="row">
				<div class="col-md-9 offset-md-3">
					<div class="technology-block">
						<div class="technology-block__title">Технологии<span>Которые использую в работе</span></div>
						<?php if(isAdmin()){ ?>
						<div class="technology-block__button"><a class="button button-edit" href="<?=HOST?>edit-skills">Редактировать</a></div>
						<?php } ?>
					</div>
				</div>
			</div>
			<div class="row mb-40">
				<div class="col-md-3 technology__title d-flex align-items-center justify-content-center">Frontend</div>
				<div class="col-md-9">
					<?php
						if($skills['html'] != 0){
							showIndicator('HTML5', $skills['html'], 'green');
						}
					?>
					<?php
						if($skills['css'] != 0){
							showIndicator('CSS3', $skills['css'], 'green');
						}
					?>
					<?php
						if($skills['js'] != 0){
							showIndicator('JS', $skills['js'], 'green');
						}
					?>
					<?php
						if($skills['jquery'] != 0){
							showIndicator('jQuery', $skills['jquery'], 'green');
						}
					?>
					<?php
						if($skills['less'] != 0){
							showIndicator('LESS', $skills['less'], 'green');
						}
					?>
					<?php
						if($skills['sass'] != 0){
							showIndicator('SASS', $skills['sass'], 'green');
						}
					?>					
					<?php
						if($skills['bootstrap'] != 0){
							showIndicator('Bootstrap', $skills['bootstrap'], 'green');
						}
					?>
				</div>
				
			</div>
			<div class="row mb-40">
				<div class="col-md-3 technology__title d-flex align-items-center justify-content-center">Backend</div>
				<div class="col-md-9">
					<?php
						if($skills['php'] != 0){
							showIndicator('PHP', $skills['php'], 'blue');
						}
					?>
					<?php
						if($skills['mysql'] != 0){
							showIndicator('MySQL', $skills['mysql'], 'blue');
						}
					?>					
					<?php
						if($skills['wordpress'] != 0){
							showIndicator('WordPress', $skills['wordpress'], 'blue');
						}
					?>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 technology__title d-flex align-items-center justify-content-center">Workflow</div>
				<div class="col-md-9">
					<?php
						if($skills['git'] != 0){
							showIndicator('Git', $skills['git'], 'yellow');
						}
					?>
					<?php
						if($skills['gulp'] != 0){
							showIndicator('Gulp', $skills['gulp'], 'yellow');
						}
					?>
					<?php
						if($skills['bower'] != 0){
							showIndicator('Bower', $skills['bower'], 'yellow');
						}
					?>
					<?php
						if($skills['webpack'] != 0){
							showIndicator('WebPack', $skills['webpack'], 'yellow');
						}
					?>
				</div>
			</div>
		</div>
	</div>
</div>