<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/header.jspf" %>
<%@include file="../common/head.jspf" %>
<%@include file="../common/sidebar.jspf" %>
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

<body>
    <div class="main-wrapper">
        <div class="page-wrapper">
            <div class="content container-fluid">
                <p id="warningPT" class="fs-6 text-danger fst-italic" style="display: none">You can only create exercises only if your personal trainer account has been approved</p>
                <div class="page-header">
                    <div class="row align-items-center">
                        <h3 class="page-title col">My Exercise</h3>
                        <div class="col-auto">
                            <div class="invoices-settings-btn invoices-settings-btn-one" id="createExercise" style="display: none">
                                <a href="/exercise/create" class="btn"><i class="feather feather-plus-circle"></i>New Exercise</a>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="mt-3">
                    <form id="search-exercise" class="w-100 d-flex">
                        <input id="searchInput" type="text" class="form-control" placeholder="Search here">
                        <button id="search-exercise-button" class="btn btn-primary h-auto" type="submit"><i class="fas fa-search"></i></button>
                    </form>
                </div>


                <div class="card report-card">
                    <div class="card-body pb-0">
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="app-listing justify-content-lg-start">
                                    <li>
                                        <div class="multipleSelection">
                                            <div class="selectBox">
                                                <p class="mb-0">Affected Muscle</p>
                                                <span class="down-icon"><i class="fas fa-chevron-down"></i></span>
                                            </div>
                                            <div id="checkBoxes">
                                                    <div class="selectBox-cont">
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Chest" class="category">
                                                            <span class="checkmark"></span>
                                                            Chest
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Back" class="category">
                                                            <span class="checkmark"></span>
                                                            Back
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Shoulders" class="category">
                                                            <span class="checkmark"></span>
                                                            Shoulders
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Arms" class="category">
                                                            <span class="checkmark"></span>
                                                            Arms
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Abs" class="category">
                                                            <span class="checkmark"></span>
                                                            Abs
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Legs" class="category">
                                                            <span class="checkmark"></span>
                                                            Legs
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Glutes" class="category">
                                                            <span class="checkmark"></span>
                                                            Glutes
                                                        </label>
                                                        <label class="custom_check w-100">
                                                            <input type="checkbox" name="Calves" class="category">
                                                            <span class="checkmark"></span>
                                                            Calves
                                                        </label>
                                                    </div>
                                                    <button type="submit" class="btn w-100 btn-primary submit-filter">Apply</button>
                                                    <button id="reset-category" type="reset" class="btn w-100 btn-grey">Reset</button>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="multipleSelection">
                                            <div class="selectBox">
                                                <p class="mb-0">Difficulty</p>
                                                <span class="down-icon"><i class="fas fa-chevron-down"></i></span>
                                            </div>
                                            <div id="checkBoxes">
                                                <div class="selectBox-cont">
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Beginner" class="difficulty">
                                                        <span class="checkmark"></span>
                                                        Beginner
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Intermediate" class="difficulty">
                                                        <span class="checkmark"></span>
                                                        Intermediate
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Advanced" class="difficulty">
                                                        <span class="checkmark"></span>
                                                        Advanced
                                                    </label>
                                                </div>
                                                <button type="submit" class="btn w-100 btn-primary submit-filter">Apply</button>
                                                <button id="reset-difficulty" type="reset" class="btn w-100 btn-grey">Reset</button>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="multipleSelection">
                                            <div class="selectBox">
                                                <p class="mb-0">Equipment</p>
                                                <span class="down-icon"><i class="fas fa-chevron-down"></i></span>
                                            </div>
                                            <div id="checkBoxes">
                                                <div class="selectBox-cont">
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="None" class="equipment">
                                                        <span class="checkmark"></span>
                                                        None
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Stationary bike" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Stationary bike
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Elliptical machine" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Elliptical machine
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Rowing machine" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Rowing machine
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Free weights" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Free weights
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Resistance bands" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Resistance bands
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Kettlebells" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Kettlebells
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Bench press" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Bench press
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Leg press machine" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Leg press machine
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Pull-up bar" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Pull-up bar
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Dumbbells" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Dumbbells
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Barbells" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Barbells
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Exercise ball" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Exercise ball
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Yoga mat" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Yoga mat
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Jump rope" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Jump rope
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Medicine ball" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Medicine ball
                                                    </label>
                                                    <label class="custom_check w-100">
                                                        <input type="checkbox" name="Foam roller" class="equipment">
                                                        <span class="checkmark"></span>
                                                        Foam roller
                                                    </label>
                                                </div>
                                                <button type="submit" class="btn w-100 btn-primary submit-filter">Apply</button>
                                                <button id="reset-equipment" type="reset" class="btn w-100 btn-grey">Reset</button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
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
                            <th scope="col">Publish</th>
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

                <div class="w-100" style="height: 2rem"></div>
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

    <script src="../../../assets/plugins/select2/js/select2.min.js"></script>

    <script src="../../../assets/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../../assets/plugins/datatables/datatables.min.js"></script>

    <script src="../../../assets/plugins/moment/moment.min.js"></script>
    <script src="../../../assets/js/bootstrap-datetimepicker.min.js"></script>

    <script src="../../../assets/js/script.js"></script>


    <script>
        var exerciseList = ${exerciseList};
        console.log(exerciseList);
    </script>

    <script>
        var canCreat = ${canCreate};
        var role = "${account.getRole()}";
        console.log('Can create exercise: ' + canCreat);
        if(canCreat && canCreat === true){
            $('#createExercise').show();
        }else{
            if(role === "PT"){
                $('#warningPT').show();
            }
        }
        console.log(role)
    </script>
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
                var displayName = exercise.name.length > 30 ? exercise.name.substring(0, 30) + '...' : exercise.name;
                var isPublic = !exercise.isPrivate;
                var statusText = isPublic ? 'Public' : 'Private';
                var statusColor = isPublic ? 'bg-success' : 'bg-danger';
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
                    '<div class="rounded-3  ' + statusColor +'">' +
                    '<span class="text-white fw-bold">' + statusText + '</span>' +
                    '</div>' +
                    '</td>' +
                    '</tr>';
                html += row;
                index++; // Increment the index for each row
            });

            tbody.html(html);
        }



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
    </script>

<%--    <script src="../../../assets/js/exercise/view-list/exercise-view-list-generate.js"></script>--%>
</body>

