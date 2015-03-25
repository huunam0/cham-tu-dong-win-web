<?php
echo "<html><head><title>Đăng nhập</title><meta name='author' content='Tran Huu Nam'></head><body>";
include("thamso.php");
include_once ("funcs.php");
session_start();
$url = (isset($_GET['r'])) ? "r=" . $_GET['r'] : "";
if (!isset($_SESSION['user_name'])) {
	if (!isset($_POST['dangnhap'])) {
		echo "<h1>Đăng nhập</h1>";
		echo "<form action='?$url' method='post'>";
		echo "<p>Tên đăng nhập: <input type='text' name='ten'/></p>";
		echo "<p>Mật khẩu: <input type='password' name='matkhau'></p>";
		echo "<input type='submit' name='dangnhap' value='Đăng nhập'/>";
		echo "</form>";
	} else {
		$ten = $_POST['ten'];
		$mkhau = $_POST['matkhau'];
		$nd = file_get_contents(__DIR__ . "\usernpass.txt");
		if (strstr($nd,"$".$ten."@".$mkhau."#")) {
			$_SESSION['user_name'] = $ten;
			echo "<p>Đăng nhập thành công</p>";
			echo "<p><a href='dangxuat.php'>Thoát</a></p>";
			if ($url) redirect($_GET['r'],4);
		} else {
			echo "Thông tin đăng nhập  không đúng.";
			redirect("?$url",4);
		}
	}
} else {
	echo "<p>Đã đăng nhập với tên <u>".$_SESSION['user_name']."</u></p>";
	echo "<p><a href='dangxuat.php'>Thoát</a></p>";
	if ($url) redirect($_GET['r'],4);
}
echo "</body></html>";
function includeornot($tenfile,$thongbao="")
{
	if (file_exists($tenfile))
		include($tenfile);
	else
		echo $thongbao;
}

?>
