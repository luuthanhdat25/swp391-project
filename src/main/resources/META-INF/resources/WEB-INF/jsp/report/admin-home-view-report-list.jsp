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
                 style="width: 80%; height: fit-content; float: right; padding: 70px 0 40px 0;">

                <div class="notification-detail d-flex flex-column align-items-center">
                    <div style="width: 95%; height: auto; background-color: #FFFFFF;
                                border: 1px solid #4c4c4c; border-radius: 6px;
                                padding: 10px; font-size: 20px; color: #4c4c4c;  text-align: center;">
                        Manage notification
                    </div>

                    <div class="d-flex flex-column" style="width: 94%; margin-top: 50px;">

                        <%--Div chứa thanh search và "add notification" button--%>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="input-group" style="width: 50%;">
                                <input type="text" class="form-control" style="border: 1px solid #4c4c4c;" placeholder="Enter notification's title">
                                <button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button>
                            </div>

                            <form action="view-creating-notification-detail" method="GET"> <%--Add notification" button--%>
                                <button type="submit" style="height: 50px; width: 164px; background-color: #3c763d;" class="btn btn-success">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
                                      <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0"/>
                                    </svg>  add notification
                                </button>
                            </form>
                        </div>

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
                        <nav aria-label="Page navigation example" style = "height: 20px; margin: 20px 0 20px 0;">
                           <ul class="pagination justify-content-center ">
                             <%
                                int totalPage = (int)request.getAttribute("TotalPage");
                                int currentPage = (int)request.getAttribute("CurrentPage");
                             %>
                             <li class="page-item <%= currentPage - 1 < 1 ? "disabled" : "" %>">
                                <a class="page-link" href="view-report-list-and-detail?papeNo=<%=currentPage - 1%>">Previous</a>
                             </li>
                             <% for (int i = currentPage; i <= Math.min(totalPage, currentPage + 3); i++) { %>
                                <li class="page-item <%= i == currentPage ? "disabled" : "" %>">
                                   <a class="page-link" href="view-report-list-and-detail?papeNo=<%=i%>"><%=i%></a>
                                </li>
                             <% } %>
                             <li class="page-item <%= currentPage + 1 > totalPage ? "disabled" : "" %>">
                                <a class="page-link" href="view-report-list-and-detail?papeNo=<%=currentPage + 1%>">Next</a>
                             </li>
                           </ul>
                        </nav>

                    </div>
            </div>
       </div>
    </div>
</div>
<%@ include file="../common/script.jspf" %>
