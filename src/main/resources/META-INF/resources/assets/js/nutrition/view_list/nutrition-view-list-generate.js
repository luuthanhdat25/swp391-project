function renderNutritionList(nutritionList) {
    var tbody = $('.star-student tbody');
    var defaultIconUrl = 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg';
    var html = '';
    $.each(nutritionList, function (index, nutrition) {
        var displayName = nutrition.name.length > 12 ? nutrition.name.substring(0, 12) + '...' : nutrition.name;
        var row = '<tr>' +
            '<td>' + (index + 1) + '</td>' +
            '<td class="text-start">' +
            '<h2 class="table-avatar">' +
            '<a href="#" class="me-2 nutrition-detail d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#exampleModal" data-name="' + nutrition.name + '" data-calo="' + nutrition.caloIn + '" data-protein="' + nutrition.protein + '" data-fat="' + nutrition.fat + '" data-carb="' + nutrition.carb + '" data-image="' + (nutrition.imageDescription || defaultIconUrl) + '" data-id="' + nutrition.nutritionId + '" data-ptid="' + nutrition.personalTrainerId + '" data-ptimage="' + (nutrition.personalTrainerImage || defaultIconUrl) +'">' +
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
            '<img class="avatar-img rounded-circle" src="data:image/jpeg;base64,' + (nutrition.personalTrainerImage || defaultIconUrl) + '" alt="User Image">' +
            '</a>' +
            '</td>' +
            '</tr>';
        html += row;
    });
    tbody.html(html);
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

