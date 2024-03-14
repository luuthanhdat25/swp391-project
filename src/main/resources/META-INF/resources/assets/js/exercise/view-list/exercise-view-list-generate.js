// Function to generate HTML for exercise cards
function generateExerciseCards(exerciseList) {
    var defaultIconUrl = 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg';
    var cardHtml = '';
    exerciseList.forEach(function(exercise) {
        cardHtml +=
            '<div class="col-lg-3 col mt-3 rounded-2" style="height: 350px;">' +
            '<div class="card invoices-grid-card w-100 h-100">' +
            '<div class="card-header d-flex justify-content-between align-items-center">' +
            '<a href="/exercise/details?id=' + exercise.id + '" class="invoice-grid-link text-decoration-none w-75 fw-bold">' + exercise.name + '</a>' +
            '<a href="view-invoice.html" class="avatar avatar-sm me-2 avatar-img rounded-circle" style="height: 3rem; width: 3rem">' +
            '<img class="rounded-circle" src="data:image/jpeg;base64,' + (exercise.personalTrainer_image || defaultIconUrl) + '" alt="Edit Avatar">' +
            '</a>' +
            '</div>' +
            '<div class="container position-relative h-100">' +
            '<a href="/exercise/details?id=' + exercise.id + '" class="text-decoration-none text-dark d-block position-relative">' +
            '<div class="image-wrapper" style="height: 200px;">' + // Tạo một phần tử bao bọc để giới hạn kích thước chiều cao của hình ảnh
            '<img class="rounded-3" style="object-fit: cover; height: 100%; width: 100%;" src="data:image/jpeg;base64,' + (exercise.imageDescription || defaultIconUrl) + '" alt="User Image">' +
            '</div>' +
            '</a>' +
            '<div class="position-absolute top-0 end-0">';


        var backgroundColor = 'bg-success';
        if (exercise.level === 'Intermediate') {
            backgroundColor = 'bg-warning';
        } else if (exercise.level === 'Advanced') {
            backgroundColor = 'bg-danger';
        }

        cardHtml += '<h2 class="m-100 p-1 ' + backgroundColor + ' text-white rounded small" style="font-size: 15px; margin-right: 24px">' + exercise.level + '</h2>' +
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
            if (response && response.length > 0) {
                document.getElementById('exerciseContainer').innerHTML = generateExerciseCards(response);
                console.log(response);
            } else {
                // Xử lý trường hợp không có phần tử bên trong
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

$(document).ready(function() {
    $('#exerciseContainer').html(generateExerciseCards(exerciseList))
})