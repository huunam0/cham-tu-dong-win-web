<?php
echo "<html><head><title>Bài toán</title><meta name='author' content='Tran Huu Nam'></head><body>";
include_once ("thamso.php");
include_once ("funcs.php");
$ds = dirspace();
if (isset($_POST['chon'])) {
	redirect("?b=".$_POST['maso'],1);
}
if (isset($_POST['nop'])) {
	$sbd = $_POST['sobd'];
	if ($sbd) {
		$baitap = $_POST['baitap'];
		$ufile = uploadFile("nfile","upload",$sbd,defined("DEBUG"));
		if ($ufile) {
			echo "Đã nộp xong.<br/>[".$sbd."] Nộp tập tin : [".$ufile."]";
			if (!isset($_POST['khongcham']))
			if (strpos($ufile,'.pas')!==false) {
				exec(__DIR__ . $ds ."chamtudong.exe ".__DIR__ . $ds ."upload" . $ds .$sbd. $ds .$ufile,$ketqua);
				echo "<hr/><div><pre>".implode(PHP_EOL,$ketqua)."</pre></div><hr/>";
				echo "<div><a href='kq.php?bd=$sbd&f=$ufile'>Xem kết quả chi tiết</a></div>";
			}
			else
				echo "Chưa hỗ trợ chấm tự động định dạng tệp này";
			echo "<div><a href='?b=$baitap'>Quay lại bài toán</a></div>";
			
			//redirect("?b=$baitap",30);
		}
		else echo "THẤT BẠI";
	} else {
		echo "Cần nhập tên hoặc số báo danh: dùng các chữ cái a-z, chữ số 0-9; không được có dấu cách";
	}
} else if (isset($_GET['b'])) {
	echo "BÀI TOÁN<br/>";
	$bai=$_GET['b'];
	//include("baitoan//$bai//index.html");
	echo "<iframe src='baitoan/".$bai."/index.html' width='1000' height='520'></iframe>";
	if ($xemtest) {
		if ($handle = opendir(__DIR__ .$ds."baitoan".$ds.$bai)) {
			echo "<div id='cacbotest'>Một số bộ test:<ol>";
			$dem=1;
			while ((false !== ($file = readdir($handle)))&&($dem<=$xemtest))
			{
				if ($file != "." && $file != ".." && strtolower(substr($file, strrpos($file, '.') + 1)) == 'inp')
				{
					echo '<li><a href="baitoan/'.$bai.'/'.$file.'" download="'.$bai.'.inp">'.substr($file,0,strrpos($file, '.')).'</a></li>';
					$dem++;
				}
			}
			closedir($handle);
			echo "</ol></div>";
		}
	}
	echo "<hr/>NỘP BÀI<br/>";
	echo "<form action='' method='post' enctype='multipart/form-data'>";
	echo "Số báo danh <i>(hoặc tên không dấu, không cách)</i>: <input name='sobd' type='text' size='9'>";
	echo ". . . . . Tập tin bài làm <i>(phải đặt tên là <span style='color:red;'>$bai.pas</span>)</i>: <input name='nfile' type='file'  id='nfile'>";
	echo " <input name='khongcham' type='checkbox'>Không chấm";
	echo " <input name='baitap' type='hidden' value='$bai'>";
	echo " <input name='nop' type='submit' value='Nộp bài'>";
	echo "</form>";
} else {
	echo "<form action='' method='post'>";
	echo "Mã số bài toán: <input name='maso' type='text' size='9'>";
	echo " <input name='chon' type='submit' value='Xem bài'>";
	echo "</form>";
}
echo "</body></html>";

function uploadFile($uname,$folder,$sbd,$debug=false) {
	if ($debug) print_r($_FILES);
	if (!empty($_FILES[$uname])) {
		if (is_uploaded_file($_FILES[$uname]["tmp_name"])){
			if ($_FILES[$uname]["error"] > 0)  {
				if ($debug) echo "Upload file with error : " . $_FILES[$uname]["error"] . "<br />";
				return "";
			} else {
				if ($debug) {
					echo "Upload: " . $_FILES[$uname]["name"] . "<br />";
					echo "Type: " . $_FILES[$uname]["type"] . "<br />";
					echo "Size: " . ($_FILES[$uname]["size"] ) . " Bytes<br />";
					echo "Temp file: " . $_FILES[$uname]["tmp_name"] . "<br />";
				}
				$filename = $_FILES[$uname]["name"];
				$i=1;
				if (!file_exists($folder."/".$sbd)) mkdir($folder."/".$sbd);
				$folder.="/".$sbd;
				//if (file_exists())
				$fileinfo=pathinfo($filename);
				//$filename = $fileinfo['filename']."_".$sbd.".".$fileinfo['extension'];
				while (file_exists($folder. "/".$filename)) {
					//$filename = $i++ ."_". $_FILES[$uname]["name"];    
					$filename = $fileinfo['filename']."_$i.".$fileinfo['extension'];
					$i++;
				}
				$filename=strtolower($filename);
				move_uploaded_file($_FILES[$uname]["tmp_name"], $folder. "/" . $filename);
				//$f = __DIR__ . $ds .  "upload.log";
				file_put_contents(__DIR__ .  "\upload.log","<p><a href='kq.php?bd=$sbd&f=$filename'>". $sbd. " : " . $filename .date(' (Y-m-d H:i:s)'). "</a></p>\n",FILE_APPEND);
				return $filename;
			}
		} else {
			if ($debug) echo "Upload Fail";
			return "";
		}
	}
	if ($debug) echo "Not found";
	return "";
}




?>
