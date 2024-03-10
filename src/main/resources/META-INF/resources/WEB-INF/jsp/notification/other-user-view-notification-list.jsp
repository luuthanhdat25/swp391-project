<%@ include file="../common/header.jspf" %>
<%@ include file="../common/head.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link href="../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
</head>

<div class="main-wrapper">
    <div class="sidebar" id="sidebar" style="width: 31%; background-color: #FFFFFF;">
        <div class="sidebar-inner slimscroll">
            <ul id="sidebar-menu" class="sidebar-menu" style="padding: 2px 9px 9px 9px;">
                <li><p class="h6" style="padding-left: 9px; margin-top: 10px;">Notifications</p></li>
                <c:forEach var="notification" items="${NotificationList}">
                    <li style="margin-bottom: 4px;">

                        <form id="notificationForm${notification.id}" action="view-notification-list" method="GET"
                              style="display: none;">
                            <input type="hidden" name="notificationId" value="${notification.id}"/>
                        </form>

                        <a onclick="submitNotificationForm(${notification.id});"
                           style="background-color: ${notification.id == NotificationDetail.id ? '#d9d9d9' : '#FFFFFF'};"
                           class="input-container">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16"
                                             style="margin-right: 3px; ">
                                            <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6"/>
                                        </svg>
                                        <img class="rounded-circle" style="width: 35px;"
                                             src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"/>
                                    </div>
                                    <div class="d-flex flex-column justify-content-start" style="margin-left: 5px;">
                                        <p class="fw-bold text-primary" style="margin-bottom: 0px;">Thai Bao
                                            personal trainer</p>
                                        <p class="text-truncate"
                                           style="margin-top: 2px; margin-bottom: 0px; color: #797979; font-size: 12px; max-width: 250px;">${notification.title}</p>
                                    </div>
                                </div>
                                <div class="fw-bold"
                                     style="color: #3c763d; font-size: 13px;"> ${notification.timeStamp.getHour()}:${notification.timeStamp.getMinute()}</div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="page-wrapper d-flex flex-column align-items-center"
         style="width: 69%; float: right; background-color: #7c7c7c; padding: 70px 0 10px 0;">
        <%@ include file="../../../WEB-INF/jsp/notification/other-user-view-notification-detail.jsp" %>
    </div>
</div>

<script>
    function submitNotificationForm(notificationId) {
        var formId = "notificationForm" + notificationId;
        document.getElementById(formId).submit();
    }
</script>
<%@ include file="../common/script.jspf" %>
