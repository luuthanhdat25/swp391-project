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
                            <input type="text" class="form-control" style="border: 1px solid #4c4c4c;"
                                   placeholder="Enter the name of nutrition" name="title">
                            <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                        </div>
                        <div class="d-flex justify-content-center align-items-center h-auto" style="width: 10rem">
                            <div>
                                <select class="form-select" id="selectOption">
                                    <option value="all">All Nutrition</option>
                                    <option value="admin">Only Admin</option>
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
                                <th scope="col">Public</th>
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
            if (nutrition.personalTrainerImage) {
                ptImage = "data:image/jpeg;base64," + nutrition.personalTrainerImage;
            } else {
                ptImage = "../../assets/img/sm-logo.png";
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
                '<a href="/personal-trainer/details?id=' + nutrition.personalTrainerId + '" class="avatar avatar-sm me-2">' +
                '<img class="avatar-img rounded-circle" src="' + ptImage + '" alt="User Image">' +
                '</a>' +
                '</td>' +
                '<td class="align-middle">' +
                '<select class="form-select form-select-sm" aria-label="Select visibility">' +
                '<option value="public">Public</option>' +
                '<option value="private">Private</option>' +
                '</select>' +
                '</td>' +
                '</tr>';
            html += row;
            index++; // Increment the index for each row
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

    displayItems(currentPage);
    renderPagination();

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

            var gam = 'g/100g';
            modal.find('.modal-title').text(name);
            modal.find('#modal-image').attr('src', 'data:image/jpeg;base64,' + image);
            modal.find('#modal-calo').text('Calories: ' + calo + gam);
            modal.find('#modal-protein').text('Protein: ' + protein + gam);
            modal.find('#modal-fat').text('Fat: ' + fat + gam);
            modal.find('#modal-carb').text('Carbohydrates: ' + carb + gam);
            var editButton = modal.find('#editButton');

            console.log('ptId ' + ptId)
            console.log('personalTrainerId ' + personalTrainerId)
            if (ptId === personalTrainerId) {
                editButton.show();
            } else {
                editButton.hide();
            }
            editButton.attr('href', '/nutrition/details/edit?id=' + id);
            modal.modal('show');
        });
    });

</script>

<script>
    $(document).ready(function() {
        $('#selectOption').change(function() {
            var selectedOption = $(this).val();
            yourFunction(selectedOption);
        });
    });

    function yourFunction(selectedOption) {
        console.log("Selected option:", selectedOption);
    }

</script>

<script src="../../../assets/js/jquery-3.6.0.min.js"></script>
<%@ include file="../common/script.jspf" %>

