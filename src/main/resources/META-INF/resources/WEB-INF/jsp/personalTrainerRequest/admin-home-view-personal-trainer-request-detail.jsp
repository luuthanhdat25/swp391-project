<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-head.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
</head>

<div class="main-wrapper">
    <div>
        <div class="page-wrapper d-flex flex-column align-items-center"
             style="width: 75%; float: right; padding-top: 70px;">

            <div class="notification-detail d-flex justify-content-center ">
                <div class="d-flex flex-column" style="width: 80%; margin-top: 3px;">
                    <form action="manage-personal-trainer-request" method="GET">
                        <button type="submit" class="btn btn-warning"
                                style="height: 50px; width: 120px; margin: 3px 0 10px 0; color: #FFFFFF;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                 class="bi bi-box-arrow-left" viewBox="0 0 16 16" style="margin-right: 5px;">
                                <path fill-rule="evenodd"
                                      d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0z"/>
                                <path fill-rule="evenodd"
                                      d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708z"/>
                            </svg>
                            Cancel
                        </button>
                    </form>
                    <div class="d-flex justify-content-between shadow mb-3 bg-body rounded "
                         style="padding: 15px;">
                        <div class="d-flex align-content-center">
                            <img src="data:image/jpeg;base64,${RequestDetail.personalTrainerAccount.account.getAvatarImageAsString()}"
                                 class="rounded-circle"
                                 style="width: 110px; height: 110px; margin-right: 10px;
                                 border: 3px solid #ffe5e6; padding: 5px;" alt="Avatar"/>
                            <div class="d-flex flex-column bd-highlight mb-3 justify-content-center">
                                <h3>${RequestDetail.personalTrainerAccount.account.fullName}</h3>
                                <div>${RequestDetail.title}</div>
                                <div class="text-muted" style="font-size: 14px; margin-top: 5px;">
                                    Send at ${RequestDetail.timeStamp.getHour()}:${RequestDetail.timeStamp.getMinute()}
                                    ${RequestDetail.timeStamp.getDayOfMonth()}/${RequestDetail.timeStamp.getMonthValue()}/${RequestDetail.timeStamp.getYear()}
                                </div>
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
                                <div class="badge bg-secondary"
                                     style="height: fit-content;">${RequestDetail.status}</div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="shadow mb-5 bg-body rounded"
                         style="padding: 25px; margin-top: 10px;">${RequestDetail.content}
                        <img src="data:image/jpeg;base64,${Certificate_1}" alt="Certificate">
                        <img src="data:image/jpeg;base64,${Certificate_2}" alt="Certificate">
                        <img src="data:image/jpeg;base64,${Certificate_3}" alt="Certificate">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%@ include file="../common/script.jspf" %>
