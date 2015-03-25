<?php
echo "<html><head><title>Mã nguồn</title></head><body>";
include("thamso.php");
include_once ("funcs.php");
$ds = dirspace();
if (isset($_POST['chon'])) {
	redirect("?bd=".$_POST['maso'],1);
}
if (!($local||$manguon)) exit("Bạn không có quyền xem");
if (isset($_GET['bd'])) { //co so bao danh
	$sbd = $_GET['bd'];
	if (isset($_GET['f'])) { //xem 1 bai nop cu the
		$tep = $_GET['f'];
		echo "NỘI DUNG TỆP <a href='ketqua.php?bd=".$sbd."&f=".$tep."'>$tep</a> (".date("d/m/Y H:i:s", filectime(__DIR__ .$ds."upload".$ds.$sbd.$ds.$tep)).") CỦA SBD: <a href='ketqua.php?bd=".$sbd."'>$sbd</a> <hr/>";
		echo "<div><pre>";
		includeornot(__DIR__ .$ds."upload".$ds.$sbd.$ds.$tep,"không có tệp");
		echo "</pre></div>";
	} else { //xem tat ca ket qua
		echo "<div>Tất cả các bài nộp của sbd: $sbd</div>";
		if ($handle = opendir(__DIR__ .$ds."upload".$ds.$sbd)) {
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
	foreach (glob(__DIR__ .$ds."upload".$ds."*",GLOB_ONLYDIR) as $filename) {
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
