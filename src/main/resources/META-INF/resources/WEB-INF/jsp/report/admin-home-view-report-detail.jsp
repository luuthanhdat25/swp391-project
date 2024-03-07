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
        <div class="sidebar" id="sidebar" style="width: 20%; background-color: #adb5bd;">
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
                    <li style="margin-bottom: 4px;">
                        <a class="input-container" onclick=""> Manage request </a>
                    </li>
                </ul>

            </div>
        </div>

        <%-- Div này hiển thị report's list khi user click vào "Manage report" button --%>
        <div class="page-wrapper d-flex flex-column align-items-center"
             style="width: 80%; float: right; background-color: #7c7c7c; padding-top: 70px;">

            <div class="notification-detail d-flex justify-content-center">
                <div class="d-flex flex-column" style="width: 94%; margin-top: 40px;">
                    <form action="manage-report" method="GET">
                        <button type="submit" class="btn btn-success"
                                style="height: 50px; width: 110px; background-color: #3c763d; margin-bottom: 20px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="19" height=19 fill="currentColor"
                                 class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"></path>
                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"></path>
                            </svg>
                            Cancel
                        </button>
                    </form>

                    <h1 class="container text-center" style="margin-bottom: 25px;">Report detail</h1>
                    <div class="d-flex flex-row bd-highlight justify-content-center border border-dark"
                         style="padding: 10px;">
                        <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle"
                             style="width: 150px; margin-right: 20px;" alt="Avatar"/>
                        <div class="d-flex flex-column bd-highlight mb-3 justify-content-center">
                            <div>Nguyen Van An</div>
                            <div><a href="" class="btn btn-success">View Profile</a></div>
                            <div>Reported at ${ReportDetail.timeStamp}</div>
                        </div>
                    </div>

                    <br><label>Reason</label>
                    <div class="border border-dark" style="padding: 5px; margin-top: 10px;">${ReportDetail.reason}</div>
                    <br><label>Description</label>
                    <div class="border border-dark"
                         style="padding: 5px; margin-top: 10px;">${ReportDetail.description}</div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/script.jspf" %>
