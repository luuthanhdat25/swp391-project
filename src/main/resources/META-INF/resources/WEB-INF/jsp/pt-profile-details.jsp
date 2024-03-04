<%@ include file="common/header.jspf" %>
<%@ include file="common/head.jspf" %>
<%@ include file="common/sidebar.jspf" %>

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
                                    <img src="assets/img/profile-bg.jpg" alt="Profile">
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <div class="profile-user-box">
                                            <div class="profile-user-img">
                                                <img src="assets/img/profiles/avatar-18.jpg" alt="Profile">
                                                <div class="form-group students-up-files profile-edit-icon mb-0">
                                                    <div class="uplod d-flex">
                                                        <label class="file-upload profile-upbtn mb-0">
                                                            <i class="feather-edit-3"></i><input type="file">
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="names-profiles">
                                                <h4>Joe Kelley</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 d-flex align-items-center">
                                        <div class="follow-group">
                                            <div class="students-follows">
                                                <h5>Number</h5>
                                                <h4>2850</h4>
                                            </div>
                                            <div class="students-follows">
                                                <h5>Price</h5>
                                                <h4>2850</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 d-flex align-items-center">
                                        <div class="follow-btn-group">
                                            <button type="submit" class="btn btn-info message-btns">Book</button>
                                            <button type="submit" class="btn btn-info message-btns">Inbox</button>
                                            <button type="submit" class="btn btn-info message-btns">Report</button>
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
                                        <a style="position: absolute; right: 5px; top: 2px" class="edit-link" data-bs-toggle="modal"
                                           href="#edit_personal_details"><i
                                                class="far fa-edit me-1"></i>Edit</a>
                                        <div style="display: flex" class="heading-detail">
                                            <h4>Personal Details</h4>

                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-user"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Name</h4>
                                                <h5>Joe Kelley</h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-phone-call"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Mobile</h4>
                                                <h5>+21 510-237-1901</h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-calendar"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Date of Birth</h4>
                                                <h5>12 Jun 1995</h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-mail"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Email</h4>
                                                <h5><a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                                       data-cfemail="d4bebbb194b3b9b5bdb8fab7bbb9">[email&#160;protected]</a>
                                                </h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-user"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Gender</h4>
                                                <h5>Female</h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity mb-0">
                                            <div class="personal-icons">
                                                <i class="feather-map-pin"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Address</h4>
                                                <h5>180, Estern Avenue, United States</h5>
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
                                                <li data-bs-target="#carouselExampleIndicators"
                                                    data-bs-slide-to="3"></li>
                                            </ol>
                                            <div class="carousel-inner" role="listbox">
                                                <div class="carousel-item active">
                                                    <img class="d-block img-fluid" src="assets/img/certificates/certificate1.jpg"
                                                         alt="First slide">
                                                </div>
                                                <div class="carousel-item">
                                                    <img class="d-block img-fluid" src="assets/img/certificates/certificate2.jpg"
                                                         alt="Second slide">
                                                </div>
                                                <div class="carousel-item">
                                                    <img class="d-block img-fluid" src="assets/img/certificates/certificate3.jpg"
                                                         alt="Third slide">
                                                </div>
                                                <div class="carousel-item">
                                                    <img class="d-block img-fluid" src="assets/img/certificates/certificate4.png"
                                                         alt="Fourth slide">
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
                                    <h4 class="card-title" style="display: flex ;height: 100%; font-size: 20px ; justify-content: space-between; align-items: center;">Feedback <button type="submit" class="btn btn-info">Evaluate</button></h4>
                                </div>
                                <div class="card-body pb-0">
                                    <ul class="comments-list">
                                        <li>
                                            <div class="comment">
                                                <div class="comment-author">
                                                    <img class="avatar" alt=""
                                                         src="assets/img/profiles/avatar-13.jpg">
                                                </div>
                                                <div class="comment-block">
                                                    <div class="comment-by">
                                                        <h5 class="blog-author-name">example@gmail.com<span
                                                                class="blog-date"> <i
                                                                class="feather-clock me-1"></i>Feb
                                                                    6, 2024</span></h5>
                                                        <div class="rate">
                                                            <input type="radio" id="star5" name="rate" value="5" />
                                                            <label for="star5" title="text">5 stars</label>
                                                            <input type="radio" id="star4" name="rate" value="4" />
                                                            <label for="star4" title="text">4 stars</label>
                                                            <input type="radio" id="star3" name="rate" value="3" />
                                                            <label for="star3" title="text">3 stars</label>
                                                            <input type="radio" id="star2" name="rate" value="2" />
                                                            <label for="star2" title="text">2 stars</label>
                                                            <input type="radio" id="star1" name="rate" value="1" />
                                                            <label for="star1" title="text">1 star</label>
                                                        </div>
                                                    </div>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                        Nam
                                                        viverra euismod odio, gravida pellentesque urna varius
                                                        vitae,
                                                        gravida pellentesque urna varius vitae. Lorem ipsum
                                                        dolor sit
                                                        amet, consectetur adipiscing elit.</p>
                                                </div>
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
</div>
<%@include file="common/script.jspf"%>
