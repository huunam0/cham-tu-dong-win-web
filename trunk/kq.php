<?php
echo "<html><head><title>Kết quả</title><meta http-equiv='refresh' content='30'/></head><body>";

if (isset($_POST['chon'])) {
	redirect("?bd=".$_POST['maso'],1);
}
if (isset($_GET['bd'])) { //co so bao danh
	$sbd = $_GET['bd'];
	if (isset($_GET['f'])) { //xem 1 bai nop cu the
		$tep = $_GET['f'];
		echo "Chua co ket qua";
	} else { //xem tat ca ket qua
		echo "Xem het cac bai";
	}
} else { //khong co sbd -> chon
	echo "<form action='' method='post'>";
	echo "Chọn số báo danh: <input name='maso' type='text' size='9'>";
	echo " <input name='chon' type='submit' value='Xem'>";
	echo "</form>";
}
echo "</body></html>";


function redirect($location, $delaytime = 0) {
    if ($delaytime>0) {    
        header( "refresh: $delaytime; url='".str_replace("&amp;", "&", $location)."'" );
    } else {
        header("Location: ".str_replace("&amp;", "&", $location));
    }    
}
?>
