<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<body>
    <div class="main-wrapper">
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

<%--                                            <div class="mb-3 w-100">--%>
<%--                                                <div class="d-flex justify-content-between">--%>
<%--                                                    <div class="d-flex">--%>
<%--                                                        <i class="feather-map-pin text-primary"></i>--%>
<%--                                                        <h6 class="px-2">Distance</h6>--%>
<%--                                                    </div>--%>
<%--                                                    <h6 class="font-weight-light" id="distance-preview">Within 100km</h6>--%>
<%--                                                </div>--%>
<%--                                                <div class="mt-3">--%>
<%--                                                    <div class="sliderBar bar" id="distanceProgressBar">--%>
<%--                                                        <div class="progressBar bar"></div>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="range-input" id="distanceSliderBar">--%>
<%--                                                        <input type="range" class="range-max" min="0" max="100" value="100">--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>

<%--                                                <div class="input-group mt-3" id="distanceInput">--%>
<%--                                                    <input type="number" class="form-control" id="distanceMaxInput" placeholder="Within" value="100">--%>
<%--                                                    <button id="submitDistance" class="btn btn-primary" type="button">></button>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>

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


    <script src="../../assets/js/jquery-3.6.0.min.js"></script>

    <script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../assets/js/feather.min.js"></script>

    <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="../../assets/js/script.js"></script>


    <script>
        function formatPrice(price) {
            return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        }
        function generatePersonalTrainers(personalTrainerList) {
            const container = $('<div class="student-personals-grp mb-3"></div>');

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
                const price = $('<h5></h5>').text(formatPrice(personalTrainer.price) + 'đ');
                priceText.append(priceHeading, price);
                const viewProfileButton = $('<button class="btn btn-primary font-weight-bold" type="button" style="font-size: 95%">View Profile</button>');
                rightColumn.append(priceText, viewProfileButton);
                viewProfileButton.click(function() {
                    window.location.href = `/personal-trainer/details?id=` + personalTrainer.id;
                });
                cardBody.append(leftColumn, middleColumn, rightColumn);
                card.append(cardBody);
                container.append(card);
            });

            $('#personalTrainerContainer').html(container);
        }

        var personalTrainerList = ${personalTrainerList};
        console.log(personalTrainerList)
        generatePersonalTrainers(personalTrainerList);

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

            $.ajax({
                type: "POST",
                url: "/api/personal-trainer/search",
                contentType: "application/json",
                data: JSON.stringify(searchData),
                success: function(response) {
                    console.log(response);
                    generatePersonalTrainers(response)
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }

        $(document).ready(function() {
            // Function to handle search
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