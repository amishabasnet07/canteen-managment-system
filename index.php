<?php

include 'config.php';
session_start();

$error = [];
$email = $password = '';

if(isset($_POST['submit'])){
   //validate email
         if(requireValidation($_POST,'email'))
         {
            $email = mysqli_real_escape_string($conn, $_POST['email']);
         }
         else
         {
            $error['email'] = 'Enter email';
         }
   //validate password
         if(requireValidation($_POST,'password'))
         {
            $pass = mysqli_real_escape_string($conn, md5($_POST['password']));
         }
         else
         {
            $error['password'] = 'Enter password';
         }

   
   
if(count($error) == 0)
{
   //users
   $select_users = mysqli_query($conn, "SELECT * FROM `users` WHERE email = '$email' AND password = '$pass'") or die('query failed');

   if(mysqli_num_rows($select_users) > 0){

      $row = mysqli_fetch_assoc($select_users);
         $_SESSION['user_name'] = $row['name'];
         $_SESSION['user_email'] = $row['email'];
         $_SESSION['user_id'] = $row['id'];
         header('location:home.php');

   }else{
      $message[] = 'incorrect email or password!';
   }

   //admin
   $select_admins = mysqli_query($conn, "SELECT * FROM `admin_tbl` WHERE email = '$email' AND password = '$pass'") or die('query failed');

   if(mysqli_num_rows($select_admins) > 0){

      $row = mysqli_fetch_assoc($select_admins);
         $_SESSION['admin_name'] = $row['name'];
         $_SESSION['admin_email'] = $row['email'];
         $_SESSION['admin_id'] = $row['id'];
         header('location:admin_page.php');

   }else{
      $message[] = 'incorrect email or password!';
   }

}
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>login</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>

<?php
if(isset($message)){
   foreach($message as $message){
      echo '
      <div class="message">
         <span>'.$message.'</span>
         <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
      ';
   }
}
?>
   
<div class="form-container">

   <form action="" method="post">
      <h3>login now</h3>
      <input type="email" name="email" placeholder="enter your email" class="box"value="<?php echo $email?>">
            <?php echo "<p class = 'error'>" .displayError($error,'email'). "</p  >";?>
      <input type="password" name="password" placeholder="enter your password" class="box" >
            <?php echo "<p class = 'error'>" .displayError($error,'password'). "</p  >";?>
      <input type="submit" name="submit" value="login now" class="btn">
      <p>don't have an account? <a href="register.php">register now</a></p>
   </form>

</div>

</body>
</html>