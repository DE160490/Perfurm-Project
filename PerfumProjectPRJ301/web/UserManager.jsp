<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/usermanager.css">

        <link href="https://fonts.googleapis.com/icon?family=Material+Symbols+Outlined" rel="stylesheet">
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
                            <span class="material-symbols-outlined">manage_accounts</span> Account Manager
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="#" target="_blank">
                            <span class="material-icons-outlined">settings</span> Settings
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
                                <h2 style="width: 100%;">Manage <b>Users</b></h2>
                            </div>
                        </div>
                    </div>

                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listU}" var="o">
                                <tr>
                                    <td>${o.userID}</td>
                                    <td>${o.name}</td>
                                    <td>${o.address}</td>                               
                                    <td>${o.phone}</td>
                                    <c:if test="${o.role == 0}">
                                        <td>User</td>
                                    </c:if>
                                    <c:if test="${o.role == 1}">
                                        <td>Admin</td>
                                    </c:if>
                                    
                                    <td>
                                        <a href="" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>


                        </tbody>
                    </table>

                    <!-- ApexCharts -->
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
                    <!-- Custom JS -->
                    <script src="./js/manager.js"></script>
                    </body>
                    </html>