<?php
echo "<html><head><title>Đăng nhập</title><meta name='author' content='Tran Huu Nam'></head><body>";
include("thamso.php");
include_once ("funcs.php");
session_start();
unset($_SESSION);
echo "Đã thoát";
redirect("dangnhap.php",3);
echo "</body></html>";

?>
