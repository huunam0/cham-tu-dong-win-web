<?php
echo "<html><head><title>Các bài nộp</title><meta charset='utf-8'><meta http-equiv='refresh' content='8'></head><body>";
include("thamso.php");
if (!($local||$doichieu)) exit('Bạn không có quyền xem');

echo "<div>Tất cả các bài mới nộp:</div>";
echo "<div>";
includeornot2(__DIR__ . "\upload.log","Không có");
echo "</div>";
echo "</body></html>";
function includeornot2($tenfile,$thongbao="")
{
	if (file_exists($tenfile)) {
		$noidung=file_get_contents($tenfile);
		echo ($noidung);
	}
	else
		echo $thongbao;
}

?>
