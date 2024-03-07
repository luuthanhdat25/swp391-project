<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="../../assets/css/styleBook.css">
<style>
    body {
        color: #566787;
        background: #f5f5f5;
        font-family: 'Varela Round', sans-serif;
        font-size: 13px;
    }
    .table-responsive {
        margin: 30px 0;
    }
    .table-wrapper {
        min-width: 1000px;
        background: #fff;
        padding: 20px 25px;
        border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
    .table-wrapper .btn {
        float: right;
        color: #333;
        background-color: #fff;
        border-radius: 3px;
        border: none;
        outline: none !important;
        margin-left: 10px;
    }
    .table-wrapper .btn:hover {
        color: #333;
        background: #f2f2f2;
    }
    .table-wrapper .btn.btn-primary {
        color: #fff;
        background: #03A9F4;
    }
    .table-wrapper .btn.btn-primary:hover {
        background: #03a3e7;
    }
    .table-title .btn {
        font-size: 13px;
        border: none;
    }
    .table-title .btn i {
        float: left;
        font-size: 21px;
        margin-right: 5px;
    }
    .table-title .btn span {
        float: left;
        margin-top: 2px;
    }
    .table-title {
        color: #fff;
        background: #4b5366;
        padding: 16px 25px;
        margin: -20px -25px 10px;
        border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
        margin: 5px 0 0;
        font-size: 24px;
    }
    .show-entries select.form-control {
        width: 60px;
        margin: 0 5px;
    }
    .table-filter .filter-group {
        float: right;
        margin-left: 15px;
    }
    .table-filter input, .table-filter select {
        height: 34px;
        border-radius: 3px;
        border-color: #ddd;
        box-shadow: none;
    }
    .table-filter {
        padding: 5px 0 15px;
        border-bottom: 1px solid #e9e9e9;
        margin-bottom: 5px;
    }
    .table-filter .btn {
        height: 34px;
    }
    .table-filter label {
        font-weight: normal;
        margin-left: 10px;
    }
    .table-filter select, .table-filter input {
        display: inline-block;
        margin-left: 5px;
    }
    .table-filter input {
        width: 200px;
        display: inline-block;
    }
    .filter-group select.form-control {
        width: 110px;
    }
    .filter-icon {
        float: right;
        margin-top: 7px;
    }
    .filter-icon i {
        font-size: 18px;
        opacity: 0.7;
    }
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
        padding: 12px 15px;
        vertical-align: middle;
    }
    table.table tr th:first-child {
        width: 60px;
    }
    table.table tr th:last-child {
        width: 80px;
    }
    table.table-striped tbody tr:nth-of-type(odd) {
        background-color: #fcfcfc;
    }
    table.table-striped.table-hover tbody tr:hover {
        background: #f5f5f5;
    }
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }
    table.table td a {
        font-weight: bold;
        color: #566787;
        display: inline-block;
        text-decoration: none;
    }
    table.table td a:hover {
        color: #2196F3;
    }
    table.table td a.view {
        width: 30px;
        height: 30px;
        color: #2196F3;
        border: 2px solid;
        border-radius: 30px;
        text-align: center;
    }
    table.table td a.view i {
        font-size: 22px;
        margin: 2px 0 0 1px;
    }
    table.table .avatar {
        border-radius: 50%;
        vertical-align: middle;
        margin-right: 10px;
    }
    .status {
        font-size: 30px;
        margin: 2px 2px 0 0;
        display: inline-block;
        vertical-align: middle;
        line-height: 10px;
    }
    .text-success {
        color: #10c469;
    }
    .text-info {
        color: #62c9e8;
    }
    .text-warning {
        color: #FFC107;
    }
    .text-danger {
        color: #ff5b5b;
    }
    .pagination {
        float: right;
        margin: 0 0 5px;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }
    .pagination li.active a {
        background: #03A9F4;
    }
    .pagination li.active a:hover {
        background: #0397d6;
    }
    .pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
    .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
    }
</style>
<script !src="">
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
<body>

<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content container-fluid">

            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Book Request</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Booking</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Request form</h5>
                        </div>
                        <div class="card-body">
                            <c:if test="${not empty OrderRequestList}">
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Gymer Name</th>
                                        <th>Location</th>
                                        <th>Order Date</th>
                                        <th>Status</th>
                                        <th>Net Amount</th>
                                        <th>Order Detail</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="order" items="${OrderRequestList}">
                                        <tr>
                                            <td> </td>
                                            <td><a href="#"><img src="/examples/images/avatar/1.jpg" class="avatar" alt="Avatar">
                                                    ${order.gymer.getAccount().getFullName()}</a></td>
                                            <td>${order.gymer.getAccount().getAddress()}</td>
                                            <td>${order.datetime_start}</td>
<%--                                            <td><c:if test="${order.status == 'Pending'}">--%>
                                                <span class="status text-danger">&bull;</span>
<%--                                            </c:if>--%>
<%--                                                <c:if test="${order.status == 'OnDoing'}">--%>
<%--                                                    <span class="status text-info">Ongoing</span>--%>
<%--                                                </c:if>--%>
<%--                                                <c:if test="${order.status == 'Expire'}">--%>
<%--                                                    <span class="status text-warning">&bull;</span>--%>
<%--                                                    <span>Expired</span>--%>
<%--                                                </c:if>--%>
<%--                                                <c:if test="${order.status == null}">--%>
<%--                                                    <span class="status text-warning">&bull;</span>--%>
<%--                                                    <span>Waiting</span>--%>
<%--                                                </c:if></td>--%>
                                            <td>$${order.total_of_money}</td>
                                            <td><a href="/Order-Request?order_id=${order.orderId}" class="view" title="View Details" data-toggle="tooltip"><i class="material-icons">&#xE5C8;</i></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>

                            <c:if test="${empty OrderRequestList}">
                                <p>No Order yet.</p>
                            </c:if>


                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <p>Copyright © 2022 Dreamguys.</p>
        </footer>

    </div>

</div>

<script src="../../theme2/js/scriptBook.js"></script>
<script src="../../theme2/js/jquery-3.6.0.min.js"></script>
<script src="../../theme2/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../theme2/js/feather.min.js"></script>
<script src="../../theme2/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../../theme2/plugins/apexchart/apexcharts.min.js"></script>
<script src="../../theme2/plugins/apexchart/chart-data.js"></script>
<script src="../../theme2/js/script.js"></script>
</body>

</html>