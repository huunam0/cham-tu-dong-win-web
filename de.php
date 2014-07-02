<?php
echo "<html><head><title>Đề bài</title><meta name='author' content='Tran Huu Nam'></head><body>";
include("thamso.php");
include_once ("funcs.php");
$ds = dirspace();
if (!isset($_GET['d'])) {
	exit ("Hãy chọn một mã đề.");
}

$made = $_GET['d'];
$handle = @fopen(__DIR__ .$ds."dethi".$ds.$made.".txt", "r");
if ($handle) {
	$buffer = fgets($handle);
	echo "<h2>".$buffer."</h2>";
	echo "<div id='dsbaitoan'>";
	$i=1;
	while (!feof($handle)) {
		$buffer = fgets($handle);
		echo "<p> Bài $i. <a href='bai.php?b=".$buffer."'>$buffer</a></p>";
		$i++;
	}
	echo "</div>";
	fclose($handle);
}
else {
	exit ("Không thấy mã đề <span class='maudo'>".$made."</span>");
}

?>
