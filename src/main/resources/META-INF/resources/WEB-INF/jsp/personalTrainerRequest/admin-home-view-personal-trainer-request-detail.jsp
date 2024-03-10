<%@ include file="../common/header.jspf" %>
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
        <%-- Div này là một sidebar dùng để hiển thị các button:  Manage account, manage notification ... --%>
        <div class="sidebar" id="sidebar" style="width: 20%; background-color: #FFFFFF;">
            <div class="sidebar-inner slimscroll">

                <%--Hiển thị tiêu đề của sidebar và danh sách các manage button--%>
                <p class="h6" style="padding-left: 9px; margin-top: 10px;">Manage</p>
                <ul id="sidebar-menu" class="sidebar-menu" style="padding: 2px 9px 9px 9px;">
                    <li style="margin-bottom: 4px;">
                        <a class="input-container" style="background-color: #d9d9d9;" onclick=""> Manage
                            notification </a>
                    </li>
                    <li style="margin-bottom: 4px;">
                        <a href="manage-report" class="input-container" onclick=""> Manage report </a>
                    </li>
                </ul>

            </div>
        </div>

        <%-- Div này hiển thị report's list khi user click vào "Manage report" button --%>
        <div class="page-wrapper d-flex flex-column align-items-center"
             style="width: 80%; float: right; background-color: #7c7c7c; padding-top: 70px;">

            <div class="notification-detail d-flex justify-content-center ">
                <div class="d-flex flex-column" style="width: 94%; margin-top: 40px;">
                    <form action="manage-personal-trainer-request" method="GET">
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
                                <h3>${RequestDetail.personalTrainerAccount.fullName}</h3>
                                <div>${RequestDetail.title}</div>
                                <div>Send at ${RequestDetail.timeStamp}</div>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${RequestDetail.status eq 'PENDING'}">
                                <div class="d-flex justify-content-between align-content-center">
                                    <form action="reject-personal-trainer-request" method="get">
                                        <input type="hidden" name="requestID" value="${RequestDetail.id}">
                                        <button type="submit" class="btn btn-danger"
                                                style="margin-right: 5px; height: fit-content;">REJECT
                                        </button>
                                    </form>
                                    <form action="approve-personal-trainer-request" method="get">
                                        <input type="hidden" name="requestID" value="${RequestDetail.id}">
                                        <button type="submit" class="btn btn-success" style="height: fit-content;">
                                            APPROVE
                                        </button>
                                    </form>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="badge bg-secondary" style="height: fit-content;">${RequestDetail.status}</div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <label style="margin-bottom: 0; margin-top: 0;">Content</label>
                    <div class="shadow p-3 mb-5 bg-body rounded"
                         style="padding: 5px; margin-top: 10px; height: 300px;">${RequestDetail.content}</div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%@ include file="../common/script.jspf" %>
