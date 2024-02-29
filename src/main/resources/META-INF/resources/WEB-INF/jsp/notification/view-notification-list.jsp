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
                                 <h2 class="fw-bold text-primary" style="margin-bottom: 0px;">Thai Bao Personal Trainer</h2>
                                 <div class="d-flex justify-content-between align-items-center" style="margin-top: 10px;">
                                     <h6 class="fw-bold" style="margin-bottom: 5px;">${NotificationDetail.title}</h6>
                                     12:10
                                 </div>
                             </div>
                         </div>
                     </div>
                     <button type="button" style="height: 50px; width: 100px; background-color: #3c763d;" class="btn btn-success">Remove</button>
                 </div>

                <div class="notification-header d-flex justify-content-between align-items-center" style="margin-top: 10px; padding: 10px;">
                     <div class="d-flex justify-content-between align-items-center">
                         <p>${NotificationDetail.content}</p>
                     </div>
                 </div>

                 <%--<div class="notification-header d-flex justify-content-between align-items-center" style="margin-top: 10px; padding: 10px;">
                     <div class="d-flex justify-content-between align-items-center">
                        Dear Luu Thanh Dat,<br><br>

                        I, Nguyen Thai Bao, as your personal trainer, acknowledge and agree to your request<br>
                        for the training course. I am confident that I can accommodate the time slots for training<br>
                        as per your requirements.<br>

                        Below are the details for the course payment:<br><br>

                        Duration: 3 month (20/4/2024  to 20/7/2024)<br>
                        Total Cost: 3.600.000 VND<br>
                        Payment Method: VNPAY<br>
                        Payment link: payment.com/vnpay<br><br>

                        Please ensure that the payment is made prior to the commencement of the training<br>
                        sessions to secure your spot. Once the payment is processed, we can proceed with<br>
                        scheduling the training sessions at your convenience.<br><br>

                        Best regards,<br><br>

                        Nguyen Thai Bao<br>
                        [Your Contact Information]<br>
                     </div>
                 </div>--%>
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
