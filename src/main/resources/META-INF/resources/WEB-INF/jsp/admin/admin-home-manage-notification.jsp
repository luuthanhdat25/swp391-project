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

        <%-- Div này hiển thị notification's list khi user click vào "Manage notification" button --%>
            <div class="page-wrapper d-flex flex-column align-items-center"
                 style="width: 80%; float: right; background-color: #7c7c7c; padding-top: 70px;">

                <div class="notification-detail d-flex justify-content-center">
                    <div class="d-flex flex-column" style="width: 80%; margin-top: 80px;">

                        <%--Div chứa thanh search và "add notification" button--%>
                        <div class="d-flex justify-content-between align-items-center">
                            <nav class="navbar navbar-light"> <%--Search box--%>
                                <div class="container-fluid">
                                    <form class="d-flex">
                                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                        <button class="btn btn-outline-success" type="submit">Search</button>
                                    </form>
                                </div>
                            </nav>
                            <form action="view-creating-notification-detail" method="GET"> " <%--Add notification" button--%>
                                <button type="submit" style="height: 50px; width: 180px; background-color: #3c763d;" class="btn btn-success">Add Notification</button>
                            </form>
                        </div>

                        <%--Table hiển thị notification's list--%>
                        <table class="table table-hover">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">TimeStamp</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="notification" items="${NotificationList}" varStatus="loop">
                                    <tr>
                                        <th scope="row">${loop.index + 1}</th>
                                        <td><div class="text-truncate" style="max-width: 300px;">${notification.title}</div></td>
                                        <td class="d-flex justify-content-between" style="font-style: italic; width: 150px;">
                                            <div>${notification.timeStamp.getHour()}:${notification.timeStamp.getMinute()}</div>
                                            <div>${notification.timeStamp.getDayOfMonth()}/${notification.timeStamp.getMonthValue()}/${notification.timeStamp.getYear()}</div>
                                        </td>
                                        <td>
                                            <button type="submit" class="btn btn-danger" style="height: 40px; width: 100px;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="19" height=19 fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"></path>
                                                  <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"></path>
                                                </svg>
                                                Remove
                                            </button>
                                        </td>
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
