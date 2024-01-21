<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Preskool - Books</title>

    <link rel="shortcut icon" href="../../theme2/img/favicon.png">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../../theme2/plugins/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="../../theme2/plugins/feather/feather.css">

    <link rel="stylesheet" href="../../theme2/plugins/icons/flags/flags.css">

    <link rel="stylesheet" href="../../theme2/css/feather.css">
    <link rel="stylesheet" href="../../theme1/css/bootstrap.min.css">

    <link rel="stylesheet" href="../../theme2/css/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet" href="../../theme2/plugins/datatables/datatables.min.css">

    <link rel="stylesheet" href="../../theme2/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="../../theme2/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet" href="../../theme2/plugins/select2/css/select2.min.css">

    <link rel="stylesheet" href="../../theme2/css/style.css">
</head>
<body>

<div class="main-wrapper">

    <div class="header">

        <div class="header-left">
            <a href="index.html" class="logo">
                <img src="../../theme2/img/logo.png" alt="Logo">
            </a>
            <a href="index.html" class="logo logo-small">
                <img src="../../theme2/img/logo-small.png" alt="Logo" width="30" height="30">
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
                    <img src="../../theme2/img/icons/header-icon-01.svg" alt="">
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="javascript:;"><i class="flag flag-lr me-2"></i>English</a>
                    <a class="dropdown-item" href="javascript:;"><i class="flag flag-bl me-2"></i>Francais</a>
                    <a class="dropdown-item" href="javascript:;"><i class="flag flag-cn me-2"></i>Turkce</a>
                </div>
            </li>

            <li class="nav-item dropdown noti-dropdown me-2">
                <a href="#" class="dropdown-toggle nav-link header-nav-list" data-bs-toggle="dropdown">
                    <img src="../../theme2/img/icons/header-icon-05.svg" alt="">
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
<img class="avatar-img rounded-circle" alt="User Image" src="../../theme2/img/profiles/avatar-02.jpg">
</span>
                                        <div class="media-body flex-grow-1">
                                            <p class="noti-details"><span class="noti-title">Carlson Tech</span> has approved <span class="noti-title">your estimate</span></p>
                                            <p class="noti-time"><span class="notification-time">4 mins ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="#">
                                    <div class="media d-flex">
<span class="avatar avatar-sm flex-shrink-0">
<img class="avatar-img rounded-circle" alt="User Image" src="../../theme2/img/profiles/avatar-11.jpg">
</span>
                                        <div class="media-body flex-grow-1">
                                            <p class="noti-details"><span class="noti-title">International Software Inc</span> has sent you a invoice in the amount of <span class="noti-title">$218</span></p>
                                            <p class="noti-time"><span class="notification-time">6 mins ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="#">
                                    <div class="media d-flex">
<span class="avatar avatar-sm flex-shrink-0">
<img class="avatar-img rounded-circle" alt="User Image" src="../../theme2/img/profiles/avatar-17.jpg">
</span>
                                        <div class="media-body flex-grow-1">
                                            <p class="noti-details"><span class="noti-title">John Hendry</span> sent a cancellation request <span class="noti-title">Apple iPhone XR</span></p>
                                            <p class="noti-time"><span class="notification-time">8 mins ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="#">
                                    <div class="media d-flex">
<span class="avatar avatar-sm flex-shrink-0">
<img class="avatar-img rounded-circle" alt="User Image" src="../../theme2/img/profiles/avatar-13.jpg">
</span>
                                        <div class="media-body flex-grow-1">
                                            <p class="noti-details"><span class="noti-title">Mercury Software Inc</span> added a new product <span class="noti-title">Apple MacBook Pro</span></p>
                                            <p class="noti-time"><span class="notification-time">12 mins ago</span></p>
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
                    <img src="../../theme2/img/icons/header-icon-04.svg" alt="">
                </a>
            </li>

            <li class="nav-item dropdown has-arrow new-user-menus">
                <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
<span class="user-img">
<img class="rounded-circle" src="../../theme2/img/profiles/avatar-01.jpg" width="31" alt="Soeng Souy">
<div class="user-text">
<h6>Soeng Souy</h6>
<p class="text-muted mb-0">Administrator</p>
</div>
</span>
                </a>
                <div class="dropdown-menu">
                    <div class="user-header">
                        <div class="avatar avatar-sm">
                            <img src="../../theme2/img/profiles/avatar-01.jpg" alt="User Image" class="avatar-img rounded-circle">
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
                    <li class="submenu">
                        <a href="#"><i class="feather-grid"></i> <span> Dashboard</span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="index.html">Admin Dashboard</a></li>
                            <li><a href="teacher-dashboard.html">Teacher Dashboard</a></li>
                            <li><a href="student-dashboard.html">Student Dashboard</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fas fa-graduation-cap"></i> <span> Students</span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="students.html">Student List</a></li>
                            <li><a href="student-details.html">Student View</a></li>
                            <li><a href="add-student.html">Student Add</a></li>
                            <li><a href="edit-student.html">Student Edit</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fas fa-chalkboard-teacher"></i> <span> Teachers</span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="teachers.html">Teacher List</a></li>
                            <li><a href="teacher-details.html">Teacher View</a></li>
                            <li><a href="add-teacher.html">Teacher Add</a></li>
                            <li><a href="edit-teacher.html">Teacher Edit</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fas fa-building"></i> <span> Departments</span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="departments.html">Department List</a></li>
                            <li><a href="add-department.html">Department Add</a></li>
                            <li><a href="edit-department.html">Department Edit</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fas fa-book-reader"></i> <span> Subjects</span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="subjects.html">Subject List</a></li>
                            <li><a href="add-subject.html">Subject Add</a></li>
                            <li><a href="edit-subject.html">Subject Edit</a></li>
                        </ul>
                    </li>
                    <li class="submenu active">
                        <a href="#"><i class="fas fa-clipboard"></i> <span> Invoices</span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="invoices.html">Invoices List</a></li>
                            <li><a href="invoice-grid.html" class="active">Invoices Grid</a></li>
                            <li><a href="add-invoice.html">Add Invoices</a></li>
                            <li><a href="edit-invoice.html">Edit Invoices</a></li>
                            <li><a href="view-invoice.html">Invoices Details</a></li>
                            <li><a href="invoices-settings.html">Invoices Settings</a></li>
                        </ul>
                    </li>
                    <li class="menu-title">
                        <span>Management</span>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fas fa-file-invoice-dollar"></i> <span> Accounts</span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="fees-collections.html">Fees Collection</a></li>
                            <li><a href="expenses.html">Expenses</a></li>
                            <li><a href="salary.html">Salary</a></li>
                            <li><a href="add-fees-collection.html">Add Fees</a></li>
                            <li><a href="add-expenses.html">Add Expenses</a></li>
                            <li><a href="add-salary.html">Add Salary</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="holiday.html"><i class="fas fa-holly-berry"></i> <span>Holiday</span></a>
                    </li>
                    <li>
                        <a href="fees.html"><i class="fas fa-comment-dollar"></i> <span>Fees</span></a>
                    </li>
                    <li>
                        <a href="exam.html"><i class="fas fa-clipboard-list"></i> <span>Exam list</span></a>
                    </li>
                    <li>
                        <a href="event.html"><i class="fas fa-calendar-day"></i> <span>Events</span></a>
                    </li>
                    <li>
                        <a href="time-table.html"><i class="fas fa-table"></i> <span>Time Table</span></a>
                    </li>
                    <li class="active">
                        <a href="library.html"><i class="fas fa-book"></i> <span>Library</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-newspaper"></i> <span> Blogs</span>
                            <span class="menu-arrow"></span>
                        </a>
                        <ul>
                            <li><a href="blog.html">All Blogs</a></li>
                            <li><a href="add-blog.html">Add Blog</a></li>
                            <li><a href="edit-blog.html">Edit Blog</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="settings.html"><i class="fas fa-cog"></i> <span>Settings</span></a>
                    </li>
                    <li class="menu-title">
                        <span>Pages</span>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fas fa-shield-alt"></i> <span> Authentication </span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="login.html">Login</a></li>
                            <li><a href="register.html">Register</a></li>
                            <li><a href="forgot-password.html">Forgot Password</a></li>
                            <li><a href="error-404.html">Error Page</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="blank-page.html"><i class="fas fa-file"></i> <span>Blank Page</span></a>
                    </li>
                    <li class="menu-title">
                        <span>Others</span>
                    </li>
                    <li>
                        <a href="sports.html"><i class="fas fa-baseball-ball"></i> <span>Sports</span></a>
                    </li>
                    <li>
                        <a href="hostel.html"><i class="fas fa-hotel"></i> <span>Hostel</span></a>
                    </li>
                    <li>
                        <a href="transport.html"><i class="fas fa-bus"></i> <span>Transport</span></a>
                    </li>
                    <li class="menu-title">
                        <span>UI Interface</span>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fab fa-get-pocket"></i> <span>Base UI </span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="alerts.html">Alerts</a></li>
                            <li><a href="accordions.html">Accordions</a></li>
                            <li><a href="avatar.html">Avatar</a></li>
                            <li><a href="badges.html">Badges</a></li>
                            <li><a href="buttons.html">Buttons</a></li>
                            <li><a href="buttongroup.html">Button Group</a></li>
                            <li><a href="breadcrumbs.html">Breadcrumb</a></li>
                            <li><a href="cards.html">Cards</a></li>
                            <li><a href="carousel.html">Carousel</a></li>
                            <li><a href="dropdowns.html">Dropdowns</a></li>
                            <li><a href="grid.html">Grid</a></li>
                            <li><a href="images.html">Images</a></li>
                            <li><a href="lightbox.html">Lightbox</a></li>
                            <li><a href="media.html">Media</a></li>
                            <li><a href="modal.html">Modals</a></li>
                            <li><a href="offcanvas.html">Offcanvas</a></li>
                            <li><a href="pagination.html">Pagination</a></li>
                            <li><a href="popover.html">Popover</a></li>
                            <li><a href="progress.html">Progress Bars</a></li>
                            <li><a href="placeholders.html">Placeholders</a></li>
                            <li><a href="rangeslider.html">Range Slider</a></li>
                            <li><a href="spinners.html">Spinner</a></li>
                            <li><a href="sweetalerts.html">Sweet Alerts</a></li>
                            <li><a href="tab.html">Tabs</a></li>
                            <li><a href="toastr.html">Toasts</a></li>
                            <li><a href="tooltip.html">Tooltip</a></li>
                            <li><a href="typography.html">Typography</a></li>
                            <li><a href="video.html">Video</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i data-feather="box"></i> <span>Elements </span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="ribbon.html">Ribbon</a></li>
                            <li><a href="clipboard.html">Clipboard</a></li>
                            <li><a href="drag-drop.html">Drag & Drop</a></li>
                            <li><a href="rating.html">Rating</a></li>
                            <li><a href="text-editor.html">Text Editor</a></li>
                            <li><a href="counter.html">Counter</a></li>
                            <li><a href="scrollbar.html">Scrollbar</a></li>
                            <li><a href="notification.html">Notification</a></li>
                            <li><a href="stickynote.html">Sticky Note</a></li>
                            <li><a href="timeline.html">Timeline</a></li>
                            <li><a href="horizontal-timeline.html">Horizontal Timeline</a></li>
                            <li><a href="form-wizard.html">Form Wizard</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i data-feather="bar-chart-2"></i> <span> Charts </span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="chart-apex.html">Apex Charts</a></li>
                            <li><a href="chart-js.html">Chart Js</a></li>
                            <li><a href="chart-morris.html">Morris Charts</a></li>
                            <li><a href="chart-flot.html">Flot Charts</a></li>
                            <li><a href="chart-peity.html">Peity Charts</a></li>
                            <li><a href="chart-c3.html">C3 Charts</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i data-feather="award"></i> <span> Icons </span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="icon-fontawesome.html">Fontawesome Icons</a></li>
                            <li><a href="icon-feather.html">Feather Icons</a></li>
                            <li><a href="icon-ionic.html">Ionic Icons</a></li>
                            <li><a href="icon-material.html">Material Icons</a></li>
                            <li><a href="icon-pe7.html">Pe7 Icons</a></li>
                            <li><a href="icon-simpleline.html">Simpleline Icons</a></li>
                            <li><a href="icon-themify.html">Themify Icons</a></li>
                            <li><a href="icon-weather.html">Weather Icons</a></li>
                            <li><a href="icon-typicon.html">Typicon Icons</a></li>
                            <li><a href="icon-flag.html">Flag Icons</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fas fa-columns"></i> <span> Forms </span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="form-basic-inputs.html">Basic Inputs </a></li>
                            <li><a href="form-input-groups.html">Input Groups </a></li>
                            <li><a href="form-horizontal.html">Horizontal Form </a></li>
                            <li><a href="form-vertical.html"> Vertical Form </a></li>
                            <li><a href="form-mask.html"> Form Mask </a></li>
                            <li><a href="form-validation.html"> Form Validation </a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fas fa-table"></i> <span> Tables </span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="tables-basic.html">Basic Tables </a></li>
                            <li><a href="data-tables.html">Data Table </a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="javascript:void(0);"><i class="fas fa-code"></i> <span>Multi Level</span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li class="submenu">
                                <a href="javascript:void(0);"> <span>Level 1</span> <span class="menu-arrow"></span></a>
                                <ul>
                                    <li><a href="javascript:void(0);"><span>Level 2</span></a></li>
                                    <li class="submenu">
                                        <a href="javascript:void(0);"> <span> Level 2</span> <span class="menu-arrow"></span></a>
                                        <ul>
                                            <li><a href="javascript:void(0);">Level 3</a></li>
                                            <li><a href="javascript:void(0);">Level 3</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="javascript:void(0);"> <span>Level 2</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0);"> <span>Level 1</span></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <div class="page-wrapper">
        <div class="content container-fluid">

            <div class="page-header" >
                <div class="row align-items-center">
                    <div class="col">
                        <h3 class="page-title">Exercise</h3>
                    </div>
                </div>
            </div>

            <div style="position: relative; display: inline-block; width: 100%" >
                <form style="display: flex; align-items: center;">
                    <input type="text" class="form-control" placeholder="Search here">
                    <button class="btn" type="submit"><i class="fas fa-search"></i></button>
                </form>
            </div>



<%--            <div class="page-header">--%>
<%--                <div class="row align-items-center">--%>
<%--                    <div class="col"></div>--%>
<%--                    <div class="col-auto">--%>
<%--                        <a href="invoices.html" class="invoices-links">--%>
<%--                            <i class="feather feather-list"></i>--%>
<%--                        </a>--%>
<%--                        <a href="invoice-grid.html" class="invoices-links active">--%>
<%--                            <i class="feather feather-grid"></i>--%>
<%--                        </a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>


            <div class="card report-card">
                <div class="card-body pb-0">
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="app-listing">
                                <li>
                                    <div class="multipleSelection">
                                        <div class="selectBox">
                                            <p class="mb-0"><i class="fas fa-user-plus me-1 select-icon"></i> Select User</p>
                                            <span class="down-icon"><i class="fas fa-chevron-down"></i></span>
                                        </div>
                                        <div id="checkBoxes">
                                            <form action="#">
                                                <p class="checkbox-title">Customer Search</p>
                                                <div class="form-custom">
                                                    <input type="text" class="form-control bg-grey" placeholder="Enter Customer Name">
                                                </div>
                                                <div class="selectBox-cont">
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="username">
                                                        <span class="checkmark"></span> Brian Johnson
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="username">
                                                        <span class="checkmark"></span> Russell Copeland
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="username">
                                                        <span class="checkmark"></span> Greg Lynch
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="username">
                                                        <span class="checkmark"></span> John Blair
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="username">
                                                        <span class="checkmark"></span> Barbara Moore
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="username">
                                                        <span class="checkmark"></span> Hendry Evan
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="username">
                                                        <span class="checkmark"></span> Richard Miles
                                                    </label>
                                                </div>
                                                <button type="submit" class="btn w-100 btn-primary">Apply</button>
                                                <button type="reset" class="btn w-100 btn-grey">Reset</button>
                                            </form>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="multipleSelection">
                                        <div class="selectBox">
                                            <p class="mb-0"><i class="fas fa-calendar me-1 select-icon"></i> Select Date</p>
                                            <span class="down-icon"><i class="fas fa-chevron-down"></i></span>
                                        </div>
                                        <div id="checkBoxes">
                                            <form action="#">
                                                <p class="checkbox-title">Date Filter</p>
                                                <div class="selectBox-cont selectBox-cont-one h-auto">
                                                    <div class="date-picker">
                                                        <div class="form-custom cal-icon">
                                                            <input class="form-control datetimepicker" type="text" placeholder="Form">
                                                        </div>
                                                    </div>
                                                    <div class="date-picker pe-0">
                                                        <div class="form-custom cal-icon">
                                                            <input class="form-control datetimepicker" type="text" placeholder="To">
                                                        </div>
                                                    </div>
                                                    <div class="date-list">
                                                        <ul>
                                                            <li><a href="#" class="btn date-btn">Today</a></li>
                                                            <li><a href="#" class="btn date-btn">Yesterday</a></li>
                                                            <li><a href="#" class="btn date-btn">Last 7 days</a></li>
                                                            <li><a href="#" class="btn date-btn">This month</a></li>
                                                            <li><a href="#" class="btn date-btn">Last month</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="multipleSelection">
                                        <div class="selectBox">
                                            <p class="mb-0"><i class="fas fa-book-open me-1 select-icon"></i> Select Status</p>
                                            <span class="down-icon"><i class="fas fa-chevron-down"></i></span>
                                        </div>
                                        <div id="checkBoxes">
                                            <form action="#">
                                                <p class="checkbox-title">By Status</p>
                                                <div class="selectBox-cont">
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="name" checked>
                                                        <span class="checkmark"></span> All Invoices
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="name">
                                                        <span class="checkmark"></span> Paid
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="name">
                                                        <span class="checkmark"></span> Overdue
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="name">
                                                        <span class="checkmark"></span> Draft
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="name">
                                                        <span class="checkmark"></span> Recurring
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="name">
                                                        <span class="checkmark"></span> Cancelled
                                                    </label>
                                                </div>
                                                <button type="submit" class="btn w-100 btn-primary">Apply</button>
                                                <button type="reset" class="btn w-100 btn-grey">Reset</button>
                                            </form>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="multipleSelection">
                                        <div class="selectBox">
                                            <p class="mb-0"><i class="fas fa-bookmark me-1 select-icon"></i> By Category</p>
                                            <span class="down-icon"><i class="fas fa-chevron-down"></i></span>
                                        </div>
                                        <div id="checkBoxes">
                                            <form action="#">
                                                <p class="checkbox-title">Category</p>
                                                <div class="form-custom">
                                                    <input type="text" class="form-control bg-grey" placeholder="Enter Category Name">
                                                </div>
                                                <div class="selectBox-cont">
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="category">
                                                        <span class="checkmark"></span> Advertising
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="category">
                                                        <span class="checkmark"></span> Food
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="category">
                                                        <span class="checkmark"></span> Marketing
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="category">
                                                        <span class="checkmark"></span> Repairs
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="category">
                                                        <span class="checkmark"></span> Software
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="category">
                                                        <span class="checkmark"></span> Stationary
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="category">
                                                        <span class="checkmark"></span> Travel
                                                    </label>
                                                </div>
                                                <button type="submit" class="btn w-100 btn-primary">Apply</button>
                                                <button type="reset" class="btn w-100 btn-grey">Reset</button>
                                            </form>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="report-btn">
                                        <a href="#" class="btn">
                                            <img src="../../theme2/img/icons/invoices-icon5.png" alt="" class="me-2"> Generate report
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

<%--            EXERCISE--%>
<%--            EXERCISE_ID--%>
<%--            NAME--%>
<%--            TYPE--%>
<%--            DESCRIPTION--%>
<%--            LEVEL--%>
<%--            VIDEO_DESC--%>
<%--            IMAGE_DESC--%>
<%--            CALO_OUT--%>
<%--            PERSONAL_TRAINER_ID--%>

            <div class="card invoices-tabs-card border-0">
                <div class="card-body card-body pt-0 pb-0">
                    <div class="invoices-main-tabs border-0 pb-0">
                        <div class="row align-items-center">
                            <div class="col-lg-12 col-md-12">
                                <div class="invoices-settings-btn invoices-settings-btn-one">
<%--                                    <a href="invoices-settings.html" class="invoices-settings-icon">--%>
<%--                                        <i class="feather feather-settings"></i>--%>
<%--                                    </a>--%>
                                    <a href="add-invoice.html" class="btn">
                                        <i class="feather feather-plus-circle"></i> New Exercise
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-4 col-xl-3 d-flex">
                    <div class="card invoices-grid-card w-100">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <div href="view-invoice.html" class="invoice-grid-link">Chess</div>
                            <div class="dropdown dropdown-action">
                                <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <a class="dropdown-item" href="edit-invoice.html"><i class="far fa-edit me-2"></i>Edit</a>
                                    <a class="dropdown-item" href="view-invoice.html"><i class="far fa-eye me-2"></i>View</a>
<%--                                    <a class="dropdown-item" href="javascript:void(0);"><i class="far fa-trash-alt me-2"></i>Delete</a>--%>
                                </div>
                            </div>
                        </div>
                        <div class="card-middle">
                            <h2 class="card-middle-avatar">
                                <a href="profile.html"><img class="avatar avatar-sm h-25 avatar-img rounded-circle w-25 " src="https://static.strengthlevel.com/images/illustrations/bench-press-1000x1000.jpg" alt="User Image">Bench Press Standard</a>
                            </h2>
                        </div>
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col">
                                    <span><img style="height: 10%; width: 10%" src="../../theme2/img/calories.png" alt="Calo">Calo</span>
                                    <h6 class="mb-0">50 calo/rep</h6>
                                </div>
<%--                                <div class="col-auto">--%>
<%--                                    <span><i class="far fa-calendar-alt"></i> Due Date</span>--%>
<%--                                    <h6 class="mb-0">23 Mar, 2022</h6>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                        <div class="    card-footer">
                            <div class="row align-items-center">
                                <div class="col-auto">
                                    <span class="badge bg-success-dark">Easy</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<%--                <div class="col-sm-6 col-lg-4 col-xl-3 d-flex">--%>
<%--                    <div class="card invoices-grid-card w-100">--%>
<%--                        <div class="card-header d-flex justify-content-between align-items-center">--%>
<%--                            <a href="view-invoice.html" class="invoice-grid-link">IN093439#@10</a>--%>
<%--                            <div class="dropdown dropdown-action">--%>
<%--                                <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>--%>
<%--                                <div class="dropdown-menu dropdown-menu-end">--%>
<%--                                    <a class="dropdown-item" href="edit-invoice.html"><i class="far fa-edit me-2"></i>Edit</a>--%>
<%--                                    <a class="dropdown-item" href="view-invoice.html"><i class="far fa-eye me-2"></i>View</a>--%>
<%--                                    <a class="dropdown-item" href="javascript:void(0);"><i class="far fa-trash-alt me-2"></i>Delete</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-middle">--%>
<%--                            <h2 class="card-middle-avatar">--%>
<%--                                <a href="profile.html"><img class="avatar avatar-sm me-2 avatar-img rounded-circle" src="../../theme2/img/profiles/avatar-06.jpg" alt="User Image"> Karlene Chaidez</a>--%>
<%--                            </h2>--%>
<%--                        </div>--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col">--%>
<%--                                    <span><i class="far fa-money-bill-alt"></i> Amount</span>--%>
<%--                                    <h6 class="mb-0">$1,222</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span><i class="far fa-calendar-alt"></i> Due Date</span>--%>
<%--                                    <h6 class="mb-0">18 Mar 2022</h6>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-footer">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span class="badge bg-danger-dark">Overdue</span>--%>
<%--                                </div>--%>
<%--                                <div class="col text-end">--%>
<%--                                    <span class="text-danger text-sm">Overdue 14 days</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-sm-6 col-lg-4 col-xl-3 d-flex">--%>
<%--                    <div class="card invoices-grid-card w-100">--%>
<%--                        <div class="card-header d-flex justify-content-between align-items-center">--%>
<%--                            <a href="view-invoice.html" class="invoice-grid-link">IN093439#@11</a>--%>
<%--                            <div class="dropdown dropdown-action">--%>
<%--                                <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>--%>
<%--                                <div class="dropdown-menu dropdown-menu-end">--%>
<%--                                    <a class="dropdown-item" href="edit-invoice.html"><i class="far fa-edit me-2"></i>Edit</a>--%>
<%--                                    <a class="dropdown-item" href="view-invoice.html"><i class="far fa-eye me-2"></i>View</a>--%>
<%--                                    <a class="dropdown-item" href="javascript:void(0);"><i class="far fa-trash-alt me-2"></i>Delete</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-middle">--%>
<%--                            <h2 class="card-middle-avatar">--%>
<%--                                <a href="profile.html"><img class="avatar avatar-sm me-2 avatar-img rounded-circle" src="../../theme2/img/profiles/avatar-08.jpg" alt="User Image"> Russell Copeland</a>--%>
<%--                            </h2>--%>
<%--                        </div>--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col">--%>
<%--                                    <span><i class="far fa-money-bill-alt"></i> Amount</span>--%>
<%--                                    <h6 class="mb-0">$3,470</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span><i class="far fa-calendar-alt"></i> Due Date</span>--%>
<%--                                    <h6 class="mb-0">10 Mar 2022</h6>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-footer">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span class="badge bg-secondary-dark">Cancelled</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-sm-6 col-lg-4 col-xl-3 d-flex">--%>
<%--                    <div class="card invoices-grid-card w-100">--%>
<%--                        <div class="card-header d-flex justify-content-between align-items-center">--%>
<%--                            <a href="view-invoice.html" class="invoice-grid-link">IN093439#@12</a>--%>
<%--                            <div class="dropdown dropdown-action">--%>
<%--                                <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>--%>
<%--                                <div class="dropdown-menu dropdown-menu-end">--%>
<%--                                    <a class="dropdown-item" href="edit-invoice.html"><i class="far fa-edit me-2"></i>Edit</a>--%>
<%--                                    <a class="dropdown-item" href="view-invoice.html"><i class="far fa-eye me-2"></i>View</a>--%>
<%--                                    <a class="dropdown-item" href="javascript:void(0);"><i class="far fa-trash-alt me-2"></i>Delete</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-middle">--%>
<%--                            <h2 class="card-middle-avatar">--%>
<%--                                <a href="profile.html"><img class="avatar avatar-sm me-2 avatar-img rounded-circle" src="../../theme2/img/profiles/avatar-10.jpg" alt="User Image"> Joseph Collins</a>--%>
<%--                            </h2>--%>
<%--                        </div>--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col">--%>
<%--                                    <span><i class="far fa-money-bill-alt"></i> Amount</span>--%>
<%--                                    <h6 class="mb-0">$8,265</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span><i class="far fa-calendar-alt"></i> Due Date</span>--%>
<%--                                    <h6 class="mb-0">30 Mar 2022</h6>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-footer">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span class="badge bg-primary-dark">Sent</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-sm-6 col-lg-4 col-xl-3 d-flex">--%>
<%--                    <div class="card invoices-grid-card w-100">--%>
<%--                        <div class="card-header d-flex justify-content-between align-items-center">--%>
<%--                            <a href="view-invoice.html" class="invoice-grid-link">IN093439#@13</a>--%>
<%--                            <div class="dropdown dropdown-action">--%>
<%--                                <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>--%>
<%--                                <div class="dropdown-menu dropdown-menu-end">--%>
<%--                                    <a class="dropdown-item" href="edit-invoice.html"><i class="far fa-edit me-2"></i>Edit</a>--%>
<%--                                    <a class="dropdown-item" href="view-invoice.html"><i class="far fa-eye me-2"></i>View</a>--%>
<%--                                    <a class="dropdown-item" href="javascript:void(0);"><i class="far fa-trash-alt me-2"></i>Delete</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-middle">--%>
<%--                            <h2 class="card-middle-avatar">--%>
<%--                                <a href="profile.html"><img class="avatar avatar-sm me-2 avatar-img rounded-circle" src="../../theme2/img/profiles/avatar-11.jpg" alt="User Image"> Jennifer Floyd</a>--%>
<%--                            </h2>--%>
<%--                        </div>--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col">--%>
<%--                                    <span><i class="far fa-money-bill-alt"></i> Amount</span>--%>
<%--                                    <h6 class="mb-0">$5,200</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span><i class="far fa-calendar-alt"></i> Due Date</span>--%>
<%--                                    <h6 class="mb-0">20 Mar 2022</h6>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-footer">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span class="badge bg-secondary-dark">Cancelled</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-sm-6 col-lg-4 col-xl-3 d-flex">--%>
<%--                    <div class="card invoices-grid-card w-100">--%>
<%--                        <div class="card-header d-flex justify-content-between align-items-center">--%>
<%--                            <a href="view-invoice.html" class="invoice-grid-link">IN093439#@14</a>--%>
<%--                            <div class="dropdown dropdown-action">--%>
<%--                                <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>--%>
<%--                                <div class="dropdown-menu dropdown-menu-end">--%>
<%--                                    <a class="dropdown-item" href="edit-invoice.html"><i class="far fa-edit me-2"></i>Edit</a>--%>
<%--                                    <a class="dropdown-item" href="view-invoice.html"><i class="far fa-eye me-2"></i>View</a>--%>
<%--                                    <a class="dropdown-item" href="javascript:void(0);"><i class="far fa-trash-alt me-2"></i>Delete</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-middle">--%>
<%--                            <h2 class="card-middle-avatar">--%>
<%--                                <a href="profile.html"><img class="avatar avatar-sm me-2 avatar-img rounded-circle" src="../../theme2/img/profiles/avatar-09.jpg" alt="User Image"> Leatha Bailey</a>--%>
<%--                            </h2>--%>
<%--                        </div>--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col">--%>
<%--                                    <span><i class="far fa-money-bill-alt"></i> Amount</span>--%>
<%--                                    <h6 class="mb-0">$480</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span><i class="far fa-calendar-alt"></i> Due Date</span>--%>
<%--                                    <h6 class="mb-0">15 Mar 2022</h6>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-footer">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span class="badge bg-primary-dark">Sent</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-sm-6 col-lg-4 col-xl-3 d-flex">--%>
<%--                    <div class="card invoices-grid-card w-100">--%>
<%--                        <div class="card-header d-flex justify-content-between align-items-center">--%>
<%--                            <a href="view-invoice.html" class="invoice-grid-link">IN093439#@15</a>--%>
<%--                            <div class="dropdown dropdown-action">--%>
<%--                                <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>--%>
<%--                                <div class="dropdown-menu dropdown-menu-end">--%>
<%--                                    <a class="dropdown-item" href="edit-invoice.html"><i class="far fa-edit me-2"></i>Edit</a>--%>
<%--                                    <a class="dropdown-item" href="view-invoice.html"><i class="far fa-eye me-2"></i>View</a>--%>
<%--                                    <a class="dropdown-item" href="javascript:void(0);"><i class="far fa-trash-alt me-2"></i>Delete</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-middle">--%>
<%--                            <h2 class="card-middle-avatar">--%>
<%--                                <a href="profile.html"><img class="avatar avatar-sm me-2 avatar-img rounded-circle" src="../../theme2/img/profiles/avatar-12.jpg" alt="User Image"> Alex Campbell</a>--%>
<%--                            </h2>--%>
<%--                        </div>--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col">--%>
<%--                                    <span><i class="far fa-money-bill-alt"></i> Amount</span>--%>
<%--                                    <h6 class="mb-0">$1,999</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span><i class="far fa-calendar-alt"></i> Due Date</span>--%>
<%--                                    <h6 class="mb-0">08 Mar 2022</h6>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-footer">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span class="badge bg-danger-dark">Overdue</span>--%>
<%--                                </div>--%>
<%--                                <div class="col text-end">--%>
<%--                                    <span class="text-danger text-sm">Overdue 10 days</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-sm-6 col-lg-4 col-xl-3 d-flex">--%>
<%--                    <div class="card invoices-grid-card w-100">--%>
<%--                        <div class="card-header d-flex justify-content-between align-items-center">--%>
<%--                            <a href="view-invoice.html" class="invoice-grid-link">IN093439#@016</a>--%>
<%--                            <div class="dropdown dropdown-action">--%>
<%--                                <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>--%>
<%--                                <div class="dropdown-menu dropdown-menu-end">--%>
<%--                                    <a class="dropdown-item" href="edit-invoice.html"><i class="far fa-edit me-2"></i>Edit</a>--%>
<%--                                    <a class="dropdown-item" href="view-invoice.html"><i class="far fa-eye me-2"></i>View</a>--%>
<%--                                    <a class="dropdown-item" href="javascript:void(0);"><i class="far fa-trash-alt me-2"></i>Delete</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-middle">--%>
<%--                            <h2 class="card-middle-avatar">--%>
<%--                                <a href="profile.html"><img class="avatar avatar-sm me-2 avatar-img rounded-circle" src="../../theme2/img/profiles/avatar-03.jpg" alt="User Image"> Marie Canales</a>--%>
<%--                            </h2>--%>
<%--                        </div>--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col">--%>
<%--                                    <span><i class="far fa-money-bill-alt"></i> Amount</span>--%>
<%--                                    <h6 class="mb-0">$2,700</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span><i class="far fa-calendar-alt"></i> Due Date</span>--%>
<%--                                    <h6 class="mb-0">18 Mar, 2022</h6>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-footer">--%>
<%--                            <div class="row align-items-center">--%>
<%--                                <div class="col-auto">--%>
<%--                                    <span class="badge bg-success-dark">Paid</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-lg-12">--%>
<%--                    <div class="invoice-load-btn">--%>
<%--                        <a href="#" class="btn">--%>
<%--                            <span class="spinner-border text-primary"></span> Load more--%>
<%--                        </a>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
        </div>
    </div>

</div>


<script src="../../theme2/js/jquery-3.6.0.min.js"></script>

<script src="../../theme2/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="../../theme2/js/feather.min.js"></script>

<script src="../../theme2/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="../../theme2/plugins/select2/js/select2.min.js"></script>

<script src="../../theme2/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../theme2/plugins/datatables/datatables.min.js"></script>

<script src="../../theme2/plugins/moment/moment.min.js"></script>
<script src="../../theme2/js/bootstrap-datetimepicker.min.js"></script>

<script src="../../theme2/js/script.js"></script>
</body>
</html>