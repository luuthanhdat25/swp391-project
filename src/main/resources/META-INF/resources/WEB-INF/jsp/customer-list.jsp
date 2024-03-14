<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
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
                        <div class="people-nearby flex-wrap">
                            <c:set var="rowCount" value="0" />
                            <c:forEach var="customer" items="${OrderList}" varStatus="loopStatus">
                                <c:set var="rowCount" value="${rowCount + 1}" />
                                <div class="col-md-6 mb-4"> <!-- Added mb-4 for margin-bottom -->
                                    <div class="panel my-panel">
                                        <div class="panel-body ">
                                            <div class="row">
                                                <div class="col-md-2 d-flex align-items-center">
                                                    <div class="pull-left">
                                                        <img class="thumb-lg img-circle bx-s" src="${c.image}" alt="">
                                                    </div>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="d-flex align-items-center justify-content-between">
                                                        <div class="info">
                                                            <h4>${customer.getGymer().getAccount().getFullName()}</h4>
                                                            <p class="text-muted">Weight ${customer.getGymer().getWeight()}</p>
                                                            <p class="text-muted">Height ${customer.getGymer().getHeight()}</p>
                                                        </div>
                                                        <div class="btn-group-sm">
                                                            <a href="#" class="btn btn-success tooltips"
                                                               data-placement="top" data-toggle="tooltip"
                                                               data-original-title="Edit">
                                                                <i class="fa fa-pencil"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Add a line break after every second iteration -->
                                <c:if test="${rowCount % 2 == 0}">
                                    <div class="w-100 d-md-none"></div> <!-- For extra small and small devices -->
                                    <div class="w-100 d-none d-md-block d-lg-none"></div> <!-- For medium devices -->
                                </c:if>
                            </c:forEach>
                        </div>

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

