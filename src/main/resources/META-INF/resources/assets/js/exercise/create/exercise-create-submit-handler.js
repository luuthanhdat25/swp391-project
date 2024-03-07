$(document).ready(function() {
    $('#exerciseForm').submit(function(event) {
        var errors = false;

        function showError(field, message) {
            $(field).text(message);
            errors = true;
        }

        function clearError(field) {
            $(field).text('');
        }

        function validateRequiredInput(input, errorMessage) {
            var value = $(input).val().trim();
            if (value === '') {
                showError(errorMessage);
            } else {
                clearError(errorMessage);
            }
            return value;
        }

        function validateSelect(select, errorId, errorMessage) {
            var value = $(select).val();
            if (value === 'None') {
                showError(errorId, errorMessage);
            } else {
                clearError(errorId);
            }
            return value;
        }

        function validateImageSize(input, errorMessage) {
            var file = $(input)[0].files[0];
            if (file === undefined) {
                showError(errorMessage);
            } else {
                if (file.size > 10 * 1024 * 1024) {
                    showError(errorMessage);
                } else {
                    clearError(errorMessage);
                }
            }
        }

        function validateYouTubeLink(input, regex, errorMessage) {
            var link = $(input).val().trim();
            if (link === '') {
                showError(errorMessage);
            } else {
                if (!regex.test(link)) {
                    showError(errorMessage);
                } else {
                    clearError(errorMessage);
                }
            }
        }

        clearError('#exerciseNameError'); // Clear error message before validation
        var exerciseName = validateRequiredInput('input[name="exerciseName"]', '#exerciseNameError');
        if (exerciseName.length < 5) {
            showError('#exerciseNameError', 'Exercise Name must be at least 5 characters long');
        }

        clearError('#levelError'); // Clear error message before validation
        if (!$('input[name="levelRadio"]:checked').val()) {
            showError('#levelError', 'Please select a level');
        }

        clearError('#equipmentError'); // Clear error message before validation
        validateSelect('select[name="equipment"]', '#equipmentError', 'Please select a equipment');

        clearError('#muscleError'); // Clear error message before validation
        validateSelect('select[name="muscle"]', '#muscleError', 'Please select a affected muscle');

        clearError('#imageError'); // Clear error message before validation
        validateImageSize('input[name="image"]', '#imageError');
        if ($('#imageError').text() === '') { // If no error message is shown for image, show a warning
            $('#imageError').text('No image selected. Please select an image.');
        }

        clearError('#youtubeLinkError'); // Clear error message before validation
        validateYouTubeLink('#youtubeLink', /^(https?:\/\/)?(www\.)?(youtube\.com\/watch\?v=)([a-zA-Z0-9_-]{11})$/, '#youtubeLinkError');

        clearError('#exerciseDescriptionError'); // Clear error message before validation
        var exerciseDescription = validateRequiredInput('#exerciseDescription', '#exerciseDescriptionError');
        if (exerciseDescription.length < 10) {
            showError('#exerciseDescriptionError', 'Exercise Description must be at least 10 characters long');
        }

        if (errors) {
            event.preventDefault();
        }
    });
});