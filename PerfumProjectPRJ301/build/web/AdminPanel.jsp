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
        <link href="https://fonts.googleapis.com/icon?family=Material+Symbols+Outlined" rel="stylesheet">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/admin.css">
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
                        <span class="material-symbols-outlined">home</span>
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
                        <a href="admin" target="">
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
            <main class="main-container">
                <div class="main-title">
                    <p class="font-weight-bold">DASHBOARD</p>
                </div>

                <div class="main-cards">

                    <div class="card">
                        <div class="card-inner">
                            <p class="text-primary">PRODUCTS</p>

                            <span class="material-icons-outlined text-blue">inventory_2</span>
                        </div>

                        <span class="text-primary font-weight-bold">${total}</span>


                    </div>

                    <div class="card">
                        <div class="card-inner">
                            <p class="text-primary">PURCHASE ORDERS</p>
                            <span class="material-icons-outlined text-orange">add_shopping_cart</span>
                        </div>
                        <span class="text-primary font-weight-bold">83</span>
                    </div>

                    <div class="card">
                        <div class="card-inner">
                            <p class="text-primary">SALES ORDERS</p>
                            <span class="material-icons-outlined text-green">shopping_cart</span>
                        </div>
                        <span class="text-primary font-weight-bold">79</span>
                    </div>

                    <div class="card">
                        <div class="card-inner">
                            <p class="text-primary">INVENTORY ALERTS</p>
                            <span class="material-icons-outlined text-red">notification_important</span>
                        </div>
                        <span class="text-primary font-weight-bold">56</span>
                    </div>

                </div>

                <div class="charts">

                    <div class="charts-card">
                        <p class="chart-title">Top 5 Products</p>
                        <div id="bar-chart"></div>
                    </div>

                    <div class="charts-card">
                        <p class="chart-title">Purchase and Sales Orders</p>
                        <div id="area-chart"></div>
                    </div>

                </div>
            </main>
            <!-- End Main -->

        </div>

        <!-- Scripts -->
        <!-- ApexCharts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
        <!-- Custom JS -->
        <script src="js/admin.js"></script>
    </body>
</html>