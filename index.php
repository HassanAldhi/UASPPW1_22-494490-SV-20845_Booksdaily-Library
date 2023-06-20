<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booksdaily</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="font.css">
    <script src="script.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg justify-content-between">
        <div class=" container">
            <a class="navbar-brand py-4" style="margin-right: 17%;" href="index.php">
                <img src="images/logo.png">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav" id="menu">
                        <a class="nav-item nav-link active" href="#">Home</a>
                        <a class="nav-item nav-link" href="#">Books</a>
                        <a class="nav-item nav-link" href="#">Categories</a>
                        <a class="nav-item nav-link" href="#">Contact Us</a>
                    </div>
                </div>
                <div class="gap-3 float-end py-3" id="account">
                    <a class="sm-button-light" style="margin-right: 10px;" href="login.php">Login</a>
                    <a class="sm-button-black" href="signup.php">Sign Up</a>
                </div>
        </div>
    </nav>
    <div class="container">
        <div class="row hero-bg img-fluid">
            <div class="col-md-6 col-lg-4 mt-5">
                <h1 class="hero-header">To Succeed You Must Read</h1>
                <p>Not sure what to read next? Explore our library catalog</p>
                <button class="button-black">Explore Now</button>
            </div>
        </div>
        <div class="row mt-5">
        <?php
        include 'conn.php';
        // Query untuk mengambil 4 data dengan nilai_rata tertinggi dari view informasi_buku
        $query = "SELECT * FROM informasi_buku LIMIT 4";
        
        // Menjalankan query
        $result = $conn->query($query);
        
        // Memeriksa apakah query berhasil dieksekusi
        if ($result) {
            // Mengambil data secara berbaris dari hasil query
            while ($row = $result->fetch_assoc()) {
                // Menampilkan data buku menggunakan kode HTML yang dimodifikasi
                ?>
                <div class="col-lg-3 col-6 mb-4">
                    <a href="preview.php?id=<?php echo $row['id_buku']; ?>" id="" class="text-decoration-none">
                        <img src="<?php echo $row['url_gambar']; ?>" class="img-fluid">
                        <div class="mt-3 gap-1">
                            <h1 class="font24 bold"><?php echo $row['judul_buku']; ?></h1>
                            <h4 class="font16 semibold grey mt-3"><?php echo $row['nama_penulis']; ?></h4>
                            <h4 class="font16 light grey mt-2"><?php echo $row['kategori']; ?></h4>
                            <div class="rating d-flex align-items-center">
                                <img src="images/icons/sm-rate.png" alt="" class="logo">
                                <span class="font16 semibold black"><?php echo $row['nilai']; ?></span>
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

        <div class="text-center mt-5">
            <a href="dashboard.php"><button class="button-black">More Books</button></a>
        </div>
    </div>
    <div class="quotes">
        <div class="container">
            <div class="md quotes-text" style="margin-top: 150px;">
                <h1  class="regular qtext">
                “ <b>Think</b> Before You Speak, <b>Read</b> Before You Think “
                </h1>
                <div class="d-flex gap-3">
                    <hr width="24px" size="2" color="grey">
                    <h5 class="font20 grey medium" style="font-style: italic;">Fran Lebowitz</h5>
                </div>
            </div>
        </div>  
    </div>

    <div style="background-color: black;">
        <div class="container py-5" >
            <div class="mt-5 mb-5 d-flex justify-content-end">
                <div>
                    <h1 class="bold" style="font-size: 48px; color: white;" align="right">Categories</h1>
                    <p style="color: white;" align="right">Discover a World of Stories: Our Book Categories</p>
            
                </div>
            </div>
            
            <div class="row mb-3">
            <?php
                $query = "SELECT nama_kategori FROM kategori";
        
                // Menjalankan query
                $result = $conn->query($query);
                
                // Memeriksa apakah query berhasil dieksekusi
                if ($result) {
                    // Mengambil data secara berbaris dari hasil query
                    while ($row = $result->fetch_assoc()) {
                        // Menampilkan data buku menggunakan kode HTML yang dimodifikasi
                        ?>
                            <div class="col-lg-3 col-6">
                                <button class="button-outline category-btn"><?php echo $row['nama_kategori']; ?></button>
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

    <div class="container py-5">
        <div class="py-3">
            <h1 class="bold" style="font-size: 48px;">Contact Us</h1>
            <p>If you would like to send a direct message, please use the contact form below.</p>
        </div>
        <div class="row">
            <div class="col-md-6">
                    <div>
                        <form action="#" method="post" class="d-flex flex-column w-100">
                            <input type="text" id="name" class="form-classic" placeholder="Name" required><br>
                            <input type="text" id="email"  class="form-classic" placeholder="Email" required><br>
                            <textarea type="textarea" id="message"  class="form-classic" rows="4" placeholder="Writing Your Message Here..."></textarea><br>
                            <input id="myBtn" class="sm-button-black" type="button" value="Send">
                            <div id="myModal" class="modal">
                                <div class="modal-content">
                                    <span class="close mb-3">&times;</span>
                                    <p>Are you sure want to send the massage ?</p>
                                    <input type="submit" class="sm-button-black" id="submit" value="Yes">
                                </div>
                            </div>
                        </form>
                    </div>
            </div>
            <div class="col-md-6">
                <img src="images/tele.png" class="img-fluid" alt="">
            </div>
        </div>

    </div>

    <footer class="py-5" style="background-color: black ;">
        <div class="container">
            <div class="row align-items-center text-md-start text-center">
                <div class="col-md-6">
                    <a href="index.php"><img src="images/logo-2.png"></a>
                </div>
            <div class="col-md-6 text-md-end text-center mt-4 mt-md-0" id="footer">
                <a  href="#" class="me-5">Newsletter</a>
                <a  href="#" class="me-5">Privacy Policy</a>
                <a  href="#">FAQs</a>
            </div>
            </div>
        </div>
    </footer>

    
    <script src="script.js"></script>
</body>
</html>