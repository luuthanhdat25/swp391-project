<%@ include file="../common/header.jspf" %>
<%@ include file="../common/head.jspf" %>
<%@ include file="../common/sidebar.jspf" %>

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
                                            <a class="edit-link" style="margin-bottom: auto; cursor: pointer"
                                               data-bs-toggle="modal" id="sendToUpdate"><i
                                                    class="far fa-edit me-1"></i>Edit</a>
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