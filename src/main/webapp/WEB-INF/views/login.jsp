<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>The News</title>

    <!-- Bootstrap core CSS -->
    <link th:href="@{/static/css/bootstrap.min.css}" rel="stylesheet">

</head>
<body style="background: url(https://w.wallhaven.cc/full/k7/wallhaven-k75weq.jpg) no-repeat center center fixed; background-size: 100%;">

    <form class="form-signin" th:action="@{/admin/loginVerify}" method="post">
        <div class="modal-dialog" style="margin-top: 10%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title text-center" id="myModalLabel">管理员登录</h4>
                </div>
                <div class="modal-body" id = "model-body">
                    <p style="color: red" th:text="${msg}" th:if="${not #strings.isEmpty(msg)}"></p>
                    <div class="form-group">
                        <input type="text" name="username" required="required" class="form-control"placeholder="用户名" >
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" required="required" class="form-control" placeholder="密码" >
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="form-group">
                        <button id="js-btn-login" type="submit" class="btn btn-primary form-control">登录</button>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </form>

    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" th:src="@{/static/js/jquery-3.2.1.slim.min.js}"></script>
    <script type="text/javascript" th:src="@{/static/js/popper.min.js}"></script>
    <script type="text/javascript" th:src="@{/static/js/bootstrap.min.js}"></script>

    <script>
        $(function(){
            $("#js-btn-login").click(function(){
                //1.验证用户名密码是否合法
                var user = $("#username").val();
                var pwd  =$("#password").val();
                if (user.length==0 || pwd.length==0) {
                    alert("用户名或密码不能为空！");
                }else{

                    //2.将用户名和密码传递给后台

                    $.ajax({
                        type:"post",
                        url:"LoginServlet",
                        data:$("#loginForm").serialize(),
                        dataType:"json",
                        success:function(data){
                            if(data == 0){
                                //登录失败，用户名或密码不正确
                                alert("用户名或密码不正确！");
                            }else{
                                //登录成功
                                location.href="index.html"; //页面跳转
                            }
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>