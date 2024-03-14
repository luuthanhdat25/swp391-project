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
