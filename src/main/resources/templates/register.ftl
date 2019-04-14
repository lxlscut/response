<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <title>这是登陆界面</title>
</head>
<body>
<h1>欢迎来到注册界面</h1>
        <input type="text" required="required" placeholder="用户名" name="name" id="name"></input>
        <input type="text" required="required" placeholder="性别" name="gerder" id="gerder"></input>
        <input type="text" required="required" placeholder="手机" name="telphone" id="telphone"></input>
        <input type="text" required="required" placeholder="验证码" name="otp" id="otp"></input>
        <input type="password" required="required" placeholder="密码" name="password" id="password"></input>
        <button  type="submit" id="button">注册</button>
</body>
<script>
    jQuery(document).ready(function () {
        //    绑定向后端发送请求的获取手机验证码的请求
        $("#button").on("click",function () {
            var name = $("#name").val();
            var gerder = $("#gerder").val();
            var telphone = $("#telphone").val();
            var otp = $("#otp").val();
            var password = $("#password").val();
            if(name== null || name=="")
            {
                alert("用户名不能为空");
                return false;
            }
            if(gerder== null || gerder=="")
            {
                alert("性别不能为空");
                return false;
            }
            if(telphone== null || telphone=="")
            {
                alert("手机号不能为空");
                return false;
            }
            if(otp== null || otp=="")
            {
                alert("验证码不能为空");
                return false;
            }
            if(password== null || password=="")
            {
                alert("密码不能为空");
                return false;
            }
            $.ajax({
                type:"POST",
                contentType:"application/x-www-form-urlencoded",
                url:"http://localhost:8080/get/Register",
                data:{"name":$("#name").val(),
                    "gerder":$("#gerder").val(),
                    "telphone":$("#telphone").val(),
                    "otp":$("#otp").val(),
                    "password":$("#password").val()},
                xhrFields: {
                    withCredentials: true
                },
                crossDomain: true,
                success:function (data) {
                    if(data.status=="success"){
                        alert("注册成功");
                        window.location.href="http://localhost:8080/login/loginl";
                    }
                    else{
                        alert("注册失败"+data.data.errmessage);
                    }
                },
                fail:function (data) {
                    alert("注册请求发送失败，原因为："+data.responseText);
                }
            })
            return false;
        })
    });
</script>
</html>