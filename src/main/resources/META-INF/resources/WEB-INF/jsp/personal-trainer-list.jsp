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
<%--    --%>
<%--    <style>--%>
<%--        .bar{--%>
<%--            height: 10px;--%>
<%--            border-radius: 5px;--%>
<%--            position: relative;--%>
<%--        }--%>

<%--        .sliderBar{--%>
<%--            background: #ddd;--%>
<%--            position: relative;--%>
<%--        }--%>

<%--        .sliderBar .progressBar{--%>
<%--            background-color: #0d6efd;--%>
<%--            left: 0%;--%>
<%--            right: 0%;--%>
<%--            position: absolute;--%>
<%--        }--%>

<%--        .range-input{--%>
<%--            position: relative;--%>
<%--        }--%>

<%--        .range-input input{--%>
<%--            top: -10px;--%>
<%--            height: 10px;--%>
<%--            width: 100%;--%>
<%--            background: none;--%>
<%--            -webkit-appearance: none;--%>
<%--            pointer-events: none;--%>
<%--            position: absolute;--%>
<%--        }--%>

<%--        input[type="range"]::-webkit-slider-thumb{--%>
<%--            height: 20px;--%>
<%--            width: 20px;--%>
<%--            border-radius: 50%;--%>
<%--            pointer-events: auto;--%>
<%--            -webkit-appearance: none;--%>
<%--            background-color: #0d6efd;--%>
<%--        }--%>
<%--    </style>--%>

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
                                <h3 class="page-title">Personal Trainer</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item "><a class="text-muted" href="teachers.html">Personal Trainer</a></li>
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
                                                        <i class="far fa-money-bill-alt text-primary"></i>
                                                        <h6 class="px-2">Price</h6>
                                                    </div>
                                                    <h6 class="font-weight-light" id="price-preview">0 - 500.000đ</h6>
                                                </div>
                                                <div class="mt-3">
                                                    <div class="sliderBar bar" id="priceProgressBar">
                                                        <div class="progressBar bar"></div>
                                                    </div>
                                                    <div class="range-input" id="priceSliderBar">
                                                        <input type="range" class="range-min" id="minRange" min="0" max="500000" value="0">
                                                        <input type="range" class="range-max" min="0" max="500000" value="500000">
                                                    </div>
                                                </div>

                                                <div class="input-group mt-3" id="priceInput">
                                                    <input type="number" class="form-control" id="priceMinInput" placeholder="Min" value="0">
                                                    <span class="input-group-text">-</span>
                                                    <input type="number" class="form-control" id="priceMaxInput" placeholder="Max" value="500000">
                                                    <button id="submitPrice" class="btn btn-primary" type="button">></button>
                                                </div>
                                            </div>

                                            <div class="mb-3 w-100">
                                                <div class="d-flex justify-content-between">
                                                    <div class="d-flex">
                                                        <i class="feather-map-pin text-primary"></i>
                                                        <h6 class="px-2">Distance</h6>
                                                    </div>
                                                    <h6 class="font-weight-light" id="distance-preview">Within 100km</h6>
                                                </div>
                                                <div class="mt-3">
                                                    <div class="sliderBar bar" id="distanceProgressBar">
                                                        <div class="progressBar bar"></div>
                                                    </div>
                                                    <div class="range-input" id="distanceSliderBar">
                                                        <input type="range" class="range-max" min="0" max="100" value="100">
                                                    </div>
                                                </div>

                                                <div class="input-group mt-3" id="distanceInput">
                                                    <input type="number" class="form-control" id="distanceMaxInput" placeholder="Within" value="100">
                                                    <button id="submitDistance" class="btn btn-primary" type="button">></button>
                                                </div>
                                            </div>
                                            <div class="personal-activity">
                                                <div class="mb-3 w-100">
                                                    <label for="genderSelect" class="form-label">Gender</label>
                                                    <select class="form-select" id="genderSelect">
                                                        <option value="">Select gender</option>
                                                        <option value="male">Male</option>
                                                        <option value="female">Female</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8 " id="personalTrainerContainer">

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
        function generatePersonalTrainers(personalTrainerList) {
            const container = $('<div class="student-personals-grp"></div>');

            personalTrainerList.forEach(personalTrainer => {
                const card = $('<div class="card mb-0"></div>');

                const cardBody = $('<div class="card-body row"></div>');

                // Left column (Image)
                const leftColumn = $('<div class="col"></div>');
                const image = $('<img class="rounded-circle" style="height: 4rem; width: 4rem" alt="Profile">').attr('src', 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg');
                leftColumn.append(image);

                // Middle column (Details)
                const middleColumn = $('<div class="col-lg-8"></div>');
                const headingDetail = $('<div class="heading-detail d-flex align-items-center"></div>');
                const trainerName = $('<h5 class="mb-0"></h5>').text(personalTrainer.fullName);
                const ratingContainer = $('<div></div>');
                const rating = $('<h6 class="text-muted mb-0 ms-2"></h6>').text(personalTrainer.averageVotes + ' (' + personalTrainer.numberOfVotes +  ' rating)');
                ratingContainer.append(rating);
                headingDetail.append(trainerName, ratingContainer);
                const personalActivity = $('<div class="personal-activity mt-2"></div>');
                const personalIcons = $('<div class="personal-icons d-flex align-items-center bg-light rounded-2 p-2 w-auto"></div>');
                const locationIcon = $('<i class="feather-map-pin text-black"></i>');
                const locationText = $('<h6 class="text-black mb-0 ms-2"></h6>').text(personalTrainer.address);
                personalIcons.append(locationIcon, locationText);
                personalActivity.append(personalIcons);
                const description = $('<div class="hello-park shortDescription"></div>');
                const descriptionParagraph = $('<p></p>').text(personalTrainer.description);
                description.append(descriptionParagraph);
                middleColumn.append(headingDetail, personalActivity, description);

                // Right column (Price and Button)
                const rightColumn = $('<div class="col"></div>');
                const priceText = $('<div></div>');
                const priceHeading = $('<h6 class="text-muted">Price</h6>');
                const price = $('<h5></h5>').text(personalTrainer.price + 'đ');
                priceText.append(priceHeading, price);
                const viewProfileButton = $('<button class="btn btn-primary font-weight-bold" type="button" style="font-size: 95%">View Profile</button>');
                rightColumn.append(priceText, viewProfileButton);
                viewProfileButton.click(function() {
                    window.location.href = `/personal-trainer/details?id=` + personalTrainer.id;
                });
                // Append columns to card body
                cardBody.append(leftColumn, middleColumn, rightColumn);

                // Append card body to card
                card.append(cardBody);

                // Append card to container
                container.append(card);
            });

            return container;
        }

        var personalTrainerList = ${personalTrainerList};
        console.log(personalTrainerList)
        const personalTrainersContainer = generatePersonalTrainers(personalTrainerList);
        $('#personalTrainerContainer').html(personalTrainersContainer);
    </script>

    <script>
        $(document).ready(function() {
            $('.shortDescription').each(function() {
                var maxLength = 200;
                var text = $(this).text();
                if (text.length > maxLength) {
                    var trimmedText = text.substr(0, maxLength);
                    $(this).text(trimmedText + '...');
                }
            });
        });

        var personalTrainerList = ${personalTrainerList}
            console.log(personalTrainerList);
    </script>

    <script>
        var distanceProgressBar = document.querySelector("#distanceProgressBar .progressBar");
        var distanceSliderBar = document.querySelector("#distanceSliderBar input");
        var distanceInput = document.querySelectorAll("#distanceInput input");
        var distancePreview = document.querySelector("#distance-preview");

        distanceSliderBar.addEventListener("input", function() {
            let maxVal = parseInt(distanceSliderBar.value);

            distanceInput.forEach(input => {
                input.value = maxVal;
            });

            distanceProgressBar.style.right = (100 - (maxVal / distanceSliderBar.max) * 100) + "%";
            distancePreview.textContent = 'Within ' + maxVal + 'km';
        });

        distanceInput.forEach(input => {
            input.addEventListener('input', function() {
                let val = input.value ? parseInt(input.value) : 0;

                if (val <= 0) {
                    val = 0;
                }else if( val >= 100){
                    val = 100;
                }

                input.value = val;
                distanceSliderBar.value = val;
                distanceProgressBar.style.right = (100 - (val / distanceSliderBar.max) * 100) + "%";
                distancePreview.textContent = 'Within ' + val + 'km';
            });
        });

    </script>

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
                    previewText.textContent = formatNumberWithCommas(minVal) + ' - ' + formatNumberWithCommas(maxVal) + 'đ';
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
                        previewText.textContent = formatNumberWithCommas(minVal) + ' - ' + formatNumberWithCommas(maxVal) + 'đ';
                    }
                });
            });

        }

        var priceProgressBar = document.querySelector("#priceProgressBar .progressBar");
        var priceSliderBar = document.querySelectorAll("#priceSliderBar input");
        var priceInput = document.querySelectorAll("#priceInput input");
        var pricePreview = document.querySelector("#price-preview");
        var priceGap = 50000;

        setupFilter(priceProgressBar, priceSliderBar, priceInput, priceGap, pricePreview);

    </script>

    <script>
        $(document).ready(function() {
            // Function to handle search
            function handleSearch() {
                var searchName = $("#searchInput").val();
                var priceMin = $("#priceMinInput").val();
                var priceMax = $("#priceMaxInput").val();
                var distanceMax = $("#distanceMaxInput").val();
                var gender = $("#genderSelect").val();

                var searchData = {
                    "searchName": searchName,
                    "priceMin": priceMin,
                    "priceMax": priceMax,
                    "distanceMax": distanceMax,
                    "gender": gender
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
            $("#submitPrice").click(function() {
                handleSearch();
            });

            // Handle distance submit
            $("#submitDistance").click(function() {
                handleSearch();
            });

            // Handle gender selection change
            $("#genderSelect").change(function() {
                handleSearch();
            });
        });

    </script>
</body>

</html>