function renderNutritionList(nutritionList) {
    var tbody = $('.star-student tbody');
    var defaultIconUrl = 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg';
    var html = '';
    $.each(nutritionList, function (index, nutrition) {
        var row = '<tr>' +
            '<td>' + (index + 1) + '</td>' +
            '<td class="text-start">' +
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
        html += row;
    });
    tbody.html(html);
}

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

    console.log(JSON.stringify(searchData));

    $.ajax({
        type: "POST",
        url: "/api/nutritions/search",
        contentType: "application/json",
        data: JSON.stringify(searchData),
        success: function(response) {
            console.log(response);
            renderNutritionList(response)
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
}

$(document).ready(function () {
    renderNutritionList(nutritionList)

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
