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

                <div class="toast-container position-fixed end-0 p-3" style="top: 3rem">
                    <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                        <div class="toast-header" id="statusBg">
                            <strong class="me-auto text-white" id="toastTitle"></strong>
                            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                        </div>
                        <div class="toast-body"></div>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center mt-3" style="width: 100%;">
                    <div class="input-group" style="width: 100%;">
                        <input id="searchInput" type="text" class="form-control" style="border: 1px solid #4c4c4c;" placeholder="Search here" name="title">
                        <button id="search-nutrition-button" class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                    </div>
                    <div class="d-flex justify-content-center align-items-center h-auto" style="width: 10rem">
                        <div>
                            <select class="form-select" id="selectOption">
                                <option value="2">All nutrition</option>
                                <option value="0">Publish</option>
                                <option value="1">Private</option>
                            </select>
                        </div>
                    </div>
                </div>


                <div id="personalTrainerContainer" class="mt-3">
                    <div class="student-personals-grp">
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
                                        <th>Action</th>
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
                            <a id="editButton" href="" class="btn btn-primary"> <i class="far fa-edit me-2"></i>Edit</a>
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
        var toastDTO = ${toastDTO};

        if(toastDTO){
            if(toastDTO.status === 1){
                var toastElement = $('.toast');
                var statusBg = $('#statusBg');
                var toastTitle = $('#toastTitle')
                var contentMessage = $('.toast-body');
                statusBg.addClass('bg-success');
                toastTitle.html(toastDTO.title);
                contentMessage.html(toastDTO.message);
                var toast = new bootstrap.Toast(toastElement);
                toast.show();
            }
        }

    </script>

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
        var tbody = $('#nutritionTableBody');

        if(nutritionList){
            if(nutritionList.length <= 0){
                nutritionList = [];
                renderPagination();
                $('.page-item').addClass('disabled');
                tbody.html("<p class='fs-3 text text-secondary mt-3'>Not found any Nutrition!</p>");
            }else {
                displayItems(currentPage);
                renderPagination();
            }
        }


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

                var gam = 'g/100g';
                modal.find('.modal-title').text(name);
                modal.find('#ptid').attr('href', ptId)
                modal.find('#modal-image').attr('src', 'data:image/jpeg;base64,' + image);
                modal.find('#modal-calo').text('Calories: ' + calo + gam);
                modal.find('#modal-protein').text('Protein: ' + protein + gam);
                modal.find('#modal-fat').text('Fat: ' + fat + gam);
                modal.find('#modal-carb').text('Carbohydrates: ' + carb + gam);
                var editButton = modal.find('#editButton');


                editButton.show();


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
                var displayName = nutrition.name.length > 20 ? nutrition.name.substring(0, 20) + '...' : nutrition.name;
                var isPublic = !nutrition.isPrivate;
                var statusText = isPublic ? 'Public' : 'Private';
                var statusColor = isPublic ? 'bg-success' : 'bg-danger';


                var editButton = '<a href="/nutrition/details/edit?id=' + nutrition.nutritionId + '" class="btn btn-sm btn-primary fw-bold text-white">Update</a>';
                var row = '<tr>' +
                    '<td>' + index + '</td>' +
                    '<td class="text-start">' +
                    '<h2 class="table-avatar">' +
                    '<a href="#" class="me-2 nutrition-detail d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#exampleModal" data-name="' + nutrition.name + '" data-calo="' + nutrition.caloIn + '" data-protein="' + nutrition.protein + '" data-fat="' + nutrition.fat + '" data-carb="' + nutrition.carb + '" data-image="' + (nutrition.imageDescription || defaultIconUrl) + '" data-id="' + nutrition.nutritionId + '" data-ptid="' + nutrition.personalTrainerId +  '">' +
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
                    '</td>' +
                    '<td class="align-middle">' + editButton + '</td>' +
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



        function sendFilter() {
            var searchValue = $('#searchInput').val();
            var selectedOption = $('#selectOption').val();

            $.ajax({
                type: "GET",
                url: '/api/nutritions/personal-trainer?search=' + encodeURIComponent(searchValue) + '&option=' + encodeURIComponent(selectedOption),
                contentType: "application/json",
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



        $(document).ready(function(){
            var searchInput = $('#searchInput');

            searchInput.keypress(function(event){
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if(keycode == '13'){
                    event.preventDefault();
                    sendFilter()
                }
            });

            $('#search-nutrition-button').click(function() {
                sendFilter()
            });

            $('#selectOption').change(function() {
                sendFilter()
            });
        });
    </script>
</body>

</html>