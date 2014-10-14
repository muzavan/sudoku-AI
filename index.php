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
<style>
  .itu {
    font-size: 16px;
    font-family: Arial;
    background-color: #22DD22;
    width : 75%;
    margin : auto auto auto auto;
  }

</style>
<body class="default">

<?php 
  if(isset($_GET['delete'])){
    if($_GET['delete']==1){
      echo "<div class='itu'> Post berhasil dihapus</div>";
    }
    else{
      echo "<div class='itu'> Post gagal dihapus</div>";
    }
  }
?>

<div class="wrapper">

<nav class="nav">
    <a style="border:none;" id="logo" href="index.php"><h1>Simple<span>-</span>Blog</h1></a>
    <ul class="nav-primary">
        <li><a href="new_post.php">+ Tambah Post</a></li>
    </ul>
</nav>

<div id="home">
    <div class="posts">
        <nav class="art-list">
          <ul class="art-list-body">

          <?php 
              $goodtogo = mysql_connect('localhost','root','');
              if(!$goodtogo){
                echo "CAN'T CONNECT TO DATABASE";
              }
              else{
                mysql_select_db('simple-wbd-blog');
                $query = "SELECT * FROM `post` ORDER BY `tanggal` DESC;";
                $result = mysql_query($query);
                while ($row = mysql_fetch_array($result)){
                    $judul = $row['judul'];
                    $tanggal = $row['tanggal'];
                    $konten = $row['konten'];
                    $ID = $row['ID'];
                

            ?>

            <li class="art-list-item">
                <div class="art-list-item-title-and-time">
                    <h2 class="art-list-title"><a href="<?php echo "post.php?id=$ID";?>"><?php echo $judul;?></a></h2>
                    <div class="art-list-time"> <?php echo $tanggal; ?> </div>
                    <div> <button onclick="editPost(<?php echo $ID;?>)">Edit</button> | <button onclick="sureDelete(<?php echo $ID;?>)">Hapus</button> </div>
                  
                </div>
                <span>

                  <p> <?php echo $konten;?> </p>
                </span>
            </li>

            <?php
               }
              }
            ?>

          </ul>
        </nav>
    </div>
</div>

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
  function sureDelete(idPost){
    if(confirm("Yakin mau hapus post ini?")){
      window.location.replace("deletepost.php?id="+idPost) ;
    }
    else{
      // do nothing
    }
  }

  function editPost(idPost){
    window.location.href = "edit_post.php?id="+idPost;
  }

</script>

</body>
</html>