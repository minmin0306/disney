<?php
header('Content-Type:application/json');

@$phone = $_REQUEST['phone'];
if(empty($phone)){
  echo '[]';
  return;
}

require('init.php');

$sql = "SELECT order_list.oid,shopping_list.pid,shopping_list.pic,order_list.order_time,order_list.user_name FROM shopping_list,order_list WHERE order_list.pid=shopping_list.pid AND order_list.phone='$phone'";

$result = mysqli_query($conn,$sql);
$output = [];

while(true){
  $row = mysqli_fetch_assoc($result);
  if(!$row)
  {
    break;
  }
  $output[] = $row;
}
echo json_encode($output);
?>