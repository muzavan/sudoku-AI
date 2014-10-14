<?php
	$false = $_GET['id'];
	if($false==0){
		echo "Ada yang salah dengan email anda atau ada bagian yang belum anda isi";	
	}
	else{
		mysql_connect('localhost','root','');
		mysql_select_db('simple-wbd-blog');
		$nama = $_POST['Nama'];
		$email = $_POST['Email'];
		$komentar = $_POST['Komentar'];
		$query = "INSERT INTO `comment`(`ID`, `nama`, `email`, `tanggal`, `komentar`) VALUES ($false,'$nama','$email',NOW(),'$komentar')";
		$result = mysql_query($query);
		if(!$result){
			echo "Something is wrong!";
		}
		else{
			echo "Yay!";
			header('Location : post.php?id='.$false);
			die();
		}
	}
?>