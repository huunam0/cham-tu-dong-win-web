<?php
echo "<html><head><title>Kết quả</title><meta http-equiv='refresh' content='60'/></head><body>";
include("thamso.php");
include_once ("funcs.php");
$ds = dirspace();
if (!$local) exit("Khu vực dành riêng");
if (isset($_GET['b'])) {//da chon bai
	$bai = $_GET['b'];
	echo "<div id='tenbaitoan'>Mã bài toán: $bai</div>";
	echo "<div id='thamsobaitoan'>";
	$handle = @fopen(__DIR__ .$ds."baitoan".$ds.$bai.$ds."chamthi.inf","r");
	//echo __DIR__ .$ds."baitoan".$ds.$bai.$ds."chamthi.inf";
	if ($handle) {
		$buffer = fgets($handle);
		echo "<div>Mô tả về bài toán: $buffer</div>";
		$buffer = fgets($handle);
		echo "<div>Kiểu chấm: $buffer</div>";
		$buffer = fgets($handle);
		echo "<div>Giới hạn thời gian: $buffer ms</div>";
		$buffer = fgets($handle);
		echo "<div>Giới hạn bộ nhớ: $buffer (MB)</div>";
		$buffer = fgets($handle);
		echo "<div>Tên tệp input: <span id='gioihantg'>$buffer</span></div>";
		$buffer = fgets($handle);
		echo "<div>Tên tệp output: <span id='gioihanbn'>$buffer</span></div>";
		fclose($handle);
	}
	echo "</div>";
	echo "<div><a href='soan.php?b=".$bai."'>Nội dung bài toán</a></div>";
	echo "<div id='cacbotest'>";
	if ($handle = opendir(__DIR__ .$ds."baitoan".$ds.$bai)) {
		echo "Các bộ test:<ol>";
		while (false !== ($file = readdir($handle)))
		{
			if ((substr($file,0,4) == "test") && (strtolower(substr($file, strrpos($file, '.') + 1)) == 'inp'))
			{
				echo '<li><a href="test.php?b='.$bai.'&f='.substr($file,0,strrpos($file, '.')).'&act=view">'.substr($file,0,strrpos($file, '.')).'</a> ('.date("d/m/Y H:i:s", filectime(__DIR__ .$ds."baitoan".$ds.$bai.$ds.$file)).')</li>';
			}
		}
		closedir($handle);
		echo "</ol>";
		echo "<a href='test.php?b=".$bai."&act=new'>Thêm bộ test</a>";
	}
	echo "</div>";
} else { //chua chon bai toan -> liet ke bai toan
	if ($handle = opendir(__DIR__ .$ds."baitoan")) {
		echo "<div id='cacbaitoan'>Các bài toán:<ol>";
		while (false !== ($file = readdir($handle)))
		{
			if (($file != ".") && ($file != ".."))
			{
				echo '<li><a href="?b='.$file.'">'.$file.'</a> ('.date("d/m/Y H:i:s", filectime(__DIR__ .$ds."baitoan".$ds.$file)).')</li>';
			}
		}
		closedir($handle);
		echo "</ol></div>";
	}
}

?>
