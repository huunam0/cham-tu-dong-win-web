<?php
echo "<html><head><title>Quản lí bài toán</title><meta name='author' content='Tran Huu Nam'></head>";
echo "<script src='ckeditor/ckeditor.js'></script><script type='text/javascript'>function dien(){var xx=document.getElementById('mabaitoan').value;document.getElementById('tepvaoid').value=xx+'.inp';document.getElementById('tepraid').value=xx+'.out';var yy=document.getElementById('noidung');document.getElementById('noidung').value=yy.value.replace(/file/g,xx).replace(/FILE/gi,xx.toUpperCase());}</script>";
echo "<body>";
include("thamso.php");
include_once ("funcs.php");
$ds = dirspace();
if (!$local) exit("Khu vực dành riêng");
if (!isset($_GET['act'])) {
	if (isset($_GET['b'])) {//da chon bai
		$bai = $_GET['b'];
		echo "<div id='tenbaitoan'>Mã bài toán: <a href='bai.php?b=$bai'>$bai</a></div>";
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
		echo "<div style='margin:20px;'><a href='baitoan.php'>Quay lại danh sách bài toán</a></div>";
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
		echo "<div><a href='?act=new'>Thêm bài toán</a></div>";
	}
} else {
	if (!isset($_POST['moi'])) {
		echo "<h2>Thêm bài toán mới</h2>";
		echo "<form action='?act=new' method='post'>";
		echo "<p>Mã bài toán: <input type='text' name='mabai' onblur='dien();' id='mabaitoan'> <span><i>(tối thiểu 3 kí tự, tối đa 8 kí tự, không dùng khoảng trống)</i></span></p>";
		echo "<p>Mô tả ngắn gọn: <input type='text' name='mota' size='100'> <i>(tối đa 200 kí tự, dùng tiếng Việt không dấu)</i></p>";
		echo "<p>Kiểu chấm: <select name='kieucham'><option value=1>Chỉ có 1 phương án đúng</option><option value=3>Liệt kê các phương án thứ tự tuỳ ý + số lượng</option><option value=4>Liệt kê các phương án thứ tự tuỳ ý</option></select></p>";
		echo "<p>Giới hạn thời gian: <input type='text' name='ghthoigian' value='1000'> (ms)</p>";
		echo "<p>Giới hạn bộ nhớ: <input type='text' name='ghbonho' value='100'> (MB)</p>";
		echo "<p>Tên tệp dữ liệu vào (input): <input type='text' name='tepvao' value='.inp' id='tepvaoid'></p>";
		echo "<p>Tên tệp dữ liệu ra (output): <input type='text' name='tepra' value='.out' id='tepraid'></p>";
		echo "<p>Nội dung bài toán:</p>";
		echo "<p><textarea class='ckeditor' name='noidung' id='noidung'>";
		echo "&lt;h2&gt;Tên bài toán&lt;/h2&gt;";
		echo "&lt;div id='mota'&gt; Mô tả &lt;/div&gt;";
		echo "&lt;div id='yeucau'&gt; &lt;h3&gt;Yêu cầu:&lt;/h3&gt; Nêu yêu cầu &lt;/div&gt;";
		echo "&lt;div id='dlvao'&gt; &lt;h3&gt;Input:&lt;/h3&gt; &lt;p&gt;từ tệp file.inp&lt;/p&gt; &lt;/div&gt;";
		echo "&lt;div id='dlra'&gt; &lt;h3&gt;Output:&lt;/h3&gt; &lt;p&gt;ghi ra tệp file.out&lt;/p&gt; &lt;/div&gt;";
		echo "&lt;div id='vidu'&gt;&lt;h3&gt;Ví dụ:&lt;/h3&gt;&lt;div id='vd_vao'&gt;&lt;div style='text-transform: uppercase'&gt;FILE.INP&lt;/div&gt;&lt;pre&gt;noi dung input&lt;/pre&gt;&lt;/div&gt;&lt;div id='vd_ra'&gt;&lt;div style='text-transform: uppercase'&gt;FILE.OUT&lt;/div&gt;&lt;pre&gt;noi dung output&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;";
		echo "&lt;div id='ghichu'&gt;&lt;h3&gt;Ghi chú:&lt;/h3&gt;&lt;p&gt;&lt;em&gt;giải thích thêm&lt;/em&gt;&lt;/p&gt;&lt;/div&gt;";
		
		echo "</textarea></p>";
		echo "<input type='submit' name='moi' value='Thêm bài toán'/>";
		echo "</form>";
	} else {
		if (!isset($_POST['mabai']))
			exit("Chưa chọn mã bài toán.");
		$mabai=$_POST['mabai'];
		if (file_exists(__DIR__ . $ds . "baitoan" .$ds . $mabai))
			exit("Mã bài toán này đã tồn tại.");
		mkdir(__DIR__ . $ds . "baitoan" .$ds . $mabai);
		$f = __DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . "chamthi.inf";
		file_put_contents($f,$_POST['mota']."\n");
		file_put_contents($f,$_POST['kieucham']."\n".$_POST['ghthoigian']."\n".$_POST['ghbonho']."\n".$_POST['tepvao']."\n".$_POST['tepra'],FILE_APPEND);
		$f = __DIR__ . $ds . "baitoan" .$ds . $mabai . $ds . "index.html";
		file_put_contents($f,"<!DOCTYPE HTML>\n<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'></head><body>".$_POST['noidung']."</body></html>");
		echo "Đã tạo xong bài toán $mabai";
		redirect($_SERVER['PHP_SELF']."?b=".$mabai,3);
		
	}
}
?>
