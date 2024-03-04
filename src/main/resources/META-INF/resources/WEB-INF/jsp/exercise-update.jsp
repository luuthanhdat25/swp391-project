<%@ include file="common/header.jspf" %>

<body>
    <div class="main-wrapper">

        <div class="header">

            <div class="header-left">
                <a href="index.html" class="logo">
                    <img src="../../assets/img/logo.png" alt="Logo">
                </a>
                <a href="index.html" class="logo logo-small">
                    <img src="../../assets/img/logo-small.png" alt="Logo" width="30" height="30">
                </a>
            </div>

            <div class="menu-toggle">
                <a href="javascript:void(0);" id="toggle_btn">
                    <i class="fas fa-bars"></i>
                </a>
            </div>

            <div class="top-nav-search">
                <form>
                    <input type="text" class="form-control" placeholder="Search here">
                    <button class="btn" type="submit"><i class="fas fa-search"></i></button>
                </form>
            </div>


            <a class="mobile_btn" id="mobile_btn">
                <i class="fas fa-bars"></i>
            </a>


            <ul class="nav user-menu">
                <li class="nav-item dropdown language-drop me-2">
                    <a href="#" class="dropdown-toggle nav-link header-nav-list" data-bs-toggle="dropdown">
                        <img src="../../assets/img/icons/header-icon-01.svg" alt="">
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:;"><i class="flag flag-lr me-2"></i>English</a>
                        <a class="dropdown-item" href="javascript:;"><i class="flag flag-bl me-2"></i>Francais</a>
                        <a class="dropdown-item" href="javascript:;"><i class="flag flag-cn me-2"></i>Turkce</a>
                    </div>
                </li>

                <li class="nav-item dropdown noti-dropdown me-2">
                    <a href="#" class="dropdown-toggle nav-link header-nav-list" data-bs-toggle="dropdown">
                        <img src="../../assets/img/icons/header-icon-05.svg" alt="">
                    </a>
                    <div class="dropdown-menu notifications">
                        <div class="topnav-dropdown-header">
                            <span class="notification-title">Notifications</span>
                            <a href="javascript:void(0)" class="clear-noti"> Clear All </a>
                        </div>
                        <div class="noti-content">
                            <ul class="notification-list">
                                <li class="notification-message">
                                    <a href="#">
                                        <div class="media d-flex">
                                            <span class="avatar avatar-sm flex-shrink-0">
                                                <img class="avatar-img rounded-circle" alt="User Image"
                                                    src="../../assets/img/profiles/avatar-02.jpg">
                                            </span>
                                            <div class="media-body flex-grow-1">
                                                <p class="noti-details"><span class="noti-title">Carlson Tech</span> has
                                                    approved <span class="noti-title">your estimate</span></p>
                                                <p class="noti-time"><span class="notification-time">4 mins ago</span>
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="notification-message">
                                    <a href="#">
                                        <div class="media d-flex">
                                            <span class="avatar avatar-sm flex-shrink-0">
                                                <img class="avatar-img rounded-circle" alt="User Image"
                                                    src="../../assets/img/profiles/avatar-11.jpg">
                                            </span>
                                            <div class="media-body flex-grow-1">
                                                <p class="noti-details"><span class="noti-title">International Software
                                                        Inc</span> has sent you a invoice in the amount of <span
                                                        class="noti-title">$218</span></p>
                                                <p class="noti-time"><span class="notification-time">6 mins ago</span>
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="notification-message">
                                    <a href="#">
                                        <div class="media d-flex">
                                            <span class="avatar avatar-sm flex-shrink-0">
                                                <img class="avatar-img rounded-circle" alt="User Image"
                                                    src="../../assets/img/profiles/avatar-17.jpg">
                                            </span>
                                            <div class="media-body flex-grow-1">
                                                <p class="noti-details"><span class="noti-title">John Hendry</span> sent
                                                    a cancellation request <span class="noti-title">Apple iPhone
                                                        XR</span></p>
                                                <p class="noti-time"><span class="notification-time">8 mins ago</span>
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="notification-message">
                                    <a href="#">
                                        <div class="media d-flex">
                                            <span class="avatar avatar-sm flex-shrink-0">
                                                <img class="avatar-img rounded-circle" alt="User Image"
                                                    src="../../assets/img/profiles/avatar-13.jpg">
                                            </span>
                                            <div class="media-body flex-grow-1">
                                                <p class="noti-details"><span class="noti-title">Mercury Software
                                                        Inc</span> added a new product <span class="noti-title">Apple
                                                        MacBook Pro</span></p>
                                                <p class="noti-time"><span class="notification-time">12 mins ago</span>
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="topnav-dropdown-footer">
                            <a href="#">View all Notifications</a>
                        </div>
                    </div>
                </li>

                <li class="nav-item zoom-screen me-2">
                    <a href="#" class="nav-link header-nav-list">
                        <img src="../../assets/img/icons/header-icon-04.svg" alt="">
                    </a>
                </li>

                <li class="nav-item dropdown has-arrow new-user-menus">
                    <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                        <span class="user-img">
                            <img class="rounded-circle" src="../../assets/img/profiles/avatar-01.jpg" width="31"
                                 alt="Soeng Souy">
                            <div class="user-text">
                                <h6>Soeng Souy</h6>
                                <p class="text-muted mb-0">Administrator</p>
                            </div>
                        </span>
                    </a>
                    <div class="dropdown-menu">
                        <div class="user-header">
                            <div class="avatar avatar-sm">
                                <img src="../../assets/img/profiles/avatar-01.jpg" alt="User Image"
                                     class="avatar-img rounded-circle">
                            </div>
                            <div class="user-text">
                                <h6>Soeng Souy</h6>
                                <p class="text-muted mb-0">Administrator</p>
                            </div>
                        </div>
                        <a class="dropdown-item" href="profile.html">My Profile</a>
                        <a class="dropdown-item" href="inbox.html">Inbox</a>
                        <a class="dropdown-item" href="login.html">Logout</a>
                    </div>
                </li>

            </ul>

        </div>

        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-sub-header">
                                <h3 class="page-title">Exercise Update</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/exercise/">Exercise</a></li>
                                    <li class="breadcrumb-item active">Exercise Update</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div>
                                <div class="student-personals-grp">
                                    <div class="card mb-0">
                                        <div class="card-body">

                                            <form:form id="exerciseForm" action="/exercise/edit" method="post" enctype="multipart/form-data">
                                                <div class="row mt-3">
                                                    <div class="w-50 col-md-6">
                                                        <input type="text" name="exerciseName" class="form-control" value='<c:out value="${exercise.name}" />' placeholder="Exercise Name" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="mb-2">Level</div>

                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="levelRadio" id="beginnerRadio" value="Beginner" <c:if test="${exercise.level eq 'Beginner'}">checked</c:if>>
                                                            <label class="form-check-label" for="beginnerRadio">Beginner</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="levelRadio" id="intermediateRadio" value="Intermediate" <c:if test="${exercise.level eq 'Intermediate'}">checked</c:if>>
                                                            <label class="form-check-label" for="intermediateRadio">Intermediate</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="levelRadio" id="advancedRadio" value="Advanced" <c:if test="${exercise.level eq 'Advanced'}">checked</c:if>>
                                                            <label class="form-check-label" for="advancedRadio">Advanced</label>
                                                        </div>
                                                    </div>
                                                </div>



                                                <div class="row mt-3">
                                                    <div class="col-md-6">
                                                        <div>
                                                            <div class="mb-2">Affected Muscle</div>
                                                            <select class="form-select" aria-label="Default select example" name="muscle">
                                                                <option selected value="None">None</option>
                                                                <option value="Chest">Chest</option>
                                                                <option value="Back">Back</option>
                                                                <option value="Shoulders">Shoulders</option>
                                                                <option value="Arms">Arms</option>
                                                                <option value="Abs">Abs</option>
                                                                <option value="Legs">Legs</option>
                                                                <option value="Glutes">Glutes</option>
                                                                <option value="Calves">Calves</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div>
                                                            <div class="mb-2">Equipment</div>
                                                            <select class="form-select" aria-label="Default select example" name="equipment">
                                                                <option selected value="None">None</option>
                                                                <option value="Stationary bike">Stationary bike</option>
                                                                <option value="Elliptical machine">Elliptical machine</option>
                                                                <option value="Rowing machine">Rowing machine</option>
                                                                <option value="Free weights">Free weights</option>
                                                                <option value="Resistance bands">Resistance bands</option>
                                                                <option value="Kettlebells">Kettlebells</option>
                                                                <option value="Bench press">Bench press</option>
                                                                <option value="Leg press machine">Leg press machine</option>
                                                                <option value="Pull-up bar">Pull-up bar</option>
                                                                <option value="Dumbbells">Dumbbells</option>
                                                                <option value="Barbells">Barbells</option>
                                                                <option value="Exercise ball">Exercise ball</option>
                                                                <option value="Yoga mat">Yoga mat</option>
                                                                <option value="Jump rope">Jump rope</option>
                                                                <option value="Medicine ball">Medicine ball</option>
                                                                <option value="Foam roller">Foam roller</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="mt-3">
                                                    <div class="mb-2">Image description</div>
                                                    <button type="button" id="chooseImageButton" class="btn btn-warning">Choose Image</button>
                                                    <br>
                                                    <input type="file" id="imageInput" style="display: none;" name="image">
                                                    <div class="mt-2">
                                                        <img id="previewImage"  src="#" alt="Preview" style="display: none;" class="w-50">
                                                    </div>
                                                </div>


                                                <div class="mt-4">
                                                    <input type="text" id="youtubeLink" placeholder="Enter YouTube URL" class="form-control w-50" name="youtubeLink">
                                                    <button type="button" id="changeVideoBtn" class="btn btn-warning mt-1">Add Video</button>
                                                </div>

                                                <div id="playerContainer" style="display: none;" class="mt-2">
                                                    <div id="player"></div>
                                                </div>

                                                <div class="hello-park mt-3">
                                                    <textarea class="form-control" id="exerciseDescription" rows="10" placeholder="Enter exercise description" name="exerciseDescription"></textarea>
                                                </div>

                                                <div class="mt-3">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value="true" id="flexCheckDefault" name="privacy">
                                                        <label class="form-check-label" for="flexCheckDefault">
                                                            Private (Only you and the gymer working with you can see)
                                                        </label>
                                                    </div>
                                                </div>

                                                <div id="errorMessages">
                                                    <p id="exerciseNameError" class="text-danger"></p>
                                                    <p id="levelError" class="text-danger"></p>
                                                    <p id="equipmentError" class="text-danger"></p>
                                                    <p id="muscleError" class="text-danger"></p>
                                                    <p id="imageError" class="text-danger"></p>
                                                    <p id="youtubeLinkError" class="text-danger"></p>
                                                    <p id="exerciseDescriptionError" class="text-danger"></p>
                                                </div>


                                                <div class="d-flex mt-3">
                                                    <button type="submit" class="btn btn-primary me-2">
                                                        Create
                                                    </button>
                                                    <a href="edit-invoice.html" class="btn btn-danger">
                                                        Cancel
                                                    </a>
                                                </div>
                                            </form:form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer>
                <p>Copyright © 2024 Gym On .</p>
            </footer>

        </div>

    </div>


    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="../../assets/js/jquery-3.6.0.min.js"></script>

    <script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../assets/js/feather.min.js"></script>

    <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="../../assets/js/script.js"></script>

    <script>
        // Image preview
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
    </script>

    <script>
        // Youtuve link
        function extractVideoId(url) {
            var regex = /^(?:(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11}))/;
            var match = url.match(regex);
            return match ? match[1] : null;
        }

        function changeVideo() {
            var youtubeLink = $('#youtubeLink').val();
            var videoId = extractVideoId(youtubeLink);

            if (videoId) {
                $('#playerContainer').show();
                player.loadVideoById(videoId);
            } else {
                alert("Invalid YouTube link. Please enter a valid link.");
            }
        }

        $(document).ready(function() {
            var tag = $('<script>', {
                src: 'https://www.youtube.com/iframe_api'
            });
            $('script:first').before(tag);

            window.onYouTubeIframeAPIReady = function() {
                player = new YT.Player('player', {
                    height: '390',
                    width: '640',
                    playerVars: {
                        'playsinline': 1
                    },
                    events: {
                        'onReady': onPlayerReady,
                        'onStateChange': onPlayerStateChange
                    }
                });
            };

            function onPlayerReady(event) {
                event.target.playVideo();
            }

            // The API calls this function when the player's state changes
            // The function indicates that when playing a video (state=1),
            // the player should play for six seconds and then stop
            var done = false;
            function onPlayerStateChange(event) {
                if (event.data == YT.PlayerState.PLAYING && !done) {
                    setTimeout(stopVideo, 6000);
                    done = true;
                }
            }

            // Function to stop the video
            function stopVideo() {
                player.stopVideo();
            }

            // Attach click event to the button
            $('#changeVideoBtn').on('click', changeVideo);
        });
    </script>

    <script>
        $(document).ready(function() {
            $('#exerciseForm').submit(function(event) {
                var errors = false;

                if ($('input[name="exerciseName"]').val().trim() === '') {
                    $('#exerciseNameError').text('Exercise Name is required');
                    errors = true;
                } else {
                    $('#exerciseNameError').text('');
                }

                if (!$('input[name="levelRadio"]:checked').val()) {
                    $('#levelError').text('Please select a level');
                    errors = true;
                } else {
                    $('#levelError').text('');
                }

                if ($('select[name="equipment"]').val() === 'None') {
                    $('#equipmentError').text('Please select an equipment');
                    errors = true;
                } else {
                    $('#equipmentError').text('');
                }

                if ($('select[name="muscle"]').val() === 'None') {
                    $('#muscleError').text('Please select an affected muscle');
                    errors = true;
                } else {
                    $('#muscleError').text('');
                }

                if ($('input[name="image"]').val() === '') {
                    $('#imageError').text('Please choose an image');
                    errors = true;
                } else {
                    $('#imageError').text('');
                }

                if ($('#youtubeLink').val().trim() === '') {
                    $('#youtubeLinkError').text('YouTube URL is required');
                    errors = true;
                } else {
                    $('#youtubeLinkError').text('');
                }

                if ($('#exerciseDescription').val().trim() === '') {
                    $('#exerciseDescriptionError').text('Exercise Description is required');
                    errors = true;
                } else {
                    $('#exerciseDescriptionError').text('');
                }

                if (errors) {
                    event.preventDefault();
                }
            });
        });

    </script>
</body>

</html>