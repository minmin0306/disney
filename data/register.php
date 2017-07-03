<?php
header("content-type:application/json;charset=utf-8");
    @$uname = $_REQUEST['uname']or die('{"code":-2,"msg":"用户名是必须的"}');
    @$upwd = $_REQUEST['upwd']or die('{"code":-3,"msg":"密码是必须的"}');
    require('init.php');
    $sql="INSERT INTO disney_user VALUES(null,'$uname','$upwd')";
    $result = mysqli_query($conn,$sql);
     if($result===true){
       echo '{"code":1,"msg":"添加成功,还需您再次登录"}';
     }else{
       echo '{"code":-1,"msg":"添加失败"}';
     }
?>