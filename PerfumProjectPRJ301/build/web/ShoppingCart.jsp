<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/cart.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

        <title>Document</title>
        <style>
            .tang a{
                text-decoration: none;
                width: 20px;
                color: black;


            }
            .tang{

                display: flex;
                flex-direction: row;
                align-items: center;
                margin: 0px 10px ;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <section class="h-100 h-custom" style="background-color: #d2c9ff">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div
                            class="card card-registration card-registration-2"
                            style="border-radius: 15px"
                            >
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-8">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">Giỏ Hàng</h1>
                                                <h6 class="mb-0 text-muted"> ${size} Loại Sản phẩm</h6>
                                            </div>
                                            <!--1 sản phẩm-->
                                            <c:set var="tt" value="0"/>
                                            <c:forEach items="${data}" var="x">
                                                <c:set var="tt" value="${tt+1}"/>
                                                <ol>
                                                    <li value="${tt}">
                                                        <hr class="my-4" />
                                                        <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                            <div class="col-md-2 col-lg-2 col-xl-2">
                                                                <img src="${x.product.image}" class="img-fluid rounded-3"
                                                                     alt="Cotton T-shirt"
                                                                     />
                                                            </div>
                                                            <div class="col-md-3 col-lg-3 col-xl-3">
                                                                <h6 class="text-black mb-0">${x.product.productName}</h6>
                                                            </div>
                                                            <div class="col-md-3 col-lg-3 col-xl-2 d-flex" style="text-align: center">
                                                                <button class="tang"><a href="process?num=-1&id=${x.product.productID}">
                                                                        <span class="material-icons-outlined" style="font-size: 15px">
                                                                            remove
                                                                        </span></a></button>
                                                                        ${x.quantity}
                                                                <button  class="tang"><a href="process?num=1&id=${x.product.productID}">
                                                                        <span class="material-icons-outlined" style="font-size: 15px">
                                                                            add
                                                                        </span></a></button>
                                                            </div>

                                                            <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                                <h6 class="mb-0"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${x.product.salePrice * x.quantity}"/> VND</h6>
                                                            </div>
                                                            <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                                <a href="#!" class="text-muted"
                                                                   ><i class="fas fa-times"></i
                                                                    ></a>
                                                            </div>
                                                        </div>
                                                    </li>

                                                </ol>


                                            </c:forEach>

                                            <!--Kết thúc 1 sản phẩm--> 
                                            <hr class="my-4" />

                                            <div class="pt-5">
                                                <h6 class="mb-0">
                                                    <a href="home" class="text-body"><i class="fas fa-long-arrow-alt-left me-2"></i>Tiếp tục mua hàng</a>
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Thông tin</h3>
                                            <hr class="my-4" />

                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">Tổng ${cart.number} Sản phẩm</h5>
                                            </div>
                                            <!--Thông tin khách hàng-->
                                            <h5 class="text-uppercase mb-3">Tên</h5>

                                            <div class="mb-5">
                                                <div class="form-outline">
                                                    <input
                                                        type="text"
                                                        id="form3Examplea2"
                                                        class="form-control form-control-lg" readonly value="${sessionScope.account.name}"/>
                                                </div>
                                            </div>
                                            <h5 class="text-uppercase mb-3">Địa chỉ</h5>

                                            <div class="mb-5">
                                                <div class="form-outline">
                                                    <input
                                                        type="text"
                                                        id="form3Examplea2"
                                                        class="form-control form-control-lg" readonly value="${sessionScope.account.address}"/>
                                                </div>
                                            </div>
                                            <h5 class="text-uppercase mb-3">Số điện thoại</h5>
                                            <div class="mb-5">
                                                <div class="form-outline">
                                                    <input
                                                        type="text"
                                                        id="form3Examplea2"
                                                        class="form-control form-control-lg" readonly value="${sessionScope.account.phone}"/>
                                                </div>
                                            </div>
                                            <!--Kết thúc thông tin khách hàng-->
                                            <hr class="my-4" />

                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Tổng tiền</h5>
                                                <h5><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${cart.total}"/> VND</h5>
                                            </div>

                                            <button
                                                type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                                class="btn btn-dark btn-block btn-lg"
                                                data-mdb-ripple-color="dark">Thanh toán</button>
                                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Thanh Toan</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>
                                                                Thanh toan thanh cong !
                                                            </p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            
                                                            <button type="button" class="btn btn-primary">
                                                                <a href="#" style="color: black; text-decoration: none;">OK</a> 
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</html>