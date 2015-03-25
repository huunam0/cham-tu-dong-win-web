<?php
echo "<html><head><title>TESTs</title><meta name='author' content='Tran Huu Nam'></head>";
echo "<body>";
include("thamso.php");
include_once ("funcs.php");
$ds = dirspace();
if (!$local) exit("Khu vực dành riêng");
if (!isset($_GET['act'])) $act="";
else $act=$_GET['act'];
if (isset($_GET['b'])) { //da chon loai thao tac
	$mabai=$_GET['b'];
	if ($act=="new") {//tao moi
		if (isset($_POST['them'])) {
			$i=1;
			while (file_exists( __DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . "test$i.inp")) {
				$i++;
			}
			file_put_contents(__DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . "test$i.inp",$_POST['dlvao']);
			file_put_contents(__DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . "test$i.out",$_POST['dlra']);
			echo "<p>Đã ghi test</p>";
			echo "<p><a href='?b=".$mabai."&act=new'>Thêm bộ test</a></p>";
			redirect("?b=$mabai&f=test$i&act=view",3);
		} else {
			echo "<h2>Thêm bộ test cho bài toán $mabai</h2>";
			echo "<form action='?act=new&b=".$mabai."' method='post'>";
			echo "<table width='100%'><tr><td width='70%'>INPUT</td><td width='30%'>OUTPUT</td></tr>";
			echo "<tr valign='top'><td><textarea name='dlvao' cols='50' rows='15'></textarea></td><td><textarea name='dlra' cols='20' rows='10'></textarea></td></tr>";
			echo "</table>";
			echo "<input type='submit' name='them' value='Tạo mới'/>";
			echo "</form>";
		}
		
	} else if ($act=="edit") {//sua
		if (!isset($_GET['f'])) exit("Chưa chọn bộ test để làm việc");
		$t = $_GET['f'];
		if (isset($_POST['sua'])) {
			file_put_contents(__DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . $t.".inp",$_POST['dlvao']);
			file_put_contents(__DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . $t.".out",$_POST['dlra']);
			echo "<p>Đã ghi test</p>";
			echo "<p><a href='?b=".$mabai."&act=new'>Thêm bộ test</a></p>";
			redirect("?b=$mabai&f=$t&act=view",3);
		} else {
			echo "<h2>Sửa bộ test cho bài toán $mabai</h2>";
			echo "<form action='?act=edit&f=".$t."&b=".$mabai."' method='post'>";
			echo "<table width='100%'><tr><td width='70%'>INPUT</td><td width='30%'>OUTPUT</td></tr>";
			echo "<tr  valign='top'><td><textarea name='dlvao' cols='50' rows='15'>".file_get_contents(__DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . $t.".inp")."</textarea></td>";
			echo "<td><textarea name='dlra'  cols='20' rows='10'>".file_get_contents(__DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . $t.".out")."</textarea></td></tr>";
			echo "</table>";
			echo "<input type='submit' name='sua' value='Lưu'/>";
			echo "</form>";
		}
	} else {//xem
		if (!isset($_GET['f'])) exit("Chưa chọn bộ test để làm việc");
		$t = $_GET['f'];
		echo "<h2>Xem bộ test <u>$t</u> cho bài toán <a href='bai.php?b=$mabai'>$mabai</a></h2>";
		echo "<table width='100%' border='0'><tr><td width='70%'>INPUT</td><td width='30%'>OUTPUT</td></tr>";
		echo "<tr valign='top'><td><pre>".file_get_contents(__DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . $t.".inp")."</pre></td>";
		echo "<td><pre>".file_get_contents(__DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . $t.".out")."</pre></td></tr>";
		echo "</table>";
		if ($act) {
			echo "<p><a href='?act=edit&b=".$mabai."&f=".$t."'>Sửa  bộ test này.</a></p>";
			echo "<p><a href='?b=".$mabai."&act=new'>Thêm bộ test khác</a></p>";
		}
	}
} else {
	echo "Không tìm thấy bộ test/bài toán";
}
?>
