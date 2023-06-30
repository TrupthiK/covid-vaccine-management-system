<?php

$servername='localhost';
$username='root';
$password='';
$dname='coviid';

$conn=new mysqli($servername, $username, $password, $dname);

if($conn -> connect_errno){
  echo "Failed to connect" . $mysqli -> connect_error;
  exit();
}
else{

$id=$_GET['id'];
$sql="select * from book_slot where C_id=$id";
$result = $conn->query($sql);
$row=$result->fetch_assoc();
$C_name=$row['C_name'];
$C_id=$row['C_id'];
$C_mob=$row['C_mob'];
$C_add=$row['C_add'];
$C_mail=$row['C_mail'];
$Password=$row['Password'];

if(isset($_POST['submit'])){
  $name=$_POST['name'];
  $cphone=$_POST['cphone'];
  $cadd=$_POST['cadd'];
  $cmail=$_POST['cmail'];
  $cpass=$_POST['cpass'];
  $sql ="update customer set C_name='$name',C_mob='$cphone',C_add='$cadd',C_mail='$cmail',Password='$password' where C_id='$id'";
  $result = $conn->query($sql);
  if($result){
   //echo "Data updated sucessfully";
   header('location:display_customer.php');
  }else{
    die(mysqli_error($con));
  }
}
}
?>





<!DOCTYPE html>
<html>
    
    <head>
        <center>
        <title>  </title>
        <h2>CUSTOMER DETAILS</h2>
        
    </head> 
    <body>
        <br>
        <br>
        This is a page to update the details about the Customers..
        <form method="post">
            <table>
                <tr>
                    <td><h4>Customer name :</h4></td>
                    <td><input type="text" name="name" value=<?php echo $C_name;?>></td><br>
                </tr><br>
                <tr>
                    <td><h4>PASSWORD :</h4></td>
                    <td><input type="password" name="cpass"  value=<?php echo $Password;?>></td><br>
                </tr><br>
                
                <tr>
                    <td><h4>Customer mobile :</h4></td>
                    <td><input type="text" name="cphone"  value=<?php echo $C_mob;?>></td>
                </tr>
                <tr>
                    <td><h4>Customer address :</h4></td>
                    <td><input type="text" name="cadd"  value=<?php echo $C_add;?>></td>
                </tr>
                <tr>
                    <td><h4>Customer mail :</h4></td>
                    <td><input type="mail" name="cmail"  value=<?php echo $C_mail;?>></td>
                </tr>
                
                <tr>
                    <!-- <td><button type="submit" name="submit">update</button></td> -->
                    <td><input type="submit" name="submit"></td>
                </tr>
            </table>
</form>
    </center>
    </body>

</html>