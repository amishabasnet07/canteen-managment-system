<?php

include 'config.php';

session_start();
$message = [];

$admin_id = $_SESSION['admin_id'];

if(!isset($admin_id)){
   header('location:login.php');
}

$error = [];
$category_title = '';

if(isset($_POST['btnSubmit']))
{ 
   if(requireValidation($_POST,'category_title'))
      {
         $category_title = $_POST['category_title'];
      }
      else
      {
         $error['category_title'] = 'Enter category title';
      }

  if(count($error) == 0)
  {
   $category_sql = "SELECT * FROM category_tbl where category_title = '$category_title' ";
   $category_select = mysqli_query($conn,$category_sql);
   if(mysqli_num_rows($category_select)>0)
   {
      $message[] = "Category were already added.";
   }
   else{
      $category_sql = "INSERT INTO category_tbl(category_title)VALUES('$category_title')";
      $result = mysqli_query($conn,$category_sql);
      if($result)
      {
         $message[] = "Category added successfully.";
      }
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
   <title>category</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom admin css file link  -->
   <link rel="stylesheet" href="css/admin_style.css?v=<?php echo time();?>">

</head>
<body>
   
<?php include 'admin_header.php'; ?> 

<section class="category">

   <h1 class="title">Categories</h1>
   <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
      <div class="inputBox">
         <input type="text" name="category_title" placeholder="Category" /> 
         <?php echo displayError($error,'category_title');?>
      </div>
      <div class="btnSubmit">
         <input type="submit" name="btnSubmit">
      </div>
   </form>
   

</section>




<section class="category_data">
   
   <div class="data">
      <div >
            <h2 align="center">Categories List</h2>
      </div>
      <div id="table">
         <fieldset>
         <div class="scroll-bg">
         <div class="scroll-div">
         <div class="scroll-object">
         
            <table>
               <tr>
                  <th>S.N.</th>
                  <th>Category</th>
                  <th>Action</th>
               </tr>
               <?php 
               $category_datas = [];
               $category_sql = "SELECT * FROM category_tbl";
               $category_select = mysqli_query($conn,$category_sql);
               if(mysqli_num_rows($category_select)>0)
               {

                  while($row = mysqli_fetch_assoc($category_select))
                  {
                     array_push($category_datas,$row);
                  }
                }


                foreach($category_datas as $key => $category_data)
                {
                  ?>
                     <tr>
                        <td>
                           <?php echo $key+1 ?>
                        </td>
                        <td>
                           <?php echo $category_data['category_title'] ?>
                        </td>

                        <td>
                           <a class = "action" href="update.php?id=<?php echo $route['Route_id']?>">Update</a>
                           <a class = "delete" href="delete.php?id=<?php echo $route['Route_id']?>" onclick="return confirm('Are you sure to delete?')">Delete</a>
                        </td>
                     </tr>
                     </tr>
                  <?php
                }
                ?> 
            </table>
         
         </div>
         </div>
         </div>
      </fieldset>
      </div>
     </div>
</section>





<!-- custom admin js file link  -->
<script src="js/admin_script.js"></script>

</body>
</html>