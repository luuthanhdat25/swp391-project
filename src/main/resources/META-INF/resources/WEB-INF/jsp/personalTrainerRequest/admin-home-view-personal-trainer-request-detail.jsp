<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
</head>

<div class="main-wrapper">
    <div>
        <div class="page-wrapper d-flex flex-column align-items-center"
             style="width: 77%; float: right; background-color: #7c7c7c; padding-top: 70px;">

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
