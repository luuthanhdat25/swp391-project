var itemsPerPage = 8;
var currentPage = 1;

function createExerciseCard(exercise) {
    var defaultIconUrl = 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg';

    var cardHtml = `
        <div class="col-lg-3 col mt-3 rounded-2" style="height: 350px;">
            <div class="card invoices-grid-card w-100 h-100">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <a href="/exercise/details?id=${exercise.id}" class="invoice-grid-link text-decoration-none w-75 fw-bold">${exercise.name}</a>
                    <a href="/personal-trainer/details?id=${exercise.personalTrainer_id}" class="avatar avatar-sm me-2 avatar-img rounded-circle" style="height: 3rem; width: 3rem;box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);">
                        <img class="rounded-circle" src="data:image/jpeg;base64,${exercise.personalTrainer_image || defaultIconUrl}" alt="Edit Avatar">
                    </a>
                </div>
                <div class="container position-relative h-100">
                    <a href="/exercise/details?id=${exercise.id}" class="text-decoration-none text-dark d-block position-relative">
                        <div class="image-wrapper" style="height: 200px;">
                            <img class="rounded-3" style="object-fit: cover; height: 100%; width: 100%;" src="data:image/jpeg;base64,${exercise.imageDescription || defaultIconUrl}" alt="User Image">
                        </div>
                    </a>
                    <div class="position-absolute top-0 end-0">
                        <h2 class="m-100 p-1 ${getBackgroundColor(exercise.level)} text-white rounded small" style="font-size: 15px; margin-right: 24px">${exercise.level}</h2>
                    </div>
                </div>
                <div class="card-body">
                    <div style="display: inline-block;">
                        <h2 class="w-auto p-1 m-1 bg-info text-white rounded small" style="font-size: 15px;">${exercise.type}</h2>
                    </div>
                    <div style="display: inline-block;">
                        <h2 class="w-auto p-1 m-1 bg-secondary text-white rounded small" style="font-size: 15px;">${exercise.equipment}</h2>
                    </div>
                </div>
            </div>
        </div>`;

    return cardHtml;
}

function displayItems(page) {
    var startIndex = (page - 1) * itemsPerPage;
    var endIndex = startIndex + itemsPerPage;
    var paginatedItems = exerciseList.slice(startIndex, endIndex);

    var cardHtml = '';

    paginatedItems.forEach(function(exercise) {
        cardHtml += createExerciseCard(exercise);
    });

    document.getElementById('exerciseContainer').innerHTML = cardHtml;
}

function getBackgroundColor(level) {
    switch (level) {
        case 'Intermediate':
            return 'bg-warning';
        case 'Advanced':
            return 'bg-danger';
        default:
            return 'bg-success';
    }
}


function renderPagination() {
    var totalPages = Math.ceil(exerciseList.length / itemsPerPage);
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

// Hiển thị trang đầu tiên khi tải trang
displayItems(currentPage);
renderPagination();

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
            console.log(response);
            if (response && response.length > 0) {
                exerciseList = response;
                currentPage = 1;
                displayItems(currentPage);
                renderPagination();
            } else {
                exerciseList = [];
                renderPagination();
                $('.page-item').addClass('disabled');
                document.getElementById('exerciseContainer').innerHTML = "<p class='fs-3 text text-secondary mt-3'>Not found any Exercise!</p>";
            }
        },
        error: function(status, error) {
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
