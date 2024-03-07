$(document).ready(function(){
    console.log(exercise);
    $('#exerciseName').val(exercise.name);
    $('#exerciseType select[name="muscle"]').val(exercise.type);
    $('#exerciseEquipment select[name="equipment"]').val(exercise.equipment);

    var levels = ['Beginner', 'Intermediate', 'Advanced'];
    levels.forEach(function(level) {
        var $radio = $('#' + level.toLowerCase() + 'Radio');
        if (exercise.level === level) {
            $radio.prop('checked', true);
        }
    });

    $('#previewImage').attr('src',"data:image/jpeg;base64," + exercise.imageDescription);
    $('#previewImage').show();
    $('#youtubeLink').val(exercise.videoDescription);
    var exerciseDescription = exercise.description;
    exerciseDescription = exerciseDescription.replace(/<br\s*\/?>/mg,"\n");
    $('#exerciseDescription').val(exerciseDescription);
    $('#exercisePrivate').prop('checked', exercise.isPrivate === 1);
    $('#cancelButton').attr("href", "/exercise/details?id=" + exercise.id);
})