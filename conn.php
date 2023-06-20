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
?>
