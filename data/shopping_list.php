<?php
//14:20--14:30
//1:修改响应格式json
header("content-type:application/json;charset=utf-8");
//2:创建数据库连接 设置编码
require("init.php");
//3:创建sql 多表 购物车表/产品表
$sql  = "select * from shopping_list ";
//4:抓取多条记录
$result = mysqli_query($conn,$sql);
$rows = mysqli_fetch_all($result,MYSQLI_ASSOC);
//5:转换json
$str = json_encode($rows);
//6:发送json字符串
echo $str;
?>