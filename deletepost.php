<?php
	if(isset($_GET['id'])){
		$ID = $_GET['id'];
		mysql_connect('localhost','root','');
		mysql_select_db('simple-wbd-blog');
		$query = "DELETE FROM `post` WHERE `ID`=$ID";
		$result = mysql_query($query);
		echo "test";
		if($result){
			header('Location:index.php?delete=1');
			die();
		}
		else{
			header('Location:index.php?delete=0');
			die();
		}
	}
	else{
		echo "gak masuk?";
	}
?>