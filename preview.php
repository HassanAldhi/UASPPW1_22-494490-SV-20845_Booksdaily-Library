<?php
      include 'conn.php';
      
      // Mendapatkan id buku dari parameter URL
      $id_buku = $_GET['id'];
      
      // Query untuk mendapatkan informasi buku dengan id yang sesuai
      $buku = "SELECT * FROM informasi_buku WHERE id_buku = '$id_buku'";
      $ul = "SELECT u.* , a.nama_anggota FROM ulasan u JOIN anggota a 
             ON u.id_anggota = a.id_anggota WHERE id_buku = '$id_buku'";
      
      // Menjalankan query
      $data_buku = $conn->query($buku);
      $ulasan = $conn->query($ul);
      
      // Memeriksa apakah query berhasil dieksekusi dan mengambil data buku
      if ($data_buku && $data_buku->num_rows > 0) {
          $row = $data_buku->fetch_assoc();

          // Menampilkan konten buku berdasarkan id yang sesuai
          // Anda dapat mengakses data buku menggunakan $row['nama_kolom']
        } else {
            echo "Error: Book not found";
        }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $row['judul_buku']; ?> - Booksdaily</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="font.css">
    <link rel="stylesheet" href="fontawesome/css/all.css">
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="script.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-md navbar-light">
        <div class="py-3 container">
            <a class="navbar-brand mb-3" href="#">
                <img src="images/logo.png" alt="Logo">
            </a>
            <button class="navbar-toggler mb-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <form class="d-flex ms-auto">
                    <input type="search" class="flex-grow-1" placeholder="Search books here" aria-label="Search" style="width: 300px;">
                    <button class="sm-button-black" type="submit" style="height: 44px;"><i class="fa fa-search" style="color: white;"></i></button>
                </form>
            </div>
        </div>
      </nav>    
          <div class="container">
              <div class="row my-4">
                  <div class="col-md-4 px-4">
                      <img src="<?php echo $row['url_gambar']; ?>" class="img-fluid mb-4" style="width: 100%;">
                      <div class="rating d-flex align-items-center mb-4" width="80%">
                          <img src="images/icons/stock.svg" alt="" class="logo">
                          <span class="font16 semibold black">Stock : <?php echo $row['stok']; ?></span>
                      </div>
                        <button class="button-black mb-2 font16"style="width: 100%;">Borrow</button>
                        <button class="button-light mb-4 font16" style="width: 100%;">Add to Favourite</button>
                        
                    </div>
                  <div class="col-md-8 px-4">
                      <h2 class="black bold mb-3" style="font-size: 32px;"><?php echo $row['judul_buku']; ?></h2>
                      <div class="col-sm-12 mb-3">
                          <div class="mb-4 d-flex align-items-center flex-wrap mb-1 column-gap-4 row-gap-2">
                              <div class="rating d-flex align-items-center">
                                  <img src="images/icons/xl-rate.png" alt="" class="logo">
                                  <span class="font20 semibold black"><?php echo $row['nilai']; ?></span>
                              </div>
                              <span class="font20 regular grey"><?php echo $row['tahun_penerbitan']; ?></span>
                              <span class="font20 reguler grey"><?php echo $row['kategori']; ?></span>
                              <span class="font20 semibold grey">by&nbsp; <?php echo $row['nama_penulis']; ?></span>
                          </div>
                      </div>
                      <hr width="100%" size="0.5px" color="grey">
                      <p class="font16 reguler body py-3 mb-3"><?php echo $row['sinopsis']; ?></p>
                      <div>


                        <?php
                            $ul = "SELECT u.*, a.nama_anggota FROM ulasan u JOIN anggota a ON u.id_anggota = a.id_anggota WHERE id_buku = '$id_buku'";
                            $ulasan = $conn->query($ul);

                            if ($ulasan && $ulasan->num_rows > 0) {
                                ?>
                                <h2 class="black font24 bold mb-4">Reviews</h2>
                                <?php
                                while ($row2 = $ulasan->fetch_assoc()) {
                                    ?>
                                    <div class="reviews mb-4 mt-2">
                                        <h5 class="font20 medium"><?php echo $row2['nama_anggota']; ?></h5>
                                        <span class="font16 reguler body">
                                            <?php echo $row2['ulasan']; ?>
                                        </span>
                                        <div class="rating d-flex align-items-center mt-2">
                                            <img src="images/icons/sm-rate.png" alt="" class="logo">
                                            <span class="font16 semibold black"><?php echo $row2['nilai']; ?></span>
                                        </div>
                                    </div>
                                    <?php
                                }
                            } else {
                                echo "No reviews available.";
                            }
                        ?>
                      </div>
                  </div>
              </div>
          </div> 
</body>
</html>