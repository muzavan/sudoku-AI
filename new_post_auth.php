<?php
	if(isset($_POST["Judul"]) && isset($_POST["Tanggal"]) && $_POST["Konten"] ){
	
		$judul = $_POST["Judul"];
		$tanggaldummy = $_POST["Tanggal"];
		$tanggal = intval($tanggaldummy);
		$konten = $_POST["Konten"];

		$goodtogo = mysql_connect('localhost','root','');

		/*
		var_dump($tanggal);
		var_dump($judul);
		var_dump($konten);
		*/

		if(!$goodtogo){
			echo "Something's wrong when try to connect to database";
		}
		else{
			mysql_select_db('simple-wbd-blog');
			$query = "INSERT INTO `post`(`judul`, `tanggal`, `konten`) VALUES ('".$judul."',".$tanggal.",'".$konten."');" ;
			$berhasil = mysql_query($query);
			echo "Good to Go";
		}

	}
	header('Location:index.php');
	die();
?>