<?php
echo "<html><head><title>Sửa nội dung bài toán</title><meta name='author' content='Tran Huu Nam'></head>";
if (!isset($_GET['plain'])) 
	echo "<script src='ckeditor/ckeditor.js'></script>";
echo "<body>";
include("thamso.php");
include_once ("funcs.php");
$ds = dirspace();
if (!$local) exit("Khu vực dành riêng");
if (isset($_GET['b'])) { //da chon bai = bat buoc
	$mabai=$_GET['b'];
	if (isset($_POST['sua'])) {
		$f = __DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . "index.html";
		file_put_contents($f,"<!DOCTYPE HTML>\n<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'></head><body>".$_POST['noidung']."</body></html>");
		echo "Đã lưu các thay đổi.";
		redirect("?b=$mabai",3);
	} else {
		echo "<h2>Sửa bài toán</h2>";
		echo "<form action='?b=".$mabai."' method='post'>";
		echo "<p><textarea class='ckeditor' name='noidung'>";
		echo file_get_contents(__DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . "index.html");
		echo "</textarea></p>";
		echo "<input type='submit' name='sua' value='Lưu thay đổi'/>";
		echo "</form>";
	}
} else {
	echo "Không tìm thấy bài toán.";
}
?>
