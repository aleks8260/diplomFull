<?php 

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/login/form-lost-password.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/login/login-page.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>
