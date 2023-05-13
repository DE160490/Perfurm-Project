<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900&amp;subset=latin,latin-ext'>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- partial:index.partial.html -->
        <form action="login" method="post">
        <div class="materialContainer">


            <div class="box">

                <div class="title">LOGIN</div>
                <c:if test="${sessionScope.account == null}">
                    <h3 style="color: red">${requestScope.ms}</h3>
                </c:if>
                <c:if test="${sessionScope.account != null}">
                    <h3 style="color: red">${requestScope.error}</h3>
                </c:if>
                
                <div class="input">
                    <label for="name">Username</label>
                    <input type="text" name="username" id="name">
                    <span class="spin"></span>
                </div>

                <div class="input">
                    <label for="pass">Password</label>
                    <input type="password" name="password" id="pass">
                    <span class="spin"></span>
                </div>

                <div class="button login">
                    <button><span>LOGIN</span> <i class="fa fa-check"></i></button>
                </div>

                <a href="" class="pass-forgot">Forgot your password?</a>

            </div>
            </form>
        
        
        
            <form action="signup" method="post">
            <div class="overbox">
                <div class="material-button alt-2"><span class="shape"></span></div>

                <div class="title">REGISTER</div>

                <div class="input">
                    <label for="regname">Username</label>
                    <input type="text" name="su_username" id="regname">
                    <span class="spin"></span>
                </div>

                <div class="input">
                    <label for="regpass">Password</label>
                    <input type="password" name="su_password" id="regpass">
                    <span class="spin"></span>
                </div>

                <div class="input">
                    <label for="reregpass">Repeat Password</label>
                    <input type="password" name="repass" id="reregpass">
                    <span class="spin"></span>
                </div>

                <div class="button">
                    <button><span>NEXT</span></button>
                </div>


            </div>

        </div>
            </form>
        <!-- partial -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="js/loginJS.js"></script>
        </<script src="./js/loginJS.js"></script>
    </body>
</html>