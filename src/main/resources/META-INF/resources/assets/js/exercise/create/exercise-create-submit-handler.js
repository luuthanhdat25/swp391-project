function clearError(field) {
    $(field).text('');
}

function showError(field, message) {
    $(field).text(message);
}

function validateSelect(select, errorId, errorMessage) {
    var value = $(select).val();
    if (value === 'None') {
        showError(errorId, errorMessage);
        return false;
    }

    clearError(errorId);
    return true;
}

$(document).ready(function() {
    $('#exerciseForm').submit(function(event) {

        var errors = false;

        clearError('#exerciseNameError');
        clearError('#exerciseDescriptionError');
        clearError('#levelError');
        clearError('#muscleError');
        clearError('#imageError');
        clearError('#youtubeLinkError');

        var exerciseName = $('#exerciseName').val();
        if (exerciseName.length < 5) {
            showError('#exerciseNameError', 'Exercise Name must be at least 5 characters long');
            errors = true;
        }

        var exerciseDescription = $('#exerciseDescription').val();
        if (exerciseDescription.length < 10) {
            showError('#exerciseDescriptionError', 'Exercise Description must be at least 10 characters long');
            errors = true;
        }

        if (!$('input[name="levelRadio"]:checked').val()) {
            showError('#levelError', 'Please select a level');
            errors = true;
        }

        var validMuscle = validateSelect('select[name="muscle"]', '#muscleError', 'Please select an affected muscle');
        if (validMuscle === false) {
            errors = true;
        }

        var file = $('input[name="image"]')[0].files[0];
        if (file === undefined) {
            showError('#imageError', 'No image selected. Please select an image.');
            errors = true;
        } else {
            if (file.size > 10 * 1024 * 1024) {
                showError('#imageError', 'Image selected should be lower than 10MB');
                errors = true;
            }else{
                clearError('#imageError');
            }
        }

        var regex = /^(https?:\/\/)?(www\.)?(youtube\.com\/watch\?v=)([a-zA-Z0-9_-]{11})$/;
        var link = $('#youtubeLink').val().trim();
        if (!regex.test(link)) {
            showError('#youtubeLinkError', 'Invalid YouTube link format');
            errors = true;
        }

        if(errors === true){
            event.preventDefault();
        }
    });
});
