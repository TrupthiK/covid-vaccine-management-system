<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$dname = 'coviid';

$conn = new mysqli($servername, $username, $password, $dname);

if ($conn->connect_errno) {
    echo "Failed to connect" . $mysqli->connect_error;
    exit();
}
$email = $_REQUEST['email'];
$result = mysqli_query($conn, "SELECT * from add_member as a join book_slot as b on a.mem_id=b.mem_id where email = '$email';");
$row = mysqli_fetch_array($result);
if (!is_array($row)) {
    echo "<script>
        alert('Password didn't change.');
        window.location.href='admin_users.php';
        </script>";
}
?>
<html>
<center>

    <head>
        <title>Update Slot</title>
    </head>

    <body>
        <form method="post" action="slot_details.php">
            <h1>UPDATE USER</h1>
            <hr>
            <?php
            $status = "";
            if (isset($_POST['new']) && $_POST['new'] == 1) {
                $fname = $_REQUEST['fname'];
                $lname = $_REQUEST['lname'];
                $vaccine_name = $_REQUEST['vaccine_name'];
                $slot_date = $_REQUEST['slot_date'];
                $slot_time = $_REQUEST['slot_time'];

                $sql1 = "UPDATE add_member as a join book_slot as b on a.mem_id=b.mem_id  SET `fname`='$fname',`lname`='$lname',`vaccine_name`='$vaccine_name',`slot_date`='$slot_date',`slot_time`='$slot_time' WHERE `email`='$email'";

                if ($conn->query($sql1) === TRUE) {
                    echo "<script>
                    alert('Slot updated successfully');
                    window.location.href='slot_details.php';
                    </script>";
                } else {
                    echo "<script>
                    alert('Updation not successful');
                            window.location.href='slot_details.php';
                            </script>";
                }
            } else {
                ?>
                <form name="form" method="post" action="">
                    <input type="hidden" name="new" value="1" />
                    <input name="email" type="hidden" value="<?php echo $row['email']; ?>" />
                    <table border="1">
                        <tr>
                            <th>ENTER FIRST NAME</th>
                            <td><input type="text" id="fname" name="fname" required value="<?php echo $row['fname']; ?>">
                            </td>
                        </tr>
                        <tr>
                            <th>ENTER LAST NAME</th>
                            <td><input type="text" id="lname" name="lname" required value="<?php echo $row['lname']; ?>"
                                    </td>
                        </tr>
                        <tr>
                            <th>ENTER VACCINE NAME</th>
                            <td><input type="text" id="vaccine_name" name="vaccine_name" required
                                    value="<?php echo $row['vaccine_name']; ?>" </td>
                        </tr>
                        <tr>
                            <th>ENTER SLOT DATE</th>
                            <td><input type="date" id="slot_date" name="slot_date" required value="<?php echo $row['slot_date']; ?>">
                            </td>
                        </tr>
                        <tr>
                            <th>ENTER SLOT TIME</th>
                            <td><input type="time" id="slot_time" name="slot_time" required
                                    value="<?php echo $row['slot_time']; ?>"></td>
                        </tr>
                    </table>
                    <br>
                    <input type="submit" id="submit" name="submit" value="update">
                </form>
            </form>
        <?php } ?>
        </form>
    </body>
</center>

</html>