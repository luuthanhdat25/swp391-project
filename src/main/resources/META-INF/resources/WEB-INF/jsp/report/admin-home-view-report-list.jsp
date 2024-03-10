<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<head>
    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
    <link href="../../assets/css/style-table.css" rel="stylesheet"/>
</head>

<body>

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

    <div class="page-wrapper d-flex flex-column align-items-center"
         style="width: 77%; height: fit-content; float: right; padding: 70px 0 40px 0;">

        <div class="notification-detail d-flex flex-column align-items-center">
            <div class="shadow p-3 mb-5 bg-body rounded" style="width: 95%; height: fit-content; background-color: #e4e4e4;
                border-radius: 6px; padding: 10px; font-size: 20px; color: #4c4c4c;  text-align: center;
                margin-bottom: 0px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"
                     fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16"
                     style="margin-right: 3px; ">
                    <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6"/>
                </svg>
                <b>Report management</b>
            </div>
            <div class="d-flex flex-column" style="width: 94%;">
                <div class="card mb-4" style="background-color: #FFFFFF;">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Report table
                    </div>
                    <div class="d-flex justify-content-between align-items-center"
                         style="width: 100%; padding: 0 15px 0 15px;">
                        <form action="manage-report" method="GET" style="width: 50%; margin-bottom: 0;">
                            <div class="input-group" style="width: 100%;">

                                <input type="text" class="form-control" style="border: 1px solid #4c4c4c;"
                                       placeholder="Enter report's reason" name="title">
                                <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                    <div class="card-body" style="width: 100%;">
                        <table id="datatablesSimple" class="table table-hover">
                            <thead class="table-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Reason</th>
                                <th scope="col">Reporter</th>
                                <th scope="col">TimeStamp</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="report" items="${ReportLists.content}">
                                <tr class="shadow p-3 mb-5 bg-body rounded" style="height: 30px;">
                                    <th scope="row">${ReportLists.content.indexOf(report) + IndexStarting}</th>
                                    <td>
                                        <div class="d-flex" style="text-align: left;">
                                            <img class="rounded-circle"
                                                 style="width: 30px; height: 30px; margin-right: 5px;"
                                                 src="https://png.pngtree.com/png-vector/20190710/ourlarge/pngtree-user-vector-avatar-png-image_1541962.jpg"/>
                                            <div class="text-truncate" style="width: 430px;">${report.reason}</div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-flex">
                                            <img class="rounded-circle"
                                                 style="width: 30px; height: 30px; margin-right: 5px;"
                                                 src="https://png.pngtree.com/png-vector/20190710/ourlarge/pngtree-user-vector-avatar-png-image_1541962.jpg"/>
                                        </div>
                                    </td>
                                    <td>
                                            ${report.timeStamp.getHour()}:${report.timeStamp.getMinute()}
                                            ${report.timeStamp.getDayOfMonth()}/${report.timeStamp.getMonthValue()}/${report.timeStamp.getYear()}
                                    </td>
                                    <td>
                                        <div class="d-flex justify-content-between"
                                             style="width: 210px; height: fit-content;">
                                            <form action="view-report-detail" method="get" style="margin-bottom: 0;">
                                                <input type="hidden" name="reportID" value=${report.id}>
                                                <button type="submit" class="btn btn-info"
                                                        style="height: 40px; width: 90px; color: #FFFFFF;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                                         fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                                                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                                                    </svg>
                                                    view
                                                </button>
                                            </form>

                                            <form action="delete-report" method="get" style="margin-bottom: 0;">
                                                <input type="hidden" name="deleteReportDetail" value=${report.id}>
                                                <button type="submit" class="btn btn-danger"
                                                        style="height: 40px; width: 110px;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                                         fill="currentColor" class="bi bi-trash3-fill"
                                                         viewBox="0 0 16 16">
                                                        <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"/>
                                                    </svg>
                                                    remove
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <nav aria-label="Page navigation example" style="height: 20px; margin: 20px 0 20px 0;">
                            <ul class="pagination justify-content-center ">
                                <%
                                    int totalPage = (int) request.getAttribute("TotalPage");
                                    int currentPage = (int) request.getAttribute("CurrentPage");
                                %>
                                <li class="page-item <%= currentPage - 1 < 1 ? "disabled" : "" %>">
                                    <a class="page-link"
                                       href="manage-report?papeNo=<%=currentPage - 1%>&reason=${reason}">Previous</a>
                                </li>
                                <% for (int i = currentPage; i <= Math.min(totalPage, currentPage + 3); i++) { %>
                                <li class="page-item <%= i == currentPage ? "disabled" : "" %>">
                                    <a class="page-link" href="manage-report?papeNo=<%=i%>&reason=${reason}"><%=i%>
                                    </a>
                                </li>
                                <% } %>
                                <li class="page-item <%= currentPage + 1 > totalPage ? "disabled" : "" %>">
                                    <a class="page-link"
                                       href="manage-report?papeNo=<%=currentPage + 1%>&reason=${reason}">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="../common/script.jspf" %>

