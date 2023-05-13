<%-- 
    Document   : HomePage
    Created on : Feb 24, 2023, 8:15:06 AM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ALLORA</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="owlcarousel/owl.carousel.min.css">
        <link rel="stylesheet" href="owlcarousel/owl.theme.default.min.css">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    </head>
    <body>
        <%@include file="temples/header.jsp" %>

        <div cl ass="slide col-md-11">
            <!-- <img width="85%" src="./assets/IMG/slide-2.jpg" alt=""> -->
            <div id="carouselExampleControls" class="carousel slide w-100"
                 data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="w-100" height="auto" src="assets/IMG/123perfume.3.tang_.huong_-1170x538.jpg"
                             alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" height="765px" src="./assets/IMG/de005xy-5efae943-5901-4d5d-ad8d-5b5b79c32a4b.jpg"
                             alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" height="auto"
                             src="./assets/IMG/perfum_02_by_valadj_dcaeugj-pre.jpg"
                             alt="Third slide">
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="body2">
        <div class="body2_child1 col-md-3">
            <img width="100%" src="./assets/IMG/jean-paul-gaultier-le-male-orchardvn-anh1.jpg" alt="">
            <p class="mota">
                <a href="product?cid=2">NƯỚC HOA NAM</a>
                <strong>Gaultier</strong> dành cho nam giới, ông muốn làm hồi sinh những giá trị truyền thống trong nước hoa Le Male. Kiểu chai thể hiện một cách gợi cảm qua hình tượng bán thân của nam giới với chiếc áo thủy thủ
            </p>
        </div>
        <div class="body2_child1 col-md-3">
            <img width="100%" height="375px" src="assets/IMG/Coco-Mademoiselle-intense-edp-orchard.vn_.jpg" alt="">
            <p class="mota">
                <a href="product?cid=3">NƯỚC HOA NỮ</a>
                <strong>Chanel Coco</strong> Mademoiselle Intense EDP được xem như là biểu tượng nhất. Nó là No5 cho thời hiện đại và kể từ khi ra mắt vào năm 2001 Coco Chanel đã là mùi thơm được lựa chọn của tất cả thế hệ phụ nữ. 
            </p>
        </div>
        <div class="body2_child1 col-md-3">
            <img width="100%" src="assets/IMG/banner_mini.jpg" alt="">
            <p class="mota">
                <a href="product?cid=1">NƯỚC HOA MINI</a>
                <strong>Miss Dior</strong>: chính thức được giới thiệu đến công chúng với sắc hồng tím ngọt lịm và chiếc nơ truyền thống trên cổ chai đã được thay đổi bằng chiếc nơ vải ánh bạc điệu đà, nữ tính
            </p>
        </div>
    </div>



    <!---------------- NƯỚC HOA NAM ------------------->
    <div class="body3">
        <h2 class="col-md-11">
            NƯỚC HOA NAM
        </h2>
        <div id="carouselExampleIndicators" class="carousel slide body3_item
             col-md-11"
             data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators"
                    data-slide-to="0" class="active" style="cursor: pointer;"></li>
                <li data-target="#carouselExampleIndicators"
                    data-slide-to="1" style="cursor: pointer;"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="list_product1">
                        <c:forEach items="${listNam}" var="o" begin="0" end="3">
                            <div class="product col-md-3">
                                <img
                                    width="100%" height="330px"
                                    src="${o.image}"
                                    alt="">
                                <p>
                                    <a href="detail?pid=${o.productID}">${o.productName}</a>

                                </p>
                                <div class="price-box">
                                    <span style="text-decoration: line-through;
                                          color: gray;"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice}"/> VND</span> 
                                          <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice*90/100}"/> VND
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="list_product1">
                        <c:forEach items="${listNam}" var="o" begin="4" end="7">
                            <div class="product col-md-3">
                                <img
                                    width="100%" height="330px"
                                    src="${o.image}"
                                    alt="">
                                <p>
                                    <a href="detail?pid=${o.productID}">${o.productName}</a>

                                </p>
                                <div class="price-box">
                                    <span style="text-decoration: line-through;
                                          color: gray;"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice}"/> VND</span>
                                          <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice*90/100}"/> VND
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-------------- NƯỚC HOA NỮ ----------------->
    <div class="body3">
        <h2 class="col-md-11">
            NƯỚC HOA NỮ
        </h2>
        <div id="carouselExampleIndicatorss" class="carousel slide body3_item
             col-md-11"
             data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicatorss"
                    data-slide-to="0" class="active" style="cursor: pointer;"></li>
                <li data-target="#carouselExampleIndicatorss"
                    data-slide-to="1" style="cursor: pointer;"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="list_product1">
                        <c:forEach items="${listNu}" var="o" begin="0" end="3">
                            <div class="product col-md-3">
                                <img
                                    width="100%" height="330px"
                                    src="${o.image}"
                                    alt="">
                                <p>
                                    <a href="detail?pid=${o.productID}">${o.productName}</a>

                                </p>
                                <div class="price-box">
                                    <span style="text-decoration: line-through;
                                          color: gray;"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice}"/> VND</span> 
                                          <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice*90/100}"/> VND
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="list_product1">
                        <c:forEach items="${listNu}" var="o" begin="4" end="7">
                            <div class="product col-md-3">
                                <img
                                    width="100%" height="330px"
                                    src="${o.image}"
                                    alt="">
                                <p>
                                    <a href="detail?pid=${o.productID}">${o.productName}</a>

                                </p>
                                <div class="price-box">
                                    <span style="text-decoration: line-through;
                                          color: gray;"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice}"/> VND</span> 
                                          <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice*90/100}"/> VND
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!------------ NƯỚC HOA MINI --------------->
    <div class="body3">
        <h2 class="col-md-11">
            NƯỚC HOA MINI
        </h2>
        <div id="carouselExampleIndicatorsr" class="carousel slide body3_item
             col-md-11"
             data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicatorsr"
                    data-slide-to="0" class="active" style="cursor: pointer;"></li>
                <li data-target="#carouselExampleIndicatorsr"
                    data-slide-to="1" style="cursor: pointer;"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="list_product1">
                        <c:forEach items="${listMini}" var="o" begin="0" end="3">
                            <div class="product col-md-3">
                                <img
                                    width="100%" height="330px"
                                    src="${o.image}"
                                    alt="">
                                <p>
                                    <a href="detail?pid=${o.productID}">${o.productName}</a>

                                </p>
                                <div class="price-box">
                                    <span style="text-decoration: line-through;
                                          color: gray;"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice}"/> VND</span> 
                                          <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice*90/100}"/> VND
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="list_product1">
                        <c:forEach items="${listMini}" var="o" begin="4" end="7">
                            <div class="product col-md-3">
                                <img
                                    width="100%" height="330px"
                                    src="${o.image}"
                                    alt="">
                                <p>
                                    <a href="detail?pid=${o.productID}">${o.productName}</a>

                                </p>
                                <div class="price-box">
                                    <span style="text-decoration: line-through;
                                          color: gray;"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice}"/> VND</span> 
                                          <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.salePrice*90/100}"/> VND
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <%@include file="temples/footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/78025ca858.js"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/js/index.js"></script>
</body>
</html>