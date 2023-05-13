<%-- 
    Document   : header
    Created on : Mar 7, 2023, 11:30:09 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <a href="#" target="_blank">
                <span class="material-icons-outlined">dashboard</span> Dashboard
            </a>
        </li>
        <li class="sidebar-list-item">
            <a href="manager" target="">
                <span class="material-icons-outlined">inventory_2</span> Products
            </a>
        </li>
        <li class="sidebar-list-item">
            <a href="#" target="_blank">
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
            <a href="#" target="_blank">
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