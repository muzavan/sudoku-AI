<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Deskripsi Blog">
<meta name="author" content="Judul Blog">

<!-- Twitter Card -->
<meta name="twitter:card" content="summary">
<meta name="twitter:site" content="omfgitsasalmon">
<meta name="twitter:title" content="Simple Blog">
<meta name="twitter:description" content="Deskripsi Blog">
<meta name="twitter:creator" content="Simple Blog">
<meta name="twitter:image:src" content="{{! TODO: ADD GRAVATAR URL HERE }}">

<meta property="og:type" content="article">
<meta property="og:title" content="Simple Blog">
<meta property="og:description" content="Deskripsi Blog">
<meta property="og:image" content="{{! TODO: ADD GRAVATAR URL HERE }}">
<meta property="og:site_name" content="Simple Blog">

<link rel="stylesheet" type="text/css" href="assets/css/screen.css" />
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<title>Simple Blog</title>


</head>

<body class="default">
<div class="wrapper">

<nav class="nav">
    <a style="border:none;" id="logo" href="index.php"><h1>Simple<span>-</span>Blog</h1></a>
    <ul class="nav-primary">
        <li><a href="new_post.php">+ Tambah Post</a></li>
    </ul>
</nav>

        <?php
            if(isset($_GET['id'])){

              mysql_connect('localhost','root','');
              mysql_select_db('simple-wbd-blog');
              $ID = $_GET['id'];
              $query = "SELECT * FROM `post` WHERE `ID`=$ID";
              $result = mysql_query($query);
              $row = mysql_fetch_array($result);
              $judul = $row['judul'];
              $tanggal = $row['tanggal'];
              $konten = $row['konten'];

            
            
        ?>


<article class="art simple post">
    
    <header class="art-header">
        <div class="art-header-inner" style="margin-top: 0px; opacity: 1;">
            <time class="art-time"><?php echo $tanggal;?></time>
            <h2 class="art-title"> <?php echo $judul ; ?></h2>
            <p class="art-subtitle"></p>
        </div>
    </header>

    <div class="art-body">
        <div class="art-body-inner">
            <hr class="featured-article" />
            <?php echo $konten; 
                } // end of if 
             ?>
            <hr />
            
            <h2>Komentar</h2>

            <div id="contact-area">
                <form method="post" action="post.php?id=<?php echo $_GET['id']; ?>" onsubmit="return validate();">
                    <label for="Nama">Nama:</label>
                    <input type="text" name="Nama" id="Nama">
        
                    <label for="Email">Email:</label>
                    <input type="text" name="Email" id="Email"><span><?php if(isset($_GET['false'])){echo "<font color='red' >Email is Invalid! </font>";} ?></span>     
                    <label for="Komentar">Komentar:</label><br>
                    <textarea name="Komentar" rows="20" cols="20" id="Komentar"></textarea>

                    <input type="submit" name="submit" value="Kirim" class="submit-button" >
                </form>
            </div>


            <ul class="art-list-body"> 
            <?php
                $ID = $_GET['id'];
                mysql_connect('localhost','root','');
                mysql_select_db('simple-wbd-blog');
                $ID = $_GET['id'];
                $query = "SELECT * FROM `comment` WHERE `ID`=$ID ORDER BY `tanggal` DESC";
                $result = mysql_query($query);
                while($row = mysql_fetch_array($result)){
                    $nama = $row['nama'];
                    $tanggal = $row['tanggal'];
                    $komentar = $row['komentar'];
                
            ?>
            <li class="art-list-item">
                    <div class="art-list-item-title-and-time">
                        <h2 class="art-list-title"><?php echo $nama;?></h2>
                        <div class="art-list-time"><?php echo $tanggal;?></div>
                    </div>
                    <p><?php echo $komentar;?></p>
            </li>

            
            <?php } ?>
            </ul>
        </div>
    </div>

</article>

<footer class="footer">
    <div class="back-to-top"><a href="">Back to top</a></div>
    <!-- <div class="footer-nav"><p></p></div> -->
    <div class="psi">&Psi;</div>
    <aside class="offsite-links">
        Asisten IF3110 /
        <a class="rss-link" href="#rss">RSS</a> /
        <br>
        <a class="twitter-link" href="http://twitter.com/YoGiiSinaga">Yogi</a> /
        <a class="twitter-link" href="http://twitter.com/sonnylazuardi">Sonny</a> /
        <a class="twitter-link" href="http://twitter.com/fathanpranaya">Fathan</a> /
        <br>
        <a class="twitter-link" href="#">Renusa</a> /
        <a class="twitter-link" href="#">Kelvin</a> /
        <a class="twitter-link" href="#">Yanuar</a> /
        
    </aside>
</footer>

</div>

<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/fittext.js"></script>
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/respond.min.js"></script>
<script type="text/javascript">
var xmlhttp;
function validate(){

    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange= myfunction;
    if(testRegex(document.getElementById("Email").value) && document.getElementById("Nama").value!=null && document.getElementById("Komentar").value!=null ){
        xmlhttp.open("POST","new_comment.php?id=<?php echo $_GET['id'];?>",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        var sendString = "Nama="+document.getElementById('Nama').value+"&"+"Komentar="+document.getElementById('Komentar').value+"&"+"Email="+document.getElementById('Email').value;
        xmlhttp.send(sendString);
        return true;
    }
    else{
        
        alert("Isian belum lengkap atau email tidak valid");
        return false;
    }
}

function myfunction()
{
    
    if(xmlhttp.readyState==4 && xmlhttp.status==200){
      if(xmlhttp.responseText=="Yay!"){

      }
      else{
      }
    }
    
}


function testRegex(contohString){
        var re = new RegExp("[a-z_0-9\-]+@[a-z_0-9\-]+.[a-z]+");
        return re.test(contohString);
}
</script>

</body>
</html>