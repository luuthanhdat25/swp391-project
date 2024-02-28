<%@ include file="common/header.jspf" %>

<body>

    <div class="main-wrapper">

        <div class="header">

            <div class="header-left">
                <a href="index.html" class="logo">
                    <img src="../../assets/img/logo.png" alt="Logo">
                </a>
                <a href="index.html" class="logo logo-small">
                    <img src="../../assets/img/logo-small.png" alt="Logo" width="30" height="30">
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


            <a class="mobile_btn" id="mobile_btn">
                <i class="fas fa-bars"></i>
            </a>


            <ul class="nav user-menu">
                <li class="nav-item dropdown language-drop me-2">
                    <a href="#" class="dropdown-toggle nav-link header-nav-list" data-bs-toggle="dropdown">
                        <img src="../../assets/img/icons/header-icon-01.svg" alt="">
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:;"><i class="flag flag-lr me-2"></i>English</a>
                        <a class="dropdown-item" href="javascript:;"><i class="flag flag-bl me-2"></i>Francais</a>
                        <a class="dropdown-item" href="javascript:;"><i class="flag flag-cn me-2"></i>Turkce</a>
                    </div>
                </li>

                <li class="nav-item dropdown noti-dropdown me-2">
                    <a href="#" class="dropdown-toggle nav-link header-nav-list" data-bs-toggle="dropdown">
                        <img src="../../assets/img/icons/header-icon-05.svg" alt="">
                    </a>
                    <div class="dropdown-menu notifications">
                        <div class="topnav-dropdown-header">
                            <span class="notification-title">Notifications</span>
                            <a href="javascript:void(0)" class="clear-noti"> Clear All </a>
                        </div>
                        <div class="noti-content">
                            <ul class="notification-list">
                                <li class="notification-message">
                                    <a href="#">
                                        <div class="media d-flex">
                                            <span class="avatar avatar-sm flex-shrink-0">
                                                <img class="avatar-img rounded-circle" alt="User Image"
                                                    src="../../assets/img/profiles/avatar-02.jpg">
                                            </span>
                                            <div class="media-body flex-grow-1">
                                                <p class="noti-details"><span class="noti-title">Carlson Tech</span> has
                                                    approved <span class="noti-title">your estimate</span></p>
                                                <p class="noti-time"><span class="notification-time">4 mins ago</span>
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="notification-message">
                                    <a href="#">
                                        <div class="media d-flex">
                                            <span class="avatar avatar-sm flex-shrink-0">
                                                <img class="avatar-img rounded-circle" alt="User Image"
                                                    src="../../assets/img/profiles/avatar-11.jpg">
                                            </span>
                                            <div class="media-body flex-grow-1">
                                                <p class="noti-details"><span class="noti-title">International Software
                                                        Inc</span> has sent you a invoice in the amount of <span
                                                        class="noti-title">$218</span></p>
                                                <p class="noti-time"><span class="notification-time">6 mins ago</span>
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="notification-message">
                                    <a href="#">
                                        <div class="media d-flex">
                                            <span class="avatar avatar-sm flex-shrink-0">
                                                <img class="avatar-img rounded-circle" alt="User Image"
                                                    src="../../assets/img/profiles/avatar-17.jpg">
                                            </span>
                                            <div class="media-body flex-grow-1">
                                                <p class="noti-details"><span class="noti-title">John Hendry</span> sent
                                                    a cancellation request <span class="noti-title">Apple iPhone
                                                        XR</span></p>
                                                <p class="noti-time"><span class="notification-time">8 mins ago</span>
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="notification-message">
                                    <a href="#">
                                        <div class="media d-flex">
                                            <span class="avatar avatar-sm flex-shrink-0">
                                                <img class="avatar-img rounded-circle" alt="User Image"
                                                    src="../../assets/img/profiles/avatar-13.jpg">
                                            </span>
                                            <div class="media-body flex-grow-1">
                                                <p class="noti-details"><span class="noti-title">Mercury Software
                                                        Inc</span> added a new product <span class="noti-title">Apple
                                                        MacBook Pro</span></p>
                                                <p class="noti-time"><span class="notification-time">12 mins ago</span>
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="topnav-dropdown-footer">
                            <a href="#">View all Notifications</a>
                        </div>
                    </div>
                </li>

                <li class="nav-item zoom-screen me-2">
                    <a href="#" class="nav-link header-nav-list">
                        <img src="../../assets/img/icons/header-icon-04.svg" alt="">
                    </a>
                </li>

                <li class="nav-item dropdown has-arrow new-user-menus">
                    <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                        <span class="user-img">
                            <img class="rounded-circle" src="../../assets/img/profiles/avatar-01.jpg" width="31"
                                 alt="Soeng Souy">
                            <div class="user-text">
                                <h6>Soeng Souy</h6>
                                <p class="text-muted mb-0">Administrator</p>
                            </div>
                        </span>
                    </a>
                    <div class="dropdown-menu">
                        <div class="user-header">
                            <div class="avatar avatar-sm">
                                <img src="../../assets/img/profiles/avatar-01.jpg" alt="User Image"
                                     class="avatar-img rounded-circle">
                            </div>
                            <div class="user-text">
                                <h6>Soeng Souy</h6>
                                <p class="text-muted mb-0">Administrator</p>
                            </div>
                        </div>
                        <a class="dropdown-item" href="profile.html">My Profile</a>
                        <a class="dropdown-item" href="inbox.html">Inbox</a>
                        <a class="dropdown-item" href="login.html">Logout</a>
                    </div>
                </li>

            </ul>

        </div>

        <div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li class="menu-title">
                            <span>Main Menu</span>
                        </li>
                        <li>
                            <a href="/"><i class="feather-grid"></i> <span> Home</span></a>
                        </li>
                        <li>
                            <a href="/personal-trainer/"><i class="fas fa-graduation-cap"></i> <span>Find Personal Trainer</span> </a>
                        </li>
                        <li  class="submenu active">
                            <a href="#"><i class="fas fa-chalkboard-teacher"></i> <span>Exercise Wiki</span></a>
                        </li>
                        <%--                        <li>--%>
                        <%--                            <a href="/nutrition/"><i class="fas fa-building"></i><span>Nutrition Wiki</span> </a>--%>
                        <%--                        </li>--%>
                    </ul>
                </div>
            </div>
        </div>


        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-sub-header">
                                <h3 class="page-title">Exercise Details</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/exercise/">Exercise</a></li>
                                    <li class="breadcrumb-item active">Exercise Details</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="student-personals-grp">
                                    <div class="card">
<<<<<<< HEAD
                                        <div class="card-body">
                                            <img class="w-100 mb-2" src="${exercise.imageDescription}" style="border-radius: .25rem;" alt="User Image">
                                            <div class="d-flex mt-md-2">
=======
                                        <div class="card-body position-relative">
                                            <img id="exerciseImage" class="w-100 mb-2" src="${exercise.imageDescription ? exercise.imageDescription : 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg'}" style="border-radius: .25rem;" alt="User Image">

                                            <a href="personal-trainer/profile/">
                                                 <img id="smallImage" class="position-absolute rounded-circle top-0 end-0 w-25" src="${personalTrainerAvatar ? personalTrainerAvatar : 'https://scontent.fsgn2-7.fna.fbcdn.net/v/t39.30808-1/426550388_1093431275117966_2445071136543330602_n.jpg?stp=dst-jpg_p320x320&_nc_cat=108&ccb=1-7&_nc_sid=5740b7&_nc_ohc=PVboOVasR0EAX94BvC9&_nc_ht=scontent.fsgn2-7.fna&oh=00_AfAMa4QeO4QY-dCi0093TSNiV0_fculKKi1ibh2DlU2UiA&oe=65E3F442'}" style="width: 90%; max-width: 100px; border-radius: .25rem;" alt="Small Image">
                                            </a>

                                            <div class="mt-md-2">
>>>>>>> origin/development
                                                <c:set var="backgroundColor" value="bg-success" />
                                                <c:choose>
                                                    <c:when test="${exercise.level eq 'Intermediate'}">
                                                        <c:set var="backgroundColor" value="bg-warning" />
                                                    </c:when>
                                                    <c:when test="${exercise.level eq 'Advanced'}">
                                                        <c:set var="backgroundColor" value="bg-danger" />
                                                    </c:when>
                                                </c:choose>

<<<<<<< HEAD
                                                <h2 class="m-100 p-1 ${backgroundColor} text-white rounded" style="font-size: 1rem">${exercise.level}</h2>
                                                <h2 class="m-100 m-l-5 p-1 bg-info text-white rounded" style="font-size: 1rem">${exercise.type}</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

=======
                                                <h2 class="m-100 p-1 ${backgroundColor} text-white rounded" style="font-size: 1rem">Level: ${exercise.level}</h2>
                                                <h2 class="m-100 p-1 bg-info text-white rounded" style="font-size: 1rem">Affected Muscle: ${exercise.type}</h2>
                                                <h2 class="m-100 p-1 bg-secondary text-white rounded" style="font-size: 1rem">Equipment: ${exercise.equipment}</h2>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

>>>>>>> origin/development
                            <div class="col-lg-8">
                                <div class="student-personals-grp">
                                    <div class="card mb-0">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-center heading-detail">
                                                <h2>${exercise.name}</h2>
<<<<<<< HEAD
                                                <a href="/exercise/details/edit?id=0" class="btn btn-primary"> <i class="far fa-edit me-2"></i>Edit</a>
                                            </div>


                                            <div class="embed-responsive embed-responsive-16by9 w-100">
                                                <iframe  src="https://www.youtube.com/embed/VmB1G1K7v94?si=sXUOXtLXqPeqOHik" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                                            </div>
=======
<%--                                                <a href="/exercise/details/edit?id=0" class="btn btn-primary"> <i class="far fa-edit me-2"></i>Edit</a>--%>
                                            </div>
                                            <hr>

                                            <div class="d-flex justify-content-center">
                                                <div class="embed-responsive embed-responsive-16by9">
                                                    <iframe class="embed-responsive-item" height="270" width="480" src="https://www.youtube.com/embed/VmB1G1K7v94?si=sXUOXtLXqPeqOHik" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                                                </div>
                                            </div>

                                            <hr>
>>>>>>> origin/development

                                            <div class="hello-park  mt-md-4">
                                                <h2>Description</h2>
                                                <p class="mt-2">${exercise.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer>
                <p>Copyright © 2022 Dreamguys.</p>
            </footer>

        </div>

    </div>


    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="../../assets/js/jquery-3.6.0.min.js"></script>

    <script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../assets/js/feather.min.js"></script>

    <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<<<<<<< HEAD

    <script src="../../assets/js/script.js"></script>
=======

    <script src="../../assets/js/script.js"></script>

>>>>>>> origin/development
</body>

</html>