$(document).ready(function(){
    console.log(nutrition);
    $('#nutritionName').val(nutrition.name);
    $('#caloryInput').val(nutrition.caloIn);
    $('#proteinInput').val(nutrition.protein);
    $('#fatInput').val(nutrition.fat);
    $('#carbInput').val(nutrition.carb);

    $('#previewImage').attr('src',"data:image/jpeg;base64," + nutrition.imageDescription);
    $('#previewImage').show();
    $('#flexCheckDefault').prop('checked', exercise.isPrivate === 1);
    $('#cancelButton').attr("href", "/nutrition/");
})