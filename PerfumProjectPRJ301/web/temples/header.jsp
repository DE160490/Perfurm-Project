<%-- 
    Document   : header
    Created on : Feb 27, 2023, 10:00:30 PM
    Author     : PC
--%>

<%@page import="dao.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<hr>
<style>
    .session{
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }
    .session i{
        cursor: pointer;
        font-size: 15px;
        padding: 10px;
        color: black;
    }
</style>
<div id="header" class="col-md-11">

    <div class="search">
        <input class="search-input" width="80%" type="text" name=""
               id="" placeholder="Tìm Kiếm"
               style="padding-left: 15px;">
        <div class="icon">
            <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
        </div>
    </div>

    <img width="12%"
         src="./assets/IMG/thiet-ke-logo-nuoc-hoa-bee-design-02.jpg"
         alt="" class="logo">
    <span class="session" >
        <c:if test="${sessionScope.account.getRole() == 1}">
            <h5>Xin Chào ${sessionScope.account.username}</h5>
        </c:if>
        <c:if test="${sessionScope.account.getRole() == 0}">
            <h5>Xin Chào ${sessionScope.account.name}</h5>
        </c:if>

        <c:if test="${sessionScope.account == null}">
            <a href="Login.jsp"><i style="" class="fa-solid fa-user"></i></a>
        </c:if>
            
        <c:if test="${sessionScope.account != null}">
            <a href="ProfileControl?username=${sessionScope.account.username}"><i style="" class="fa-solid fa-user"></i></a>
        </c:if>
                

    </span>


</div>
<hr>
<div class="header col-md-11" style="margin: 0 auto;">
    <div class="hd2">
        <nav class="hd2-menu">
            <ul>
                <li><a href="home">Trang Chủ</a></li>
                <li><a href="#footer">Về Chúng Tôi</a></li>
                <li>
                    <a href="#">Sản Phẩm<i class="fa-solid fa-chevron-down"></i></a>
                    <ul class="sub-menu">
                        <c:forEach items="${listCate}" var="o">
                            <li><a href="product?cid=${o.cateID}">${o.cateName}</a></li>
                            </c:forEach>

                    </ul>
                </li>
                <c:if test="${sessionScope.account == null}">
                    <li><a href="Login.jsp">Đăng Nhập</a></li>
                    <li><a href="Login.jsp">Đăng Ký</a></li>
                    </c:if>

                <c:if test="${sessionScope.account != null}">
                    <li><a href="logout">Đăng Xuất</a></li>
                    </c:if>
            </ul>
            <ul class="hd2-cart" style="cursor: pointer;">
                <li>
                    <a href="#">
                        <i class="fa-solid fa-cart-shopping"></i>GIỎ HÀNG</a>
                    <ul class="sub-menu2" >
                        <li style="font-family: Verdana, Geneva, Tahoma, sans-serif; display: flex; margin-left: 8%;">TỔNG CỘNG</li>

                        <div class="menu22">
                            <c:if test="${sessionScope.account == null}">
                                <li class="view-cart "><a href="Login.jsp">XEM GIỎ HÀNG</a></li>
                                <li class="view-cart"><a href="Login.jsp">THANH TOÁN</a></li>
                            </c:if>
                            <c:if test="${sessionScope.account != null}">
                                <li class="view-cart "><a href="cart">XEM GIỎ HÀNG</a></li>
                                <li class="view-cart"><a href="cart">THANH TOÁN</a></li>
                            </c:if>
                            
                        </div>  
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>