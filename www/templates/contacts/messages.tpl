		<div class="sticky-footer-content">
			<div class="container user-content pt-80 pb-120">
				<div class="row">
					<div class="col-md-10 offset-md-1">
						<?php 
							if(isset($_GET['result'])){
								include ROOT . "templates/contacts/_results.tpl";
							}
						?>
						<div class="title-1">Сообщения от посетителей</div>
						<div class="mb-20">
							<!-- <pre> -->
								<!-- <?php print_r($messages); ?> -->
							<!-- </pre> -->
							<?php foreach ($messages as $message): ?>
							<?php include ROOT . "/templates/contacts/message-card.tpl" ?>
							<?php endforeach ?>	
						</div>
					</div>
				</div>
			</div>
		</div>