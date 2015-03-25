<?php
echo "<html><head><title>So sánh output</title></head><body>";
include("thamso.php");
if (isset($_POST['chon'])) {
	redirect("?bd=".$_POST['maso'],1);
}
if (!($local||$doichieu)) exit('Bạn không có quyền xem');
if (isset($_GET['bd'])) { //co so bao danh
	$sbd = $_GET['bd'];
	if (isset($_GET['f'])) { //xem 1 bai nop cu the
		$tep = $_GET['f'];
		$test = $_GET['t'];
		echo "SO SÁNH OUTPUT $test BÀI <a href='ketqua.php?bd=".$sbd."&f=".$tep."'>$tep</a> CỦA SBD: <a href='ketqua.php?bd=".$sbd."'>$sbd</a> <hr/>";
		if (strpos($tep,"_")!==false)  
			$thumuc=substr($tep,0,strpos($tep,"_"));
		else
			$thumuc=substr($tep,0,strpos($tep,"."));
		echo "<table border=1><tr><td>output mẫu</td><td>kết quả chạy</td></tr><tr><td valign='top'><pre>";
		
		includeornot(__DIR__ ."\\baitoan\\$thumuc\\$test.out","không có tệp");
		//echo __DIR__ ."\\baitoan\\$thumuc\\$test.out";
		echo "</pre></td><td valign='top'><pre>";
		includeornot(__DIR__ ."\\upload\\$sbd\\".str_replace(".pas","_$test.txt", $tep),"không có tệp");
		echo "</pre></td></tr></table>";
		echo "<div style='margin:20px;'>";
		echo "<a href='test.php?b=$thumuc&f=$test'>Xem bộ test</a>";
		echo "</div>";
	} else { //xem tat ca ket qua
		echo "<div>Tất cả các bài nộp của sbd: $sbd</div>";
		if ($handle = opendir(__DIR__ ."\\upload\\$sbd")) {
			echo "<ul>";
			while (false !== ($file = readdir($handle)))
			{
				if ($file != "." && $file != ".." && strtolower(substr($file, strrpos($file, '.') + 1)) == 'pas')
				{
					echo '<li><a href="?bd='.$sbd.'&f='.$file.'">'.$file.'</a></li>';
				}
			}
			closedir($handle);
			echo "</ul>";
		}
	}
} else { //khong co sbd -> chon
	echo "Chọn số báo danh<ul>";
	foreach (glob(__DIR__ ."\\upload\\*",GLOB_ONLYDIR) as $filename) {
		//echo "$filename size \n";
		$filen=basename($filename);
		echo "<li><a href='?bd=".$filen."'>$filen</a></li>";
	}
	echo "</ul>";
}
echo "</body></html>";
function includeornot($tenfile,$thongbao="")
{
	if (file_exists($tenfile)) {
		$noidung=file_get_contents($tenfile);
		echo htmlspecialchars($noidung);
	}
	else
		echo $thongbao;
}

?>
