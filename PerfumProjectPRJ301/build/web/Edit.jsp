<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title" style="width: 1125px;">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
                <div id="editEmployeeModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="edit" method="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Edit Product</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        <a href="manager" style="color: black">&times;</a>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Product ID</label>
                                        <input value="${detail.productID}"name="id" type="text" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label>Product Name</label>
                                        <input value="${detail.productName}" name="name" type="text" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label>Purchase Price</label>
                                        <input value="${detail.purchasePrice}" name="purchaseprice" type="text" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label>Sale Price</label>
                                        <input value="${detail.salePrice}" name="saleprice" type="text" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label>Image</label>
                                        <input value="${detail.image}" name="image" type="text" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="description" class="form-control" required>${detail.description}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Quantity</label>
                                        <input value="${detail.quantity}" name="quantity" type="text" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label>Day To Import</label>
                                        <input value="${detail.lastDayImport}" name="daytoimport" type="text" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label>Category</label>
                                        <select name="category" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${listCate}" var="o">
                                                <option value="${o.cateID}">${o.cateName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-success" value="Update">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>