<?php 
require 'conn.php';
// require 'function.php';

// if(isset($_POST["search"])){
//     $book = search($_POST["keyword"]);
// }
session_start();
if(!isset($_SESSION["login"])){
    header("Location: login.php");
    exit;
}

$sql = "SELECT username FROM user";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $username = $row["username"];
} else {
    echo "No username found.";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booksdaily - Discover</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="font.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/0d349f8e2e.js" crossorigin="anonymous"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="script.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-md navbar-light">
        <div class="py-3 container">
            <a class="navbar-brand mb-3" href="dashboard.php">
                <img src="images/logo.png" alt="Logo">
            </a>
            <button class="navbar-toggler mb-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <form action="" method="post" class="d-flex ms-auto">
                    <input type="search" name="keyword" class="flex-grow-1" placeholder="Search books here" aria-label="Search" style="width: 300px;" >
                    <button class="sm-button-black" name="search" type="submit" style="height: 44px;"><i class="fa fa-search" style="color: white;"></i></button>
                </form>
                <a class="text-decoration-none py-4 px-4 float-end">
                    <div class="dropdown">
                        <div class="rating d-flex align-items-center">
                            <img src="images/icons/user.svg" class="logo">
                            <span class="font16">Profile</span>
                            <div class="dropdown-profile text-decoration-none row-gap-4">
                                <a href="#">Settings</a>
                                <a href="logout.php">Logout</a>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
      </nav>    
    <div class="container mt-4">
        <div class="row">
            <div class="sidebar col-md-3 mb-4">               
                <a href="#home" class="active" onclick="highlightLink(event)">
                <div class="rating d-flex column align-items-center">
                    <img src="images/icons/discover.svg" class="logo">
                    <span class="font16">Discover</span>
                </div>
                </a>
                <a href="#" onclick="highlightLink(event)">
                    <div class="rating d-flex align-items-center">
                        <img src="images/icons/categories.svg" class="logo">
                        <span class="font16">Categories</span>
                    </div>
                </a>
                <a href="#" onclick="highlightLink(event)">
                    <div class="rating d-flex align-items-center">
                        <img src="images/icons/borrowing.svg" class="logo">
                        <span class="font16">My Borrowing</span>
                    </div>
                </a>
                <a href="#" onclick="highlightLink(event)">
                    <div class="rating d-flex align-items-center">
                        <img src="images/icons/fav.svg" class="logo">
                        <span class="font16">My Favourite</span>
                    </div>
                </a>             
            </div>
            <div class="col-md-9">
                <h2 class="bold mb-4">Top Rated</h2>
                <div class="row mb-3 row-gap-4">
                    <?php
                    include 'conn.php';
                    // Query untuk mengambil 4 data dengan nilai_rata tertinggi dari view informasi_buku
                    $query = "SELECT * FROM informasi_buku ORDER BY nilai DESC LIMIT 4";
                    
                    // Menjalankan query
                    $result = $conn->query($query);
                    
                    // Memeriksa apakah query berhasil dieksekusi
                    if ($result) {
                        // Mengambil data secara berbaris dari hasil query
                        while ($row = $result->fetch_assoc()) {
                            // Menampilkan data buku menggunakan kode HTML yang dimodifikasi
                            ?>
                                <div class="col-lg-3 col-md-6 col-6">
                                    <a href="preview.php?id=<?php echo $row['id_buku']; ?>" id="" class="text-decoration-none">
                                        <img src="<?php echo $row['url_gambar']; ?>" class="img-fluid">
                                        <div class="mt-2 gap-1">
                                            <h1 class="font20 bold"><?php echo $row['judul_buku']; ?></h1>
                                            <h4 class="font14 semibold grey"><?php echo $row['nama_penulis']; ?></h4>
                                            <h4 class="font14 light grey"><?php echo $row['kategori']; ?></h4>
                                            <div class="rating d-flex align-items-center">
                                                <img src="images/icons/sm-rate.png" alt="" class="logo">
                                                <span class="font14 semibold black"><?php echo $row['nilai']; ?></span>
                                            </div>                       
                                        </div> 
                                    </a>                        
                                </div>
                            <?php
                        }
                    } else {
                        echo "Error: " . $conn->error;
                    }
                    ?> 
                    </div>
                    <h2 class="bold mt-5 mb-4">All Books</h2>
                    <div class="row mb-3 row-gap-4">
                    <?php
                    include 'conn.php';
                    // Query untuk mengambil 4 data dengan nilai_rata tertinggi dari view informasi_buku
                    $query = "SELECT * FROM informasi_buku";
                    
                    // Menjalankan query
                    $result = $conn->query($query);
                    
                    // Memeriksa apakah query berhasil dieksekusi
                    if ($result) {
                        // Mengambil data secara berbaris dari hasil query
                        while ($row = $result->fetch_assoc()) {
                            // Menampilkan data buku menggunakan kode HTML yang dimodifikasi
                            ?>
                                <div class="col-lg-3 col-md-6 col-6">
                                    <a href="preview.php?id=<?php echo $row['id_buku']; ?>" id="" class="text-decoration-none">
                                        <img src="<?php echo $row['url_gambar']; ?>" class="img-fluid" >
                                        <div class="mt-2 gap-1">
                                            <h1 class="font20 bold"><?php echo $row['judul_buku']; ?></h1>
                                            <h4 class="font14 semibold grey"><?php echo $row['nama_penulis']; ?></h4>
                                            <h4 class="font14 light grey"><?php echo $row['kategori']; ?></h4>
                                            <div class="rating d-flex align-items-center">
                                                <img src="images/icons/sm-rate.png" alt="" class="logo">
                                                <span class="font14 semibold black"><?php echo $row['nilai']; ?></span>
                                            </div>                       
                                        </div> 
                                    </a>                        
                                </div>
                            <?php
                        }
                    } else {
                        echo "Error: " . $conn->error;
                    }
                    ?> 
                    </div>    
                </div>
            </div>  
        </div>   
    </div>
        
</body>
</html>
