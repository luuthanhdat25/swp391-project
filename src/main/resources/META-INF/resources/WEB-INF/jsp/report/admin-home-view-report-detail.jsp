<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-head.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
</head>

<div class="main-wrapper">
    <div class="header">

        <div class="header-left">
            <a href="index.html" class="logo">
                <img src="/META-INF/resources/assets/img/logo.png" alt="Logo">
            </a>
            <a href="index.html" class="logo logo-small">
                <img src="/META-INF/resources/assets/img/logo-small.png" alt="Logo" width="30" height="30">
            </a>
        </div>

        <div class="menu-toggle">
            <a href="javascript:void(0);" id="toggle_btn">
                <i class="fas fa-bars"></i>
            </a>
        </div>

        <div class="top-nav-search">
            <form>
                <input type="text" class="form-control" placeholder="Search here">
                <button class="btn" type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>

        <ul class="nav user-menu">
            <button class="btn btn-rounded btn-outline-danger"><a href="login">Login</a></button>
            <button class="btn btn-rounded btn-outline-danger"><a href="/registration">Sign up</a></button>
        </ul>

    </div>
    <div>
        <%-- Div này hiển thị report's list khi user click vào "Manage report" button --%>
        <div class="page-wrapper d-flex flex-column align-items-center"
             style="width: 77%; float: right; padding-top: 70px;">

            <div class="notification-detail d-flex justify-content-center ">
                <div class="d-flex flex-column" style="width: 80%; margin-top: 40px;">
                    <form action="manage-report" method="GET">
                        <button type="submit" class="btn btn-warning"
                                style="height: 50px; width: 80px; background-color: #3c763d; margin: 3px 0 3px 0;">
                            Cancel
                        </button>

                    </form>
                    <div class="d-flex justify-content-between shadow p-3 mb-5 bg-body rounded "
                         style="padding: 20px;">
                        <div class="d-flex align-content-center">
                            <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle"
                                 style="width: 100px; height: 100px; margin-right: 20px;" alt="Avatar"/>
                            <div class="d-flex flex-column bd-highlight mb-3 justify-content-center">
                                <h3>${ReportDetail.personalTrainerAccount.fullName}</h3>
                                <div>${ReportDetail.reason}</div>
                                <div>Reported at ${ReportDetail.timeStamp}</div>
                            </div>
                        </div>
                        <div class="d-flex flex-column">
                            <button type="button" class="btn btn-danger" style="margin-bottom: 5px;">Delete</button>
                            <button type="button" class="btn btn-success">View Profile</button>
                        </div>
                    </div>

                    <label style="margin-bottom: 0; margin-top: 0;">Description</label>
                    <div class="shadow p-3 mb-5 bg-body rounded"
                         style="padding: 5px; margin-top: 10px;">${ReportDetail.description}</div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/script.jspf" %>
