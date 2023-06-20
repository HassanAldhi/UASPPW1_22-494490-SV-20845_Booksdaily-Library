<?php
session_start();

if(isset($_SESSION["login"])){
    header("Location: dashboard.php");
    exit;
}
require 'function.php';
if(isset($_POST["login"])){
    $username = $_POST["username"];
    $password = $_POST["password"];

    $result = mysqli_query($conn,"SELECT * FROM user WHERE
        username = '$username'");

    if(mysqli_num_rows($result) === 1){
        $row = mysqli_fetch_assoc($result);
        
        if(password_verify($password, $row["password"])){
            $_SESSION["login"]=true;
            
            header("Location: dashboard.php");
            exit;
        }
        
    }

    $error = true;
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booksdaily - Login</title>
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
                        <h1 class="mb-4 medium" style="font-size: 32px;">Login</h1>
                        <div class="form-data">
                            <?php if(isset($error)): ?>
                                <p style="font-size:14px; color:red;">username or password incorrect</p>    
                            <?php endif; ?>
                            <div class="forms-inputs mb-4"> 
                                <label class="mb-3 font16 black medium">Username</label><br> 
                                <input type="text" placeholder="Username" name="username" id="username">
                            </div>
                            <div class="forms-inputs mb-4"> 
                                <label class="mb-3 font16 black medium">Password</label><br> 
                                <input type="password" placeholder="Password" name="password" id="password">
                                <!-- <div class="invalid-feedback">Password must be 8 character!</div> -->
                            </div>
                            <button type="submit" name="login" class="sm-button-black" style="width: 100%;" href="?username=<?php echo $username; ?>">Login</button>
                            <p align="center" class="mt-5">Dont have account ? <a href="signup.php">Create Account</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    
</body>
</html>