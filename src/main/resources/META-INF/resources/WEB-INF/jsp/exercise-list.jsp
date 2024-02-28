<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="common/header.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<<<<<<< HEAD
<head><link rel="stylesheet" href="../../assets/plugins/bootstrap/css/bootstrap.min.css"></head>
=======
>>>>>>> origin/development

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
                <form id="search_bar">
                    <input type="text"  class="form-control" placeholder="Search here">
                    <button type="submit" class="btn"><i class="fas fa-search"></i></button>
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

<<<<<<< HEAD

<%--        <div class="sidebar" id="sidebar">--%>
<%--            <div class="sidebar-inner slimscroll">--%>
<%--                <div id="sidebar-menu" class="sidebar-menu">--%>
<%--                    <ul>--%>
<%--                        <li class="menu-title">--%>
<%--                            <span>Main Menu</span>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i class="feather-grid"></i> <span> Dashboard</span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="index.html">Admin Dashboard</a></li>--%>
<%--                                <li><a href="teacher-dashboard.html">Teacher Dashboard</a></li>--%>
<%--                                <li><a href="student-dashboard.html">Student Dashboard</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i class="fas fa-graduation-cap"></i> <span> Students</span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="students.html">Student List</a></li>--%>
<%--                                <li><a href="student-details.html">Student View</a></li>--%>
<%--                                <li><a href="add-student.html">Student Add</a></li>--%>
<%--                                <li><a href="edit-student.html">Student Edit</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i class="fas fa-chalkboard-teacher"></i> <span> Teachers</span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="teachers.html">Teacher List</a></li>--%>
<%--                                <li><a href="exercise-details.jsp">Teacher View</a></li>--%>
<%--                                <li><a href="add-teacher.html">Teacher Add</a></li>--%>
<%--                                <li><a href="edit-teacher.html">Teacher Edit</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i class="fas fa-building"></i> <span> Departments</span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="departments.html">Department List</a></li>--%>
<%--                                <li><a href="add-department.html">Department Add</a></li>--%>
<%--                                <li><a href="edit-department.html">Department Edit</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i class="fas fa-book-reader"></i> <span> Subjects</span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="subjects.html">Subject List</a></li>--%>
<%--                                <li><a href="add-subject.html">Subject Add</a></li>--%>
<%--                                <li><a href="edit-subject.html">Subject Edit</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li class="submenu active">--%>
<%--                            <a href="#"><i class="fas fa-clipboard"></i> <span> Invoices</span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="invoices.html">Invoices List</a></li>--%>
<%--                                <li><a href="invoice-grid.html" class="active">Invoices Grid</a></li>--%>
<%--                                <li><a href="add-invoice.html">Add Invoices</a></li>--%>
<%--                                <li><a href="edit-invoice.html">Edit Invoices</a></li>--%>
<%--                                <li><a href="view-invoice.html">Invoices Details</a></li>--%>
<%--                                <li><a href="invoices-settings.html">Invoices Settings</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li class="menu-title">--%>
<%--                            <span>Management</span>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i class="fas fa-file-invoice-dollar"></i> <span> Accounts</span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="fees-collections.html">Fees Collection</a></li>--%>
<%--                                <li><a href="expenses.html">Expenses</a></li>--%>
<%--                                <li><a href="salary.html">Salary</a></li>--%>
<%--                                <li><a href="add-fees-collection.html">Add Fees</a></li>--%>
<%--                                <li><a href="add-expenses.html">Add Expenses</a></li>--%>
<%--                                <li><a href="add-salary.html">Add Salary</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="holiday.html"><i class="fas fa-holly-berry"></i> <span>Holiday</span></a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="fees.html"><i class="fas fa-comment-dollar"></i> <span>Fees</span></a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="exam.html"><i class="fas fa-clipboard-list"></i> <span>Exam list</span></a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="event.html"><i class="fas fa-calendar-day"></i> <span>Events</span></a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="time-table.html"><i class="fas fa-table"></i> <span>Time Table</span></a>--%>
<%--                        </li>--%>
<%--                        <li class="active">--%>
<%--                            <a href="library.html"><i class="fas fa-book"></i> <span>Library</span></a>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i class="fa fa-newspaper"></i> <span> Blogs</span>--%>
<%--                                <span class="menu-arrow"></span>--%>
<%--                            </a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="blog.html">All Blogs</a></li>--%>
<%--                                <li><a href="add-blog.html">Add Blog</a></li>--%>
<%--                                <li><a href="edit-blog.html">Edit Blog</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="settings.html"><i class="fas fa-cog"></i> <span>Settings</span></a>--%>
<%--                        </li>--%>
<%--                        <li class="menu-title">--%>
<%--                            <span>Pages</span>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i class="fas fa-shield-alt"></i> <span> Authentication </span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="login.html">Login</a></li>--%>
<%--                                <li><a href="register.html">Register</a></li>--%>
<%--                                <li><a href="forgot-password.html">Forgot Password</a></li>--%>
<%--                                <li><a href="error-404.html">Error Page</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="blank-page.html"><i class="fas fa-file"></i> <span>Blank Page</span></a>--%>
<%--                        </li>--%>
<%--                        <li class="menu-title">--%>
<%--                            <span>Others</span>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="sports.html"><i class="fas fa-baseball-ball"></i> <span>Sports</span></a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="hostel.html"><i class="fas fa-hotel"></i> <span>Hostel</span></a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="transport.html"><i class="fas fa-bus"></i> <span>Transport</span></a>--%>
<%--                        </li>--%>
<%--                        <li class="menu-title">--%>
<%--                            <span>UI Interface</span>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i class="fab fa-get-pocket"></i> <span>Base UI </span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="alerts.html">Alerts</a></li>--%>
<%--                                <li><a href="accordions.html">Accordions</a></li>--%>
<%--                                <li><a href="avatar.html">Avatar</a></li>--%>
<%--                                <li><a href="badges.html">Badges</a></li>--%>
<%--                                <li><a href="buttons.html">Buttons</a></li>--%>
<%--                                <li><a href="buttongroup.html">Button Group</a></li>--%>
<%--                                <li><a href="breadcrumbs.html">Breadcrumb</a></li>--%>
<%--                                <li><a href="cards.html">Cards</a></li>--%>
<%--                                <li><a href="carousel.html">Carousel</a></li>--%>
<%--                                <li><a href="dropdowns.html">Dropdowns</a></li>--%>
<%--                                <li><a href="grid.html">Grid</a></li>--%>
<%--                                <li><a href="images.html">Images</a></li>--%>
<%--                                <li><a href="lightbox.html">Lightbox</a></li>--%>
<%--                                <li><a href="media.html">Media</a></li>--%>
<%--                                <li><a href="modal.html">Modals</a></li>--%>
<%--                                <li><a href="offcanvas.html">Offcanvas</a></li>--%>
<%--                                <li><a href="pagination.html">Pagination</a></li>--%>
<%--                                <li><a href="popover.html">Popover</a></li>--%>
<%--                                <li><a href="progress.html">Progress Bars</a></li>--%>
<%--                                <li><a href="placeholders.html">Placeholders</a></li>--%>
<%--                                <li><a href="rangeslider.html">Range Slider</a></li>--%>
<%--                                <li><a href="spinners.html">Spinner</a></li>--%>
<%--                                <li><a href="sweetalerts.html">Sweet Alerts</a></li>--%>
<%--                                <li><a href="tab.html">Tabs</a></li>--%>
<%--                                <li><a href="toastr.html">Toasts</a></li>--%>
<%--                                <li><a href="tooltip.html">Tooltip</a></li>--%>
<%--                                <li><a href="typography.html">Typography</a></li>--%>
<%--                                <li><a href="video.html">Video</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i data-feather="box"></i> <span>Elements </span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="ribbon.html">Ribbon</a></li>--%>
<%--                                <li><a href="clipboard.html">Clipboard</a></li>--%>
<%--                                <li><a href="drag-drop.html">Drag & Drop</a></li>--%>
<%--                                <li><a href="rating.html">Rating</a></li>--%>
<%--                                <li><a href="text-editor.html">Text Editor</a></li>--%>
<%--                                <li><a href="counter.html">Counter</a></li>--%>
<%--                                <li><a href="scrollbar.html">Scrollbar</a></li>--%>
<%--                                <li><a href="notification.html">Notification</a></li>--%>
<%--                                <li><a href="stickynote.html">Sticky Note</a></li>--%>
<%--                                <li><a href="timeline.html">Timeline</a></li>--%>
<%--                                <li><a href="horizontal-timeline.html">Horizontal Timeline</a></li>--%>
<%--                                <li><a href="form-wizard.html">Form Wizard</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i data-feather="bar-chart-2"></i> <span> Charts </span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="chart-apex.html">Apex Charts</a></li>--%>
<%--                                <li><a href="chart-js.html">Chart Js</a></li>--%>
<%--                                <li><a href="chart-morris.html">Morris Charts</a></li>--%>
<%--                                <li><a href="chart-flot.html">Flot Charts</a></li>--%>
<%--                                <li><a href="chart-peity.html">Peity Charts</a></li>--%>
<%--                                <li><a href="chart-c3.html">C3 Charts</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i data-feather="award"></i> <span> Icons </span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="icon-fontawesome.html">Fontawesome Icons</a></li>--%>
<%--                                <li><a href="icon-feather.html">Feather Icons</a></li>--%>
<%--                                <li><a href="icon-ionic.html">Ionic Icons</a></li>--%>
<%--                                <li><a href="icon-material.html">Material Icons</a></li>--%>
<%--                                <li><a href="icon-pe7.html">Pe7 Icons</a></li>--%>
<%--                                <li><a href="icon-simpleline.html">Simpleline Icons</a></li>--%>
<%--                                <li><a href="icon-themify.html">Themify Icons</a></li>--%>
<%--                                <li><a href="icon-weather.html">Weather Icons</a></li>--%>
<%--                                <li><a href="icon-typicon.html">Typicon Icons</a></li>--%>
<%--                                <li><a href="icon-flag.html">Flag Icons</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i class="fas fa-columns"></i> <span> Forms </span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="form-basic-inputs.html">Basic Inputs </a></li>--%>
<%--                                <li><a href="form-input-groups.html">Input Groups </a></li>--%>
<%--                                <li><a href="form-horizontal.html">Horizontal Form </a></li>--%>
<%--                                <li><a href="form-vertical.html"> Vertical Form </a></li>--%>
<%--                                <li><a href="form-mask.html"> Form Mask </a></li>--%>
<%--                                <li><a href="form-validation.html"> Form Validation </a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="#"><i class="fas fa-table"></i> <span> Tables </span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="tables-basic.html">Basic Tables </a></li>--%>
<%--                                <li><a href="data-tables.html">Data Table </a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li class="submenu">--%>
<%--                            <a href="javascript:void(0);"><i class="fas fa-code"></i> <span>Multi Level</span> <span--%>
<%--                                    class="menu-arrow"></span></a>--%>
<%--                            <ul>--%>
<%--                                <li class="submenu">--%>
<%--                                    <a href="javascript:void(0);"> <span>Level 1</span> <span--%>
<%--                                            class="menu-arrow"></span></a>--%>
<%--                                    <ul>--%>
<%--                                        <li><a href="javascript:void(0);"><span>Level 2</span></a></li>--%>
<%--                                        <li class="submenu">--%>
<%--                                            <a href="javascript:void(0);"> <span> Level 2</span> <span--%>
<%--                                                    class="menu-arrow"></span></a>--%>
<%--                                            <ul>--%>
<%--                                                <li><a href="javascript:void(0);">Level 3</a></li>--%>
<%--                                                <li><a href="javascript:void(0);">Level 3</a></li>--%>
<%--                                            </ul>--%>
<%--                                        </li>--%>
<%--                                        <li><a href="javascript:void(0);"> <span>Level 2</span></a></li>--%>
<%--                                    </ul>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <a href="javascript:void(0);"> <span>Level 1</span></a>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
=======
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
>>>>>>> origin/development

        <div class="page-wrapper">
            <div class="content container-fluid">

                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col">
                            <h3 class="page-title">Exercise</h3>
                        </div>
                    </div>
                </div>

                <div class="container mb-3">
                    <form id="search-exercise" class="d-flex align-items-center">
                        <input id="searchInput" type="text" class="form-control" placeholder="Search here">
<<<<<<< HEAD
                        <button id="search-exercise-button" class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
=======
                        <button id="search-exercise-button" class="btn btn-primary w-auto h-100" type="submit"><i class="fas fa-search"></i></button>
>>>>>>> origin/development
                    </form>
                </div>


                <div class="card report-card">
                    <div class="card-body pb-0">
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="app-listing justify-content-lg-start">
                                    <li>
                                        <div class="multipleSelection">
                                            <div class="selectBox">
                                                <p class="mb-0">Category</p>
                                                <span class="down-icon"><i class="fas fa-chevron-down"></i></span>
                                            </div>
                                            <div id="checkBoxes">
                                                    <div class="selectBox-cont">
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Chest" class="category">
                                                            <span class="checkmark"></span>
                                                            Chest
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Triceps" class="category">
                                                            <span class="checkmark"></span>
                                                            Triceps
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Biceps" class="category">
                                                            <span class="checkmark"></span>
                                                            Biceps
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Forearms" class="category">
                                                            <span class="checkmark"></span>
                                                            Forearms
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Cadio" class="category">
                                                            <span class="checkmark"></span>
                                                            Cadio
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Calves" class="category">
                                                            <span class="checkmark"></span>
                                                            Calves
                                                        </label>
                                                    </div>
                                                    <button type="submit" class="btn w-100 btn-primary submit-filter">Apply</button>
                                                    <button id="reset-category" type="reset" class="btn w-100 btn-grey">Reset</button>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="multipleSelection">
                                            <div class="selectBox">
                                                <p class="mb-0">Difficulty</p>
                                                <span class="down-icon"><i class="fas fa-chevron-down"></i></span>
                                            </div>
                                            <div id="checkBoxes">
                                                <div class="selectBox-cont">
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Beginner" class="difficulty">
                                                        <span class="checkmark"></span>
                                                        Beginner
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Intermediate" class="difficulty">
                                                        <span class="checkmark"></span>
                                                        Intermediate
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Advanced" class="difficulty">
                                                        <span class="checkmark"></span>
                                                        Advanced
                                                    </label>
                                                </div>
                                                <button type="submit" class="btn w-100 btn-primary submit-filter">Apply</button>
                                                <button id="reset-difficulty" type="reset" class="btn w-100 btn-grey">Reset</button>
<<<<<<< HEAD
=======
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="multipleSelection">
                                            <div class="selectBox">
                                                <p class="mb-0">Equipment</p>
                                                <span class="down-icon"><i class="fas fa-chevron-down"></i></span>
                                            </div>
                                            <div id="checkBoxes">
                                                <div class="selectBox-cont">
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Stationary bike" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Stationary bike
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Elliptical machine" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Elliptical machine
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Rowing machine" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Rowing machine
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Free weights" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Free weights
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Resistance bands" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Resistance bands
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Kettlebells" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Kettlebells
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Bench press" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Bench press
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Leg press machine" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Leg press machine
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Pull-up bar" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Pull-up bar
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Dumbbell" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Dumbbell
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Barbells" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Barbells
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Exercise ball" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Exercise ball
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Yoga mat" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Yoga mat
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Jump rope" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Jump rope
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Medicine ball" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Medicine ball
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Foam roller" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Foam roller
                                                    </label>
                                                </div>
                                                <button type="submit" class="btn w-100 btn-primary submit-filter">Apply</button>
                                                <button id="reset-equipment" type="reset" class="btn w-100 btn-grey">Reset</button>
>>>>>>> origin/development
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

<<<<<<< HEAD
                <div class="card invoices-tabs-card border-0">
                    <div class="card-body card-body pt-0 pb-0">
                        <div class="invoices-main-tabs border-0 pb-0">
                            <div class="row align-items-center">
                                <div class="col-lg-12 col-md-12">
                                    <div class="invoices-settings-btn invoices-settings-btn-one">
                                        <a href="/exercise/create" class="btn"><i class="feather feather-plus-circle"></i>New Exercise</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="exerciseContainer" class="row">
<%--                    <c:forEach var="exercise" items="${exerciseList}">--%>

<%--                        <div class="col-sm-6 col-lg-4 col-xl-3 d-flex">--%>
<%--                            <div class="card invoices-grid-card w-100">--%>
<%--                                <div class="card-header d-flex justify-content-between align-items-center">--%>
<%--                                    <a href="/exercise/details?id=0" class="invoice-grid-link">${exercise.name}</a>--%>
<%--&lt;%&ndash;                                    <a href="edit-invoice.html" class="btn btn-primary"><i class="far fa-edit me-2"></i>Edit</a>&ndash;%&gt;--%>
<%--                                    <a href="view-invoice.html" class="avatar avatar-sm me-2 avatar-img rounded-circle">--%>
<%--                                        <img class="rounded-circle" src="https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*" alt="Edit Avatar">--%>
<%--                                    </a>--%>
<%--                                </div>--%>
<%--                                <div class="container position-relative">--%>
<%--                                    <a href="profile.html" class="text-decoration-none text-dark d-block position-relative">--%>
<%--                                        <img class="w-100 mb-2" src="${exercise.imageDescription}" alt="User Image">--%>
<%--                                        <div class="position-absolute top-0 end-0">--%>


<%--                                            <c:set var="backgroundColor" value="bg-success" />--%>
<%--                                            <c:choose>--%>
<%--                                                <c:when test="${exercise.level eq 'Intermediate'}">--%>
<%--                                                    <c:set var="backgroundColor" value="bg-warning" />--%>
<%--                                                </c:when>--%>
<%--                                                <c:when test="${exercise.level eq 'Advanced'}">--%>
<%--                                                    <c:set var="backgroundColor" value="bg-danger" />--%>
<%--                                                </c:when>--%>
<%--                                            </c:choose>--%>

<%--                                            <h2 class="m-100 p-1 ${backgroundColor} text-white rounded small" style="font-size: 15px;">${exercise.level}</h2>--%>
<%--                                        </div>--%>
<%--                                    </a>--%>
<%--                                </div>--%>
<%--                                <div class="card-body">--%>
<%--                                    <c:forEach var="word" items="${fn:split(exercise.type, ' ')}">--%>
<%--                                        <div style="display: inline-block;">--%>
<%--                                            <h2 class="w-auto p-1 bg-info text-white rounded small" style="font-size: 15px;">${word}</h2>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </c:forEach>--%>
                </div>

                <div>
                <ul class="pagination mb-4">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item active">
                        <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </div>
=======
<%--                <div class="card invoices-tabs-card border-0">--%>
<%--                    <div class="card-body card-body pt-0 pb-0">--%>
<%--                        <div class="invoices-main-tabs border-0 pb-0">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col-lg-12 col-md-12">--%>
<%--                                    <div class="invoices-settings-btn invoices-settings-btn-one">--%>
<%--                                        <a href="/exercise/create" class="btn"><i class="feather feather-plus-circle"></i>New Exercise</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

                    <div id="exerciseContainer" class="d-flex"></div>

<%--                <div>--%>
<%--                    <ul class="pagination mb-4">--%>
<%--                        <li class="page-item disabled">--%>
<%--                            <a class="page-link" href="#" tabindex="-1">Previous</a>--%>
<%--                        </li>--%>
<%--                        <li class="page-item active">--%>
<%--                            <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>--%>
<%--                        </li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link" href="#">Next</a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
>>>>>>> origin/development
            </div>
        </div>
    </div>


    <script src="../../assets/js/jquery-3.6.0.min.js"></script>

    <script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../assets/js/feather.min.js"></script>

    <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="../../assets/plugins/select2/js/select2.min.js"></script>

    <script src="../../assets/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../assets/plugins/datatables/datatables.min.js"></script>

    <script src="../../assets/plugins/moment/moment.min.js"></script>
    <script src="../../assets/js/bootstrap-datetimepicker.min.js"></script>

    <script src="../../assets/js/script.js"></script>

    <script>
        // Function to generate HTML for exercise cards
        function generateExerciseCards(exerciseList) {
<<<<<<< HEAD
            var cardHtml = '';
            exerciseList.forEach(function(exercise) {
                cardHtml += '<div class="col-sm-6 col-lg-4 col-xl-3 d-flex">' +
=======
            var defaultIconUrl = 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg';
            var cardHtml = '';
            exerciseList.forEach(function(exercise) {
                cardHtml += '<div class="col-lg-3 col-xl-3 m-2 rounded-3">' +
>>>>>>> origin/development
                    '<div class="card invoices-grid-card w-100">' +
                    '<div class="card-header d-flex justify-content-between align-items-center">' +
                    '<a href="/exercise/details?id=' + exercise.id + '" class="invoice-grid-link text-decoration-none">' + exercise.name + '</a>' +
                    '<a href="view-invoice.html" class="avatar avatar-sm me-2 avatar-img rounded-circle">' +
<<<<<<< HEAD
                    '<img class="rounded-circle" src="https://icons.veryicon.com/png/o/miscellaneous/commonly-used-icon-1/personal-25.png" alt="Edit Avatar">' +
=======
                    '<img class="rounded-circle" src="' +  'https://scontent.fsgn2-7.fna.fbcdn.net/v/t39.30808-1/426550388_1093431275117966_2445071136543330602_n.jpg?stp=dst-jpg_p320x320&_nc_cat=108&ccb=1-7&_nc_sid=5740b7&_nc_ohc=PVboOVasR0EAX94BvC9&_nc_ht=scontent.fsgn2-7.fna&oh=00_AfAMa4QeO4QY-dCi0093TSNiV0_fculKKi1ibh2DlU2UiA&oe=65E3F442' + '" alt="Edit Avatar">' +
>>>>>>> origin/development
                    '</a>' +
                    '</div>' +
                    '<div class="container position-relative">' +
                    '<a href="/exercise/details?id=' + exercise.id + '" class="text-decoration-none text-dark d-block position-relative">' +
<<<<<<< HEAD
                    '<img class="w-100 mb-2" src="' + exercise.imageDescription + '" alt="User Image">' +
=======
                    '<img class="w-100 mb-2" src="' + (exercise.imageDescription || defaultIconUrl) + '" alt="User Image">' +
>>>>>>> origin/development
                    '<div class="position-absolute top-0 end-0">';

                var backgroundColor = 'bg-success';
                if (exercise.level === 'Intermediate') {
                    backgroundColor = 'bg-warning';
                } else if (exercise.level === 'Advanced') {
                    backgroundColor = 'bg-danger';
                }

                cardHtml += '<h2 class="m-100 p-1 ' + backgroundColor + ' text-white rounded small" style="font-size: 12px;">' + exercise.level + '</h2>' +
                    '</div>' +
                    '</a>' +
                    '</div>' +
                    '<div class="card-body">';

<<<<<<< HEAD
                var types = exercise.type.split(' ');
                types.forEach(function(word) {
                    cardHtml += '<div style="display: inline-block;">' +
                        '<h2 class="w-auto p-1 m-1 bg-info text-white rounded small" style="font-size: 15px;">' + word + '</h2>' +
                        '</div>';
                });

=======
                cardHtml += '<div style="display: inline-block;">' +
                    '<h2 class="w-auto p-1 m-1 bg-info text-white rounded small" style="font-size: 15px;">' + exercise.type + '</h2>' +
                    '</div>';

                cardHtml += '<div style="display: inline-block;">' +
                    '<h2 class="w-auto p-1 m-1 bg-secondary text-white rounded small" style="font-size: 15px;">' + exercise.equipment + '</h2>' +
                    '</div>';
>>>>>>> origin/development
                cardHtml += '</div></div></div>';
            });
            return cardHtml;
        }

<<<<<<< HEAD
=======
        var csrfToken = $("meta[name='_csrf']").attr("content");
        var csrfHeader = $("meta[name='_csrf_header']").attr("content");
        console.log(csrfToken)
        console.log(csrfHeader)
>>>>>>> origin/development

        function sendFilterJSON(filterObject) {
            var filterJSON = JSON.stringify(filterObject);
            console.log(filterJSON);
            $.ajax({
                url: '/api/exercises/search',
                type: 'POST',
<<<<<<< HEAD
=======
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
>>>>>>> origin/development
                data: filterJSON,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(response) {
                    document.getElementById('exerciseContainer').innerHTML = generateExerciseCards(response);
                },
                error: function(xhr, status, error) {
                }
            });
        }

        function sendFilterRequest(){
            var filterObject = {};
            var searchValue = $('#searchInput').val();
            filterObject.searchValue = searchValue;
            filterObject.categories = $('.category:checked').map(function() {
                return $(this).attr('name');
            }).get();
            filterObject.difficulties = $('.difficulty:checked').map(function() {
                return $(this).attr('name');
            }).get();

<<<<<<< HEAD
=======
            filterObject.equipments = $('.equipment:checked').map(function() {
                return $(this).attr('name');
            }).get();

>>>>>>> origin/development
            sendFilterJSON(filterObject);
        }
    </script>

    <script>
<<<<<<< HEAD
        // Start call when page is loaded
        var exerciseList = ${exerciseList};
        document.getElementById('exerciseContainer').innerHTML = generateExerciseCards(exerciseList);
        console.log(exerciseList);
=======
        $(document).ready(function() {
            var exerciseList = ${exerciseList};
            document.getElementById('exerciseContainer').innerHTML = generateExerciseCards(exerciseList);
            console.log(exerciseList);
        })
>>>>>>> origin/development
    </script>

    <script>
        $(document).ready(function(){
            // Search form
            $('#search-exercise').submit(function(event) {
                event.preventDefault();

                var searchValue = $('#searchInput').val();
                if (searchValue.trim() !== '') {
                    sendFilterRequest()
                }
            });

            $('#search-exercise-button').click(function() {
                sendFilterRequest()
            });
            

            // Filter submit
            $('.submit-filter').click(function() {
                sendFilterRequest();
            });

            // Reset categories
            $('#reset-category').click(function() {
                $('.category').prop('checked', false);
                sendFilterRequest()
            });

            // Reset difficulty
            $('#reset-difficulty').click(function() {
                $('.difficulty').prop('checked', false);
                sendFilterRequest()
            });
<<<<<<< HEAD
=======

            // Reset equipment
            $('#reset-equipment').click(function() {
                $('.equipment').prop('checked', false);
                sendFilterRequest()
            });
>>>>>>> origin/development
        });
    </script>

</body>

