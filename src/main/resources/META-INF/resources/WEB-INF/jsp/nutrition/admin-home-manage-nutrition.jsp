<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-head.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<head>
    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
</head>


<body>
<style>
    .rounded-image {
        width: 3rem;
        height: 3rem;
        border-radius: 50%;
        object-fit: cover;
    }

    th {
        text-align: center;
    }
</style>

<div class="main-wrapper">
    <div class="page-wrapper d-flex flex-column align-items-center"
         style="width: 75%; height: fit-content; float: right; padding: 70px 0 40px 0;">

        <div class="notification-detail d-flex flex-column align-items-center">
            <div class="shadow mb-2 rounded" style="width: 94%; height: fit-content; background-color: #333B59;
                border-radius: 6px; padding: 10px; font-size: 20px; color: #FFFFFF;  text-align: center;
                margin-bottom: 0px;">
                <b>Nutrition management</b>
            </div>
            <div class="d-flex flex-column" style="width: 94%;">
                <div class="card mb-4" style="background-color: #FFFFFF;">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Nutrition on System
                    </div>
                    <div class="d-flex justify-content-between align-items-center" style="width: 100%; padding: 0 15px 0 15px; margin-top: 2px;">
                        <div class="input-group" style="width: 100%;">
                            <input id="searchInput" type="text" class="form-control" style="border: 1px solid #4c4c4c;"
                                   placeholder="Enter the name of nutrition" name="title">
                            <button id="search-nutrition-button" class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                        </div>
                        <div class="d-flex justify-content-center align-items-center h-auto" style="width: 10rem">
                            <div>
                                <select class="form-select" id="selectOption">
                                    <option value="1">All Nutrition</option>
                                    <option value="0">Only Admin</option>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="invoices-settings-btn invoices-settings-btn- mt-3 d-flex justify-content-start">
                        <a href="/admin-home/manage-nutrition/create" class="btn" style="margin-left: 15px"><i class="feather feather-plus-circle"></i>New Nutrition</a>
                    </div>

                    <div class="card-body" style="width: 100%; height: 550px; overflow-y: auto">
                        <table id="datatablesSimple"
                               class="table table-hover table-centered mdi-format-vertical-align-center">
                            <thead class="table-secondary">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Calories/100g</th>
                                <th scope="col">Protein/100g</th>
                                <th scope="col">Fat/100g</th>
                                <th scope="col">Carb/100g</th>
                                <th scope="col">Author</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody id="tbody">

                            </tbody>
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

<div class="toast-container position-fixed end-0 p-3" style="top: 3rem">
    <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header" id="statusBg">
            <strong class="me-auto text-white" id="toastTitle"></strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body"></div>
    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg"> <!-- Use modal-lg for larger modal -->
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body row">
                <div class="col-md-8"> <!-- Use col-md-* for responsiveness -->
                    <img class="w-100 mb-2" style="object-fit: cover;" id="modal-image" src="" alt="Nutrition Image">
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
<script src="../../../assets/js/jquery-3.6.0.min.js"></script>

<script src="../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="../../../assets/js/feather.min.js"></script>

<script src="../../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="../../../assets/js/script.js"></script>

<script>
    var toastDTO = ${toastDTO};

    var toastElement = $('.toast');
    var statusBg = $('#statusBg');
    var toastTitle = $('#toastTitle')
    var contentMessage = $('.toast-body');
    statusBg.addClass('bg-success');

    function showToast(title, message) {
        toastTitle.html(title);
        contentMessage.html(message);
        var toast = new bootstrap.Toast(toastElement);
        toast.show();
    }

    if (toastDTO && toastDTO.status === 1) {
        showToast(toastDTO.title, toastDTO.message);
    }
</script>


<script>
    var nutritionList = ${nutritionList}
    console.log(nutritionList)

    var itemsPerPage = 6;
    var currentPage = 1;
    var tbody = $('#tbody');

    function displayItems(page) {
        var startIndex = (page - 1) * itemsPerPage;
        var endIndex = startIndex + itemsPerPage;
        var paginatedItems = nutritionList.slice(startIndex, endIndex);
        var defaultIconUrl = 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg';
        var html = '';
        var index = startIndex + 1; // Calculate initial index based on the current page

        $.each(paginatedItems, function (i, nutrition) {
            var displayName = nutrition.name.length > 20 ? nutrition.name.substring(0, 20) + '...' : nutrition.name;
            var ptImage;
            var ptHref;
            var action = '';
            if (nutrition.personalTrainerImage) {
                ptImage = "data:image/jpeg;base64," + nutrition.personalTrainerImage;
                ptHref = "/admin-home/personal-trainer-account?id=" + nutrition.personalTrainerId;
                var isPublic = !nutrition.isPrivate;
                var selectedPublic = isPublic ? 'selected' : '';

                action += '<select class="form-select form-select-sm" aria-label="Select visibility" data-nutrition-id="' + nutrition.nutritionId + '">' +
                    '<option value="0" ' + selectedPublic + '>Public</option>' +
                    '<option value="1" ' + (selectedPublic ? '' : 'selected') + '>Private</option>' +
                    '</select>';
            } else {
                ptImage = "../../assets/img/sm-logo.png";
                ptHref = "#"
                action += '<a href="/admin-home/manage-nutrition/edit?id=' + nutrition.nutritionId + '" class="btn btn-sm btn-primary fw-bold">Update</a>';
            }
            var row = '<tr class="align-middle">' +
                '<td class="align-middle">' + index + '</td>' +
                '<td class="text-start align-middle">' +
                '<h2 class="table-avatar">' +
                '<a href="#" class="me-2 nutrition-detail d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#exampleModal" data-name="' + nutrition.name + '" data-calo="' + nutrition.caloIn + '" data-protein="' + nutrition.protein + '" data-fat="' + nutrition.fat + '" data-carb="' + nutrition.carb + '" data-image="' + (nutrition.imageDescription || defaultIconUrl) + '" data-id="' + nutrition.nutritionId + '" data-ptid="' + nutrition.personalTrainerId + '" data-ptimage="' + (nutrition.personalTrainerImage || defaultIconUrl) + '">' +
                '<img class=" rounded-image" src="data:image/jpeg;base64,' + (nutrition.imageDescription || defaultIconUrl) + '" alt="User Image">' +
                '<p class="m-0 ms-2" style="padding-left: 10px">' + displayName + '</p>' +
                '</a>' +
                '</h2>' +
                '</td>' +
                '<td class="align-middle">' + nutrition.caloIn + '</td>' +
                '<td class="align-middle">' + nutrition.protein + '</td>' +
                '<td class="align-middle">' + nutrition.fat + '</td>' +
                '<td class="align-middle">' + nutrition.carb + '</td>' +
                '<td class="align-middle">' +
                '<a href="' + ptHref + '" class="avatar avatar-sm me-2">' +
                '<img class="avatar-img rounded-circle" src="' + ptImage + '" alt="User Image">' +
                '</a>' +
                '</td>' +
                '<td class="align-middle">' + action + '</td>' +
                '</tr>';
            html += row;
            index++; // Increment the index for each row
        });

        tbody.html(html);

        $('select').change(function() {
            var nutritionId = $(this).data('nutrition-id');
            var visibility = $(this).val();
            changeStatus(nutritionId, visibility);
        });
    }

    var statusBg = $('#statusBg');
    statusBg.addClass('bg-success');

    function changeStatus(id, status) {
        $.ajax({
            type: "GET",
            url: "/admin-home/nutrition-change-status",
            data: {
                id: id,
                status: status
            },
            success: function(response) {
                console.log(response);
                $('#toastTitle').html('Success');
                $('.toast-body').html(response);
                var toastElement = $('.toast');
                var toast = new bootstrap.Toast(toastElement);
                toast.show();
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
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

    $(document).ready(function () {
        $(document).on('click', '.nutrition-detail', function (event) {
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

            console.log(ptId)

            var gam = 'g/100g';
            modal.find('.modal-title').text(name);
            modal.find('#modal-image').attr('src', 'data:image/jpeg;base64,' + image);
            modal.find('#modal-calo').text('Calories: ' + calo + gam);
            modal.find('#modal-protein').text('Protein: ' + protein + gam);
            modal.find('#modal-fat').text('Fat: ' + fat + gam);
            modal.find('#modal-carb').text('Carbohydrates: ' + carb + gam);
            var editButton = modal.find('#editButton');

            if (!ptId) {
                editButton.attr('href', "/admin-home/manage-nutrition/edit?id=" + id)
                editButton.show();
            }
            modal.modal('show');
        });
    });

</script>

<script>

    function sendFilter() {
        var searchValue = $('#searchInput').val();
        var selectedOption = $('#selectOption').val();

        $.ajax({
            url: '/api/nutritions/admin?search=' + encodeURIComponent(searchValue) + '&option=' + encodeURIComponent(selectedOption),
            type: 'GET',
            contentType: 'application/json; charset=utf-8',
            success: function(response) {
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
                    tbody.html("<p class='fs-3 text text-secondary mt-3'>Not found any Nutrition!</p>");
                }
            },
            error: function(status, error) {
                console.error("Error:", status, error);
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

<script src="../../../assets/js/jquery-3.6.0.min.js"></script>
<%@ include file="../common/script.jspf" %>

