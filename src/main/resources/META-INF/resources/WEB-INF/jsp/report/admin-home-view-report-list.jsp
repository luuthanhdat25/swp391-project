<%@ include file="../common/header.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<head>
    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
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
    <div>
        <%-- Div này là một sidebar dùng để hiển thị các button:  Manage account, manage notification ... --%>
        <div class="sidebar" id="sidebar" style="width: 20%; background-color: #adb5bd;">
            <div class="sidebar-inner slimscroll">

                <%--Hiển thị tiêu đề của sidebar và danh sách các manage button--%>
                <p class="h6" style="padding-left: 9px; margin-top: 10px;">Manage</p>
                <ul id="sidebar-menu" class="sidebar-menu" style="padding: 2px 9px 9px 9px;">
                    <li style="margin-bottom: 4px;">
                        <a href="manage-notification" class="input-container" onclick=""> Manage notification </a>
                    </li>
                    <li style="margin-bottom: 4px;">
                        <a class="input-container" onclick="" style="background-color: #d9d9d9;"> Manage report </a>
                    </li>
                    <li style="margin-bottom: 4px;">
                        <a class="input-container" onclick=""> Manage request </a>
                    </li>
                </ul>

            </div>
        </div>

        <%-- Div này hiển thị notification's list khi user click vào "Manage notification" button --%>
        <div class="page-wrapper d-flex flex-column align-items-center"
             style="width: 80%; height: fit-content; float: right; padding: 70px 0 40px 0;">

            <div class="notification-detail d-flex flex-column align-items-center">
                <div style="width: 95%; height: auto; background-color: #FFFFFF;
                                border: 1px solid #4c4c4c; border-radius: 6px;
                                padding: 10px; font-size: 20px; color: #4c4c4c;  text-align: center;">
                    Manage report
                </div>

                <div class="d-flex flex-column" style="width: 94%; margin-top: 50px;">
                    <%--Div chứa thanh search và "add notification" button--%>
                    <form action="manage-report" method="GET" style="width: 50%;">
                        <div class="input-group" style="width: 50%; margin-bottom: 10px;">
                            <input type="text" class="form-control" style="border: 1px solid #4c4c4c;"
                                   placeholder="Enter report's reason" name="reason">
                            <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                        </div>
                    </form>

                    <%--Table hiển thị notification's list--%>
                    <table class="table table-hover">
                        <thead class="table-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Reason</th>
                            <th scope="col">TimeStamp</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="report" items="${ReportLists.content}">
                            <tr class="shadow p-3 mb-5 bg-body rounded" style="height: 30px;">
                                <th scope="row">${ReportLists.content.indexOf(report) + IndexStarting}</th>
                                <td>
                                    <div class="text-truncate" style="width: 430px;">${report.reason}</div>
                                </td>
                                <td class="d-flex"
                                    style="font-style: oblique; width: 140px; border-bottom-width: 0px; color: #3c763d; font-size: 16px;">
                                    <div style="margin-right: 5px;">${report.timeStamp.getHour()}:${report.timeStamp.getMinute()}</div>
                                    <div>${report.timeStamp.getDayOfMonth()}/${report.timeStamp.getMonthValue()}/${report.timeStamp.getYear()}</div>
                                </td>
                                <td>
                                    <div class="d-flex justify-content-between" style="width: 210px;">
                                        <form action="view-report-detail" method="get">
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

                                        <form action="delete-report" method="get">
                                            <input type="hidden" name="deleteReportDetail" value=${report.id}>
                                            <button type="submit" class="btn btn-danger"
                                                    style="height: 40px; width: 110px;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                                     fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
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

                    <%--Phân trang--%>
                    <nav aria-label="Page navigation example" style="height: 20px; margin: 20px 0 20px 0;">
                        <ul class="pagination justify-content-center ">
                            <%
                                int totalPage = (int) request.getAttribute("TotalPage");
                                int currentPage = (int) request.getAttribute("CurrentPage");
                            %>
                            <li class="page-item <%= currentPage - 1 < 1 ? "disabled" : "" %>">
                                <a class="page-link" href="manage-report?papeNo=<%=currentPage - 1%>&reason=${reason}">Previous</a>
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
    <div class="modal fade" id="viewReport" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-centered" style="width: 630px;">
            <div class="modal-content">
                <div class="d-flex justify-content-center" data-backdrop="static">
                    <div style="width: 100%; padding: 20px;">
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
                        <div class="border border-dark"
                             style="padding: 5px; margin-top: 10px;">${ReportDetail.reason}</div>
                        <br><label>Description</label>
                        <div class="border border-dark"
                             style="padding: 5px; margin-top: 10px;">${ReportDetail.description}</div>
                        <br>
                        <div class="d-flex flex-row bd-highlight justify-content-center">
                            <button type="submit" class="btn btn-success" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="../common/script.jspf" %>

