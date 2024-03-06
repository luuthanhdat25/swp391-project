$(document).ready(function() {
    $('#nutritionForm').submit(function(event) {
        var isValid = true;

        // Mảng chứa thông tin về các trường cần kiểm tra
        var fieldsToCheck = [
            { id: 'nutritionName', errorMessageId: 'nutritionNameError', errorMessage: 'Nutrition Name is required' },
            { id: 'caloryInput', errorMessageId: 'caloryError', errorMessage: 'Calories is required' },
            { id: 'proteinInput', errorMessageId: 'proteinError', errorMessage: 'Protein is required' },
            { id: 'fatInput', errorMessageId: 'fatError', errorMessage: 'Fat is required' },
            { id: 'carbInput', errorMessageId: 'carbError', errorMessage: 'Carb is required' }
        ];

        // Lặp qua mảng các trường và kiểm tra
        fieldsToCheck.forEach(function(field) {
            var fieldValue = $('#' + field.id).val().trim();
            if (fieldValue === '') {
                $('#' + field.errorMessageId).text(field.errorMessage);
                isValid = false;
            } else {
                $('#' + field.errorMessageId).text('');
            }
        });

        // Kiểm tra hình ảnh
        var image = $('#imageInput').val();
        if (!image) {
            $('#imageError').text('Image is required');
            isValid = false;
        } else {
            $('#imageError').text('');
        }

        // Check if all required fields are filled
        if (!isValid) {
            event.preventDefault(); // Prevent form submission if validation fails
        }
    });
});
