<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-head.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<head>
    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
</head>


<body>
<style>
    .rounded-image {
        width: 3rem;
        height: 3rem;
        border-radius: 50%;
        object-fit: cover;
    }

    th {
        text-align: center;
    }
</style>

<div class="main-wrapper">
    <div class="page-wrapper d-flex flex-column align-items-center"
         style="width: 75%; height: fit-content; float: right; padding: 70px 0 40px 0;">

        <div class="notification-detail d-flex flex-column align-items-center">
            <div class="shadow mb-2 rounded" style="width: 94%; height: fit-content; background-color: #333B59;
                border-radius: 6px; padding: 10px; font-size: 20px; color: #FFFFFF;  text-align: center;
                margin-bottom: 0px;">
                <b>Exercise management</b>
            </div>
            <div class="d-flex flex-column" style="width: 94%;">
                <div class="card mb-4" style="background-color: #FFFFFF;">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Exercise on System
                    </div>
                    <div class="d-flex justify-content-between align-items-center" style="width: 100%; padding: 0 15px 0 15px; margin-top: 2px;">
                        <div class="input-group" style="width: 100%;">
                            <input type="text" class="form-control" style="border: 1px solid #4c4c4c;"
                                   placeholder="Search here" name="title">
                            <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                        </div>
                        <div class="d-flex justify-content-center align-items-center h-auto" style="width: 10rem">
                            <div>
                                <select class="form-select" id="selectOption">
                                    <option value="all">All exercise</option>
                                    <option value="admin">Only Admin</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="invoices-settings-btn invoices-settings-btn- mt-3 d-flex justify-content-start">
                        <a href="/admin-home/manage-exercise/create" class="btn" style="margin-left: 15px"><i class="feather feather-plus-circle"></i>New Exercise</a>
                    </div>

                    <div class="card-body" style="width: 100%; height: 550px; overflow-y: auto">
                        <table id="datatablesSimple"
                               class="table table-hover table-centered mdi-format-vertical-align-center">
                            <thead class="table-secondary">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Level</th>
                                <th scope="col">Affected Muscle</th>
                                <th scope="col">Equipment</th>
                                <th scope="col">Author</th>
                                <th scope="col">Public</th>
                            </tr>
                            </thead>
                            <tbody id="tbody">

                            </tbody>
                        </table>

                    </div>
                    <div class="mt-3 w-100 d-flex justify-content-center">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination" id="pagination"></ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl"> <!-- Use modal-lg for larger modal -->
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body row">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="student-personals-grp">
                                <div class="card mb-0">
                                    <div class="card-body">
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
                        <div class="col-lg-4">
                            <div class="student-personals-grp">
                                <div class="card">
                                    <div class="card-body position-relative">
                                        <select class="form-select form-select-lg " aria-label="Select visibility">
                                            <option value="public">Public</option>
                                            <option value="private">Private</option>
                                        </select>
                                        <div id="exerciseImage" class="mt-3"> </div>
                                        <div class="mt-md-2" id="exerciseDetails"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <a id="editButton" style="display: none" href="" class="btn btn-primary"> <i class="far fa-edit me-2"></i>Edit</a>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script src="../../../assets/js/jquery-3.6.0.min.js"></script>

<script src="../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="../../../assets/js/feather.min.js"></script>

<script src="../../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="../../../assets/js/script.js"></script>

<script>
    var exerciseList = ${exerciseList}
    console.log(exerciseList)

    var itemsPerPage = 6;
    var currentPage = 1;
    var tbody = $('#tbody');

    function displayItems(page) {
        var startIndex = (page - 1) * itemsPerPage;
        var endIndex = startIndex + itemsPerPage;
        var paginatedItems = exerciseList.slice(startIndex, endIndex);
        var defaultIconUrl = 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg';
        var html = '';
        var index = startIndex + 1; // Calculate initial index based on the current page

        $.each(paginatedItems, function (i, exercise) {
            var displayName = exercise.name.length > 20 ? exercise.name.substring(0, 20) + '...' : exercise.name;
            var ptImage;
            if (exercise.personalTrainer_image) {
                ptImage = "data:image/jpeg;base64," + exercise.personalTrainer_image;
            } else {
                ptImage = "../../assets/img/sm-logo.png";
            }
            var row = '<tr class="align-middle">' +
                '<td class="align-middle">' + index + '</td>' +
                '<td class="text-start align-middle"> ' +
                '<h2 class="table-avatar">' +
                '<a href="#" class="me-2 exercise-detail d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="' + exercise.id + '">' +
                '<img class=" rounded-image" src="data:image/jpeg;base64,' + (exercise.imageDescription || defaultIconUrl) + '" alt="User Image">' +
                '<p class="m-0 ms-2" style="padding-left: 10px">' + displayName + '</p>' +
                '</a>' +
                '</h2>' +
                '</td>' +
                '<td class="align-middle">' + exercise.level + '</td>' +
                '<td class="align-middle">' + exercise.type + '</td>' +
                '<td class="align-middle">' + exercise.equipment + '</td>' +
                '<td class="align-middle">' +
                '<a href="/personal-trainer/details?id=' + exercise.personalTrainerId + '" class="avatar avatar-sm me-2">' +
                '<img class="avatar-img rounded-circle" src="' + ptImage + '" alt="User Image">' +
                '</a>' +
                '</td>' +
                '<td class="align-middle">' +
                '<select class="form-select form-select-sm" aria-label="Select visibility">' +
                '<option value="public">Public</option>' +
                '<option value="private">Private</option>' +
                '</select>' +
                '</td>' +
                '</tr>';
            html += row;
            index++; // Increment the index for each row
        });

        tbody.html(html);
    }






    function renderPagination() {
        var totalPages = Math.ceil(exerciseList.length / itemsPerPage);
        var paginationHtml = '';

        paginationHtml += '<li class="page-item ' + (currentPage === 1 ? 'disabled' : '') + '"><a class="page-link" href="#" data-page="' + (currentPage - 1) + '">Previous</a></li>';
        for (var i = 1; i <= totalPages; i++) {
            paginationHtml += '<li class="page-item ' + (currentPage === i ? 'active' : '') + '"><a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>';
        }
        paginationHtml += '<li class="page-item ' + (currentPage === totalPages ? 'disabled' : '') + '"><a class="page-link" href="#" data-page="' + (currentPage + 1) + '">Next</a></li>';

        $('#pagination').html(paginationHtml);
    }

    $(document).on('click', '.pagination .page-link', function(e) {
        e.preventDefault();
        var page = parseInt($(this).data('page'));
        if (!isNaN(page)) {
            currentPage = page;
            displayItems(currentPage);
            renderPagination();
        }
    });

    displayItems(currentPage);
    renderPagination();

    $(document).ready(function () {
        $(document).on('click', '.exercise-detail', function (event) {
            event.preventDefault();
            var modal = $('#exampleModal');
            var exerciseId = $(this).data('id');
            console.log(exerciseId)

            $.ajax({
                type: 'GET',
                url: '/api/exercises/' + exerciseId,
                success: function (exercise) {
                    // console.log("Exercise details:", exercise);
                    modal.find('.modal-title').text(exercise.name);
                    $('#exerciseImage').html('<img class="w-100 mb-2" src="data:image/jpeg;base64,' + exercise.imageDescription + '" style="border-radius: .25rem;" alt="Exercise Image">');
                    var level = '';
                    if (exercise.level === 'Beginner') {
                        level = 'bg-success';
                    } else if (exercise.level === 'Intermediate') {
                        level = 'bg-warning';
                    } else if (exercise.level === 'Advanced') {
                        level = 'bg-danger';
                    }

                    $('#exerciseDetails').html('<h2 class="m-100 p-1 text-white rounded ' + level + '" id="level" style="font-size: 1rem">Level: ' + exercise.level + '</h2>' +
                        '<h2 class="m-100 p-1 bg-info text-white rounded" id="affectedMuscle" style="font-size: 1rem">Affected Muscle: ' + exercise.type + '</h2>' +
                        '<h2 class="m-100 p-1 bg-secondary text-white rounded" id="equipment" style="font-size: 1rem">Equipment: ' + exercise.equipment + '</h2>');

                    $('#exerciseDescription').html(exercise.description);

                    var videoId = extractVideoId(exercise.videoDescription);

                    // Nếu có video ID, tạo người chơi YouTube
                    if (videoId) {
                        createYouTubePlayer(videoId);
                    } else {
                        // Hiển thị thông báo nếu không có link YouTube hợp lệ
                        $('#playerContainer').hide();
                        console.error("Invalid YouTube link. Please enter a valid link.");
                    }

                    function extractVideoId(url) {
                        var regex = /^(?:(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11}))/;
                        var match = url.match(regex);
                        return match ? match[1] : null;
                    }

                    // Hàm để tạo người chơi YouTube
                    function createYouTubePlayer(videoId) {
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

                        // Hiển thị người chơi YouTube
                        $('#playerContainer').show();
                        player.loadVideoById(videoId);
                    }
                },
                error: function (error) {
                    console.error("Error fetching exercise details:", error);
                }
            });
        });

        // Xử lý sự kiện khi modal được đóng
        $('#exampleModal').on('hidden.bs.modal', function (e) {
            stopVideo(); // Dừng video khi modal được đóng
        });

        // Hàm để dừng video
        function stopVideo() {
            player.stopVideo(); // Dừng video
        }
    });


</script>

<script>
    $(document).ready(function() {
        $('#selectOption').change(function() {
            var selectedOption = $(this).val();
            yourFunction(selectedOption);
        });
    });

    function yourFunction(selectedOption) {
        console.log("Selected option:", selectedOption);
    }

</script>

<script src="../../../assets/js/jquery-3.6.0.min.js"></script>
<%@ include file="../common/script.jspf" %>

