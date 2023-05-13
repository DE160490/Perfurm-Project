<%-- 
   
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>

<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Error</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />

    </head>
    <style>
        body{
            margin: -150px;
            padding: 30px;
            height: 50vh;
            justify-content: center;
            align-items: center;
            display: flex;
            flex-direction: column;
        }
        .btn{
            
            font-family: "Roboto", sans-serif;
            font-size: 18px;
            font-weight: bold;
            background: #5875e5;
            width: 160px;
            padding: 30px;
            margin: 50px;
            text-align: center;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2{
            padding: 35px;
            margin: 40px;
        }
        .btn:hover{
            box-shadow: 0 0 20px rgba(0,0,0,0.5);
        }
    </style>
    <body>
        <h2 style="color: red">${requestScope.ms}</h2>
        
        <div>
            <a href="home" class="btn" >Trở về trang chủ</a>
            <a href="logout" class="btn" >Đăng Xuất</a>
        </div>

    </body>
</html>
