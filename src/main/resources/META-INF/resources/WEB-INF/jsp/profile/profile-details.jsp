<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${account.getRole().getLabel() == 'Gymer'}">
    <%@ include file="../common/header.jspf" %>
    <%@ include file="../common/head.jspf" %>
    <%@ include file="../common/sidebar.jspf" %>
</c:if>
<c:if test="${account.getRole().getLabel() == 'Admin'}">
    <%@ include file="../common/header.jspf" %>
    <%@ include file="../common/admin-head.jspf" %>
    <div class="sidebar" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <ul>
                    <li class="menu-title">
                        <span>Admin Action</span>
                    </li>
                    <li style="margin-bottom: 4px;" class="shadow bg-body rounded">
                        <a href="${pageContext.request.contextPath}/admin-home/manage-notification" style="text-decoration: none;" onclick="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                 class="bi bi-bell-fill" viewBox="0 0 16 16" style="margin-right: 5px;">
                                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2m.995-14.901a1 1 0 1 0-1.99 0A5 5 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901"/>
                            </svg>
                            Manage Notification </a>
                    </li>
                    <li style="margin-bottom: 4px;" class="shadow bg-body rounded">
                        <a href="${pageContext.request.contextPath}/admin-home/manage-report" style="text-decoration: none;" onclick="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                 class="bi bi-flag-fill" viewBox="0 0 16 16" style="margin-right: 5px;">
                                <path d="M14.778.085A.5.5 0 0 1 15 .5V8a.5.5 0 0 1-.314.464L14.5 8l.186.464-.003.001-.006.003-.023.009a12 12 0 0 1-.397.15c-.264.095-.631.223-1.047.35-.816.252-1.879.523-2.71.523-.847 0-1.548-.28-2.158-.525l-.028-.01C7.68 8.71 7.14 8.5 6.5 8.5c-.7 0-1.638.23-2.437.477A20 20 0 0 0 3 9.342V15.5a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 1 0v.282c.226-.079.496-.17.79-.26C4.606.272 5.67 0 6.5 0c.84 0 1.524.277 2.121.519l.043.018C9.286.788 9.828 1 10.5 1c.7 0 1.638-.23 2.437-.477a20 20 0 0 0 1.349-.476l.019-.007.004-.002h.001"/>
                            </svg>
                            Manage Report </a>
                    </li>
                    <li style="margin-bottom: 4px;" class="shadow bg-body rounded">
                        <a href="${pageContext.request.contextPath}/admin-home/manage-personal-trainer-request" style="text-decoration: none;" onclick="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                 class="bi bi-envelope-arrow-up-fill" viewBox="0 0 16 16" style="margin-right: 5px;">
                                <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zm.192 8.159 6.57-4.027L8 9.586l1.239-.757.367.225A4.49 4.49 0 0 0 8 12.5c0 .526.09 1.03.256 1.5H2a2 2 0 0 1-1.808-1.144M16 4.697v4.974A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-1.965.45l-.338-.207z"/>
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.354-5.354 1.25 1.25a.5.5 0 0 1-.708.708L13 12.207V14a.5.5 0 0 1-1 0v-1.717l-.28.305a.5.5 0 0 1-.737-.676l1.149-1.25a.5.5 0 0 1 .722-.016"/>
                            </svg>
                            Manage Personal Trainer's Request </a>
                    </li>
                    <li style="margin-bottom: 4px;" class="shadow bg-body round ed">
                        <a href="${pageContext.request.contextPath}/admin-home/manage-account" style="text-decoration: none;" onclick="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                 class="bi bi-person-fill" viewBox="0 0 16 16" style="margin-right: 5px;">
                                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                            </svg>
                            Manage Account</a>
                    </li>
                    <li style="margin-bottom: 4px;" class="shadow bg-body rounded">
                        <a href="${pageContext.request.contextPath}/admin-home/manage-exercise" style="text-decoration: none;" onclick="">
                            <i class="fas fa-dumbbell" style="margin-right: 5px;"></i>
                            Manage Exercise</a>
                    </li>
                    <li style="margin-bottom: 4px;" class="shadow bg-body rounded">
                        <a href="${pageContext.request.contextPath}/admin-home/manage-nutrition" style="text-decoration: none;" onclick="">
                            <img style="height: 25px; width: 25px; margin-right: 5px;"
                                 src="../../assets/img/icons/nutrition.png" alt="Nutrition Wiki">
                            Manage Nutrition</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <%@ include file="../common/admin-head.jspf" %>
</c:if>
<c:if test="${account.getRole().getLabel() == 'Personal Trainer'}">
    <%@ include file="../common/header.jspf" %>
    <%@ include file="../common/head.jspf" %>
    <%@ include file="../common/sidebar.jspf" %>
</c:if>

<style>
    .empty-text {
        color: gray;
        font-style: italic;
    }
</style>
<body>
<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content container-fluid" style="padding-left: 0">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="student-profile-head">
                                <div class="profile-bg-img">
                                    <img src="../../assets/img/profile-bg.png" alt="Profile">
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <div class="profile-user-box">
                                            <div class="profile-user-img">
                                                <img src="#" id="avatar" alt="Profile">
                                            </div>
                                            <div class="names-profiles">
                                                <h4 class="name"></h4>
                                                <h4 style="color: #0060eb">Gymer</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6"
                                         style="display: flex;padding-top: 27px;align-items: center;justify-content: space-between;">
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-user"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Weight</h4>
                                                <h5 id="weight"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-phone-call"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Height</h4>
                                                <h5 id="height"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-phone-call"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Goals</h4>
                                                <h5 id="goal"></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${account.getRole().getLabel() == 'Personal Trainer'}">
                                        <div class="col-lg-2 col-md-2" style="display: flex;align-items: center;">
                                            <div class="col-lg-6 col-md-6 d-flex align-items-center">
                                                <div class="follow-btn-group">
                                                    <button type="submit" class="btn btn-info message-btns">Inbox</button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="col-lg-2 col-md-2" style="display: flex;align-items: center;">
                                        <c:if test="${accountView.getIsBan() == 'false'}">
                                            <a href="/admin-home/lock-account?id=${accountView.getId()}" style="width: 100%;height: 48px;line-height: 36px" class="btn btn-primary lock-account">Lock Account</a>
                                        </c:if>
                                        <c:if test="${accountView.getIsBan() == 'true'}">
                                            <a href="/admin-home/unlock-account?id=${accountView.getId()}" style="width: 100%;height: 48px;line-height: 36px" class="btn btn-primary unlock-account">Unlock Account</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="student-personals-grp">
                                <div class="card">
                                    <div class="card-body">
                                        <div style="display: flex;align-items: center;justify-content: space-between;"
                                             class="heading-detail">
                                            <h4>Personal Details</h4>
                                            <c:if test="${account.getRole().getLabel() == 'Gymer'}">
                                                <a class="edit-link" style="margin-bottom: auto; cursor: pointer"
                                                   data-bs-toggle="modal" id="sendToUpdate"><i
                                                        class="far fa-edit me-1"></i>Edit</a>
                                            </c:if>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-user"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Name</h4>
                                                <h5 class="name"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-phone-call"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Mobile</h4>
                                                <h5 id="phone"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-calendar"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Date of Birth</h4>
                                                <h5 id="birthday"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-mail"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Email</h4>
                                                <h5 id="email"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-user"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Gender</h4>
                                                <h5 id="gender"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity mb-0">
                                            <div class="personal-icons">
                                                <i class="feather-map-pin"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Address</h4>
                                                <h5 id="address"></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="student-personals-grp">
                                <div class="card mb-0">
                                    <div class="card-body">
                                        <div class="heading-detail">
                                            <h4>About Me</h4>
                                        </div>
                                        <div class="hello-park" id="desc">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

    var gymerDto = ${gymerDtoJson}
        $(document).ready(function () {
            $('#avatar').attr('src', 'data:image/jpeg;base64,' + gymerDto.avatarImage);
            $('.name').html(gymerDto.fullName ? gymerDto.fullName : '<span class="empty-text">[Empty]</span>');
            $('#phone').html(gymerDto.phone ? gymerDto.phone : '<span class="empty-text">[Empty]</span>');
            var birthday = gymerDto.birthday;
            if (birthday) {
                var [year, month, day] = birthday.split('-');

                var monthNames = ["January", "Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                var monthName = monthNames[parseInt(month, 10) - 1];

                var formattedBirthday = monthName + " " + day + ", " + year;

                $('#birthday').html(formattedBirthday);
            } else {
                $('#birthday').html('<span class="empty-text">Empty</span>');
            }
            $('#email').html(gymerDto.email ? gymerDto.email : '<span class="empty-text">[Empty]</span>');
            $('#gender').html(gymerDto.gender ? gymerDto.gender : '<span class="empty-text">[Empty]</span>');
            $('#address').html(gymerDto.address ? gymerDto.address : '<span class="empty-text">[Empty]</span>');

            $('#weight').html(gymerDto.weight + ' KG');
            $('#height').html(gymerDto.height + ' CM')
            $('#goal').html(gymerDto.goal);
            $('#desc').html(gymerDto.description)

            $('#sendToUpdate').click(function () {
                window.location.href = `/profile/update?id=` + gymerDto.id;
            });

        })



</script>

<%@include file="../common/script.jspf" %>