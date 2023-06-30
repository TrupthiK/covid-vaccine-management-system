<?php
require('db.php');
$email = $_REQUEST['email'];
$sql1 = "DELETE FROM add_member WHERE email='$email'";
if ($conn->query($sql1) === TRUE) {
    echo "<script>
    alert('Member deleted successfully');
    window.location.href='slot details.php';
    </script>";
} else {
    echo "<script>
    alert('Deletion not successful');
            window.location.href='slot details.php';
            </script>";
}
?>