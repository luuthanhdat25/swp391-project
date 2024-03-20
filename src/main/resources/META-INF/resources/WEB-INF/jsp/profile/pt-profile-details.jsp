<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${account.getRole().getLabel() == 'Gymer'}">
    <%@ include file="../common/header.jspf" %>
    <%@ include file="../common/head.jspf" %>
    <%@ include file="../common/sidebar.jspf" %>
</c:if>
<c:if test="${account.getRole().getLabel() == 'Admin'}">
    <%@ include file="../common/header.jspf" %>
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
        color: gray; /* Set the color for the "Empty" text */
        font-style: italic; /* Optionally, you can italicize the text */
        /* Add any other styles you want for the "Empty" text */
    }
</style>

<body>

<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content container-fluid">
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
                                                <img src="../../assets/img/user.jpg" id="avatar" alt="Profile">
                                            </div>
                                            <div class="names-profiles">
                                                <h4 class="personalTrainerName"></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 d-flex align-items-center">
                                        <div class="follow-group">
                                            <div class="students-follows">
                                                <h5>Price</h5>
                                                <h4 id="personalTrainerPrice"></h4>
                                            </div>
                                        </div>
                                    </div>
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
                                            <c:if test="${account.getRole().getLabel() == 'Personal Trainer'}">
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
                                                <h5 class="personalTrainerName"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-phone-call"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Mobile</h4>
                                                <h5 id="personalTrainerPhone"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-calendar"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Date of Birth</h4>
                                                <h5 id="personalTrainerBirth"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-mail"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Email</h4>
                                                <h5 id="personalTrainerEmail"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-user"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Gender</h4>
                                                <h5 id="personalTrainerGender"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-map-pin"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Address</h4>
                                                <h5 id="personalTrainerAddress"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-home"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>BankName</h4>
                                                <h5 id="bankName"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-slash"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>BankNumber</h4>
                                                <h5 id="bankNumber"></h5>
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
                                            <h4>Certificates</h4>
                                        </div>
                                        <div class="hello-park">
                                        </div>
                                        <div id="carouselExampleIndicators" class="carousel slide"
                                             data-bs-ride="carousel">
                                            <ol class="carousel-indicators">
                                                <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                                    class="active"></li>
                                                <li data-bs-target="#carouselExampleIndicators"
                                                    data-bs-slide-to="1"></li>
                                                <li data-bs-target="#carouselExampleIndicators"
                                                    data-bs-slide-to="2"></li>
                                            </ol>
                                            <div class="carousel-inner" role="listbox">
                                                <div class="carousel-item active">
                                                    <img id="slider1" class="d-block img-fluid" src="#"
                                                         alt="First slide">
                                                </div>
                                                <div class="carousel-item">
                                                    <img id="slider2" class="d-block img-fluid" src="#"
                                                         alt="Second slide">
                                                </div>
                                                <div class="carousel-item">
                                                    <img id="slider3" class="d-block img-fluid" src="#"
                                                         alt="Third slide">
                                                </div>
                                            </div>
                                            <a class="carousel-control-prev" href="#carouselExampleIndicators"
                                               role="button" data-bs-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="visually-hidden">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#carouselExampleIndicators"
                                               role="button" data-bs-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="visually-hidden">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card blog-comments">
                                <div class="card-header">
                                    <h4 class="card-title"
                                        style="display: flex ;height: 100%; font-size: 20px ; justify-content: space-between; align-items: center;">
                                        Feedback
                                    </h4>
                                </div>
                                <div class="card-body pb-0">
                                    <ul class="comments-list">
                                        <li>
                                                <c:forEach items="${evaluations}" var="evaluation">
                                                    <div class="comment">
                                                    <div class="comment-author">
                                                        <img class="avatar" alt=""
                                                             src="data:image/png;base64,${evaluation.getGymer().getAccount().getAvatarImageAsString()}">
                                                    </div>
                                                    <div class="comment-block">
                                                        <div class="comment-by">
                                                            <h5 class="blog-author-name">${evaluation.getGymer().getAccount().getFullName()}<span
                                                                    class="blog-date"> <i
                                                                    class="feather-clock me-1"></i>${evaluation.getEvaluationDateTime()}</span>
                                                            </h5>
                                                            <div class="rate">
                                                                <c:forEach begin="1" end="5" var="i">
                                                                    <span class="star" style="color: ${i <= evaluation.getStarRating() ? 'gold' : 'gray'}">&#9733;</span>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <p class="caption" style="font-size: 14px">${evaluation.getCommentFeedback()}</p>
                                                    </div>
                                                        <br>
                                                </c:forEach>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <img src="">
</div>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="../../assets/js/jquery-3.6.0.min.js"></script>
<script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../assets/js/feather.min.js"></script>
<script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../../assets/plugins/apexchart/apexcharts.min.js"></script>
<script src="../../assets/plugins/apexchart/chart-data.js"></script>
<script src="../../assets/plugins/select2/js/select2.min.js"></script>
<script src="../../assets/js/script.js"></script>
<script src="../../assets/plugins/moment/moment.min.js"></script>
<script src="../../assets/js/bootstrap-datetimepicker.min.js"></script>

<script>
    var personalTrainer = ${personalDtoJson};
    console.log(personalTrainer)
    $(document).ready(function () {
        $('#personalTrainerBook').attr('href', '/personal-trainer/book?id=' + personalTrainer.id);
        $('#personalTrainerPrice').html(personalTrainer.price + ' VND / SLOT')
        $('.personalTrainerName').html(personalTrainer.fullName ? personalTrainer.fullName : '<span class="empty-text">[Empty]</span>');
        $('#personalTrainerPhone').html(personalTrainer.phone ? personalTrainer.phone : '<span class="empty-text">[Empty]</span>');
        $('#avatar').attr("src", personalTrainer.avatarImage == null ? "../../assets/img/user.jpg" : "data:image/jpeg;base64, " + personalTrainer.avatarImage)
        var birthday = personalTrainer.birthday;

        if (birthday) {
            var [year, month, day] = birthday.split('-');

            var monthNames = ["January", "Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            var monthName = monthNames[parseInt(month, 10) - 1];

            var formattedBirthday = monthName + " " + day + ", " + year;

            $('#personalTrainerBirth').html(formattedBirthday);
        } else {
            $('#personalTrainerBirth').html('<span class="empty-text">Empty</span>');
        }
        $('#personalTrainerEmail').html(personalTrainer.email ? personalTrainer.email : '<span class="empty-text">[Empty]</span>');
        $('#personalTrainerGender').html(personalTrainer.gender ? personalTrainer.gender : '<span class="empty-text">[Empty]</span>');
        $('#personalTrainerAddress').html(personalTrainer.address ? personalTrainer.address : '<span class="empty-text">[Empty]</span>');
        $('#bankName').html(personalTrainer.bankName ? personalTrainer.bankName : '<span class="empty-text">[Empty]</span>')
        $('#bankNumber').html(personalTrainer.bankNumber ? personalTrainer.bankNumber : '<span class="empty-text">[Empty]</span>')
        $('#slider1').attr("src", "data:image/jpeg;base64, " + personalTrainer.certificateList[0]);
        $('#slider2').attr("src", "data:image/jpeg;base64, " + personalTrainer.certificateList[1]);
        $('#slider3').attr("src", "data:image/jpeg;base64, " + personalTrainer.certificateList[2]);

        $('#sendToUpdate').click(function () {
            window.location.href = `/profile/update?ptid=` + personalTrainer.id;
        });
    })


</script>
</body>
</html>