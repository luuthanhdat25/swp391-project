<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet"/>
    <title>Insert title here</title>
</head>
<body>
<div class="d-flex justify-content-center">
    <div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" style="width: 630px;">
            <div class="modal-content">
                <%@include file="../../../WEB-INF/jsp/report/AddReport.jsp" %>
            </div>
        </div>
    </div>

    <div class="modal fade" id="viewReportDetail" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" style="width: 630px;">
            <div class="modal-content">
                <%@include file="../../../WEB-INF/jsp/report/ViewReportDetail.jsp" %>
            </div>
        </div>
    </div>

    <div style="width: 50%; height: 430px; padding: 10px; margin-top: 100px;" class="border border-dark">
        <button type="submit" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">Add Report
        </button>
        <input type="hidden" id="viewReport" class="btn btn-success"
                <c:if test="${ReportDetail ne null}">
                    data-bs-toggle="modal" data-bs-target="#viewReportDetail"
                </c:if>/>

        <div style="height: 310px;">
            <c:forEach items="${Reports.content}" var="report">
                <a href="view-report-list-and-detail?reportId=${report.getId()}&papeNo=${CurrentPage}"
                   style="text-decoration: none; color: inherit;">
                    <div class="d-flex flex-row bd-highlight justify-content-between border border-dark"
                         style="padding: 5px; margin-top: 10px;">
                        <div class="d-flex flex-row bd-highlight justify-content-between align-items-center">
                            <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle"
                                 style="width: 30px" alt="Avatar"/>
                            <label class="d-inline-block text-truncate"
                                   style="max-width: 300px; height: 27px; margin-left: 10px;">
                                    ${report.getTitle()}
                            </label>
                        </div>
                        <div class="d-flex flex-row bd-highlight justify-content-between align-items-center">
                            <em style="display: inline-block; " class="align-items-center">${report.getDateTime()}</em>
                            <form action="delete-report" method="get">
                                <input type="hidden" name="id" value="${report.getId()}">
                                <button style="margin-left: 10px;" type="submit" class="btn btn-success">Delete</button>
                            </form>
                        </div>
                    </div>
                </a>
            </c:forEach><br>
        </div>
        <nav aria-label="Page navigation example" style="height: 20px;">
            <ul class="pagination justify-content-center ">
                <%
                    int totalPage = (int) request.getAttribute("TotalPage");
                    int currentPage = (int) request.getAttribute("CurrentPage");
                %>
                <li class="page-item <%= currentPage - 1 < 1 ? "disabled" : "" %>">
                    <a class="page-link" href="view-report-list-and-detail?papeNo=<%=currentPage - 1%>">Previous</a>
                </li>
                <% for (int i = currentPage; i <= Math.min(totalPage, currentPage + 3); i++) { %>
                <li class="page-item <%= i == currentPage ? "disabled" : "" %>">
                    <a class="page-link" href="view-report-list-and-detail?papeNo=<%=i%>"><%=i%>
                    </a>
                </li>
                <% } %>
                <li class="page-item <%= currentPage + 1 > totalPage ? "disabled" : "" %>">
                    <a class="page-link" href="view-report-list-and-detail?papeNo=<%=currentPage + 1%>">Next</a>
                </li>
            </ul>
        </nav>
    </div>
</div>
</body>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var viewReportDetail = document.getElementById('viewReport');
        viewReportDetail.click();
    });
</script>
<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</html>