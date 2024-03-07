function clearError(field) {
    $(field).text('');
}

function showError(field, message) {
    console.log(message)
    $(field).text(message);
}


$(document).ready(function() {
    $('#nutritionForm').submit(function(event) {
        var isValid = true;

        clearError('#nutritionNameError');
        clearError('#caloryError');
        clearError('#proteinError');
        clearError('#fatError');
        clearError('#carbError');

        var nutritionName = $('#nutritionName').val();
        if (nutritionName.length < 5) {
            showError('#nutritionNameError', 'Nutrition Name must be at least 5 characters long');
            isValid = false;
        }

        var file = $('input[name="image"]')[0].files[0];
        if (file === undefined) {
            showError('#imageError', 'No image selected. Please select an image.');
            isValid = false;
        } else {
            if (file.size > 10 * 1024 * 1024) {
                showError('#imageError', 'Image selected should be lower than 10MB');
                isValid = false;
            }else{
                clearError('#imageError');
            }
        }

        if (!isValid) {
            event.preventDefault();
        }
    });
});