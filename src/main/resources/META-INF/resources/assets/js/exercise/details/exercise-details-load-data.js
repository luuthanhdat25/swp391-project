$(document).ready(function() {
    $('#exerciseImage').html('<img class="w-100 mb-2" src="data:image/jpeg;base64,' + exercise.imageDescription + '" style="border-radius: .25rem;" alt="Exercise Image">');
    console.log("data:image/jpeg;base64," + exercise.personalTrainer_image)
    var level = '';
    if (exercise.level === 'Beginner') {
        level = 'bg-success';
    } else if (exercise.level === 'Intermediate') {
        level = 'bg-warning';
    } else if (exercise.level === 'Advanced') {
        level = 'bg-danger';
    }

    $('#exerciseDetails').append('<h2 class="m-100 p-1 text-white rounded ' + level + '" id="level" style="font-size: 1rem">Level: ' + exercise.level + '</h2>' +
        '<h2 class="m-100 p-1 bg-info text-white rounded" id="affectedMuscle" style="font-size: 1rem">Affected Muscle: ' + exercise.type + '</h2>' +
        '<h2 class="m-100 p-1 bg-secondary text-white rounded" id="equipment" style="font-size: 1rem">Equipment: ' + exercise.equipment + '</h2>');

    $('#exerciseName').append(exercise.name);
    $('#editButton').attr('href', '/exercise/details/edit?id=' + exercise.id);
    $('#exerciseDescription').append(exercise.description);
});
