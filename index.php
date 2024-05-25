
<?php
session_start();
if(isset($_SESSION['username'])){
   header("Location: template.php");
   exit();
}
?>

<!DOCTYPE html>
<html lang="it">
<link href="style.css" rel="stylesheet">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="style.css">
   <title>Login & Registration</title>
</head>

<body>
   <div class="benvenuto">
      <h1>SoloSport</h1>
   </div>
   
   <div class="container">
      <form action="register.php" method="POST" class="form" id="registerForm" style="border-radius: 10px 10px 0px 0px;">
      <h2>Register</h2>
      <label for="email">Email:</label>
      <input type="email" name="email" required>
      <label for="username">Username:</label>
      <input type="text" name="username" required>
      <label for="password">Password:</label>
      <input type="password" name="password" required>
      <label for="Citta'">Città:</label>
      <input type="text" name="Citta'" required>
      <label for="Via">Via:</label>
      <input type="text" name="Via" required>
      <label for="NumeroCivico">Numero civico:</label>
      <input type="text" name="NumeroCivico" required><br>
      <button  type="submit">Register</button>
      </form>

      <form action="login.php" method="POST" class="form" id="loginForm" style="border-radius:0px 0px 10px 10px ;">
         <h2>Login</h2>
         <label for="email">Email:</label>
         <input type="email" name="email" required>
         <label for="username">Username:</label>
         <input type="text" name="username" required>
         <label for="password">Password:</label>
         <input type="password" name="password" required>
         <button  type="submit">Login</button>
         
      </form>
      
   </div>
   
</body>

</html>