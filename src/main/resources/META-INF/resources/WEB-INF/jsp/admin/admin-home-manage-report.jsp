<%@ include file="../common/header.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
       <link href = "../../assets/css/notification/view-notification-list.css" rel = "stylesheet"/>
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
                            <a class="input-container" onclick=""> Manage account </a>
                        </li>
                        <li style="margin-bottom: 4px;">
                            <a class="input-container" onclick=""> Manage notification </a>
                        </li>
                        <li style="margin-bottom: 4px;">
                            <a class="input-container" onclick=""> Manage report </a>
                        </li>
                        <li style="margin-bottom: 4px;">
                            <a class="input-container" onclick=""> Manage request </a>
                        </li>
                        <li style="margin-bottom: 4px;">
                           <a class="input-container" onclick=""> Manage exercise </a>
                        </li>
                        <li style="margin-bottom: 4px;">
                             <a class="input-container" onclick=""> Manage exercise </a>
                        </li>
                    </ul>

                </div>
            </div>

        <%-- Div này hiển thị report's list khi user click vào "Manage report" button --%>
            <div class="page-wrapper d-flex flex-column align-items-center"
                 style="width: 80%; float: right; background-color: #7c7c7c; padding-top: 70px;">

                <div class="notification-detail d-flex justify-content-center">
                    <div class="d-flex flex-column" style="width: 80%; margin-top: 80px;">

                        <%--Div chứa thanh search--%>
                        <div class="d-flex justify-content-between align-items-center">
                            <nav class="navbar navbar-light"> <%--Search box--%>
                                <div class="container-fluid">
                                    <form class="d-flex">
                                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                        <button class="btn btn-outline-success" type="submit">Search</button>
                                    </form>
                                </div>
                            </nav>
                        </div>

                        <%--Table hiển thị report's list--%>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Reason</th>
                                    <th scope="col">TimeStamp</th>
                                     <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="report" items="${ReportLists}">
                                    <tr>
                                        <th scope="row">${report.id}</th>
                                        <td><div class="text-truncate" style="max-width: 300px;">${report.title}</div></td>
                                        <td>${report.dateTime}</td>
                                        <td><button type="submit" class="btn btn-success" style="height: 50px; width: 110px; background-color: #3c763d;">Remove</button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <%--Phân trang--%>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item disabled">
                                  <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                  <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>

                    </div>
            </div>
       </div>
    </div>
</div>
<%@ include file="../common/script.jspf" %>
