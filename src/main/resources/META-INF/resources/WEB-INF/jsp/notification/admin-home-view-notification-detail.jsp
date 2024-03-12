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
             style="width: 77%; float: right; padding-top: 70px;">

            <div class="notification-detail d-flex justify-content-center">
                <div class="d-flex flex-column" style="width: 80%; margin-top: 40px;">
                    <form action="manage-notification" method="GET">
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

                    <div class="notification-header d-flex justify-content-between align-items-center">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                  <img src="data:image/jpeg;base64,${NotificationDetail.toAccount.getAvatarImageAsString()}"
                                 class="rounded-circle"
                                 style="width: 110px; height: 110px; margin-right: 10px;
                                 border: 3px solid #ffe5e6; padding: 5px;" alt="Avatar"/>

                                <div class="d-flex flex-column" style="margin-left: 15px; width: 600px;">
                                    <div class="d-flex justify-content-between align-items-center"
                                         style="margin: 10px 0 0px 0;">
                                        <h2 class="fw-bold text-primary" style="margin-bottom: 0px;">${NotificationDetail.toAccount.fullName}</h2>
                                        <div class="d-flex justify-content-between" style="font-style: italic;">
                                            <div style="margin-right: 5px;">${NotificationDetail.timeStamp.getHour()}:${NotificationDetail.timeStamp.getMinute()}</div>
                                            <div>${NotificationDetail.timeStamp.getDayOfMonth()}/${NotificationDetail.timeStamp.getMonthValue()}/${NotificationDetail.timeStamp.getYear()}</div>
                                        </div>
                                    </div>
                                    <hr style="margin: 8px 0px;">
                                    <div class="fw-bold"
                                         style="margin-bottom: 5px; color: #797979; font-size: math ;">${NotificationDetail.title}</div>
                                </div>
                            </div>
                        </div>
                        <form action="delete-notification-detail" method="GET">
                            <input type="hidden" name="deleteNotificationID" value="${NotificationDetail.id}"/>
                            <button type="submit" class="btn btn-danger"
                                    style="height: 50px; width: 110px;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="19" height=19 fill="currentColor"
                                     class="bi bi-trash" viewBox="0 0 16 16">
                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"></path>
                                    <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"></path>
                                </svg>
                                Remove
                            </button>
                        </form>
                    </div>

                    <div class="notification-header d-flex justify-content-between align-items-center"
                         style="margin-top: 10px; padding: 50px;">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>${NotificationDetail.content}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/script.jspf" %>
