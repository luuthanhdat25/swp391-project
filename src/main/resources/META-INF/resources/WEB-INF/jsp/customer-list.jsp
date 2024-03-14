<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    .img-thumbnail {
        width: 50px; /* Đặt kích thước của hình ảnh */
        height: 50px;
        border-radius: 50%; /* Làm cho hình ảnh tròn */
    }
    body {
        margin-top: 20px;
        background-color: #edf0f0;
    }

    .btn-primary,
    .btn-primary:hover,
    .btn-primary:focus,
    .btn-primary:active,
    .btn-primary.active,
    .btn-primary.focus,
    .btn-primary:active,
    .btn-primary:focus,
    .btn-primary:hover,
    .open > .dropdown-toggle.btn-primary {
        background-color: #3bc0c3;
        border: 1px solid #3bc0c3;
    }

    .p-t-10 {
        padding-top: 10px !important;
    }

    .media-main a.pull-left {
        width: 100px;
    }

    .thumb-lg {
        height: 84px;
        width: 84px;
    }

    .media-main .info {
        overflow: hidden;
        color: #000;
    }

    .media-main .info h4 {
        padding-top: 10px;
        margin-bottom: 5px;
    }

    .social-links li a {
        background: #EFF0F4;
        width: 30px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        display: inline-block;
        /*border-radius: 50%;*/
        -webkit-border-radius: 50%;
        color: #7A7676;
    }
    .my-panel {
        margin: 30px; /* Adjust the value according to your preference */
        border: 1px solid #ccc; /* Add a 1px solid border with a light gray color */
        border-radius: 15px;
        padding: 20px;
    }
</style>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="customer container mt-5">
                <div class="row justify-content-center">
                    <div class="card ">
                        <div class="card-header">
                            <h5 class="card-title">My Customer</h5>
                        </div>
                        <c:if test="${not empty OrderList}">
                            <table>
                                <thead>
                                <tr>

                                    <th style="text-align: left;">Name</th>
                                    <th style="text-align: center;">Goal</th>
                                    <th style="text-align: center;">Point body</th>
                                    <th style="text-align: center;">Schedule Detail</th>
                                    <th style="text-align: center;">Order Detail</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="order" items="${OrderList}">
                                    <tr>
                                        <td style="text-align: left;">
                                            <img class="img-thumbnail" src="data:image/png;base64,${order.gymer.account.getAvatarImageAsString()}" alt="Customer image Image">
                                                ${order.gymer.getAccount().getFullName()}
                                        </td>
                                        <td >
                                            ${order.title}
                                        </td>
                                        <td><p class="text-muted">Weight ${order.getGymer().getWeight()}</p>
                                            <p class="text-muted">Height ${order.getGymer().getHeight()}</p></td>
                                        <td><a href="/view-personal-schedule?GymerID=${order.gymer.getGymerId()}" class="view"
                                               title="View Schedue Details" data-toggle="tooltip"><i class="fas fa-calendar-alt" style='font-size:24px'></i></a></td>

                                        <td><a href="/Order-Request?order_id=${order.orderId}" class="view"
                                               title="View Order Details" data-toggle="tooltip"><i class="fas fa-address-book" style='font-size:24px'></i></a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${empty OrderList}">
                            <p>No Order yet.</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>$(function () {
    $("a[data-toggle='tooltip']").tooltip();
});
</script>
<script src="../../assets/js/jquery-3.6.0.min.js"></script>

<script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="../../assets/js/feather.min.js"></script>

<script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="../../assets/plugins/select2/js/select2.min.js"></script>

<script src="../../assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../assets/plugins/datatables/datatables.min.js"></script>

<script src="../../assets/plugins/moment/moment.min.js"></script>
<script src="../../assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="../../assets/js/script.js"></script>
</body>

