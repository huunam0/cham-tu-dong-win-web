<?php
echo "<html><head><title>Quản lí Thí sinh</title><meta name='author' content='Tran Huu Nam'></head><body>";
include("thamso.php");
include_once ("funcs.php");
if (!$local) exit("Khu vực dành riêng");
echo "<h1>Quản lí thí sinh</h1>";
if (isset($_POST['them'])) {
	$ten = $_POST['sbd'];
	$matkhau = $_POST['matkhau'];
	file_put_contents(__DIR__ . "\usernpass.txt","$".$ten."@".$matkhau."#",FILE_APPEND);
	echo "<p>Thêm thành công</p>";
	redirect("?",1);
}
echo "<div>";
includeornot(__DIR__ . "\usernpass.txt");
echo "</div>";
echo "<hr/>";
echo "<form action='' method='post' enctype='multipart/form-data'>";
echo "<p>Tên thí sinh: <input name='sobd' type='text' size='20'> (Không dấu cách, không dấu tiếng Việt)</p>";
echo "<p>Mật khẩu: <input name='matkhau' type='text' ></p>";
echo " <input name='them' type='submit' value='Thêm mới'>";
echo "</form>";
echo "</body></html>";
function includeornot($tenfile,$thongbao="")
{
	if (file_exists($tenfile)) {
		$noidung=file_get_contents($tenfile);
		echo ($noidung);
	}
	else
		echo $thongbao;
}
?>
