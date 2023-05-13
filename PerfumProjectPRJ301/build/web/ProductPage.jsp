 <%-- 
    Document   : ProductPage
    Created on : Feb 28, 2023, 11:34:37 PM
    Author     : PC
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/product.css" rel="stylesheet" />
        <link href="css/home.css"/>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="home">ALLORA</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="product?cid=1">Nước Hoa Mini</a></li>
                        <li class="nav-item"><a class="nav-link" href="product?cid=2">Nước Hoa Nam</a></li>
                        <li class="nav-item"><a class="nav-link" href="product?cid=3">Nước Hoa Nữ</a></li>

                    </ul>
                    <form action="search" method="get">
                        <div class="input-group input-group-sm">
                            <input value="${txtS}" name="txt" type="text" class="form-control" placeholder="Tìm Kiếm">
                            <div class="input-group-append" style="margin-right: 30px">
                                <button type="submit" class="btn btn-secondary">
                                    <span class="material-symbols-outlined">
                                        search
                                    </span>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

                <form class="d-flex">
                    <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </button>
                </form>
            </div>
        </div>
    </nav>
    <!-- Header-->
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <c:if test="${txtS == null}">
                <h1 class="display-4 fw-bolder">${cate.cateName}</h1>
                </c:if>
                <c:if test="${txtS != null}">
                    <h1 class="display-4 fw-bolder">${txtS}</h1>
                </c:if>
            </div>
        </div>
    </header>
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div id="content" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach items="${ListC}" var="o">
                    <div class="col mb-5">
                        <div class="card h-100" style="box-shadow: 2px 2px 15px 0 rgba(0, 0, 0, 0.19)">
                            <!-- Product image-->
                            <img class="card-img-top" src="${o.image}" alt="..." style="height: 85%;  "/>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <a href="detail?pid=${o.productID}" style="text-decoration: none; color: black" >
                                        <h5 class="fw-bolder">${o.productName}</h5>
                                    </a>
                                    <!-- Product price-->
                                    <div class="price" style="padding: 20%">
                                        <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice}"/> VND
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <c:if test="${sessionScope.account == null}">
                                        <a class="btn btn-outline-dark mt-auto" href="Login.jsp">Add to cart</a>
                                    </c:if>
                                    <c:if test="${sessionScope.account != null}">
                                        <a class="btn btn-outline-dark mt-auto" href="buy?id=${o.productID}&num=1">Add to cart</a>
                                    </c:if>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
            </div>
        </div>
       
    </section>
    <!-- Footer-->
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>

