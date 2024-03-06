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
    <style>
        .rounded-image {
            width: 3rem;
            height: 3rem;
            border-radius: 50%;
            object-fit: cover;
        }
    </style>
</head>

<body>

<div class="main-wrapper">

    <div class="header">


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
                                                <tbody id="nutritionTableBody">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body row">
                        <div class="col-8">
                            <img class="w-100 mb-2" style="object-fit: cover;" id="modal-image" src="" alt="Nutrition Image">
                        </div>
                        <div class="col-4">
                            <p id="modal-calo"></p>
                            <p id="modal-protein"></p>
                            <p id="modal-fat"></p>
                            <p id="modal-carb"></p>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <a id="editButton" href="" class="btn btn-primary"> <i class="far fa-edit me-2"></i>Edit</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>



        <footer>
            <p>Copyright © 2024 Gym On.</p>
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
    $(document).ready(function() {
        var nutritionList = ${nutritionList};
        var tbody = $('.star-student tbody');
        var defaultIconUrl = 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg';

        $.each(nutritionList, function(index, nutrition) {
            var row = '<tr>' +
                '<td>' + (index + 1) + '</td>' +
                '<td>' +
                '<h2 class="table-avatar">' +
                '<a href="#" class="me-2 nutrition-detail d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#exampleModal" data-name="' + nutrition.name + '" data-calo="' + nutrition.caloIn + '" data-protein="' + nutrition.protein + '" data-fat="' + nutrition.fat + '" data-carb="' + nutrition.carb + '" data-image="' + (nutrition.imageDescription || defaultIconUrl) + '" data-id="' + nutrition.nutritionId + '">' +
                    '<img class=" rounded-image" src="data:image/jpeg;base64,' + (nutrition.imageDescription || defaultIconUrl) + '" alt="User Image">' +
                    '<p class="m-0 ms-2">' + nutrition.name + '</p>' +
                '</a>' +

                '</h2>' +
                '</td>' +
                '<td>' + nutrition.caloIn + '</td>' +
                '<td>' + nutrition.protein + '</td>' +
                '<td>' + nutrition.fat + '</td>' +
                '<td>' + nutrition.carb + '</td>' +
                '<td>' +
                '<a href="#" class="avatar avatar-sm me-2 nutrition-detail" data-bs-toggle="modal" data-bs-target="#exampleModal">' +
                '<img class="avatar-img rounded-circle" src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg" alt="User Image">' +
                '</a>' +
                '</td>' +
                '</tr>';
            tbody.append(row);
        });

        // Sự kiện khi nhấn vào thẻ <a> với class "nutrition-detail"
        $('.star-student').on('click', '.nutrition-detail', function(event) {
            event.preventDefault();
            var modal = $('#exampleModal');
            var name = $(this).data('name');
            var calo = $(this).data('calo');
            var protein = $(this).data('protein');
            var fat = $(this).data('fat');
            var carb = $(this).data('carb');
            var image = $(this).data('image');
            var id = $(this).data('id');

            modal.find('.modal-title').text(name);
            modal.find('#modal-image').attr('src', 'data:image/jpeg;base64,' + image);
            modal.find('#modal-calo').text('Calories: ' + calo);
            modal.find('#modal-protein').text('Protein: ' + protein);
            modal.find('#modal-fat').text('Fat: ' + fat);
            modal.find('#modal-carb').text('Carbohydrates: ' + carb);
            $('#editButton').attr('href', '/nutrition/details/edit?id=' + id);
            $('#exampleModal').modal('show');
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