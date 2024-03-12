<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-head.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<head>
    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
    <link href="../../assets/css/style-table.css" rel="stylesheet"/>
</head>
<body>

<div class="main-wrapper">
    <div class="page-wrapper d-flex flex-column align-items-center"
         style="width: 75%; height: fit-content; float: right; padding: 70px 0 40px 0;">

        <div class="notification-detail d-flex flex-column align-items-center">
            <div class="shadow mb-2 rounded" style="width: 94%; height: fit-content; background-color: #333B59;
                border-radius: 6px; padding: 10px; font-size: 20px; color: #FFFFFF;  text-align: center;
                margin-bottom: 0px;">
                <b>Personal Trainer's request management</b>
            </div>
            <div class="d-flex flex-column" style="width: 94%;">
                <div class="card mb-4" style="background-color: #FFFFFF;">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Personal Trainer's request table
                    </div>
                    <div class="d-flex justify-content-between align-items-center"
                         style="width: 100%; padding: 0 15px 0 15px; margin-top: 2px;" >
                        <form action="manage-personal-trainer-request" method="GET"
                              style="width: 50%; margin-bottom: 0;">
                            <div class="input-group" style="width: 100%;">
                                <input type="text" class="form-control" style="border: 1px solid #4c4c4c;"
                                       placeholder="Enter the title of personal trainer's request" name="title">
                                <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                    <div class="card-body" style="width: 100%;">
                        <table id="datatablesSimple"
                               class="table table-hover table-centered mdi-format-vertical-align-center">
                            <thead class="table-secondary">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">title</th>
                                <th scope="col">Personal Trainer</th>
                                <th scope="col">Status</th>
                                <th scope="col">TimeStamp</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="request" items="${PersonalTrainerRequestList.content}">
                                <tr class="shadow p-3 mb-5 bg-body rounded" style="height: 30px;">
                                    <th class="align-baseline"
                                        scope="row">${PersonalTrainerRequestList.content.indexOf(request) + IndexStarting}</th>
                                    <td class="align-baseline">
                                        <div class="text-truncate"
                                             style="width: 350px; text-align: left;">${request.title}</div>
                                    </td>
                                    <td class="align-baseline">
                                        <img class="rounded-circle"
                                             style="width: 30px; height: 30px; margin-right: 5px;"
                                             src="data:image/jpeg;base64,${request.personalTrainerAccount.account.getAvatarImageAsString()}">
                                    </td>
                                    <td class="align-baseline">
                                            ${request.timeStamp.getHour()}:${request.timeStamp.getMinute()}
                                            ${request.timeStamp.getDayOfMonth()}/${request.timeStamp.getMonthValue()}/${request.timeStamp.getYear()}
                                    </td>
                                    <td class="align-baseline">
                                        <div class="badge ${request.status == 'REJECTED' ? 'badge-danger' : (request.status == 'APPROVED' ? 'badge-success' : 'badge-warning')}">${request.status}</div>
                                    </td>

                                    <td class="align-baseline">
                                        <div class="d-flex justify-content-between"
                                             style="height: fit-content;">
                                            <form action="view-personal-trainer-request-detail" method="get" style="margin-bottom: 0;">
                                                <input type="hidden" name="requestID" value=${request.id}>
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
                                       href="manage-personal-trainer-request?papeNo=<%=currentPage - 1%>&title=${title}">Previous</a>
                                </li>
                                <% for (int i = currentPage; i <= Math.min(totalPage, currentPage + 3); i++) { %>
                                <li class="page-item <%= i == currentPage ? "disabled" : "" %>">
                                    <a class="page-link"
                                       href="manage-personal-trainer-request?papeNo=<%=i%>&title=${title}"><%=i%>
                                    </a>
                                </li>
                                <% } %>
                                <li class="page-item <%= currentPage + 1 > totalPage ? "disabled" : "" %>">
                                    <a class="page-link"
                                       href="manage-personal-trainer-request?papeNo=<%=currentPage + 1%>&title=${title}">Next</a>
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

