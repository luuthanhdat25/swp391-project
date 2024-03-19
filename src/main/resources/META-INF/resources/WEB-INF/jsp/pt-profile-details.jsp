<%@ include file="common/header.jspf" %>
<%@ include file="common/head.jspf" %>
<%@ include file="common/sidebar.jspf" %>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
<style>
    .overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Adjust opacity as needed */
        z-index: 1001; /* Ensure it's above other elements */
    }

    @import url("https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap");
    @import url("https://fonts.googleapis.com/css2?family=Potta+One&display=swap");
    .feedback-modal {
        z-index: 2000;
        overflow-x: hidden;
        overflow-y: hidden;
        display: none;
        position: fixed;
        top: 10%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 2vmax;
        font-family: "Space Grotesk", sans-serif;
        width: 43rem;
        padding: 1.3rem 1rem;

        flex-direction: column;
        align-items: center;
        gap: 0.9rem;
        border-radius: 1.25rem;
        background-image: radial-gradient(farthest-side, #afc8f9 16%, #fff0), radial-gradient(farthest-side, #ddc1fb -7%, #fff0), radial-gradient(circle at 0 0, #d5e0fa, #e5d5f6) !important;
        box-shadow: 10px 10px 30px rgba(0, 0, 0, 0.2);
        background-color: rgba(255, 255, 255, 0.5);
    }

    .feedback-modal .title {
        font-weight: bold;
        font-size: 1.8rem;
    }

    .feedback-modal .content {
        line-height: 1.6;
        font-size: 1rem;
        padding: 0.5rem 0.7rem;
        color: #555;
    }

    .rate-box {
        display: flex;
        flex-direction: row-reverse;
        gap: 0.1rem;
    }

    .rate-box input {
        display: none;
    }

    .rate-box input:hover ~ .star:before {
        color: rgba(255, 204, 51, 0.5);
    }

    .rate-box input:active + .star:before {
        transform: scale(0.9);
    }

    .rate-box input:checked ~ .star:before {
        color: #ffcc33;
        text-shadow: 3px 3px 8px rgba(0, 0, 0, 0.3), -3px -3px 8px rgba(255, 255, 255, 0.8);
    }

    .rate-box .star:before {
        content: "\272c";
        display: inline-block;
        font-family: "Potta One", cursive;
        font-size: 5rem;
        cursor: pointer;
        color: #0000;
        text-shadow: 2px 2px 3px rgba(255, 255, 255, 0.5);
        background-color: #aaa;
        background-clip: text;
        -webkit-background-clip: text;
        transition: all 0.3s;
    }

    textarea {
        border: none;
        resize: none;
        width: 95%;
        padding: 0.2rem;
        font-size: 1rem;
        color: inherit;
        font-family: inherit;
        line-height: 1.5;
        border-radius: 0.2rem;
        box-shadow: inset 2px 2px 8px rgba(0, 0, 0, 0.3), inset -2px -2px 8px rgba(255, 255, 255, 0.8);
        background-color: rgba(255, 255, 255, 0.3);
    }

    textarea::placeholder {
        color: #aaa;
    }

    textarea:focus {
        outline-color: #ffcc33;
    }

    .submit-btn-feedback {
        padding: 0.2rem 2rem;
        border: none;
        box-shadow: 3px 3px 8px rgba(0, 0, 0, 0.3), -3px -3px 8px rgba(255, 255, 255, 0.8);
        border-radius: 1rem;
        font-size: 1.5rem;
        cursor: pointer;
        background-color: rgba(255, 204, 51, 0.8);
        transition: all 0.2s;
    }

    .submit-btn-feedback:active {
        transform: translate(2px, 2px);
    }

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
                                    <div class="col-lg-2 col-md-2 d-flex align-items-center">
                                        <div class="follow-group">
                                            <div class="students-follows">
                                                <h5>Price</h5>
                                                <h4 id="personalTrainerPrice"></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 d-flex align-items-center">
                                        <div class="follow-btn-group">
                                            <a class="btn btn-info message-btnsz"
                                               href="/bookPT1?PersonalTrainerID=${param.id}">Book</a>

                                            <c:if test="${personalTrainer ne null}">
                                                <button type="submit" class="btn btn-info message-btns">Inbox</button>
                                            </c:if>
                                            <%--                                            <button type="submit" class="btn btn-info message-btns">Inbox</button>--%>
                                            <c:if test="${personalTrainer ne null}">
                                                <button type="submit" class="btn btn-info message-btns"
                                                        data-bs-toggle="modal" data-bs-target="#exampleModal">Report
                                                </button>
                                            </c:if>
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
                                        <div class="personal-activity mb-0">
                                            <div class="personal-icons">
                                                <i class="feather-map-pin"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Address</h4>
                                                <h5 id="personalTrainerAddress"></h5>
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
                                        <button type="submit" class="btn btn-info" id="feedbackModalBtn">Evaluate
                                        </button>
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
    <div class="feedback-modal">
        <div class="title">Rate your experience</div>
        <div class="content">We highly value your feedback! Kindly take a moment to rate your experience and provide us
            with your valuable feedback.
        </div>
        <div class="rate-box">
            <input type="radio" name="star" id="star0"/>
            <label class="star" for="star0"></label>
            <input type="radio" name="star" id="star1"/>
            <label class="star" for="star1"></label>
            <input type="radio" name="star" id="star2"/>
            <label class="star" for="star2"></label>
            <input type="radio" name="star" id="star3"/>
            <label class="star" for="star3"></label>
            <input type="radio" name="star" id="star4"/>
            <label class="star" for="star4"></label>
        </div>
        <textarea id="feedbackComment" cols="30" rows="6" placeholder="Tell us about your experience!"></textarea>
        <div>
            <button type="button" class="submit-btn-feedback close-feedback-modal">Close</button>
            <button type="button" class="submit-btn-feedback send-feedback-modal">Send</button>
        </div>
    </div>

    <div class="overlay"></div>

    <div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" style="width: 630px;">
            <div class="modal-content">
                <%@include file="../../WEB-INF/jsp/report/AddReport.jsp" %>
            </div>
        </div>
    </div>


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

    $(document).ready(function () {
        // Show modal and overlay when Evaluate button is clicked
        $('#feedbackModalBtn').click(function () {
            $('.feedback-modal').css({
                "display": "flex",
                "top": "40%"
            }).animate({
                "top": "50%",
            }, 300);
            $('.overlay').fadeIn();
            $('.feedback-modal').fadeIn();
        });

        $('.close-feedback-modal').click(function () {
            $('.feedback-modal').animate({
                "top": "40%",
            }, 300, function () {
                $('.feedback-modal').css("display", "none");
            });
            $('.overlay').fadeOut();
            $('.feedback-modal').fadeOut();
        });
    });

    $('.send-feedback-modal').click(function () {
        // Get the selected star rating
        var starRating = $('input[name="star"]:checked').val();
        // Get the feedback comment
        var feedbackComment = $('#feedbackComment').val();

        // AJAX POST request to send feedback to Spring Controller
        $.ajax({
            type: 'POST',
            url: '',
            data: {
                starRating: starRating,
                feedbackComment: feedbackComment
            },
            success: function (response) {
                // Handle success response
                console.log(response);
            },
            error: function (xhr, status, error) {
                // Handle error
                console.error(error);
            }
        });
    });


    var personalTrainer = ${personaltrainer};
    console.log(personalTrainer)
    $(document).ready(function () {
        $('#personalTrainerBook').attr('href', '/personal-trainer/book?id=' + personalTrainer.id);
        $('#personalTrainerPrice').html(personalTrainer.price + 'VND / SLOT')
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


        $('#slider1').attr("src", "data:image/jpeg;base64, " + personalTrainer.certificateList[0]);
        $('#slider2').attr("src", "data:image/jpeg;base64, " + personalTrainer.certificateList[1]);
        $('#slider3').attr("src", "data:image/jpeg;base64, " + personalTrainer.certificateList[2]);
    })
</script>
</body>
</html>