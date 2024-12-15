<?php

include 'config.php';
include 'function/cosine_similarity.php';
session_start();

$user_id = $_SESSION['user_id']; 

if(!isset($user_id)){
   header('location:login.php');
}
//data from database
            $items = [];
            $cosineSimilaritys = [];

            if(isset($_GET['category_id']))
            {
                $category_id = $_GET['category_id'];
                $result = mysqli_query($conn, "SELECT * FROM additem WHERE category_id = $category_id");
            }
            else
                $result = mysqli_query($conn, "SELECT * FROM `additem`");
                        
            if(mysqli_num_rows($result)>0)
            {
                while($row = mysqli_fetch_assoc($result))
                {
                    array_push($items,$row);
                }
            }
            else{
               echo '<p class="empty">no products added yet!</p>';
            } 


            $compare_data = [];
            $select = "SELECT * FROM compare_tbl";
            $result = mysqli_query($conn,$select);
                        
            if(mysqli_num_rows($result)>0)
            {
                while($row = mysqli_fetch_assoc($result))
                {
                    array_push($compare_data,$row);
                }
            }
            $items_after_remove_zero = [];
  
    if(isset($_POST['btnCompare']))
    {
        // Retrieve documents from the form
        $document1 = $_POST['document1'];

        //default keywords
        $keyword = 'highcalorie,highfat,highsodium,calorie,fat,sodium,flavour,lays,potatochips,chips,chip,potato,vegetableoil,happy,excitement,stress,craving,salty,salt,celebration,snacks,fiber,sugar,protein,happy,sweet,chocolate,coffee,tiger,biscuits,biscuit,tigerbiscuit,milk,butter,lactose,craving,m&m,m&ms,carbohydrates,salt,corn,hunger,craving,happy,celebration,movie,night,stress,Calories,fat,carbohydrates,fibre,sodium,protein,salt,taste,hunger,craving,SeaSalt,sweet,chili,spicy,cheesy,snacks,snack,popcorn,popcorner,Calories,fat,carbohydrates,fibre,sodium,protein,salt,strength,stamina,satisfaction,stress,fatigue,taste,enjoyment,nutrient,calorie,chocolate,fruit,nut,chocolate,coffee,caramel,celebration,lunabar,energybar,bar,snacksEnergy, protein, carbohydrates, sodium, calories,Wheat, noodles, chicken, flavoring,Savory, Salty,Comfort, Satisfaction,Instant Chicken Noodles, Savory, Comfort Food, Salty, Quick Meal, Instant Noodles,current,currentnoodles, noodle,snacks,snack,Energy, carbohydrates, sodium, calories,Wheat noodles,Spicy, Savory,Excitement, Quick Meal,maggiNoodles, SpicyMasala, Quick Meal, Exciting, InstantNoodles,maggi,seasoning,Spicy, Savory,Adventure, Boldness,2X Spicy Noodles, Extra Spicy, Adventure, Savory, Instant Noodles,current,noodle,snacks,snack,protein, carbohydrates, sodium, calories,Korean,ramen,noodles, traditionalseasoning,Umami, Spicy,CulturalExperience, spicy,Satisfaction, Umami, Spicy, Cultural, Satisfying,noodle,snacks,snack,Energy, protein, carbohydrates, sodium, calories,Instant noodles, chicken pizza flavoring,Savory,Curiosity, Indulgence,Noodles, Savory, Curiosity, Indulgent, Instant,Mangoflavored,Sweet, Fruity,Happiness, Nostalgia,Kaccha, Mango , Sweet, Fruity, Happy,happiness,Joy, surprise, KinderJoy,caramelcandies, Sweet, Creamy ,happy ,Pleasure, Indulgence,Eclairs, Candy,AmericanoCoffee, Bitter, Coffee, Wakefulness, Alertness,Energy, carbohydrates, fat, sodium, calories,Cheeseflavored,snack,balls,Cheesy, Crunch,Snack Craving, Satisfaction,Snacks,snack,Classic,salted,crackers,Salty,Crispy,SnackTime, Simplicity,Biscuits,snacks,snack,Coconut-flavored biscuits,Sweet, Coconut,Tropical Delight, Relaxation,Biscuit,snacks,Delight, Nostalgia,Biscuits ,Lovers, Treat,Energy, carbohydrates, sugar,Chocolate,cream,Sweet, Delight, Nostalgia, EspressoCoffee, Intense, Coffee, Quick,Energy,Boost,drink,hot,beverage, Cappuccino, Creamy, Coffee, Comfort, Relaxation,Latte , Mild,  Contentment,Black,Tea, Bitter, Astringent, Alertness, Calm,Green,Tea, Earthy, Bitter, Refreshment, Health,conscious,Milk,Tea, Sweet, Creamy, Coziness, Indulgence,drink,hot,Lemon,Tea, Sour, Refreshing, Rejuvenation, Invigoration,Milk, Nutrient,rich, Calcium, Protein, Versatile,Milkshake, Creamy, Sweet, Indulgence, Dessert,Fanta, Sweet, Fruity, Refreshing, Happiness, SoftDrink,drink,cold,beverage,happy,Yogurt, Creamy, Tangy, Versatile, Dairy Product,real,Mixed,Fruits, Sweet, Tangy, Symphony, Happiness,happy,fruit, Juice,drink,,Mango,Frooti,Juice, Pure, Delicious, Joy, Juice, Soothing, Fruity ,Pepsi, Sweet, Bitter, Enjoyment, Soda,MountainDew,Mountain,Dew, Citrus, Energizing, Excitement, Hamburger, Beef, Calories, Salty, FrenchFries, Potatoes,street ,food,fastfoods,fastfood,fries,ItalianCuisine, Pizza, Cheese, Savory, Happy,street,food,fastfoods,Hotdogs, Sausage, Savory, momo,Happy,street,food,fastfoods,fastfood,chicken, Meat, Samosas,Biryani, Spicy, Aromatic, Samosa Chaat, Tangy,buff,ChineseCuisine, Chow Mein, Chicken,Chow Mein, Buffalo, ,buff,Vegetarian, Chow Mein, cake, Blackforest, ChocoPie, vanilla';

        //tokenize the comma text into indiviuals words
        $keywords = explode(',',strtolower($keyword));

        
            // echo '<br/><br/>data from database';
            // print_r($items);  


        //tokenize the comma text into indiviuals words
        foreach($items as $key => $item) {
            $items_keywords = explode(',',strtolower($item['itemKeywords']));
            $itemId = $item['itemId'];

            $item_keywords_trim = [];
            foreach($items_keywords as $w)
            {
                $ftext = preg_replace("/[^a-zA-Z0-9\s]/", "", trim($w));
                array_push($item_keywords_trim,$ftext);

            }

            // echo '<br/> items_keywords  from database  '; 
            // print_r($item_keywords_trim);
     
            // Preprocess the text
            $preprocessedText = preprocess($document1);
            // echo "<br/><pre> preprocessedText from user   ";
            // print_r($preprocessedText);

            // echo "<br/><pre> keywords (default keywords) ";
            // print_r($keywords);

            //compare two array values and find there intersect(similar word in array)
            $words = array_intersect($preprocessedText, $keywords);
            
            // echo "<br/><pre> words after comparing user and default keywords  ";
            // print_r($words);

            // Compute term frequency (TF) vectors
            $tfVector1 = computeTF($words);
            $tfVector2 = computeTF($item_keywords_trim);

            // print_r($tfVector1);
            // print_r($tfVector2);

            // Compute cosine similarity
            $cosineSimilarity = computeCosineSimilarity($tfVector1, $tfVector2);
            $cosineSimilaritys = array_push_assoc($cosineSimilaritys, $itemId, $cosineSimilarity);

            // echo '<br/> <br/> cosineSimilaritys   <br/>';
            
            // print_r($cosineSimilaritys);

            // echo ' <br/> end of loop <br/>   <br/><br/>   <br/>  <br/>';
            
        }
        // print_r($cosineSimilaritys);
        arsort($cosineSimilaritys);
        // print_r($cosineSimilaritys);

        $items_after_sort = [];
        

        //removing zero value from cosine similarity calculation 
        foreach($cosineSimilaritys as $key => $value)
        {
            $id = $key;
            $value = $value;


            // echo ' <br/> id    ' . $id;

            // echo ' <br/> value    ' . $value;

            if($value != 0)
            {
                $items_after_remove_zero = array_push_assoc($items_after_remove_zero, $id, $value);
            }        
        }
        // print_r($items_after_remove_zero);
        // echo '<pre>';
        // print_r($compare_data);
        // echo '</pre>';

        //storing items into compare table
        foreach($items_after_remove_zero as $key => $value)
        {
            $id = $key;

            if($compare_data != null)
            {
                //  
            }
            else
            {
                $category_id = [];
                $select = "SELECT * FROM additem WHERE itemId = $id";
                $result = mysqli_query($conn,$select);
                            
                if(mysqli_num_rows($result)>0)
                {
                    while($row = mysqli_fetch_assoc($result))
                    {
                        array_push($category_id,$row);
                        $category_id = $row['category_id'];
                        $check_cart_numbers = mysqli_query($conn, "INSERT INTO  `compare_tbl`(item_id,category_id)VALUES('$id','$category_id')") or die('query failed');
                    }
                }
                
            }
            
        }   

    }



    $data = [];
    if($items_after_remove_zero==null)
    {

        if(isset($_GET['category_id']))
        {
            $category_id = $_GET['category_id'];
            $compare_data = mysqli_query($conn, "SELECT * FROM `compare_tbl` WHERE category_id = $category_id");
        }
        else
            $compare_data = mysqli_query($conn, "SELECT * FROM `compare_tbl`");
        if(mysqli_num_rows($compare_data)>0)
        {
            while($row = mysqli_fetch_assoc($compare_data)){
                array_push($data, $row); 
            }
        }
    }

if(isset($_POST['add_to_cart'])){

   $itemId = $_POST['itemId'];
   $itemName = $_POST['itemName'];
   $image = $_POST['image'];
   $salePrice = $_POST['salePrice'];
   $quantity = $_POST['quantity'];

   $check_cart_numbers = mysqli_query($conn, "SELECT * FROM `cart` WHERE name = '$itemName' AND user_id = '$user_id'") or die('query failed');

   if(mysqli_num_rows($check_cart_numbers) > 0){
      $message[] = 'already added to cart!';
   }else{
      mysqli_query($conn, "INSERT INTO `cart`(itemId,user_id, name, price, quantity, image) VALUES('$itemId','$user_id', '$itemName', '$salePrice', '$quantity', '$image')") or die('query failed');
      $message[] = 'product added to cart!';
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>home</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css?v=<?php echo time();?>">

</head>
<body>
   
<?php include 'header.php'; ?>

<section class="home">

   <div class="content">
      <h3>Custom Selected food items Arriving At Your table</h3>
      <p>Simplify your food items shopping with our online system that lets you explore, choose, and receive food items from the comfort of your table.</p>
   </div>

</section>

<section id="popup_section">
   <div class="popup" id="popup">
        <button id="close">&times;</button>
        <form method="post" action="<?php echo $_SERVER['PHP_SELF'] ?> ">
            <div>
                <label for="document1" id="inputfromuser">Item description</label>
            </div>
            
            <div>
                <textarea id="document1" name="document1" placeholder="Please input Item Description !!!" id = "textarea"></textarea><br>
            </div>
            <input type="submit" value="Click Me" name="btnCompare" id="btn" >

        </form>

    </div>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/popup.js"></script>
</section>

<div class="category">

    <div class="menu-bar">
        <ul class="ul">
            <li class="active">
                <a href="#">Category</a>
                <div class="sub-menu-bar">
                    <ul>

                        <?php 
                          $category_sql = "SELECT * FROM category_tbl"; 
                          $category_result = mysqli_query($conn,$category_sql);
                          while($row = mysqli_fetch_assoc($category_result))
                          {
                             $category_title  = $row['category_title'];
                             $category_id = $row['category_id'];
                             echo "<li><a href='home.php?category_id=$category_id'>$category_title</a> </li>";
                          }
                       ?>


                         <!-- <li class="hover-me">
                            <a href="#">Drinks</a>
                            <div class="sub-menu-bar-1">
                                <ul>
                                    <li>
                                        <a href="#">hhhh</a>
                                    </li>
                                    <li>
                                        <a href="#">hhhh</a>
                                    </li>
                                     
                                </ul>
                            </div>
                        </li> -->
                         <!-- <li class="hover-me">
                            <a href="#">Food</a>
                            <div class="sub-menu-bar-1">
                                <ul>
                                    <li>
                                        <a href="#">sdfsf</a>
                                    </li>
                                    <li>
                                        <a href="#">sdfsdf</a>
                                    </li>
                                     
                                </ul>
                            </div>
                        </li> -->
                    </ul>
                </div>
            </li>
        </ul>
    </div>

</div>

<section class="items_div">
   
            
         <?php  
               if(isset($items_after_remove_zero) != 0 && $items_after_remove_zero != null)
                {?>
                <h1 class="title">Items for You1</h1>
                    <div class="box-container">
                        <?php
                    foreach($items_after_remove_zero as $key => $value)
                    {
                        $id = $key;
                        foreach($items as $key => $item)
                        {
                            if($id == $item['itemId'])
                            { ?>
                               
                              <form action="" method="post" id="items">
                                <div id="" class="item">
                                    <div class="front">
                                        <div class="price">
                                            RS.<?php echo $item['salePrice']; ?>/- 
                                        </div>
                                        <div class="front-img">
                                            <img src="uploaded_img/<?php echo $item['image']; ?>"/>
                                        </div>
                                        <div>
                                            <h3><?php echo $item['itemName'] ?></h3>
                                        </div>
                                    </div>
                                    <div class="back">
                                        <h3><?php echo $item['itemName'] ?></h3>
                                        <div class="back-img">
                                            <img src="uploaded_img/<?php echo $item['image']; ?>"/>
                                        </div>
                                        <div class="desc">
                                            <p>
                                                <?php echo $item['itemDesc'] ?>
                                            </p>
                                        </div>


                                          <input type="number" min="1" name="quantity" value="1" class="qty">
                                          <input type="hidden" name="itemId" value="<?php echo $item['itemId']; ?>">
                                          <input type="hidden" name="itemName" value="<?php echo $item['itemName']; ?>">
                                          <input type="hidden" name="salePrice" value="<?php echo $item['salePrice']; ?>">
                                          <input type="hidden" name="image" value="<?php echo $item['image']; ?>">


                                        <input type="submit" value="add to cart" name="add_to_cart" class="btn">
                                    </div>
                                </div> 
                              </form>
                        <?php    }
                        }

                    }?>
                     </div>
                    <?php
                }
         
         ?>


         <?php  
               if(isset($data)>0 && $data != null)
                {?>
                <h1 class="title">Items for You2 </h1>
                    <div class="box-container">
                        <?php
                    foreach($data as $key => $value)
                    {
                        $id = $value['item_id'];
                        foreach($items as $key => $item)
                        {
                            if($id == $item['itemId'])
                            { ?>
                               
                              <form action="" method="post" id="items">
                                <div id="" class="item">
                                    <div class="front">
                                        <div class="price">
                                            RS.<?php echo $item['salePrice']; ?>/- 
                                        </div>
                                        <div class="front-img">
                                            <img src="uploaded_img/<?php echo $item['image']; ?>"/>
                                        </div>
                                        <div>
                                            <h3><?php echo $item['itemName'] ?></h3>
                                        </div>
                                    </div>
                                    <div class="back">
                                        <h3><?php echo $item['itemName'] ?></h3>
                                        <div class="back-img">
                                            <img src="uploaded_img/<?php echo $item['image']; ?>"/>
                                        </div>
                                        <div class="desc">
                                            <p>
                                                <?php echo $item['itemDesc'] ?>
                                            </p>
                                        </div>


                                           <input type="number" min="1" name="quantity" value="1" class="qty">
                                          <input type="hidden" name="itemId" value="<?php echo $item['itemId']; ?>">
                                          <input type="hidden" name="itemName" value="<?php echo $item['itemName']; ?>">
                                          <input type="hidden" name="salePrice" value="<?php echo $item['salePrice']; ?>">
                                          <input type="hidden" name="image" value="<?php echo $item['image']; ?>">

                                        <input type="submit" value="add to cart" name="add_to_cart" class="btn">
                                    </div>
                                </div> 
                              </form>
                        <?php    }
                        }

                    }?>
                     </div>
                    <?php
                }
         
         ?>


         <?php  
               if($data == NULL && $items_after_remove_zero ==null)
                {?>
                <h1 class="title">Items for You </h1>
                    <div class="box-container">
                        <?php
                        foreach($items as $key => $item)
                        {
                             ?>
                               
                              <form action="" method="post" id="items">
                                <div id="" class="item">
                                    <div class="front">
                                        <div class="price">
                                            RS.<?php echo $item['salePrice']; ?>/- 
                                        </div>
                                        <div class="front-img">
                                            <img src="uploaded_img/<?php echo $item['image']; ?>"/>
                                        </div>
                                        <div>
                                            <h3><?php echo $item['itemName'] ?></h3>
                                        </div>
                                    </div>
                                    <div class="back">
                                        <h3><?php echo $item['itemName'] ?></h3>
                                        <div class="back-img">
                                            <img src="uploaded_img/<?php echo $item['image']; ?>"/>
                                        </div>
                                        <div class="desc">
                                            <p>
                                                <?php echo $item['itemDesc'] ?>
                                            </p>
                                        </div>


                                           <input type="number" min="1" name="quantity" value="1" class="qty">
                                          <input type="hidden" name="itemId" value="<?php echo $item['itemId']; ?>">
                                          <input type="hidden" name="itemName" value="<?php echo $item['itemName']; ?>">
                                          <input type="hidden" name="salePrice" value="<?php echo $item['salePrice']; ?>">
                                          <input type="hidden" name="image" value="<?php echo $item['image']; ?>">

                                        <input type="submit" value="add to cart" name="add_to_cart" class="btn">
                                    </div>
                                </div> 
                              </form>
                        <?php    }

                    ?>
                     </div>
                    <?php
                }
         
         ?>

  
</section>

<section class="about">

   <div class="flex">

      <div class="image">
         <img src="images/lunchroom.jpg" alt="">
      </div>

      <div class="content">
         <h3>about us</h3>
         <p>we take pride in offering you a seamless and satisfying dining experience.</p>
         <a href="about.php" class="btn">read more</a>
      </div>

   </div>

</section>




<?php include 'footer.php'; ?>

<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>