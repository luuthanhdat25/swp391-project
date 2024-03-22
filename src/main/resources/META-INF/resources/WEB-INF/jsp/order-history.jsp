<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<link rel="stylesheet" href="../../assets/css/styleBook.css">--%>
<%--    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>--%>
<%--    <link href="../../assets/css/style-table.css" rel="stylesheet"/>--%>
</head>
<style>
    .img-thumbnail {
        width: 50px; /* Đặt kích thước của hình ảnh */
        height: 50px;
        border-radius: 50%; /* Làm cho hình ảnh tròn */
    }
</style>
<script !src="">
    $(document).ready(function () {
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
                        <h3 class="page-title">Order Request</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
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
                            <c:if test="${not empty OrderHistory}">
                                <table>
                                    <thead>
                                    <tr>
                                        <th style="text-align: left;">Personal Trainer</th>
                                        <th style="text-align: center;">Order Date</th>
                                        <th style="text-align: center;">Status</th>
                                        <th style="text-align: center;">Net Amount</th>
                                        <th style="text-align: center;">Order Detail</th>
                                        <th style="text-align: center;">payment</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="order" items="${OrderHistory}">
                                        <tr>
                                            <td style="text-align: left;">
                                                <img class="img-thumbnail" src="data:image/png;base64,${order.gymer.account.getAvatarImageAsString()}" alt="Customer image Image">
                                                    ${order.personalTrainer.getAccount().getFullName()}
                                            </td>
                                            <td>${order.datetime_start}</td>
                                            <td>
                                                <div class="badge ${order.getStatusString() == 'Pending' ? 'badge-danger' : (order.getStatusString() == 'OnDoing' ? 'badge-success' : 'badge-warning')}">${order.getStatusString()}</div>
                                            </td>
                                            <td>${order.total_of_money} VND</td>
                                            <td><a href="/gymer-orderdetail?order_id=${order.orderId}" class="view"
                                                   title="View Details" data-toggle="tooltip"><i class="fas fa-address-book" style='font-size:24px'></i></a></td>
                                            <td>
                                                <c:if test="">
                                                    <a href="/pay?amountPay=${order.total_of_money}&orderID=${order.orderId}" class="pay" title="Pay Now" data-toggle="tooltip">
                                                        <i class="fas fa-money-bill" style="font-size:24px"></i>
                                                    </a>
                                                </c:if>
                                                <c:choose>
                                                    <c:when test="${order.status == 'Accepted'}">
                                                        <a href="/pay?amountPay=${order.total_of_money}&orderID=${order.orderId}" class="pay" title="Pay Now" data-toggle="tooltip">
                                                            <i class="fas fa-money-bill" style="font-size:24px"></i>
                                                        </a>
                                                    </c:when>
                                                    <c:when test="${order.status == 'Pending'}">
                                                        <span class="fas fa-times"></span>

                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="fas fa-check"></span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>

                            <c:if test="${empty OrderHistory}">
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

<%@ include file="common/script.jspf" %>
</body>
