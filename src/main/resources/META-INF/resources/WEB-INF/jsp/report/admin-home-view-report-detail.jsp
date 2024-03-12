<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-head.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
</head>

<div class="main-wrapper">
    <div>
        <%-- Div này hiển thị report's list khi user click vào "Manage report" button --%>
        <div class="page-wrapper d-flex flex-column align-items-center"
             style="width: 75%; float: right; padding-top: 70px;">

            <div class="notification-detail d-flex justify-content-center ">
                <div class="d-flex flex-column" style="width: 80%; margin-top: 3px;">
                    <form action="manage-report" method="GET">
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
                            <img src="data:image/jpeg;base64,${ReportDetail.personalTrainerAccount.account.getAvatarImageAsString()}"
                                 class="rounded-circle"
                                 style="width: 110px; height: 110px; margin-right: 10px;
                                 border: 3px solid #ffe5e6; padding: 5px;" alt="Avatar"/>
                            <div class="d-flex flex-column bd-highlight mb-3 justify-content-center">
                                <h3>${ReportDetail.personalTrainerAccount.account.fullName}</h3>
                                <div>${ReportDetail.reason}</div>
                                <div class="text-muted" style="font-size: 14px; margin-top: 5px;">Reported at
                                    ${ReportDetail.timeStamp.getHour()}:${ReportDetail.timeStamp.getMinute()}
                                    ${ReportDetail.timeStamp.getDayOfMonth()}/${ReportDetail.timeStamp.getMonthValue()}/${ReportDetail.timeStamp.getYear()}
                                    by
                                    <img src="data:image/jpeg;base64,${ReportDetail.gymerAccount.account.getAvatarImageAsString()}"
                                         class="rounded-circle"
                                         style="width: 25px; height: 25px; margin: 0 5px 0 5px;" alt="Avatar"/>
                                    <b>${ReportDetail.gymerAccount.account.fullName}</b>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-column">
                            <form action="delete-report" method="get">
                                <input type="hidden" name="deleteReportDetail" value=${ReportDetail.id}>
                                <button type="submit" class="btn btn-danger" style="margin-bottom: 5px; width: 131px;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                         fill="currentColor" class="bi bi-trash3-fill"
                                         viewBox="0 0 16 16">
                                        <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"/>
                                    </svg>
                                    Delete
                                </button>
                            </form>
                            <form action="http://localhost:8080/personal-trainer/details" method="get">
                                <input type="hidden" name="id" value=${ReportDetail.personalTrainerAccount.id}>
                                <button type="submit" class="btn btn-success">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                         fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                                    </svg>
                                    View Profile
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="shadow mb-5 bg-body rounded"
                         style="padding: 25px; margin-top: 10px;">${ReportDetail.description}</div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/script.jspf" %>
