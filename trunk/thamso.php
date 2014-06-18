<?php
$whitelist = array(
    '127.0.0.1',
    '::1'
);
$local = in_array($_SERVER['REMOTE_ADDR'], $whitelist);
$doichieu = false;
$manguon = false;
$xemtest = 5; //so bo test duoc xem

?>
