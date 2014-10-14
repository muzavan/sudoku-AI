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

<title>Simple Blog | Tambah Post</title>


</head>


<body class="default">
<style>
    .khusus{
        color : red;
        font-size: 20px;
        font-family: Arial;
        margin : 100px auto auto auto;
        vertical-align: center;
        width: 50%;
    }
</style>

<div class="wrapper">


    <a style="border:none;" id="logo" href="index.php"><h1>Simple<span>-</span>Blog</h1></a>
    <ul class="nav-primary">
        <li><a href="new_post.php">+ Tambah Post</a></li>
    </ul>


<article class="art simple post">
    
    
    <h2 class="art-title" style="margin-bottom:40px">-</h2>

    <div class="art-body">
        <div class="art-body-inner">
            <h2>Tambah Post</h2>

            <div id="contact-area">
                <form  method="post" action="new_post_auth.php" onsubmit="return validate()">
                    <label for="Judul">Judul:</label>
                    <input type="text" name="Judul" id="Judul">

                    <label for="Tanggal">Tanggal:</label>
                    <input type="number" name="Tanggal" id="Tanggal" value="yyyymmdd"> <span><?php if(isset($_GET['false'])){ echo "Format Tanggal Tidak Tepat atau Kurang Dari Sekarang";}?><span>
                    
                    <label for="Konten">Konten:</label><br>
                    <textarea name="Konten" rows="20" cols="20" id="Konten"></textarea>

                    <input type="submit" name="submit" style="width:auto;margin:auto auto auto auto;" value="Simpan" bclass="submit-button">
                <span>or <a class="khusus" href="index.php" > Back to Home</a>?</span>
            </div>
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



</body>
<script type="text/javascript">
    function validate(){
        if(testTanggal(document.getElementById("Tanggal").value) && document.getElementById("Judul").value!="" && document.getElementById("Konten").value!=""){
            return true;
        }
        else{
            alert("SALAH!");
            return false;
        }
    }
    function testTanggal(contohTanggal){
        var re= new RegExp("[0-9]{8}");
        if(re.test(contohTanggal)){
            var tahun = contohTanggal/10000;
            var bulan = ((contohTanggal - contohTanggal%100)/100)%100;
            var hari = contohTanggal%100;

            if(isValid(contohTanggal)){
                currentDate = new Date(tahun,bulan,hari); 
                nowDate = new Date();
                if(currentDate>=nowDate){
                    return true;
                }
                else{
                    return false;
                }
            }
            else{
                return false;
            }
        }
        else{
            
            return false;
        }
    }

    function isValid(contohTanggal){
        var tahun = contohTanggal/10000;
        var bulan = ((contohTanggal - contohTanggal%100)/100)%100;
        var hari = contohTanggal%100;
        
        if(bulan > 12 || hari > 31){
            return false;
        }
        else if(bulan==4 || bulan==6 || bulan==9 || bulan==11 ){
            return (tanggal<=30);
        }
        else if(bulan==2){
            return ((tanggal==29 && tahun%400==0) || (tanggal==29 && tahun%100!=0 && tahun%4!=0) || (tanggal<29)); 
        }

    }
    

</script>
</html>