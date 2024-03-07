<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Preskool - Teacher Details</title>

    <link rel="shortcut icon" href="../../../assets/img/favicon.png">

    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&display=swap"
            rel="stylesheet">

    <link rel="stylesheet" href="../../../assets/plugins/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="../../../assets/plugins/feather/feather.css">

    <link rel="stylesheet" href="../../../assets/plugins/icons/flags/flags.css">

    <link rel="stylesheet" href="../../../assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="../../../assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet" href="../../../assets/plugins/datatables/datatables.min.css">

    <link rel="stylesheet" href="../../../assets/css/style.css">
    <link rel="stylesheet" href="../../../assets/css/styleSliderBar.css">
    <style>
        .ex-image {
            width: 100%;
            height: 9rem;
            object-fit: cover;
        }
    </style>
</head>

<body>
    <div class="main-wrapper">

        <div class="header">

            <div class="header-left">
                <a href="index.html" class="logo">
                    <img src="../../../assets/img/logo.png" alt="Logo">
                </a>
                <a href="index.html" class="logo logo-small">
                    <img src="../../../assets/img/logo-small.png" alt="Logo" width="30" height="30">
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
                        <img src="../../../assets/img/icons/header-icon-01.svg" alt="">
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:;"><i class="flag flag-lr me-2"></i>English</a>
                        <a class="dropdown-item" href="javascript:;"><i class="flag flag-bl me-2"></i>Francais</a>
                        <a class="dropdown-item" href="javascript:;"><i class="flag flag-cn me-2"></i>Turkce</a>
                    </div>
                </li>

                <li class="nav-item dropdown noti-dropdown me-2">
                    <a href="#" class="dropdown-toggle nav-link header-nav-list" data-bs-toggle="dropdown">
                        <img src="../../../assets/img/icons/header-icon-05.svg" alt="">
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
                                                    src="../../../assets/img/profiles/avatar-02.jpg">
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
                                                    src="../../../assets/img/profiles/avatar-11.jpg">
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
                                                    src="../../../assets/img/profiles/avatar-17.jpg">
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
                                                    src="../../../assets/img/profiles/avatar-13.jpg">
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
                        <img src="../../../assets/img/icons/header-icon-04.svg" alt="">
                    </a>
                </li>

                <li class="nav-item dropdown has-arrow new-user-menus">
                    <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                        <span class="user-img">
                            <img class="rounded-circle" src="../../../assets/img/profiles/avatar-01.jpg" width="31"
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
                                <img src="../../../assets/img/profiles/avatar-01.jpg" alt="User Image"
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
                    <div class="row align-items-center">
                        <div class="col">
                            <h3 class="page-title">Exercise</h3>
                        </div>
                    </div>
                </div>

                <div class="mt-3">
                    <form id="search-exercise" class="w-100 d-flex">
                        <input id="searchInput" type="text" class="form-control" placeholder="Search here">
                        <button id="search-exercise-button" class="btn btn-primary h-auto" type="submit"><i class="fas fa-search"></i></button>
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
                                                <p class="mb-0">Affected Muscle</p>
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
                                                            <input type="checkbox" name="Back" class="category">
                                                            <span class="checkmark"></span>
                                                            Back
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Shoulders" class="category">
                                                            <span class="checkmark"></span>
                                                            Shoulders
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Arms" class="category">
                                                            <span class="checkmark"></span>
                                                            Arms
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Abs" class="category">
                                                            <span class="checkmark"></span>
                                                            Abs
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Legs" class="category">
                                                            <span class="checkmark"></span>
                                                            Legs
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Glutes" class="category">
                                                            <span class="checkmark"></span>
                                                            Glutes
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
                                                        <input type="checkbox" name="Dumbbells" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Dumbbells
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
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card invoices-tabs-card border-0 mt-3">
                    <div class="col-lg-12 col-md-12">
                        <div class="invoices-settings-btn invoices-settings-btn-one">
                            <a href="/exercise/create" class="btn"><i class="feather feather-plus-circle"></i>New Exercise</a>
                        </div>
                    </div>
                </div>

                    <div id="exerciseContainer" class="row"></div>

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
            </div>
        </div>
    </div>


    <script src="../../../assets/js/jquery-3.6.0.min.js"></script>

    <script src="../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../../assets/js/feather.min.js"></script>

    <script src="../../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="../../../assets/plugins/select2/js/select2.min.js"></script>

    <script src="../../../assets/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../../assets/plugins/datatables/datatables.min.js"></script>

    <script src="../../../assets/plugins/moment/moment.min.js"></script>
    <script src="../../../assets/js/bootstrap-datetimepicker.min.js"></script>

    <script src="../../../assets/js/script.js"></script>

    <script>
        // Function to generate HTML for exercise cards
        function generateExerciseCards(exerciseList) {
            var defaultIconUrl = 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg';
            var cardHtml = '';
            exerciseList.forEach(function(exercise) {
                cardHtml +=
                    '<div class="col-lg-3 col mt-3" style="height: 350px;">' +
                        '<div class="card invoices-grid-card w-100 h-100">' +
                            '<div class="card-header d-flex justify-content-between align-items-center">' +
                                '<a href="/exercise/details?id=' + exercise.id + '" class="invoice-grid-link text-decoration-none w-75">' + exercise.name + '</a>' +
                                '<a href="view-invoice.html" class="avatar avatar-sm me-2 avatar-img rounded-circle" style="height: 3rem; width: 3rem">' +
                                    '<img class="rounded-circle" src="' +  'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg' + '" alt="Edit Avatar">' +
                                '</a>' +
                            '</div>' +
                        '<div class="container position-relative h-100">' +
                        '<a href="/exercise/details?id=' + exercise.id + '" class="text-decoration-none text-dark d-block position-relative">' +
                        '<img class=" w-100 h-100" src="data:image/jpeg;base64,' + (exercise.imageDescription || defaultIconUrl) + '" alt="User Image">' +
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

                cardHtml += '<div style="display: inline-block;">' +
                    '<h2 class="w-auto p-1 m-1 bg-info text-white rounded small" style="font-size: 15px;">' + exercise.type + '</h2>' +
                    '</div>';

                cardHtml += '<div style="display: inline-block;">' +
                    '<h2 class="w-auto p-1 m-1 bg-secondary text-white rounded small" style="font-size: 15px;">' + exercise.equipment + '</h2>' +
                    '</div>';
                cardHtml += '</div></div></div>';
            });
            return cardHtml;
        }

        function sendFilterJSON(filterObject) {
            var filterJSON = JSON.stringify(filterObject);
            console.log(filterJSON);
            $.ajax({
                url: '/api/exercises/search',
                type: 'POST',
                data: filterJSON,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(response) {
                    document.getElementById('exerciseContainer').innerHTML = generateExerciseCards(response);
                    console.log(response)
                },
                error: function(status, error) {
                    // Xử lý lỗi ở đây nếu cần
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


            filterObject.equipments = $('.equipment:checked').map(function() {
                return $(this).attr('name');
            }).get();

            sendFilterJSON(filterObject);
        }
    </script>

    <script>
        $(document).ready(function() {
            var exerciseList = ${exerciseList};
            document.getElementById('exerciseContainer').innerHTML = generateExerciseCards(exerciseList);
            console.log(exerciseList);
        })
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

            // Reset equipment
            $('#reset-equipment').click(function() {
                $('.equipment').prop('checked', false);
                sendFilterRequest()
            });
        });
    </script>


</body>

