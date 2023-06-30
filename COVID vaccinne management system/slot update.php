<html>

<head>
<title>
Slot Update page
</title>
</head>


<center>
<body>
<br>
<h1>UPDATE SLOT</h1>
<hr>
<br>


<form action="slot update_p.php" method="post">
  <input type="hidden" name="slot_id" value="<?php echo $slot_id; ?>">
  <div>
    <label for="slot_date">Date:</label>
    <input type="text" id="slot_date" name="slot_date" value="<?php echo $slot_date; ?>">
  </div>
  <div>
    <label for="slot_time">Time:</label>
    <input type="text" id="slot_time" name="slot_time" value="<?php echo $slot_time; ?>">
  </div>
  <div>
    <label for="slot_address">Address:</label>
    <input type="text" id="slot_address" name="slot_address" value="<?php echo $slot_address; ?>">
  </div>
  <input type="submit" value="Update Slot">
</form>
