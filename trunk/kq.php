<?php
echo "<html><head><title>Kết quả</title><meta http-equiv='refresh' content='60'/></head><body>";
include("thamso.php");
if (isset($_POST['chon'])) {
	redirect("?bd=".$_POST['maso'],1);
}
if (isset($_GET['bd'])) { //co so bao danh
	$sbd = $_GET['bd'];
	if (isset($_GET['f'])) { //xem 1 bai nop cu the
		$tep = $_GET['f'];
		echo "KẾT QUẢ NỘP BÀI ";
		echo (($local||$manguon)?"<a href='xem.php?bd=".$sbd."&f=".$tep."'>$tep</a>":$tep);
		echo " CỦA SBD: <a href='?bd=".$sbd."'>$sbd</a> <hr/>";
		echo "<div><h2>Kết quả chạy chương trình</h2><pre>";
		$handle = @fopen(__DIR__ ."\\upload\\$sbd\\".str_replace(".pas","_kq.txt",$tep), "r");
		if ($handle) {
			$buffer = fgets($handle);
			echo "Số bộ test: $buffer".PHP_EOL;
			$sotest=intval($buffer);
			for ($i=0;$i<$sotest;$i++) {
				$buffer = fgets($handle);
				if (strpos($buffer,"SAI")!==false) {
					echo ($doichieu||$local?"<a href='ss.php?bd=".$sbd."&f=".$tep."&t=".substr($buffer,0,strpos($buffer,":"))."'>$buffer</a>":$buffer).PHP_EOL;
				}
				else {
					echo $buffer.PHP_EOL;
				}
			}
			fclose($handle);
		}
		echo "</pre></div>";
		echo "<div><h2>Lỗi khi chạy chương trình</h2><pre>";
		includeornot(__DIR__ ."\\upload\\$sbd\\".str_replace(".pas","_chay.txt",$tep),"không có");
		echo "</pre></div>";
		echo "<div><h2>Lỗi biên dịch chương trình</h2><pre>";
		includeornot(__DIR__ ."\\upload\\$sbd\\".str_replace(".pas","_dich.txt",$tep),"không có");
		echo "</pre></div>";
		echo "<hr/><div><a href='cham.php?bd=".$sbd."&f=".$tep."'>Chấm lại</a></div>";
		
	} else { //xem tat ca ket qua
		echo "<div>Tất cả các bài nộp của sbd: $sbd</div>";
		if ($handle = opendir(__DIR__ ."\\upload\\$sbd")) {
			echo "<ul>";
			while (false !== ($file = readdir($handle)))
			{
				if ($file != "." && $file != ".." && strtolower(substr($file, strrpos($file, '.') + 1)) == 'pas')
				{
					echo '<li><a href="?bd='.$sbd.'&f='.$file.'">'.$file.'</a> ('.date("d/m/Y H:i:s", filectime(__DIR__ ."\\upload\\$sbd\\".$file)).')</li>';
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
	if (file_exists($tenfile))
		include($tenfile);
	else
		echo $thongbao;
}

function redirect($location, $delaytime = 0) {
    if ($delaytime>0) {    
        header( "refresh: $delaytime; url='".str_replace("&amp;", "&", $location)."'" );
    } else {
        header("Location: ".str_replace("&amp;", "&", $location));
    }    
}
?>
