<?php
	if(isset($_POST["Judul"]) && isset($_POST["Tanggal"]) && $_POST["Konten"] && $_GET['id'] ){
		$ID = $_GET['id'];	
		$judul = $_POST["Judul"];
		$tanggaldummy = $_POST["Tanggal"];
		$tanggal = intval($tanggaldummy);
		$konten = $_POST["Konten"];
		$goodtogo = mysql_connect('localhost','root','');

		/*
		var_dump($tanggal);
		var_dump($judul);
		*/
		var_dump($konten);

		if(!$goodtogo){
			echo "Something's wrong when try to connect to database";
		}
		else{
			mysql_select_db('simple-wbd-blog');
			$query = "UPDATE `post` SET `ID`=$ID,`judul`='$judul',`tanggal`='$tanggal',`konten`='$konten' WHERE `ID`=$ID" ;
			$berhasil = mysql_query($query);
			if($berhasil){
				echo "Post anda telah direkam";
				header('Location : post.php?id='.$ID);
			}
			else{
				echo "False Query";
			}
		}

	}
	else{
		echo "<center><h1>Nothing to do</h1></center>";
	}
?>