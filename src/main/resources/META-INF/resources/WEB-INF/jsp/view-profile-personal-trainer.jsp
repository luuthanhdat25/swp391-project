<%@ include file="common/header.jspf" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile</title>
    <link rel="stylesheet" href="css/StyleProfile.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Activitar | Template</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery and Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>

    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <%-- <header class="header-section header-normal">--%>
        <%-- <div class="container-fluid">--%>
            <%-- <div class="logo">--%>
                <%-- <a href="./index.html">--%>
                    <%-- <img src="img/logo.png" alt="">--%>
                        <%-- </a>--%>
                            <%-- </div>--%>
                                <%-- <div class="top-social">--%>
                                    <%-- <a href="#"><i class="fa fa-pinterest-p"></i></a>--%>
                                        <%-- <a href="#"><i class="fa fa-linkedin"></i></a>--%>
                                            <%-- <a href="#"><i class="fa fa-pinterest-p"></i></a>--%>
                                                <%-- <a href="#"><i class="fa fa-youtube-play"></i></a>--%>
                                                    <%-- <a href="#"><i class="fa fa-instagram"></i></a>--%>
                                                        <%-- </div>--%>
                                                            <%-- <div class="container">--%>
                                                                <%-- <div class="nav-menu">--%>
                                                                    <%-- <nav class="mainmenu mobile-menu">--%>
                                                                        <%-- <ul>--%>
                                                                            <%-- <li><a href="./index.html">Home</a>
                                                                                </li>--%>
                                                                                <%-- <li><a href="./about-us.html">About
                                                                                        us</a></li>--%>
                                                                                    <%-- <li><a
                                                                                            href="./schedule.html">Schedule</a>
                                                                                        </li>--%>
                                                                                        <%-- <li class="active"><a
                                                                                                href="./gallery.html">Gallery</a>
                                                                                            </li>--%>
                                                                                            <%-- <li><a
                                                                                                    href="./blog.html">Blog</a>--%>
                                                                                                <%-- <ul
                                                                                                    class="dropdown">--%>
                                                                                                    <%-- <li><a
                                                                                                            href="./about-us.html">About
                                                                                                            Us</a></li>
                                                                                                        --%>
                                                                                                        <%-- <li><a
                                                                                                                href="./blog-single.html">Blog
                                                                                                                Details</a>
                                                                                                            </li>--%>
                                                                                                            <%-- </ul>--%>
                                                                                                                <%--
                                                                                                                    </li>--%>
                                                                                                                    <%--
                                                                                                                        <li><a
                                                                                                                            href="./contact.html">Contacts</a>
                                                                                                                        </li>
                                                                                                                        --%>
                                                                                                                        <%--
                                                                                                                            </ul>--%>
                                                                                                                            <%--
                                                                                                                                </nav>--%>
                                                                                                                                <%--
                                                                                                                                    </div>--%>
                                                                                                                                    <%--
                                                                                                                                        </div>--%>
                                                                                                                                        <%-- <div
                                                                                                                                            id="mobile-menu-wrap">
                                                                                                                                            </div>
                                                                                                                                            --%>
                                                                                                                                            <%--
                                                                                                                                                </div>--%>
                                                                                                                                                <%--
                                                                                                                                                    </header>--%>
                                                                                                                                                     <a class="nav-link" href="/logout">Logout</a>
                                                                                                                                                    <div
                                                                                                                                                        class="container">
                                                                                                                                                        <div
                                                                                                                                                            class="row profile">
                                                                                                                                                            <div
                                                                                                                                                                class="col-md-3">
                                                                                                                                                                <div
                                                                                                                                                                    class="profile-sidebar">
                                                                                                                                                                    <!-- SIDEBAR USERPIC -->
                                                                                                                                                                    <div
                                                                                                                                                                        class="profile-userpic">
                                                                                                                                                                        <img src="https://scontent.fsgn2-7.fna.fbcdn.net/v/t1.6435-9/68727992_705625573241145_675769175100096512_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=73878a&_nc_eui2=AeHSzM-XQT51j-tx_uC8e-qdLHQuxTv5EQUsdC7FO_kRBQe8Gw6hEws8eus-a-ACspTdF_W2vJM3A9h878a3cUu8&_nc_ohc=ON7_qEUZMxAAX-qwzvB&_nc_ht=scontent.fsgn2-7.fna&oh=00_AfC-NT6aRrWSPYcXhJhBxlIniTFGZAbOx6v_NymBXo4O0g&oe=65D0685C"
                                                                                                                                                                            class="img-responsive"
                                                                                                                                                                            alt="">
                                                                                                                                                                    </div>
                                                                                                                                                                    <!-- END SIDEBAR USERPIC -->
                                                                                                                                                                    <!-- SIDEBAR USER TITLE -->
                                                                                                                                                                    <div
                                                                                                                                                                        class="profile-usertitle">
                                                                                                                                                                        <div
                                                                                                                                                                            class="profile-usertitle-name">
                                                                                                                                                                            Truong
                                                                                                                                                                            Cong
                                                                                                                                                                            Trinh
                                                                                                                                                                        </div>

                                                                                                                                                                    </div>
                                                                                                                                                                    <!-- END SIDEBAR USER TITLE -->
                                                                                                                                                                    <!-- SIDEBAR BUTTONS -->
                                                                                                                                                                    <div
                                                                                                                                                                        class="profile-userbuttons">

                                                                                                                                                                        <a class="btn btn-success btn-sm"
                                                                                                                                                                            href="personal-trainer/profile/update-profile?id=${personTrainer.id}">
                                                                                                                                                                            Update profile
                                                                                                                                                                        </a>

                                                                                                                                                                        <a class="btn btn-danger btn-sm"
                                                                                                                                                                           href="/profile/change-password?id=${personTrainer.id}">Change password
                                                                                                                                                                        </a>
                                                                                                                                                                        <div>${succes}</div>
                                                                                                                                                                    </div>
                                                                                                                                                                    <!-- END SIDEBAR BUTTONS -->
                                                                                                                                                                    <!-- SIDEBAR MENU -->
                                                                                                                                                                    <div
                                                                                                                                                                        class="profile-usermenu">

                                                                                                                                                                    </div>
                                                                                                                                                                    <!-- END MENU -->
                                                                                                                                                                </div>
                                                                                                                                                            </div>
                                                                                                                                                            <div
                                                                                                                                                                class="col-md-9">
                                                                                                                                                                <div
                                                                                                                                                                    class="profile-content">
                                                                                                                                                                    <div
                                                                                                                                                                        class="col-sm-9">
                                                                                                                                                                        <ul
                                                                                                                                                                            class="nav nav-tabs">
                                                                                                                                                                            <li
                                                                                                                                                                                class="active">
                                                                                                                                                                                <a data-toggle="tab"
                                                                                                                                                                                    href="#home">Home</a>
                                                                                                                                                                            </li>
                                                                                                                                                                            <li><a data-toggle="tab"
                                                                                                                                                                                    href="#messages">Certificate</a>
                                                                                                                                                                            </li>

                                                                                                                                                                        </ul>


                                                                                                                                                                        <div
                                                                                                                                                                            class="tab-content">
                                                                                                                                                                            <div class="tab-pane active"
                                                                                                                                                                                id="home">
                                                                                                                                                                                <hr>
                                                                                                                                                                                <form
                                                                                                                                                                                    class="form"
                                                                                                                                                                                    action="##"
                                                                                                                                                                                    method="post"
                                                                                                                                                                                    id="registrationForm">
                                                                                                                                                                                    <div
                                                                                                                                                                                        class="form-group">

                                                                                                                                                                                        <div
                                                                                                                                                                                            class="col-xs-6">
                                                                                                                                                                                            <label
                                                                                                                                                                                                for="Name">
                                                                                                                                                                                                <h4>${personTrainer.name}
                                                                                                                                                                                                </h4>
                                                                                                                                                                                            </label>

                                                                                                                                                                                        </div>
                                                                                                                                                                                    </div>
                                                                                                                                                                                    <div
                                                                                                                                                                                        class="form-group">

                                                                                                                                                                                        <div
                                                                                                                                                                                            class="col-xs-6">
                                                                                                                                                                                            <label
                                                                                                                                                                                                for="phone">
                                                                                                                                                                                                <h4>${personTrainer.bankNumber}
                                                                                                                                                                                                </h4>
                                                                                                                                                                                            </label>

                                                                                                                                                                                        </div>
                                                                                                                                                                                    </div>

                                                                                                                                                                                    <div
                                                                                                                                                                                        class="form-group">

                                                                                                                                                                                        <div
                                                                                                                                                                                            class="col-xs-6">
                                                                                                                                                                                            <label
                                                                                                                                                                                                for="phone">
                                                                                                                                                                                                <h4>${personTrainer.phone}
                                                                                                                                                                                                </h4>
                                                                                                                                                                                            </label>
                                                                                                                                                                                        </div>
                                                                                                                                                                                    </div>

                                                                                                                                                                                    <div
                                                                                                                                                                                        class="form-group">
                                                                                                                                                                                        <div
                                                                                                                                                                                            class="col-xs-6">
                                                                                                                                                                                            <label
                                                                                                                                                                                                for="Weight">
                                                                                                                                                                                                <h4>${personTrainer.weight}
                                                                                                                                                                                                </h4>
                                                                                                                                                                                            </label>

                                                                                                                                                                                        </div>
                                                                                                                                                                                    </div>
                                                                                                                                                                                    <div
                                                                                                                                                                                        class="form-group">
                                                                                                                                                                                        <div
                                                                                                                                                                                            class="col-xs-6">
                                                                                                                                                                                            <label
                                                                                                                                                                                                for="Height">
                                                                                                                                                                                                <h4>${personTrainer.height}
                                                                                                                                                                                                </h4>
                                                                                                                                                                                            </label>

                                                                                                                                                                                        </div>
                                                                                                                                                                                    </div>
                                                                                                                                                                                    <div
                                                                                                                                                                                        class="form-group">

                                                                                                                                                                                        <div
                                                                                                                                                                                            class="col-xs-6">
                                                                                                                                                                                            <label
                                                                                                                                                                                                for="email">
                                                                                                                                                                                                <h4>${personTrainer.email}
                                                                                                                                                                                                </h4>
                                                                                                                                                                                            </label>

                                                                                                                                                                                        </div>
                                                                                                                                                                                    </div>
                                                                                                                                                                                    <div
                                                                                                                                                                                        class="form-group">

                                                                                                                                                                                        <div
                                                                                                                                                                                            class="col-xs-6">
                                                                                                                                                                                            <label
                                                                                                                                                                                                for="dayOfBirth">
                                                                                                                                                                                                <h4>${personTrainer.dayOfBirth}
                                                                                                                                                                                                </h4>
                                                                                                                                                                                            </label>

                                                                                                                                                                                        </div>
                                                                                                                                                                                    </div>
                                                                                                                                                                                    <div
                                                                                                                                                                                        class="form-group">

                                                                                                                                                                                        <div
                                                                                                                                                                                            class="col-xs-6">
                                                                                                                                                                                            <label
                                                                                                                                                                                                for="location">
                                                                                                                                                                                                <h4>${personTrainer.location}
                                                                                                                                                                                                </h4>
                                                                                                                                                                                            </label>

                                                                                                                                                                                        </div>
                                                                                                                                                                                    </div>
                                                                                                                                                                                    <div
                                                                                                                                                                                        class="form-group">

                                                                                                                                                                                        <div
                                                                                                                                                                                            class="col-xs-6">
                                                                                                                                                                                            <label
                                                                                                                                                                                                for="sex">
                                                                                                                                                                                                <h4>${personTrainer.sex}
                                                                                                                                                                                                </h4>
                                                                                                                                                                                            </label>

                                                                                                                                                                                        </div>
                                                                                                                                                                                    </div>
                                                                                                                                                                                    <div
                                                                                                                                                                                        class="form-group">

                                                                                                                                                                                        <div
                                                                                                                                                                                            class="col-xs-6">
                                                                                                                                                                                            <label
                                                                                                                                                                                                for="price">
                                                                                                                                                                                                <h4>${personTrainer.price}/h$
                                                                                                                                                                                                </h4>
                                                                                                                                                                                            </label>

                                                                                                                                                                                        </div>
                                                                                                                                                                                    </div>
                                                                                                                                                                                    <div
                                                                                                                                                                                        class="form-group">
                                                                                                                                                                                        <div
                                                                                                                                                                                            class="col-xs-12">
                                                                                                                                                                                            <label
                                                                                                                                                                                                for="description">
                                                                                                                                                                                                <h4>${personTrainer.description}
                                                                                                                                                                                                </h4>
                                                                                                                                                                                            </label>
                                                                                                                                                                                            <!-- Đặt maxlength="-1" để không giới hạn ký tự -->

                                                                                                                                                                                        </div>
                                                                                                                                                                                    </div>




                                                                                                                                                                                </form>

                                                                                                                                                                                <hr>

                                                                                                                                                                            </div>
                                                                                                                                                                            <!--/tab-pane-->
                                                                                                                                                                            <div class="tab-pane"
                                                                                                                                                                                id="messages">

                                                                                                                                                                                <h2>
                                                                                                                                                                                </h2>




                                                                                                                                                                                <hr>
                                                                                                                                                                                <form
                                                                                                                                                                                    class="form"
                                                                                                                                                                                    action="##"
                                                                                                                                                                                    method="post"
                                                                                                                                                                                    id="registrationForm">
                                                                                                                                                                                    <table
                                                                                                                                                                                        class="table">
                                                                                                                                                                                        <thead>
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <th scope="col"
                                                                                                                                                                                                    class="border-0 bg-light">
                                                                                                                                                                                                    <div
                                                                                                                                                                                                        class="p-2 px-3 text-uppercase">
                                                                                                                                                                                                        Image
                                                                                                                                                                                                    </div>
                                                                                                                                                                                                </th>
                                                                                                                                                                                                <th scope="col"
                                                                                                                                                                                                    class="border-0 bg-light">
                                                                                                                                                                                                    <div
                                                                                                                                                                                                        class="py-2 text-uppercase">
                                                                                                                                                                                                        Decription
                                                                                                                                                                                                    </div>
                                                                                                                                                                                                </th>


                                                                                                                                                                                            </tr>
                                                                                                                                                                                        </thead>
                                                                                                                                                                                        <tbody>
                                                                                                                                                                                            <c:forEach
                                                                                                                                                                                                items="${list}"
                                                                                                                                                                                                var="o">
                                                                                                                                                                                                <tr>
                                                                                                                                                                                                    <th
                                                                                                                                                                                                        scope="row">
                                                                                                                                                                                                        <div
                                                                                                                                                                                                            class="p-2">
                                                                                                                                                                                                            <img src="#"
                                                                                                                                                                                                                alt=""
                                                                                                                                                                                                                width="70"
                                                                                                                                                                                                                class="img-fluid rounded shadow-sm">

                                                                                                                                                                                                        </div>
                                                                                                                                                                                                    </th>
                                                                                                                                                                                                    <td
                                                                                                                                                                                                        class="align-middle">
                                                                                                                                                                                                        <strong>
                                                                                                                                                                                                        </strong>
                                                                                                                                                                                                    </td>


                                                                                                                                                                                                </tr>
                                                                                                                                                                                            </c:forEach>
                                                                                                                                                                                        </tbody>
                                                                                                                                                                                    </table>

                                                                                                                                                                                </form>

                                                                                                                                                                            </div>
                                                                                                                                                                            <!--/tab-pane-->


                                                                                                                                                                        </div>
                                                                                                                                                                        <!--/tab-pane-->
                                                                                                                                                                    </div>
                                                                                                                                                                    <!--/tab-content-->

                                                                                                                                                                </div>
                                                                                                                                                                <!--/col-9-->
                                                                                                                                                            </div>
                                                                                                                                                        </div>
                                                                                                                                                    </div>
                                                                                                                                                    </div>

                                                                                                                                                    <br>
                                                                                                                                                    <br>
                                                                                                                                                    <footer
                                                                                                                                                        class="footer-section">
                                                                                                                                                        <div
                                                                                                                                                            class="container">
                                                                                                                                                            <div
                                                                                                                                                                class="row">
                                                                                                                                                                <div
                                                                                                                                                                    class="col-lg-3">
                                                                                                                                                                    <div
                                                                                                                                                                        class="footer-logo-item">
                                                                                                                                                                        <div
                                                                                                                                                                            class="f-logo">
                                                                                                                                                                            <a
                                                                                                                                                                                href="#"><img
                                                                                                                                                                                    src="../../theme1/img/logo.png"
                                                                                                                                                                                    alt=""></a>
                                                                                                                                                                        </div>
                                                                                                                                                                        <p>Despite
                                                                                                                                                                            growth
                                                                                                                                                                            of
                                                                                                                                                                            the
                                                                                                                                                                            Internet
                                                                                                                                                                            over
                                                                                                                                                                            the
                                                                                                                                                                            past
                                                                                                                                                                            seven
                                                                                                                                                                            years,
                                                                                                                                                                            the
                                                                                                                                                                            use
                                                                                                                                                                            of
                                                                                                                                                                            toll-free
                                                                                                                                                                            phone
                                                                                                                                                                            numbers
                                                                                                                                                                            in
                                                                                                                                                                            television
                                                                                                                                                                            advertising
                                                                                                                                                                            continues.
                                                                                                                                                                        </p>
                                                                                                                                                                        <div
                                                                                                                                                                            class="social-links">
                                                                                                                                                                            <h6>Follow
                                                                                                                                                                                us
                                                                                                                                                                            </h6>
                                                                                                                                                                            <a
                                                                                                                                                                                href="#"><i
                                                                                                                                                                                    class="fa fa-facebook"></i></a>
                                                                                                                                                                            <a
                                                                                                                                                                                href="#"><i
                                                                                                                                                                                    class="fa fa-twitter"></i></a>
                                                                                                                                                                            <a
                                                                                                                                                                                href="#"><i
                                                                                                                                                                                    class="fa fa-google-plus"></i></a>
                                                                                                                                                                            <a
                                                                                                                                                                                href="#"><i
                                                                                                                                                                                    class="fa fa-linkedin"></i></a>
                                                                                                                                                                            <a
                                                                                                                                                                                href="#"><i
                                                                                                                                                                                    class="fa fa-instagram"></i></a>
                                                                                                                                                                        </div>
                                                                                                                                                                    </div>
                                                                                                                                                                </div>
                                                                                                                                                                <div
                                                                                                                                                                    class="col-lg-3 offset-lg-1">
                                                                                                                                                                    <div
                                                                                                                                                                        class="footer-widget">
                                                                                                                                                                        <h5>Our
                                                                                                                                                                            Blog
                                                                                                                                                                        </h5>
                                                                                                                                                                        <div
                                                                                                                                                                            class="footer-blog">
                                                                                                                                                                            <a href="#"
                                                                                                                                                                                class="fb-item">
                                                                                                                                                                                <h6>Most
                                                                                                                                                                                    people
                                                                                                                                                                                    who
                                                                                                                                                                                    work
                                                                                                                                                                                </h6>
                                                                                                                                                                                <span
                                                                                                                                                                                    class="blog-time"><i
                                                                                                                                                                                        class="fa fa-clock-o"></i>
                                                                                                                                                                                    Jan
                                                                                                                                                                                    02,
                                                                                                                                                                                    2019</span>
                                                                                                                                                                            </a>
                                                                                                                                                                            <a href="#"
                                                                                                                                                                                class="fb-item">
                                                                                                                                                                                <h6>Freelance
                                                                                                                                                                                    Design
                                                                                                                                                                                    Tricks
                                                                                                                                                                                    How
                                                                                                                                                                                </h6>
                                                                                                                                                                                <span
                                                                                                                                                                                    class="blog-time"><i
                                                                                                                                                                                        class="fa fa-clock-o"></i>
                                                                                                                                                                                    Jan
                                                                                                                                                                                    02,
                                                                                                                                                                                    2019</span>
                                                                                                                                                                            </a>
                                                                                                                                                                            <a href="#"
                                                                                                                                                                                class="fb-item">
                                                                                                                                                                                <h6>have
                                                                                                                                                                                    a
                                                                                                                                                                                    computer
                                                                                                                                                                                    at
                                                                                                                                                                                    home
                                                                                                                                                                                    have
                                                                                                                                                                                    had
                                                                                                                                                                                </h6>
                                                                                                                                                                                <span
                                                                                                                                                                                    class="blog-time"><i
                                                                                                                                                                                        class="fa fa-clock-o"></i>
                                                                                                                                                                                    Jan
                                                                                                                                                                                    02,
                                                                                                                                                                                    2019</span>
                                                                                                                                                                            </a>
                                                                                                                                                                        </div>
                                                                                                                                                                    </div>
                                                                                                                                                                </div>
                                                                                                                                                                <div
                                                                                                                                                                    class="col-lg-2">
                                                                                                                                                                    <div
                                                                                                                                                                        class="footer-widget">
                                                                                                                                                                        <h5>Program
                                                                                                                                                                        </h5>
                                                                                                                                                                        <ul
                                                                                                                                                                            class="workout-program">
                                                                                                                                                                            <li><a
                                                                                                                                                                                    href="#">Bodybuilding</a>
                                                                                                                                                                            </li>
                                                                                                                                                                            <li><a
                                                                                                                                                                                    href="#">Running</a>
                                                                                                                                                                            </li>
                                                                                                                                                                            <li><a
                                                                                                                                                                                    href="#">Streching</a>
                                                                                                                                                                            </li>
                                                                                                                                                                            <li><a
                                                                                                                                                                                    href="#">Weight
                                                                                                                                                                                    Loss</a>
                                                                                                                                                                            </li>
                                                                                                                                                                            <li><a
                                                                                                                                                                                    href="#">Gym
                                                                                                                                                                                    Fitness</a>
                                                                                                                                                                            </li>
                                                                                                                                                                        </ul>
                                                                                                                                                                    </div>
                                                                                                                                                                </div>
                                                                                                                                                                <div
                                                                                                                                                                    class="col-lg-3">
                                                                                                                                                                    <div
                                                                                                                                                                        class="footer-widget">
                                                                                                                                                                        <h5>Get
                                                                                                                                                                            Info
                                                                                                                                                                        </h5>
                                                                                                                                                                        <ul
                                                                                                                                                                            class="footer-info">
                                                                                                                                                                            <li>
                                                                                                                                                                                <i
                                                                                                                                                                                    class="fa fa-phone"></i>
                                                                                                                                                                                <span>Phone:</span>
                                                                                                                                                                                (12)
                                                                                                                                                                                345
                                                                                                                                                                                6789
                                                                                                                                                                            </li>
                                                                                                                                                                            <li>
                                                                                                                                                                                <i
                                                                                                                                                                                    class="fa fa-envelope-o"></i>
                                                                                                                                                                                <span>Email:</span>
                                                                                                                                                                                Colorlib.info@gmail.com
                                                                                                                                                                            </li>
                                                                                                                                                                            <li>
                                                                                                                                                                                <i
                                                                                                                                                                                    class="fa fa-map-marker"></i>
                                                                                                                                                                                <span>Address</span>
                                                                                                                                                                                Iris
                                                                                                                                                                                Watson,
                                                                                                                                                                                Box
                                                                                                                                                                                283
                                                                                                                                                                                8562,
                                                                                                                                                                                NY
                                                                                                                                                                            </li>
                                                                                                                                                                        </ul>
                                                                                                                                                                    </div>
                                                                                                                                                                </div>
                                                                                                                                                            </div>
                                                                                                                                                        </div>
                                                                                                                                                        <div
                                                                                                                                                            class="copyright-text">
                                                                                                                                                            <div
                                                                                                                                                                class="container">
                                                                                                                                                                <div
                                                                                                                                                                    class="row">
                                                                                                                                                                    <div
                                                                                                                                                                        class="col-lg-12 text-center">
                                                                                                                                                                        <div
                                                                                                                                                                            class="ct-inside">
                                                                                                                                                                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                                                                                                                                                            Copyright
                                                                                                                                                                            &copy;
                                                                                                                                                                            <script>document.write(new Date().getFullYear());</script>
                                                                                                                                                                            All
                                                                                                                                                                            rights
                                                                                                                                                                            reserved
                                                                                                                                                                            |
                                                                                                                                                                            This
                                                                                                                                                                            template
                                                                                                                                                                            is
                                                                                                                                                                            made
                                                                                                                                                                            with
                                                                                                                                                                            <i class="fa fa-heart-o"
                                                                                                                                                                                aria-hidden="true"></i>
                                                                                                                                                                            by
                                                                                                                                                                            <a href="https://colorlib.com"
                                                                                                                                                                                target="_blank">Colorlib</a>
                                                                                                                                                                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                                                                                                                                                        </div>
                                                                                                                                                                    </div>
                                                                                                                                                                </div>
                                                                                                                                                            </div>
                                                                                                                                                        </div>
                                                                                                                                                    </footer>
                                                                                                                                                    <!-- Footer Section End -->

                                                                                                                                                    <!-- Js Plugins -->
                                                                                                                                                    <script
                                                                                                                                                        src="js/jquery-3.3.1.min.js"></script>
                                                                                                                                                    <script
                                                                                                                                                        src="js/bootstrap.min.js"></script>
                                                                                                                                                    <script
                                                                                                                                                        src="js/jquery.magnific-popup.min.js"></script>
                                                                                                                                                    <script
                                                                                                                                                        src="js/mixitup.min.js"></script>
                                                                                                                                                    <script
                                                                                                                                                        src="js/jquery.nice-select.min.js"></script>
                                                                                                                                                    <script
                                                                                                                                                        src="js/jquery.slicknav.js"></script>
                                                                                                                                                    <script
                                                                                                                                                        src="js/owl.carousel.min.js"></script>
                                                                                                                                                    <script
                                                                                                                                                        src="js/masonry.pkgd.min.js"></script>
                                                                                                                                                    <script
                                                                                                                                                        src="js/main.js"></script>
</body>

</html>