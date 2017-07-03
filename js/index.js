/**
 * Created by bjwsl-001 on 2017/6/23.
 */
if(window.$===undefined){
    throw new Error ("jQuery加载失败")
}
jQuery.fn.navbar=function(){
    var $lis=this.children('li');
    $lis.click(function(){
        index=$(this).index();
        $lis.eq(index).addClass("active").siblings().removeClass("active");
    })
};
jQuery.fn.change=function(){
    if(sessionStorage['loginUname']!=undefined){
        console.log($(this).html());
        $(this).html('欢迎回来'+sessionStorage['loginUname']);
        $(this).attr("href",'#/MyOrder');
        $(this).attr("data-toggle",'');
    }
};
//if(sessionStorage['loginUname']) {
//    console.log($('#d1').html());
//    $('#nav').find('.login').html('欢迎回来' + sessionStorage['loginUname'])
//}
var app = angular.module('disney', ['ng', 'ngRoute']);
app.controller('parentCtrl',
    ['$scope', '$location','$http',
        function ($scope, $location,$http) {
            $scope.jump = function (desPath) {
                $location.path(desPath);
            };

            $scope.loginClick=function(){

                console.log($scope.user_name);
                console.log($scope.user_pwd);
                $http
                    .post('data/login.php?uname='+$scope.user_name+'&&upwd='+$scope.user_pwd)
                    .success(function (data) {
                        //console.log(data);
                        alert(data.msg);
                        sessionStorage['loginUname']=$('[name="uname"]').val();
                        location.href="disney.html";
                    });
            };

            $scope.registerClick=function(){
                $http
                .post('data/register.php?uname='+$scope.user_name+'&&upwd='+$scope.user_pwd)
                .success(function(data){
                    //console.log(data);
                    alert(data.msg);
                    location.href="disney.html"
                })
        }
        }
    ])
app.config(function ($routeProvider) {
    $routeProvider
        .when('/Main', {
            templateUrl: 'tpl/main.html',
            controller: 'MainCtrl'
        })
        .when('/Detail', {
            templateUrl: 'tpl/detail.html',
            controller: 'MainCtrl'
        })
        .when('/Order/:id', {
            templateUrl: 'tpl/order.html',
            controller: 'OrderCtrl'
        })
        .when('/MyOrder', {
            templateUrl: 'tpl/myOrder.html',
            controller: 'MyOrderCtrl'
        })
        .otherwise({redirectTo: '/Main'})
});
app.controller('MainCtrl',
    ['$scope', '$http',
        function ($scope, $http) {
            //console.log(1);
            //$http
            //    .get('data/banner.php')
            //    .success(function (data) {
            //        console.log(data);
            //        $scope.bannerList = data;
            //    });
            $http
                .get('data/star.php')
                .success(function (data) {
                    //console.log(data);
                    $scope.starList = data;
                });
            $http
                .get('data/shopping_main.php')
                .success(function (data) {
                    //console.log(data);
                    $scope.shoppingMain = data;
                });
            $http
                .get('data/shopping_list.php')
                .success(function (data) {
                    //console.log(data);
                    $scope.shoppingList = data;
                });
            $http
                .get('data/msg_main.php')
                .success(function (data) {
                    //console.log(data);
                    $scope.msgMain = data;
                });
            $http
                .get('data/msg_list.php')
                .success(function (data) {
                    //console.log(data);
                    $scope.msgList = data;
                });


            //轮播图
            var oSj = 5000;
            var i = 0;
            var bar = $(".banner-box .bar");
            var oImg = $(".banner-box .img");//获取图片盒子
            var w=$(".banner-box ").css("width");
            var h=$(".banner-box ").css("height");
            var imgwidth=parseFloat(w);
            //console.log(w);
            $(".banner-box .img li").css({"width":w,"height":h});
            $(".banner-box .img ").css({"width":3*w,"height":h});
            //console.log($(".banner-box .img ").css("width"));
            var oImgfirst= $('.banner-box .img li:first').clone();//复制第一张图片
            oImg.append(oImgfirst);//将复制的第一张图片放到最后
            var imgNum = $(".banner-box .img li").size();//获取图片数量

            //根据图片个数添加圆点按钮
            for(var j=1;j<=imgNum-1;j++){
                $('.banner-box .li').append('<li></li>');
            }

            //给第一个按钮添加选中样式
            $('.banner-box .li li:first').addClass('index');


            //点击向右轮播
            $(".but-right").click(function(){
                int();
            });

            //点击向左轮播
            $(".but-left").click(function(){
                bar.stop().css('width',0);
                i--;
                if(i == -1){
                    $('.banner-box .img').css('left',-(imgNum-1)*imgwidth);//用CSS进行图片位置变换，达到无缝拼接效果
                    i = imgNum-2;
                }
                oImg.stop().animate({left:-i*imgwidth},500);//动画效果
                clearInterval(oTime);
                oTime = setInterval(function(){
                    int();
                },oSj);
                barAniMate();//进度条函数动画效果
                $(".banner-box .li li").eq(i).addClass('index').siblings().removeClass('index');//给相应的按钮添加样式
            });

            //鼠标移动到圆点后轮播
            $(".banner-box .li li").hover(function() {
                clearInterval(oTime);//清除定时器
                bar.stop().css('width',0);
                var index = $(this).index();
                i=index;
                oImg.stop().animate({left:-index*imgwidth},500);//动画效果
                bar.stop().css('width',0);
                $(this).addClass('index').siblings().removeClass('index');//给相应的按钮添加样式
            },function(){
                barAniMate();//进度条函数动画效果
                oTime = setInterval(function(){
                    int();
                },oSj);
            });

            //自动轮播
            var oTime = setInterval(function(){
                int();
            },oSj);

            barAniMate();//进度条函数动画效果

            //进度条函数动画效果
            function barAniMate(){
                bar.animate({width:'100%'},oSj,function(){
                    $(this).css('width',0);
                });
            }

            //自动轮播函数
            function int(){
                bar.stop().css('width',0);
                i++;
                if(i == imgNum){
                    oImg.css('left',0);//用CSS进行图片位置变换，达到无缝拼接效果
                    i = 1;
                }
                oImg.stop().animate({left:-i*imgwidth},500);//动画效果
                barAniMate();//进度条函数动画效果
                clearInterval(oTime);
                oTime = setInterval(function(){
                    int();
                },oSj);
                if(i == imgNum-1){
                    $(".banner-box .li li").eq(0).addClass('index').siblings().removeClass('index');//给相应的按钮添加样式

                }else{
                    $(".banner-box .li li").eq(i).addClass('index').siblings().removeClass('index');//给相应的按钮添加样式
                }
            }



        }
    ]);
app.controller('OrderCtrl',
    ['$scope', '$http', '$routeParams', '$httpParamSerializerJQLike',
        function ($scope, $http, $routeParams, $httpParamSerializerJQLike) {
            //console.log($routeParams);
            $scope.order = {pid: $routeParams.id};
            console.log($scope.order);
            $scope.submitOrder = function () {
                console.log($scope.order);
                //针对 对象或者数组 做序列化的处理
                var result = $httpParamSerializerJQLike($scope.order);
                $http
                    .get('data/order_add.php?' + result)
                    .success(function (data) {
                        console.log(data);
                        if (data[0].msg == 'succ') {
                            $scope.AddResult = '下单成功，订单编号为' + data[0].oid;
                            sessionStorage.setItem('phone',
                                $scope.order.phone)
                        }
                        else {
                            $scope.AddResult = "下单失败";
                        }

                    })
            }
        }
    ]);
app.controller('MyOrderCtrl', ['$scope', '$http',
    function ($scope, $http) {
        //根据手机号 读取 该手机号对应的订单信息
        var phone = sessionStorage.getItem('phone');
        console.log(phone);
        $http
            .get('data/myOrder.php?phone='+ phone)
            .success(function (data) {
                console.log(data);
                $scope.orderList = data;
            })
    }
])