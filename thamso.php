<?php
$whitelist = array(
    '127.0.0.1',
    '::1'
);
$local = in_array($_SERVER['REMOTE_ADDR'], $whitelist);
$doichieu = false; //thí sinh được doi chieu output sai
$manguon = false; //thi sinh duoc xem ma nguon
$thuattoan = false; //thi sinh duoc xem huong dan
$xemtest = 2; //so bo test duoc xem

?>
