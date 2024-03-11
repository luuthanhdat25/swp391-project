<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../common/header.jspf" %>
<%@include file="../common/head.jspf" %>
<%@include file="../common/sidebar.jspf" %>
<html>
<body>
    <div class="main-wrapper">
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-sub-header">
                                <h3 class="page-title">Exercise Details</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/exercise/">Exercise</a></li>
                                    <li class="breadcrumb-item active">Exercise Details</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="student-personals-grp">
                                    <div class="card">
                                        <div class="card-body position-relative">
                                            <div id="exerciseImage">
                                            </div>

<%--                                            <a href="personal-trainer/profile/">--%>
<%--                                                 <img id="smallImage" class="position-absolute rounded-circle top-0 end-0" src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg" style="width: 4rem; height: 4rem; max-width: 100px; border-radius: .25rem;" alt="Small Image">--%>
<%--                                            </a>--%>
                                            <div class="mt-md-2" id="exerciseDetails">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="student-personals-grp">
                                    <div class="card mb-0">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-center heading-detail">
                                                <h2 id="exerciseName"></h2>

                                                <a id="editButton" href="" class="btn btn-primary"> <i class="far fa-edit me-2"></i>Edit</a>
                                            </div>
                                            <hr>

                                            <div class="d-flex justify-content-center">
                                                <div id="playerContainer" style="display: none;" class="mt-2">
                                                    <div id="player"></div>
                                                </div>
                                            </div>

                                            <hr>

                                            <div class="hello-park  mt-md-4">
                                                <h2>Description</h2>
                                                <p class="mt-2 display-6" id="exerciseDescription"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer>
                <p>Copyright © 2024 Gym On.</p>
            </footer>

        </div>

    </div>



    <script src="../../../assets/js/jquery-3.6.0.min.js"></script>
    <script>
        var exercise = ${exercise};
        console.log(exercise.personalTrainer_id);
        $(document).ready(function() {
            $('#exerciseImage').html('<img class="w-100 mb-2" src="data:image/jpeg;base64,' + exercise.imageDescription + '" style="border-radius: .25rem;" alt="Exercise Image">');

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


        var youtubeLink = exercise.videoDescription;
        var videoId = extractVideoId(youtubeLink);

        function extractVideoId(url) {
            var regex = /^(?:(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11}))/;
            var match = url.match(regex);
            return match ? match[1] : null;
        }

        $(document).ready(function() {
            if (videoId) {
                var tag = $('<script>', {
                    src: 'https://www.youtube.com/iframe_api'
                });
                $('script:first').before(tag);

                window.onYouTubeIframeAPIReady = function() {
                    player = new YT.Player('player', {
                        height: '270',
                        width: '480',
                        playerVars: {
                            'playsinline': 1,
                        },
                        videoId: videoId,
                        events: {
                            'onReady': onPlayerReady,
                            'onStateChange': onPlayerStateChange
                        }
                    });
                };

                function onPlayerReady(event) {
                    event.target.playVideo();
                }

                function onPlayerStateChange(event) {
                    if (event.data == YT.PlayerState.PLAYING && !done) {
                        setTimeout(stopVideo, 6000);
                        done = true;
                    }
                }

                if (videoId) {
                    $('#playerContainer').show();
                    player.loadVideoById(videoId);
                } else {
                    alert("Invalid YouTube link. Please enter a valid link.");
                }
            } else {
                // Invalid YouTube link
                console.error("Invalid YouTube link. Please enter a valid link.");
            }
        });
    </script>

    <script src="../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../../assets/js/feather.min.js"></script>

    <script src="../../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../../../assets/js/script.js"></script>



    <script>
          var account =  ${account.getId()};
          console.log(account)
    </script>
</body>

</html>