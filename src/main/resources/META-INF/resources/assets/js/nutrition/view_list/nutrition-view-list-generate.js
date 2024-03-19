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

        var gam = 'g/100g';
        modal.find('.modal-title').text(name);
        modal.find('#modal-image').attr('src', 'data:image/jpeg;base64,' + image);
        modal.find('#modal-calo').text('Calories: ' + calo + gam);
        modal.find('#modal-protein').text('Protein: ' + protein + gam);
        modal.find('#modal-fat').text('Fat: ' + fat + gam);
        modal.find('#modal-carb').text('Carbohydrates: ' + carb + gam);
        var editButton = modal.find('#editButton');

            console.log('ptId ' +ptId)
            console.log('personalTrainerId ' +personalTrainerId)
        if (ptId === personalTrainerId) {
            editButton.show();
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
        var ptImage;
        if (nutrition.personalTrainerImage) {
            console.log("Yes")
            ptImage = "data:image/jpeg;base64," + nutrition.personalTrainerImage;
        } else {
            console.log("No")
            ptImage = "../../assets/img/sm-logo.png";
        }
        var row = '<tr>' +
            '<td>' + index + '</td>' +
            '<td class="text-start">' +
            '<h2 class="table-avatar">' +
            '<a href="#" class="me-2 nutrition-detail d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#exampleModal" data-name="' + nutrition.name + '" data-calo="' + nutrition.caloIn + '" data-protein="' + nutrition.protein + '" data-fat="' + nutrition.fat + '" data-carb="' + nutrition.carb + '" data-image="' + (nutrition.imageDescription || defaultIconUrl) + '" data-id="' + nutrition.nutritionId + '" data-ptid="' + nutrition.personalTrainerId + '" data-ptimage="' + (nutrition.personalTrainerImage || defaultIconUrl) + '">' +
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
            '<a href="#" class="avatar avatar-sm me-2 nutrition-detail" data-bs-toggle="modal" data-bs-target="#exampleModal">' +
            '<img class="avatar-img rounded-circle" src="' + ptImage + '" alt="User Image">' +
            '</a>' +
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