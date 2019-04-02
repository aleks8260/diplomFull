<div class="work-experience-post">
	<div class="work-experience-post-wrap">
		<div class="work-experience-post-wrap__date"><?=$education['period']?></div>
		<div class="work-experience-post-button"><a class="button button-delete" href="<?=HOST?>about/education-delete?id=<?=$education['id']?>">Удалить</a></div>
	</div>
	<div class="work-experience-post__title"><?=$education['title']?></div>
	<div class="work-experience-post__message"><?=$education['description']?></div>
</div>