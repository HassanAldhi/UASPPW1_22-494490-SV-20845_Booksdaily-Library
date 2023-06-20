<?php 
    include 'conn.php';
    function registrasi($data){
        global $conn;
    
        $username = strtolower(stripslashes($data["username"]));
        $password = mysqli_real_escape_string($conn, $data["password"]);
        $password2 = mysqli_real_escape_string($conn, $data["password2"]);
        
        $result = mysqli_query($conn, "SELECT username FROM user WHERE
            username = '$username'");

        if(mysqli_fetch_assoc($result)) {
            echo "<script>
                alert('username not available')
            </script>";
            return false;
        }       

        // CEK KONFIRMASI PASSWORD   
        if($password !== $password2){
            echo "<script>
                alert(\"Password doesn't match\"); 
            </script>";
            return false;
        }
        // enskripsi
        $password = password_hash($password, PASSWORD_DEFAULT);
    
        mysqli_query($conn, "INSERT INTO user VALUES('', '$username', '$password')");
        return mysqli_affected_rows($conn); 
    }   
    
    // function query($query){
    //     global $conn;
    //     $result = mysqli_query($conn, $query);
    //     $rows = [];
    //     while($row = mysqli_fetch_assoc($result)){
    //         $rows[] = $row;
    //     }
    //     return $rows;
    // }

    // function search($keyword){
    //     $query = "SELECT * FROM informasi_bukuWHERE judul_buku = '$keyword'";

    //     return query($query);
    // }
?>
