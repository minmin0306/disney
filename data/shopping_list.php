<?php
//14:20--14:30
//1:�޸���Ӧ��ʽjson
header("content-type:application/json;charset=utf-8");
//2:�������ݿ����� ���ñ���
require("init.php");
//3:����sql ��� ���ﳵ��/��Ʒ��
$sql  = "select * from shopping_list ";
//4:ץȡ������¼
$result = mysqli_query($conn,$sql);
$rows = mysqli_fetch_all($result,MYSQLI_ASSOC);
//5:ת��json
$str = json_encode($rows);
//6:����json�ַ���
echo $str;
?>