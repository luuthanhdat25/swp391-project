//Image import
$(document).ready(function() {
    $('#chooseImageButton').click(function() {
        $('#imageInput').click();
    });

    $('#imageInput').change(function() {
        var file = this.files[0];
        if (file) {
            if (file.size > 10 * 1024 * 1024) {
                alert("The image size exceeds 10MB limit.");
                return;
            }

            var fileType = file.type;
            if (fileType !== 'image/jpeg' && fileType !== 'image/png') {
                alert("Please choose a valid image file (JPEG or PNG).");
                return;
            }

            var reader = new FileReader();
            reader.onload = function(event) {
                $('#previewImage').attr('src', event.target.result);
                $('#previewImage').show();
            };
            reader.readAsDataURL(file);
        }
    });
});
