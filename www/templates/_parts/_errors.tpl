	<?php
		foreach($errors as $error){
			if(count($error) == 1){ ?>
			<!-- Однострочная ошибка -->
				<div class="notification__error--text2">
					<div class="notification__error notification__error--top notification__error--top-border-radius"><?=$error['title']?></div>
				</div>
	<?php	} else if (count($error) == 2){ ?>
			<!-- Ошибка с описанием -->
			<div class="registration-form__error">
		<div class="notification__error--text">
			<div class="notification__error notification__error--top notification__error--top-border-radius"><?=$error['title']?></div>
			<?=$error['desc']?>
		</div>
	</div>
	<?php
			}
		}
	?>