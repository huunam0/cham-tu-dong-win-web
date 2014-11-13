<?php
$whitelist = array(
    '127.0.0.1',
    '::1'
);
$MYIP=$_SERVER['REMOTE_ADDR'];
$local = in_array($MYIP, $whitelist);
date_default_timezone_set("Asia/Ho_Chi_Minh");
$tennd = isset($_SESSION['user_name']) ? $_SESSION['user_name'] : "";
$doichieu = false; //thí sinh được doi chieu output sai
$manguon = false; //thi sinh duoc xem ma nguon
$thuattoan = false; //thi sinh duoc xem huong dan
$xemtest = 2; //so bo test duoc xem

?>
