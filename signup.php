<?php 
session_start();

if(isset($_SESSION["login"])){
    header("Location: dashboard.php");
    exit;
}
require 'function.php';
if(isset($_POST["register"])){
    if(registrasi($_POST)>0){
        echo "<script>
            alert('Your account successfully created !');
        </script>";
    } else {
        echo mysqli_error($conn);
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booksdaily - Sign Up</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="font.css">
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="loginbg">
        <nav class="navbar navlog justify-content-between px-5">
            <div class="py-3 container">
                <a class="navbar-brand" href="index.php">
                    <img src="images/logo-2.png">
                    </a>
                    <div class="nav" id="menu-light">
                        <a class="nav-item nav-link" href="#">Home</a>
                        <a class="nav-item nav-link" href="#">Books</a>
                        <a class="nav-item nav-link" href="#">Categories</a>
                        <a class="nav-item nav-link" href="#">Contact Us</a>
                    </div>
            </div>
        </nav>
        <div class="container mt-5">
            <div class="row d-flex justify-content-center">
                <div class="col-md-5">
                    <form method="post" class="card" id="form1">
                        <h1 class="mb-4 medium" style="font-size: 32px;">Sign Up</h1>
                        <div class="form-data">
                            <div class="forms-inputs mb-4"> 
                                <label class="mb-3 font16 black medium">Username</label><br> 
                                <input type="text" name="username" id="username" placeholder="Username">
                            </div>
                            <div class="forms-inputs mb-4"> 
                                <label class="mb-3 font16 black medium">Password</label><br> 
                                <input type="password" name="password" id="password" placeholder="Password">
                            </div>
                            <div class="forms-inputs mb-4"> 
                                <label class="mb-3 font16 black medium">Confirm Password</label><br> 
                                <input type="password" name="password2" id="password2" placeholder="Confirm Password">
                            </div>
                            <button type="submit" name="register" class="sm-button-black" style="width: 100%;">Register</button>
                            <p align="center" class="mt-5">have an account ? <a href="login.php">Login</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    
</body>
</html>