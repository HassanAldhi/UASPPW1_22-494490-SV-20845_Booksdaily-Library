# Booksdaily Library
by Hassan Aldhi Wirawan

### Tujuan Website
Website ini memiliki tujuan untuk mempermudah pengguna mencari buku yang ingin dipinjam dari sebuah perpustakaan, pengguna dapat menelusuri berbagai jenis buku, melihat detail buku, sinopsis, rating, dan ulasan dari pembaca lain yang sudah pernah membaca buku tersebut.

### Kebutuhan klien dan permasalahan yang dicover
Seringkali orang menghabiskan waktu yang cukup lama hanya untuk mencari satu buku. Dengan ada nya website ini pengguna tidak perlu susah payah mencari buku secara manual yang pastinya memakan waktu yang cukup lama. Pencarian pun lebih fleksibel dan mudah, hanya perlu menelusuri buku yang ingin ia pinjam. Kemudian melakukan peminjaman, yang nantinya akan diberikan sebuah kode peminjaman ( fitur ini masih belum dikembangkan lebih lanjut ) lalu kode tersebut diberikan pengguna kepada pustakawan untuk ditukarkan dengan buku yang dipinjam. 

### 1. Desain rapi mengikuti kaidah atau prinsip desain
Desain rapi yang mengikuti kaidah atau prinsip desain melibatkan beberapa aspek penting yang dapat membuat tampilan website menjadi menarik, fungsional, dan mudah digunakan oleh pengguna.

![chrome-capture-2023-5-20](https://github.com/HassanAldhi/UASPPW1_22-494490-SV-20845_Booksdaily-Library/assets/59635754/6f829fa8-bc5d-4cb1-9e8f-9635ffb19615)

Menjaga konsistensi dalam tata letak, warna, jenis huruf (font), dan gaya elemen di seluruh halaman website. Menempatkan elemen didalam sebuah container akan membuat konten menjadi tertata dan memiliki konsistensi margin pada setiap elemennya
```html
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
                  ....
          <!-- kode lain -->
    </div>
```

Menetapkan jenis font, ukuran font, warna default dan juga warna background yang diterapkan pada seluruh halaman website. Pada kode css dibawah, font yang digunakan ialah Plus Jakarta Sans dengan color hitam dan background color halaman dengan kode #DFD9D5. Ukuran font sudah disusun berdasarkan tipografi yang dibutuhkan.
```css
*{
    color: black;
}
body{
    font-family: Plus Jakarta Sans, sans-serif;
    background-color: #DFD9D5;
}
.font24 {
    font-size: 24px;
}
.font20 {
    font-size: 20px;
}
.font16 {
    font-size: 16px;
}
.font14 {
    font-size: 14px;
}
```
### 2. Website responsive
Website responsive adalah kemampuan sebuah website untuk menyesuaikan tampilannya secara otomatis dengan berbagai perangkat dan ukuran layar yang digunakan oleh pengguna, termasuk mobile, tablet, dan laptop. Tujuan utama dari website responsive adalah memberikan pengalaman pengguna yang optimal tanpa mengorbankan kualitas tampilan atau fungsionalitas, terlepas dari perangkat yang digunakan.

Untuk mewujudkan website yang responsive, dapat menggunakan media queries atau menggunakan bootstrap grid. Menyesuaikan ukuran font, gambar, dan elemen-elemen lain agar sesuai dengan perangkat yang digunakan.
```css
@media screen and (max-width: 576px) {
    .hero-header{
        font-size: 40px;
        font-weight: 800;
        line-height: 130%;
        color: black;
    }

  @media screen and (max-width: 756px) {
    .sidebar {
      width: 100%;
      height: auto;
      position: relative;
    }
    .sidebar a {float: left;}
    div.content {margin-left: 0;}
    .qtext{
        font-size: 40px;
        line-height: 60px;
    }
    .quotes-text {
        float: right;
        width: 300px;
    }
}
}

```
Dari contoh potongan kode css diatas, selector class .hero-header akan merubah properties dari ukuran font, weight font, line height, dan warna font ketika ukuran layar dibawah 576px yang merupakan breakpoint dari device mobile. Lalu terdapat perubahan beberapa properties seperti ukuran font, position, dsb pada beberapa selector saat ukuran layar dibawah 756px yang merupakan breakpoint dari device tablet.

```html
<div class="col-lg-3 col-6">
     <button class="button-outline category-btn"><?php echo $row['nama_kategori']; ?></button>
</div>
```
col-lg-3 menunjukkan bahwa kolom tersebut akan memiliki lebar 3 kolom (dari total 12 kolom) pada layar berukuran large ( lebih dari sama dengan 992px ). col-6 menunjukkan bahwa kolom tersebut akan memiliki lebar 6 kolom pada semua ukuran layar yang lebih kecil dari large.

### 3. Direct feedback ke pengguna website
Direct Feedback ke pengguna website adalah konsep dimana sebuah website dapat memberikan tanggapan atau informasi secara langsung kepada pengguna terhadap tindakan atau interaksi yang mereka lakukan di dalam website. Tujuan dari direct feedback adalah memberikan pengalaman yang lebih interaktif, informatif, dan responsif kepada pengguna.

![image](https://github.com/HassanAldhi/UASPPW1_22-494490-SV-20845_Booksdaily-Library/assets/59635754/18a36df9-896d-4ffe-9ae0-ec9eccb1a934)

Contoh direct feedback yang diterapkan pada website ini adalah ketika pengguna melakukan login. Apabila terjadi kesalahan terhadap username atau password maka akan muncul pesan secara langsung kepada pengguna. 

```php
<?php 
require 'function.php';
if(isset($_POST["login"])){
    $username = $_POST["username"];
    $password = $_POST["password"];
  
    //mengambil baris data pada user yang memiliki username yang sama
    $result = mysqli_query($conn,"SELECT * FROM user WHERE
        username = '$username'");
    
  //cek apakah username ada
    if(mysqli_num_rows($result) === 1){
        $row = mysqli_fetch_assoc($result);
        //cek password
        if(password_verify($password, $row["password"])){
            $_SESSION["login"]=true;
            //pindah halaman ke dashboard
            header("Location: dashboard.php");
            exit;
        }
    }
    $error = true;
}
?>
```
Pada kode diatas, logikanya dalah ketika button login di klik dan mengirimkan data, username dan password disimpan dalam variabel. Kemudian langkah pertama adalah melakukan cek apakah username ada didalam database, jika ada cek apakah password sama dengan password yang ada didalam database. Jika benar maka akan diarahkan ke halaman dashboard lalu exit dari kode, jika salah maka variabel error menjadi true.

```php
<?php if(isset($error)): ?>
    <p style="font-size:14px; color:red;">username or password incorrect</p>    
<?php endif; ?>
```
Kemudian, didalam tag form melakukan cek apakah variabel error adalah true, jika iya akan muncul paragraf berwarna merah bertuliskan "username or password incorrect".

### 4. Konten dinamis dari database
Konten dinamis dari database mengacu pada kemampuan sebuah website untuk menampilkan konten yang diperoleh secara dinamis dari database. Dengan konten dinamis dari database, sebuah website dapat menjadi lebih interaktif, responsif, dan adaptif terhadap perubahan. Pengguna akan mendapatkan konten yang relevan dan terkini, sementara pemilik website dapat dengan mudah mengelola dan mengontrol konten sesuai dengan kebutuhan.

Dalam implementasinya, website dapat menggunakan bahasa pemrograman seperti PHP untuk membuat website menjadi dinamis. PHP menjadi penghubung antara database dan website.
```php
<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $database = "booksdaily";

    // Membuat koneksi
    $conn = mysqli_connect($servername, $username, $password, $database);

    if (!$conn){
        die("Connection failed: " . mysqli_connect_error());
    }
      
    // Mendapatkan id buku dari parameter URL
    $id_buku = $_GET['id'];
      
    // Query untuk mendapatkan informasi buku dengan id yang sesuai
    $buku = "SELECT * FROM informasi_buku WHERE id_buku = '$id_buku'";
      
    // Menjalankan query
    $data_buku = $conn->query($buku);

      // Memeriksa apakah query berhasil dieksekusi dan mengambil data buku
    if ($data_buku && $data_buku->num_rows > 0) {
        $row = $data_buku->fetch_assoc();
        // Menampilkan konten buku berdasarkan id yang sesuai
        echo $row['judul_buku'];
      
    } else {
        echo "Error: Book not found";
    }
?>
```
Pada kode php diatas, adalah sebuah proses mengambil data dari tabel buku berdasarkan id_buku. Langkah pertama ialah melakukan konfigurasi untuk mengakses database dengan menggunakan function mysqli_connect() yang terdapat 4 parameter yaitu servername, username, password, dan database yang dimana function tersebut disimpan kedalam variabel $conn. Kemudian $id_buku menampung id buku dari parameter URL. Lalu menjalankan query select dari informasi_buku sesuai dengan id_buku. Jika query berhasil dieksekusi, ambil data buku dan simpan kedalam variabel row. ( echo $row['judul_buku']; ) merupakan contoh mengambil data dari kolom judul_buku.
