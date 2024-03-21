<%@include file="../common/header.jspf" %>
<%@include file="../common/head.jspf" %>
<%@include file="../common/sidebar.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    .rounded-image {
        width: 3rem;
        height: 3rem;
        border-radius: 50%;
        object-fit: cover;
    }

    .btn-group-lg>.btn, .btn-lg {
        padding: 1rem 2rem;
        font-size: 1.25rem;
    }
</style>
<body>

    <div class="main-wrapper">
        <div class="page-wrapper">
            <div class="content container-fluid">
                <p id="warningPT" class="fs-6 text-danger fst-italic" style="display: none">You can only create nutritions only if your personal trainer account has been approved</p>
                <div class="page-header">
                    <div class="row align-items-center">
                        <h3 class="page-title col">My Nutrition</h3>
                        <div class="col-auto">
                            <div class="invoices-settings-btn invoices-settings-btn-one" id="createNutrition" style="display: none">
                                <a href="/nutrition/create" class="btn"><i class="feather feather-plus-circle"></i>New Nutrition</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mt-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="student-personals-grp">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="personal-activity">
                                                <div class="w-100 input-group">
                                                    <label for="searchInput"
                                                        class="form-label visually-hidden">Search by Name</label>
                                                    <span class="input-group-text"><i
                                                            class="fas fa-search"></i></span>
                                                    <input type="text" class="form-control" id="searchInput"
                                                        placeholder="Enter search name">
                                                </div>
                                            </div>

                                            <div id="advancedSearch"  class="mt-2">
                                                <div class="mb-3 w-100">
                                                    <div class="d-flex justify-content-between">
                                                        <div class="d-flex">
                                                            <h6>Calories</h6>
                                                        </div>
                                                        <h6 class="font-weight-light" id="calo-preview">0 - 1000/100g</h6>
                                                    </div>
                                                    <div class="mt-3">
                                                        <div class="sliderBar bar" id="caloProgressBar">
                                                            <div class="progressBar bar"></div>
                                                        </div>
                                                        <div class="range-input" id="caloSliderBar">
                                                            <input type="range" class="range-min" min="0" max="1000"
                                                                value="0">
                                                            <input type="range" class="range-max" min="0" max="1000"
                                                                value="1000">
                                                        </div>
                                                    </div>

                                                    <div class="input-group mt-3" id="caloInput">
                                                        <input id="caloMinInput" type="number" class="form-control"
                                                            placeholder="Min" value="0" min="0" max="1000">
                                                        <span class="input-group-text">-</span>
                                                        <input id="caloMaxInput" type="number" class="form-control"
                                                            placeholder="Max" value="1000" min="0" max="1000">
                                                        <button id="submitCalo" class="btn btn-primary"
                                                            type="button">></button>
                                                    </div>
                                                </div>

                                                <div class="mb-3 w-100">
                                                    <div class="d-flex justify-content-between">
                                                        <div class="d-flex">
                                                            <h6>Protein</h6>
                                                        </div>
                                                        <h6 class="font-weight-light" id="protein-preview">0 - 1000/100g</h6>
                                                    </div>
                                                    <div class="mt-3">
                                                        <div class="sliderBar bar" id="proteinProgressBar">
                                                            <div class="progressBar bar"></div>
                                                        </div>
                                                        <div class="range-input" id="proteinSliderBar">
                                                            <input type="range" class="range-min" min="0" max="1000"
                                                                value="0">
                                                            <input type="range" class="range-max" min="0" max="1000"
                                                                value="1000">
                                                        </div>
                                                    </div>

                                                    <div class="input-group mt-3" id="proteinInput">
                                                        <input id="proteinMinInput" type="number" class="form-control"
                                                            placeholder="Min" value="0" min="0" max="1000">
                                                        <span class="input-group-text">-</span>
                                                        <input id="proteinMaxInput" type="number" class="form-control"
                                                            placeholder="Max" value="1000" min="0" max="1000">
                                                        <button id="submitProtein" class="btn btn-primary"
                                                            type="button">></button>
                                                    </div>
                                                </div>

                                                <div class="mb-3 w-100">
                                                    <div class="d-flex justify-content-between">
                                                        <div class="d-flex">
                                                            <h6>Fat</h6>
                                                        </div>
                                                        <h6 class="font-weight-light" id="fat-preview">0 - 1000/100g</h6>
                                                    </div>
                                                    <div class="mt-3">
                                                        <div class="sliderBar bar" id="fatProgressBar">
                                                            <div class="progressBar bar"></div>
                                                        </div>
                                                        <div class="range-input" id="fatSliderBar">
                                                            <input type="range" class="range-min" min="0" max="1000"
                                                                value="0">
                                                            <input type="range" class="range-max" min="0" max="1000"
                                                                value="1000">
                                                        </div>
                                                    </div>

                                                    <div class="input-group mt-3" id="fatInput">
                                                        <input id="fatMinInput" type="number" class="form-control"
                                                            placeholder="Min" value="0" min="0" max="1000">
                                                        <span class="input-group-text">-</span>
                                                        <input id="fatMaxInput" type="number" class="form-control"
                                                            placeholder="Max" value="1000" min="0" max="1000">
                                                        <button id="submitFat" class="btn btn-primary"
                                                            type="button">></button>
                                                    </div>
                                                </div>

                                                <div class="mb-3 w-100">
                                                    <div class="d-flex justify-content-between">
                                                        <div class="d-flex">
                                                            <h6>Carb</h6>
                                                        </div>
                                                        <h6 class="font-weight-light" id="carb-preview">0 - 1000/100g</h6>
                                                    </div>
                                                    <div class="mt-3">
                                                        <div class="sliderBar bar" id="carbProgressBar">
                                                            <div class="progressBar bar"></div>
                                                        </div>
                                                        <div class="range-input" id="carbSliderBar">
                                                            <input type="range" class="range-min" min="0" max="1000"
                                                                value="0">
                                                            <input type="range" class="range-max" min="0" max="1000"
                                                                value="1000">
                                                        </div>
                                                    </div>

                                                    <div class="input-group mt-3" id="carbInput">
                                                        <input id="carbMinInput" type="number" class="form-control"
                                                            placeholder="Min" value="0" min="0" max="1000">
                                                        <span class="input-group-text">-</span>
                                                        <input id="carbMaxInput" type="number" class="form-control"
                                                            placeholder="Max" value="1000" min="0" max="1000">
                                                        <button id="submitCarb" class="btn btn-primary"
                                                            type="button">></button>
                                                    </div>
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
                                            <div class="table-responsive" style="height: 500px; overflow-y: auto">

                                                <table class="table star-student table-center mb-0 table-striped" >
                                                    <thead class="student-thread">
                                                        <tr>
                                                            <th></th>
                                                            <th>Name</th>
                                                            <th>Calories/100g</th>
                                                            <th>Protein/100g</th>
                                                            <th>Fat/100g</th>
                                                            <th>Carb/100g</th>
                                                            <th>Publish</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="nutritionTableBody" ></tbody>
                                                </table>
                                            </div>

                                            <div class="mt-3 w-100 d-flex justify-content-center">
                                                <nav aria-label="Page navigation example">
                                                    <ul class="pagination" id="pagination"></ul>
                                                </nav>
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
                <div class="modal-dialog modal-lg"> <!-- Use modal-lg for larger modal -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body row">
                            <div class="col-md-8"> <!-- Use col-md-* for responsiveness -->
                                <div style="position: relative;">
                                    <a id="ptid" href="#" style="position: absolute; top: 0; left: 0; margin: 1rem;">
                                        <img class="rounded-circle" style=" box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);object-fit: cover; width: 5rem; height: 5rem;" id="modal-image-pt" src="" alt="Personal Trainer Image">
                                    </a>
                                    <img class="w-100 mb-2" style="object-fit: cover;" id="modal-image" src="" alt="Nutrition Image">
                                </div>
                            </div>

                            <div class="col-md-4"> <!-- Use col-md-* for responsiveness -->
                                <p id="modal-calo"></p>
                                <p id="modal-protein"></p>
                                <p id="modal-fat"></p>
                                <p id="modal-carb"></p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a id="editButton" style="display: none" href="" class="btn btn-primary"> <i class="far fa-edit me-2"></i>Edit</a>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <footer>
            </footer>
        </div>
    </div>


    <script src="../../../assets/js/jquery-3.6.0.min.js"></script>

    <script src="../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../../assets/js/feather.min.js"></script>

    <script src="../../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="../../../assets/js/script.js"></script>

    <script>
        var canCreat = ${canCreate};
        console.log('Can create Nutrition: ' + canCreat);
        var role = "${account.getRole()}";
        if(canCreat && canCreat === true){
            $('#createNutrition').show();
        }else{
            if(role === "PT"){
                $('#warningPT').show();
            }
        }

        var nutritionList = ${nutritionList}
        console.log(nutritionList)
        var personalTrainerId = "${personalTrainerId}";
    </script>

    <script>
        var itemsPerPage = 6;
        var currentPage = 1;

        //View detail modal
        $(document).ready(function () {
            // renderNutritionList(nutritionList)

            $('.star-student').on('click', '.nutrition-detail', function (event) {
                event.preventDefault();
                var modal = $('#exampleModal');
                var name = $(this).data('name');
                var calo = $(this).data('calo');
                var protein = $(this).data('protein');
                var fat = $(this).data('fat');
                var carb = $(this).data('carb');
                var image = $(this).data('image');
                var id = $(this).data('id');
                var ptId = $(this).data('ptid');
                var ptimage = $(this).data('ptimage')

                var gam = 'g/100g';
                modal.find('.modal-title').text(name);
                modal.find('#ptid').attr('href', ptId)
                modal.find('#modal-image').attr('src', 'data:image/jpeg;base64,' + image);
                modal.find('#modal-image-pt').attr('src', ptimage);
                modal.find('#modal-calo').text('Calories: ' + calo + gam);
                modal.find('#modal-protein').text('Protein: ' + protein + gam);
                modal.find('#modal-fat').text('Fat: ' + fat + gam);
                modal.find('#modal-carb').text('Carbohydrates: ' + carb + gam);
                var editButton = modal.find('#editButton');

                console.log('ptId ' +ptId)
                console.log('personalTrainerId ' + personalTrainerId)
                if (ptId.toString() === personalTrainerId.toString()) {
                    editButton.show();
                }else{
                    editButton.hide();
                }

                $('#editButton').attr('href', '/nutrition/details/edit?id=' + id);
                $('#exampleModal').modal('show');
            });
        });

        function displayItems(page) {
            var startIndex = (page - 1) * itemsPerPage;
            var endIndex = startIndex + itemsPerPage;
            var paginatedItems = nutritionList.slice(startIndex, endIndex);
            var tbody = $('.star-student tbody');
            var defaultIconUrl = 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg';
            var html = '';

            var index = startIndex + 1; // Initialize index outside the loop

            $.each(paginatedItems, function (i, nutrition) {
                var displayName = nutrition.name.length > 12 ? nutrition.name.substring(0, 12) + '...' : nutrition.name;
                var isPublic = !nutrition.isPrivate;
                var statusText = isPublic ? 'Public' : 'Private';
                var statusColor = isPublic ? 'bg-success' : 'bg-danger';
                var row = '<tr>' +
                    '<td>' + index + '</td>' +
                    '<td class="text-start">' +
                    '<h2 class="table-avatar">' +
                    '<a href="#" class="me-2 nutrition-detail d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#exampleModal" data-name="' + nutrition.name + '" data-calo="' + nutrition.caloIn + '" data-protein="' + nutrition.protein + '" data-fat="' + nutrition.fat + '" data-carb="' + nutrition.carb + '" data-image="' + (nutrition.imageDescription || defaultIconUrl) + '" data-id="' + nutrition.nutritionId + '" data-ptid="' + nutrition.personalTrainerId + '">' +
                    '<img class=" rounded-image" src="data:image/jpeg;base64,' + (nutrition.imageDescription || defaultIconUrl) + '" alt="User Image">' +
                    '<p class="m-0 ms-2">' + displayName + '</p>' +
                    '</a>' +
                    '</h2>' +
                    '</td>' +
                    '<td>' + nutrition.caloIn + '</td>' +
                    '<td>' + nutrition.protein + '</td>' +
                    '<td>' + nutrition.fat + '</td>' +
                    '<td>' + nutrition.carb + '</td>' +
                    '<td>' +
                    '<div class="rounded-3  ' + statusColor +'">' +
                    '<span class="text-white fw-bold">' + statusText + '</span>' +
                    '</div>' +
                    '</td>' +
                    '</tr>';
                html += row;
                index++;
            });

            tbody.html(html);
        }


        function renderPagination() {
            var totalPages = Math.ceil(nutritionList.length / itemsPerPage);
            var paginationHtml = '';

            paginationHtml += '<li class="page-item ' + (currentPage === 1 ? 'disabled' : '') + '"><a class="page-link" href="#" data-page="' + (currentPage - 1) + '">Previous</a></li>';
            for (var i = 1; i <= totalPages; i++) {
                paginationHtml += '<li class="page-item ' + (currentPage === i ? 'active' : '') + '"><a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>';
            }
            paginationHtml += '<li class="page-item ' + (currentPage === totalPages ? 'disabled' : '') + '"><a class="page-link" href="#" data-page="' + (currentPage + 1) + '">Next</a></li>';

            $('#pagination').html(paginationHtml);
        }


        displayItems(currentPage);
        renderPagination();

        $(document).on('click', '.pagination .page-link', function(e) {
            e.preventDefault();
            var page = parseInt($(this).data('page'));
            if (!isNaN(page)) {
                currentPage = page;
                displayItems(currentPage);
                renderPagination();
            }
        });
    </script>


    <script>
        function formatNumberWithCommas(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        }

        function setupFilter(progressBar, sliderBars, inputs, gap, previewText) {
            sliderBars.forEach(function (input) {
                input.addEventListener("input", function (e) {
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
                    previewText.textContent = formatNumberWithCommas(minVal) + ' - ' + formatNumberWithCommas(maxVal) + '/100g';
                });
            });

            inputs.forEach(function (input, index) {
                input.addEventListener("input", function (e) {
                    var minVal = parseInt(inputs[0].value);
                    var maxVal = parseInt(inputs[1].value);

                    if ((maxVal - minVal >= gap) && maxVal <= sliderBars[1].max) {
                        if (index === 0 && minVal >= 0) {
                            sliderBars[0].value = minVal;
                            progressBar.style.left = (minVal / sliderBars[0].max) * 100 + "%";
                        }
                        if (index === 1 && maxVal >= 0) {
                            sliderBars[1].value = maxVal;
                            progressBar.style.right = 100 - (maxVal / sliderBars[1].max) * 100 + "%";
                        }
                        previewText.textContent = formatNumberWithCommas(minVal) + ' - ' + formatNumberWithCommas(maxVal) + '/100g';
                    }
                });
            });
        }

        var caloProgressBar = document.querySelector("#caloProgressBar .progressBar");
        var caloSliderBar = document.querySelectorAll("#caloSliderBar input");
        var caloInput = document.querySelectorAll("#caloInput input");
        var caloPreview = document.querySelector("#calo-preview");
        var caloGap = 100;

        setupFilter(caloProgressBar, caloSliderBar, caloInput, caloGap, caloPreview);



        var proteinProgressBar = document.querySelector("#proteinProgressBar .progressBar");
        var proteinSliderBar = document.querySelectorAll("#proteinSliderBar input");
        var proteinInput = document.querySelectorAll("#proteinInput input");
        var proteinPreview = document.querySelector("#protein-preview");
        var proteinGap = 100;

        setupFilter(proteinProgressBar, proteinSliderBar, proteinInput, proteinGap, proteinPreview);



        var fatProgressBar = document.querySelector("#fatProgressBar .progressBar");
        var fatSliderBar = document.querySelectorAll("#fatSliderBar input");
        var fatInput = document.querySelectorAll("#fatInput input");
        var fatPreview = document.querySelector("#fat-preview");
        var fatGap = 100;

        setupFilter(fatProgressBar, fatSliderBar, fatInput, fatGap, fatPreview);




        var carbProgressBar = document.querySelector("#carbProgressBar .progressBar");
        var carbSliderBar = document.querySelectorAll("#carbSliderBar input");
        var carbInput = document.querySelectorAll("#carbInput input");
        var carbPreview = document.querySelector("#carb-preview");
        var carbGap = 100;

        setupFilter(carbProgressBar, carbSliderBar, carbInput, carbGap, carbPreview);



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
                "fatMin": fatMin,
                "fatMax": fatMax,
                "carbMin": carbMin,
                "carbMax": carbMax
            };

            console.log('Request: ' + JSON.stringify(searchData));

            $.ajax({
                type: "POST",
                url: "/api/nutritions/search",
                contentType: "application/json",
                data: JSON.stringify(searchData),
                success: function(response) {
                    console.log('Response: ');
                    console.log(response);

                    if (response && response.length > 0) {
                        nutritionList = response;
                        currentPage = 1;
                        displayItems(currentPage);
                        renderPagination();
                    } else {
                        nutritionList = [];
                        renderPagination();
                        $('.page-item').addClass('disabled');
                        document.getElementById('nutritionTableBody').innerHTML = "<p class='fs-3 text text-secondary mt-3'>Not found any Nutrition!</p>";
                    }
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }



        $(document).ready(function () {
            // Handle search name input and submit on enter
            $("#searchInput").keypress(function (event) {
                if (event.which == 13) {
                    event.preventDefault();
                    handleSearch();
                }
            });

            $("#submitCalo").click(function () {
                handleSearch();
            });

            $("#submitProtein").click(function () {
                handleSearch();
            });

            $("#submitFat").click(function () {
                handleSearch();
            });

            $("#submitCarb").click(function () {
                handleSearch();
            });
        })

    </script>
<%--    <script src="../../../assets/js/nutrition/view_list/nutrition-view-list-generate.js"></script>--%>
<%--    <script src="../../../assets/js/nutrition/view_list/nutrition-view-list-filter.js"></script>--%>
</body>

</html>