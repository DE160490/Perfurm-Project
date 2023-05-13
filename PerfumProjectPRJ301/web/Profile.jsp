<%-- 
    Document   : Profile
    Created on : Mar 17, 2023, 1:59:39 PM
    Author     : DELL
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/profile.css">
    </head>
    <body>
        <form action="" method="post" class="form1">

            <c:set var="p" value="${Account}"/>

            <div class="edit-profile">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <h5>HỒ SƠ CỦA TÔI</h5>
                        <p>Quản lý thông tin hồ sơ để bảo vệ mật khẩu</p>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-6">
                        <table>
                            <tr>
                                <th>Tên đăng nhập:</th>
                                <td>${p.username}</td>
                            </tr>
                            <tr>
                                <th>Tên:</th>
                                <td>
                                    ${p.name}
                                </td>
                            </tr>
                            <tr>
                                <th>Số điện thoại</th>
                                <td>
                                    <p style="padding-right: 10px;" id="">${p.phone}</p>
                                </td>
                            </tr>
                            <tr>
                                <th>Địa chỉ</th>
                                <td>
                                    ${p.address}
                                </td>
                            </tr>
                        </table>
                        <div>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">Cập Nhập</button>
                            <a href="home" class="btn btn-primary" data-bs-whatever="@getbootstrap"> Trở Về Trang Chủ </a>
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Cập Nhập Thông Tin</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="ProfileServlet" methor="post">
                                            <div class="modal-body">

                                                <div class="mb-3">
                                                    <label for="recipient-name" class="col-form-label">Username: </label>
                                                    <input type="text" class="form-control" id="recipient-name" value="${p.username}" name="username" readonly>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="recipient-name" class="col-form-label">Họ & Tên</label>
                                                    <input type="text" class="form-control" id="recipient-name" value="${p.name}" name="name">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="recipient-name" class="col-form-label">Số Điện Thoại:</label>
                                                    <input type="number" class="form-control" id="recipient-name" value="${p.phone}" name="phone">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="message-text" class="col-form-label">Địa chỉ:</label>
                                                    <input type="text" class="form-control" id="message-text" value="${p.address}" name="address">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="message-text" class="col-form-label">New password:</label>
                                                    <input type="password" class="form-control" id="message-text" value="${p.password}" name="password">
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <input type="text" class="form-control" id="recipient-name" value="${p.username}" name="username" hidden="">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <input type="submit" class="btn btn-primary" value="Update"> 
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<!-- <script src="profile/"></script> -->