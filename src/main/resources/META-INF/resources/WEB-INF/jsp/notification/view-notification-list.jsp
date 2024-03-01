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
        <form action="view-creating-notification-detail" method="GET">
           <button type="submit" style="height: 50px; width: 50px; background-color: #3c763d;" class="btn btn-success">Add</button>
        </form>
    </div>
    <div>
        <div class="sidebar" id="sidebar" style="width: 30%; background-color: #adb5bd;">
            <div class="sidebar-inner slimscroll">
                <p class="h6" style="padding-left: 20px; margin-top: 10px;">Notifications</p>
               <ul id="sidebar-menu" class="sidebar-menu">

                   <c:forEach var="notification" items="${NotificationList}">
                        <li style="margin-bottom: 5px;">

                            <form id="notificationForm${notification.id}" action="view-notification-detail" method="GET" style="display: none;">
                                <input type="hidden" name="notificationId" value="${notification.id}" />
                            </form>

                            <a class="input-container" onclick="submitNotificationForm(${notification.id});">
                                <div class="d-flex justify-content-between align-items-center" style="margin-bottom: 10px;">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <img class="rounded-circle" style="width: 35px;" src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"/>
                                        <p class="fw-bold text-primary" style="margin-bottom: 0px; margin-left: 10px;">Thai Bao personal trainer</p>
                                    </div>
                                    ${notification.timeStamp.getHour()}:${notification.timeStamp.getMinute()}
                                </div>
                                <p class="fw-bold" style="margin-bottom: 5px;">${notification.title}</p>
                               <%-- <p class="fw-normal text-truncate" style="margin-bottom: 5px;">${notification.content}</p>--%>

                            </a>
                        </li>
                   </c:forEach>

               </ul>
            </div>
        </div>

       <div class="page-wrapper d-flex flex-column align-items-center" style="width: 70%; float: right; background-color: #7c7c7c; padding-top: 70px;">
            <div class="notification-detail">
                 <div class="notification-header d-flex justify-content-between align-items-center">
                     <div class="d-flex justify-content-between align-items-center">
                         <div class="d-flex justify-content-between align-items-center">
                             <img class="rounded-circle" style="width: 80px;" src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"/>
                             <div class="d-flex flex-column" style="margin-left: 15px;">
                                 <div class="d-flex justify-content-between align-items-center" style="margin: 10px 0 10px 0;">
                                     <h2 class="fw-bold text-primary" style="margin-bottom: 0px;"> Nguyen Thai Bao</h2>
                                     ${NotificationDetail.timeStamp}
                                 </div>
                                 <h6 class="fw-bold" style="margin-bottom: 5px;">${NotificationDetail.title}</h6>
                             </div>
                         </div>
                     </div>
                     <form action="delete-notification-detail" method="GET">
                         <input type="hidden" name="deleteNotificationID" value="${NotificationDetail.id}"/>
                          <button type="button" class="btn btn-success" style="height: 50px; width: 150px; background-color: #3c763d;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="19" height=19 fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                              <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"></path>
                              <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"></path>
                            </svg> Remove
                          </button>
                     </form>
                 </div>

                <div class="notification-header d-flex justify-content-between align-items-center" style="margin-top: 10px; padding: 50px;">
                     <div class="d-flex justify-content-between align-items-center">
                         <div>${NotificationDetail.content}</div>
                     </div>
                 </div>
            </div>
       </div>
    </div>
</div>

<script>
    function submitNotificationForm(notificationId) {
        var formId = "notificationForm" + notificationId;
        document.getElementById(formId).submit();
    }
</script>
<%@ include file="../common/script.jspf" %>
