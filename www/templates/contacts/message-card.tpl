<div class="message">
	<div class="message-container">
		<div class="delete">
			<!-- <a class="button button-delete button-small" href="#">Удалить</a> -->
			<!-- <a class="button-red button-del button-small" href="#!">Удалить</a> -->
			<a class="button button-delete" href="<?=HOST?>contacts/message-delete?id=<?=$message['id']?>">Удалить</a>
		</div>
		<div class="message-date"><?=$message['date_time']?></div>
		<div class="message-author">
			<div class="message-author--name"><?=$message['name']?></div><a class="message-author--email" href="mailto:<?=$message['email']?>" target="_blank"><?=$message['email']?></a>
		</div>
		<div class="message-text">
			<p><?=$message['message']?></p>
		</div>
		<?php if($message['message_file'] != ''){ ?>
		<div class="message-files">
			<div class="message-files--title">Прикрепленные файлы:</div><a class="message-files--list" href="<?=HOST?>/usercontent/upload_files/<?=$message['message_file']?>"><?=$message['message_file_name_original']?></a>
		</div>
		<?php } ?>
	</div>
</div>