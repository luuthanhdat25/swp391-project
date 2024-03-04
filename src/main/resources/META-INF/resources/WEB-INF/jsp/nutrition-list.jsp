<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Preskool - Teacher Details</title>

    <link rel="shortcut icon" href="../../assets/img/favicon.png">

    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&display=swap"
            rel="stylesheet">

    <link rel="stylesheet" href="../../assets/plugins/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="../../assets/plugins/feather/feather.css">

    <link rel="stylesheet" href="../../assets/plugins/icons/flags/flags.css">

    <link rel="stylesheet" href="../../assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="../../assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet" href="../../assets/plugins/datatables/datatables.min.css">

    <link rel="stylesheet" href="../../assets/css/style.css">
    <link rel="stylesheet" href="../../assets/css/styleSliderBar.css">
</head>

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
                    <li  class="submenu active">
                        <a href="#"><i class="fas fa-graduation-cap"></i> <span>Find Personal Trainer</span> </a>
                    </li>
                    <li>
                        <a href="/exercise/"><i class="fas fa-chalkboard-teacher"></i> <span>Exercise Wiki</span></a>
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
                            <h3 class="page-title">Nutrition</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item "><a class="text-muted" href="teachers.html">Nutrition</a></li>
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
                                    <div class="card-body">
                                        <div class="personal-activity">
                                            <div class="mb-3 w-100 input-group">
                                                <label for="searchInput" class="form-label visually-hidden">Search by Name</label>
                                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                                                <input type="text" class="form-control" id="searchInput" placeholder="Enter search name">
                                            </div>
                                        </div>

                                        <div class="mb-3 w-100">
                                            <div class="d-flex justify-content-between">
                                                <div class="d-flex">
                                                    <h6>Calories</h6>
                                                </div>
                                                <h6 class="font-weight-light" id="calo-preview">0 - 5.000</h6>
                                            </div>
                                            <div class="mt-3">
                                                <div class="sliderBar bar" id="caloProgressBar">
                                                    <div class="progressBar bar"></div>
                                                </div>
                                                <div class="range-input" id="caloSliderBar">
                                                    <input type="range" class="range-min" min="0" max="5000" value="0">
                                                    <input type="range" class="range-max" min="0" max="5000" value="5000">
                                                </div>
                                            </div>

                                            <div class="input-group mt-3" id="caloInput">
                                                <input id="caloMinInput" type="number" class="form-control" placeholder="Min" value="0">
                                                <span class="input-group-text">-</span>
                                                <input id="caloMaxInput" type="number" class="form-control" placeholder="Max" value="5000">
                                                <button id="submitCalo" class="btn btn-primary" type="button">></button>
                                            </div>
                                        </div>

                                        <div class="mb-3 w-100">
                                            <div class="d-flex justify-content-between">
                                                <div class="d-flex">
                                                    <h6>Protein</h6>
                                                </div>
                                                <h6 class="font-weight-light" id="protein-preview">0 - 100</h6>
                                            </div>
                                            <div class="mt-3">
                                                <div class="sliderBar bar" id="proteinProgressBar">
                                                    <div class="progressBar bar"></div>
                                                </div>
                                                <div class="range-input" id="proteinSliderBar">
                                                    <input type="range" class="range-min" min="0" max="100" value="0">
                                                    <input type="range" class="range-max" min="0" max="100" value="100">
                                                </div>
                                            </div>

                                            <div class="input-group mt-3" id="proteinInput">
                                                <input id="proteinMinInput" type="number" class="form-control" placeholder="Min" value="0">
                                                <span class="input-group-text">-</span>
                                                <input id="proteinMaxInput" type="number" class="form-control" placeholder="Max" value="100">
                                                <button id="submitProtein" class="btn btn-primary" type="button">></button>
                                            </div>
                                        </div>

                                        <div class="mb-3 w-100">
                                            <div class="d-flex justify-content-between">
                                                <div class="d-flex">
                                                    <h6>Fat</h6>
                                                </div>
                                                <h6 class="font-weight-light" id="fat-preview">0 - 100</h6>
                                            </div>
                                            <div class="mt-3">
                                                <div class="sliderBar bar" id="fatProgressBar">
                                                    <div class="progressBar bar"></div>
                                                </div>
                                                <div class="range-input" id="fatSliderBar">
                                                    <input type="range" class="range-min" min="0" max="100" value="0">
                                                    <input type="range" class="range-max" min="0" max="100" value="100">
                                                </div>
                                            </div>

                                            <div class="input-group mt-3" id="fatInput">
                                                <input id="fatMinInput" type="number" class="form-control" placeholder="Min" value="0">
                                                <span class="input-group-text">-</span>
                                                <input id="fatMaxInput" type="number" class="form-control" placeholder="Max" value="100">
                                                <button id="submitFat" class="btn btn-primary" type="button">></button>
                                            </div>
                                        </div>

                                        <div class="mb-3 w-100">
                                            <div class="d-flex justify-content-between">
                                                <div class="d-flex">
                                                    <h6>Carb</h6>
                                                </div>
                                                <h6 class="font-weight-light" id="carb-preview">0 - 100</h6>
                                            </div>
                                            <div class="mt-3">
                                                <div class="sliderBar bar" id="carbProgressBar">
                                                    <div class="progressBar bar"></div>
                                                </div>
                                                <div class="range-input" id="carbSliderBar">
                                                    <input type="range" class="range-min" min="0" max="100" value="0">
                                                    <input type="range" class="range-max" min="0" max="100" value="100">
                                                </div>
                                            </div>

                                            <div class="input-group mt-3" id="carbInput">
                                                <input id="carbMinInput" type="number" class="form-control" placeholder="Min" value="0">
                                                <span class="input-group-text">-</span>
                                                <input id="carbMaxInput" type="number" class="form-control" placeholder="Max" value="100">
                                                <button id="submitCarb" class="btn btn-primary" type="button">></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 " id="personalTrainerContainer">
                            <div class="student-personals-grp">
                                <div class="card mb-0">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table
                                                    class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
                                                <thead class="student-thread">
                                                <tr>
                                                    <th></th>
                                                    <th>Name</th>
                                                    <th>Calories</th>
                                                    <th>Protein</th>
                                                    <th>Fat</th>
                                                    <th>Carb</th>
                                                    <th>Author</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="teacher-details.html"
                                                               class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="https://lh3.googleusercontent.com/proxy/l7v9o_LIhbLcwWxejszL_7EhaUXVR9pBS2DoZ81tEuwJqPPTZPYwO3MJrd1SSk6g9kEyhmb1pPJcOtTlnNQrdRNcK3TBAJPc73aKzAU"
                                                                    alt="User Image"></a>
                                                            <a href="teacher-details.html">Banana</a>
                                                        </h2>
                                                    </td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td><a href="teacher-details.html"
                                                           class="avatar avatar-sm me-2"><img
                                                            class="avatar-img rounded-circle"
                                                            src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg"
                                                            alt="User Image"></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="teacher-details.html"
                                                               class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="https://lh3.googleusercontent.com/proxy/l7v9o_LIhbLcwWxejszL_7EhaUXVR9pBS2DoZ81tEuwJqPPTZPYwO3MJrd1SSk6g9kEyhmb1pPJcOtTlnNQrdRNcK3TBAJPc73aKzAU"
                                                                    alt="User Image"></a>
                                                            <a href="teacher-details.html">Banana</a>
                                                        </h2>
                                                    </td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td><a href="teacher-details.html"
                                                           class="avatar avatar-sm me-2"><img
                                                            class="avatar-img rounded-circle"
                                                            src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg"
                                                            alt="User Image"></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="teacher-details.html"
                                                               class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="https://lh3.googleusercontent.com/proxy/l7v9o_LIhbLcwWxejszL_7EhaUXVR9pBS2DoZ81tEuwJqPPTZPYwO3MJrd1SSk6g9kEyhmb1pPJcOtTlnNQrdRNcK3TBAJPc73aKzAU"
                                                                    alt="User Image"></a>
                                                            <a href="teacher-details.html">Banana</a>
                                                        </h2>
                                                    </td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td><a href="teacher-details.html"
                                                           class="avatar avatar-sm me-2"><img
                                                            class="avatar-img rounded-circle"
                                                            src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg"
                                                            alt="User Image"></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="teacher-details.html"
                                                               class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="https://lh3.googleusercontent.com/proxy/l7v9o_LIhbLcwWxejszL_7EhaUXVR9pBS2DoZ81tEuwJqPPTZPYwO3MJrd1SSk6g9kEyhmb1pPJcOtTlnNQrdRNcK3TBAJPc73aKzAU"
                                                                    alt="User Image"></a>
                                                            <a href="teacher-details.html">Banana</a>
                                                        </h2>
                                                    </td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td><a href="teacher-details.html"
                                                           class="avatar avatar-sm me-2"><img
                                                            class="avatar-img rounded-circle"
                                                            src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg"
                                                            alt="User Image"></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="teacher-details.html"
                                                               class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="https://lh3.googleusercontent.com/proxy/l7v9o_LIhbLcwWxejszL_7EhaUXVR9pBS2DoZ81tEuwJqPPTZPYwO3MJrd1SSk6g9kEyhmb1pPJcOtTlnNQrdRNcK3TBAJPc73aKzAU"
                                                                    alt="User Image"></a>
                                                            <a href="teacher-details.html">Banana</a>
                                                        </h2>
                                                    </td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td><a href="teacher-details.html"
                                                           class="avatar avatar-sm me-2"><img
                                                            class="avatar-img rounded-circle"
                                                            src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg"
                                                            alt="User Image"></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="teacher-details.html"
                                                               class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="https://lh3.googleusercontent.com/proxy/l7v9o_LIhbLcwWxejszL_7EhaUXVR9pBS2DoZ81tEuwJqPPTZPYwO3MJrd1SSk6g9kEyhmb1pPJcOtTlnNQrdRNcK3TBAJPc73aKzAU"
                                                                    alt="User Image"></a>
                                                            <a href="teacher-details.html">Banana</a>
                                                        </h2>
                                                    </td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td><a href="teacher-details.html"
                                                           class="avatar avatar-sm me-2"><img
                                                            class="avatar-img rounded-circle"
                                                            src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg"
                                                            alt="User Image"></a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
<%--                                    <div class="card-body row">--%>
<%--                                        <!-- Left column -->--%>
<%--                                        <div class="col">--%>
<%--                                            <img class="w-100 rounded-circle" src="../../assets/img/profiles/avatar-18.jpg" alt="Profile">--%>
<%--                                        </div>--%>

<%--                                        <!-- Middle column -->--%>
<%--                                        <div class="col-lg-8">--%>
<%--                                            <div class="heading-detail d-flex align-items-center">--%>
<%--                                                <h5 class="mb-0">Personal Trainer Name</h5>--%>
<%--                                                <div class="ms-2">--%>
<%--                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#FFFF00" class="bi bi-star-fill" viewBox="0 0 16 16">--%>
<%--                                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>--%>
<%--                                                    </svg>--%>
<%--                                                </div>--%>
<%--                                                <h6 class="text-muted mb-0 ms-2">4.0 (2 rating)</h6>--%>
<%--                                            </div>--%>

<%--                                            <div class="personal-activity mt-2 ">--%>
<%--                                                <div class="personal-icons d-flex align-items-center bg-light rounded-2 p-2 w-auto">--%>
<%--                                                    <i class="feather-map-pin text-black"></i>--%>
<%--                                                    <h6 class="text-black mb-0 ms-2">180, Estern Avenue, United States</h6>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>

<%--                                            <div class="hello-park shortDescription">--%>
<%--                                                <p>My name is Zhi Sun, I started my professional training career at Equinox Midtown, and worked hard to become a high end tier trainer. I had the opportunity to work with clients of varying levels of fitness. I am originally from Syracuse, NY and I decided to move to the city around 2017. I took a chance and risk to move to a big city and pursue my passion as a full time fitness trainer. </p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                        <!-- Right column -->--%>
<%--                                        <div class="col">--%>
<%--                                            <div id="caloText">--%>
<%--                                                <h6 class="text-muted">calo</h6>--%>
<%--                                                <h5>60.000đ/hr</h5>--%>
<%--                                            </div>--%>
<%--                                            <div>--%>
<%--                                                <button id="viewProfile" class="btn btn-primary font-weight-bold" type="button" style="font-size: 95%">View Profile</button>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <p>Copyright © 2022 Gym On.</p>
        </footer>
    </div>
</div>


<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="../../assets/js/jquery-3.6.0.min.js"></script>

<script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="../../assets/js/feather.min.js"></script>

<script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="../../assets/js/script.js"></script>

<script>
    function formatNumberWithCommas(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }

    function setupFilter(progressBar, sliderBars, inputs, gap, previewText) {
        sliderBars.forEach(function(input) {
            input.addEventListener("input", function(e) {
                var minVal = parseInt(sliderBars[0].value);
                var maxVal = parseInt(sliderBars[1].value);

                if (maxVal - minVal < gap) {
                    if (e.target === sliderBars[0]) {
                        sliderBars[0].value = maxVal - gap;
                        minVal = parseInt(sliderBars[0].value);
                    }
                    if (e.target === sliderBars[1]) {
                        sliderBars[1].value = minVal + gap;
                        maxVal = parseInt(sliderBars[1].value);
                    }
                }

                inputs[0].value = minVal;
                inputs[1].value = maxVal;
                progressBar.style.left = (minVal / sliderBars[0].max) * 100 + "%";
                progressBar.style.right = 100 - (maxVal / sliderBars[1].max) * 100 + "%";
                previewText.textContent = formatNumberWithCommas(minVal) + ' - ' + formatNumberWithCommas(maxVal);
            });
        });

        inputs.forEach(function(input, index) {
            input.addEventListener("input", function(e) {
                var minVal = parseInt(inputs[0].value);
                var maxVal = parseInt(inputs[1].value);

                if ((maxVal - minVal >= gap) && maxVal <= sliderBars[1].max) {
                    if (index === 0) {
                        sliderBars[0].value = minVal;
                        progressBar.style.left = (minVal / sliderBars[0].max) * 100 + "%";
                    }
                    if (index === 1) {
                        sliderBars[1].value = maxVal;
                        progressBar.style.right = 100 - (maxVal / sliderBars[1].max) * 100 + "%";
                    }
                    previewText.textContent = formatNumberWithCommas(minVal) + ' - ' + formatNumberWithCommas(maxVal);
                }
            });
        });
    }
</script>

<script>
    var caloProgressBar = document.querySelector("#caloProgressBar .progressBar");
    var caloSliderBar = document.querySelectorAll("#caloSliderBar input");
    var caloInput = document.querySelectorAll("#caloInput input");
    var caloPreview = document.querySelector("#calo-preview");
    var caloGap = 500;

    setupFilter(caloProgressBar, caloSliderBar, caloInput, caloGap, caloPreview);
</script>

<script>
    var proteinProgressBar = document.querySelector("#proteinProgressBar .progressBar");
    var proteinSliderBar = document.querySelectorAll("#proteinSliderBar input");
    var proteinInput = document.querySelectorAll("#proteinInput input");
    var proteinPreview = document.querySelector("#protein-preview");
    var proteinGap = 10;

    setupFilter(proteinProgressBar, proteinSliderBar, proteinInput, proteinGap, proteinPreview);
</script>

<script>
    var fatProgressBar = document.querySelector("#fatProgressBar .progressBar");
    var fatSliderBar = document.querySelectorAll("#fatSliderBar input");
    var fatInput = document.querySelectorAll("#fatInput input");
    var fatPreview = document.querySelector("#fat-preview");
    var fatGap = 10;

    setupFilter(fatProgressBar, fatSliderBar, fatInput, fatGap, fatPreview);
</script>

<script>
    var carbProgressBar = document.querySelector("#carbProgressBar .progressBar");
    var carbSliderBar = document.querySelectorAll("#carbSliderBar input");
    var carbInput = document.querySelectorAll("#carbInput input");
    var carbPreview = document.querySelector("#carb-preview");
    var carbGap = 10;

    setupFilter(carbProgressBar, carbSliderBar, carbInput, carbGap, carbPreview);
</script>
<script>
    $(document).ready(function() {
        function handleSearch() {
            var searchName = $("#searchInput").val();
            var caloMin = $("#caloMinInput").val();
            var caloMax = $("#caloMaxInput").val();
            var proteinMin = $("#proteinMinInput").val();
            var proteinMax = $("#proteinMaxInput").val();
            var fatMin = $("#fatMinInput").val();
            var fatMax = $("#fatMaxInput").val();
            var carbMin = $("#carbMinInput").val();
            var carbMax = $("#carbMaxInput").val();

            var searchData = {
                "searchName": searchName,
                "caloMin": caloMin,
                "caloMax": caloMax,
                "proteinMin": proteinMin,
                "proteinMax": proteinMax,
                "fatMin" : fatMin,
                "fatMax" : fatMax,
                "carbMin" :carbMin,
                "carbMax" :carbMax
            };

            console.log(JSON.stringify(searchData));
        }

        // Handle search name input and submit on enter
        $("#searchInput").keypress(function(event) {
            if (event.which == 13) {
                event.preventDefault();
                handleSearch();
            }
        });

        // Handle price submit
        $("#submitCalo").click(function() {
            handleSearch();
        });

        $("#submitProtein").click(function() {
            handleSearch();
        });

        $("#submitFat").change(function() {
            handleSearch();
        });

        $("#submitCarb").change(function() {
            handleSearch();
        });
    });

</script>
</body>

</html>