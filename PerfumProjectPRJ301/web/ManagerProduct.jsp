<%-- 
Document   : ManagerProduct
Created on : Dec 28, 2020, 5:19:02 PM
Author     : trinh
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Admin Dashboard</title>

        <!-- Montserrat Font -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Symbols+Outlined" rel="stylesheet">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/manager.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <div class="grid-container">

            <!-- Header -->
            <header class="header">
                <div class="menu-icon" onclick="openSidebar()">
                    <span class="material-icons-outlined">menu</span>
                </div>
                <div class="header-left">
                    <a href="home">
                        <span class="material-symbols-outlined" style="color: black">home</span>
                    </a>   
                </div>
                <div class="header-right">
                    <c:if test="${sessionScope.account.getRole() == 1}">
                        <h5>Xin Chào ${sessionScope.account.username}</h5>
                    </c:if>
                </div>
                <span class="material-icons-outlined">account_circle</span>
            </header>
            <!-- End Header -->

            <!-- Sidebar -->
            <aside id="sidebar">
                <div class="sidebar-title">
                    <div class="sidebar-brand">
                        <span class="material-symbols-outlined">
                            admin_panel_settings
                        </span> Admin Panel
                    </div>
                    <span class="material-icons-outlined" onclick="closeSidebar()">close</span>
                </div>

                <ul class="sidebar-list">
                    <li class="sidebar-list-item">
                        <a href="admin  " target="">
                            <span class="material-icons-outlined">dashboard</span> Dashboard
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="manager" target="">
                            <span class="material-icons-outlined">inventory_2</span> Products
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="inventory" target="">
                            <span class="material-icons-outlined">fact_check</span> Inventory
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="#" target="_blank">
                            <span class="material-icons-outlined">add_shopping_cart</span> Purchase Orders
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="#" target="_blank">
                            <span class="material-icons-outlined">shopping_cart</span> Sales Orders
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="userctl" target="">
                            <span class="material-icons-outlined">manage_accounts</span> Account Manager
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="logout" target="">
                            <span class="material-icons-outlined">logout</span> Log Out
                        </a> 
                    </li>
                </ul>
            </aside>
            <!-- End Sidebar -->

            <!-- Main -->
            <div class="containerr">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="menu">
                            <div >
                                <h2 style="width: 100%;">Manage <b>Product</b></h2>
                            </div>
                            <div class="col-sm-6 add">
                                <a href="#exampleModal"  class="btn btn-success"  data-bs-toggle="modal" data-bs-target="#exampleModal" ><i style="width: 20px; font-size: 20px;" class="fa-solid fa-circle-plus"></i> <span>Add New Product</span></a>						
                            </div>
                        </div>
                    </div>

                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listPage}" var="o">
                                <tr>
                                    <td>${o.productID}</td>
                                    <td>${o.productName}</td>
                                    <td>
                                        <img width="150px" src="${o.image}">
                                    </td>
                                    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${o.salePrice}"/> VND</td>
                                    <td>
                                        <a href="edit?pid=${o.productID}" class="edit" data-toggle="modal"><span class="material-symbols-outlined" title="edit">edit</a>
                                        <a href="delete?pid=${o.productID}" class="delete" data-toggle="modal"><span class="material-symbols-outlined" title="delete">delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix">

                        <div class="clearfix">

                            <div class="hint-text">Showing <b>5</b> out of <b>40</b> entries</div>

                            <ul class="pagination">
                                <li class="page-item"><a href="#">Previous</a></li>
                                    <c:forEach begin="1" end="${endP}" var="i">
                                    <li class="page-item ${tag == i?"active":""}"><a href="manager?index=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                <li class="page-item"><a href="#">Next</a></li>

                            </ul>
                        </div>

                    </div>
                    <!-- Edit Modal HTML -->


                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Add New Product</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="modal-body">					
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input name="name" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Purchase Price</label>
                                                <input name="purchaseprice" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Sale Price</label>
                                                <input name="saleprice" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Image</label>
                                                <input name="image" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Description</label>
                                                <textarea name="description" class="form-control" required></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>Quantity</label>
                                                <input name="quantity" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Day To Import</label>
                                                <input name="daytoimport" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Category</label>
                                                <select name="category" class="form-select" aria-label="Default select example">
                                                    <c:forEach items="${listCate}" var="o">
                                                        <option value="${o.cateID}">${o.cateName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                    </form>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Scripts -->
                        <!-- ApexCharts -->
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
                        <!-- Custom JS -->
                        <script src="./js/manager.js"></script>
                        </body>
                        </html>