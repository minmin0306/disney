<?php
header('Content-Type:application/json');

@$phone = $_REQUEST['phone'];
@$user_name = $_REQUEST['user_name'];
@$pid = $_REQUEST['pid'];
@$addr = $_REQUEST['addr'];
if(empty($phone) || empty($user_name) || empty($pid) || empty($addr)){
  echo '[]';
  return;
}
$order_time = time()*1000;
require('init.php');

$sql = "INSERT INTO order_list VALUES(NULL,'$phone','$user_name','$order_time','$addr','$pid')";

$result = mysqli_query($conn,$sql);

$addResult = [];
if($result)
{
  //·µ»Ø¶©µ¥±àºÅ
  $addResult['oid'] = mysqli_insert_id($conn);
  $addResult['msg'] = 'succ';
}
else
{
  $addResult['msg'] = 'error';
}

$output = [];
$output[] = $addResult;

echo json_encode($output);
?>