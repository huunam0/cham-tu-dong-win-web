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
	$f = isset($_GET['f']) ? $_GET['f'] : "goiy.html";
	echo $f."<hr/>";
	echo file_get_contents(__DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . $f);
} else {
	echo "Không tìm thấy bài toán.";
}
?>
