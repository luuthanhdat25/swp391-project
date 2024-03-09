<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/header.jspf" %>
<%@include file="../common/head.jspf" %>
<%@include file="../common/sidebar.jspf" %>

<body>
    <div class="main-wrapper">
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-sub-header">
                                <h3 class="page-title">Exercise Create</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/exercise/">Exercise</a></li>
                                    <li class="breadcrumb-item active">Exercise Create</li>
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

                                            <form id="exerciseForm" action="/exercise/create" method="post" enctype="multipart/form-data">
                                                <div class="row mt-3">
                                                    <div class="w-50 col-md-6">
                                                        <div>Exercise Name</div>
                                                        <input id="exerciseName" type="text" name="exerciseName" class="form-control mt-2" required  placeholder="Exercise Name" />
                                                        <p id="exerciseNameError" class="text-danger mt-2"></p>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="mb-2 mt-2">Level</div>

                                                        <div class="form-check form-check-inline mt-1">
                                                            <input class="form-check-input" type="radio" name="levelRadio" id="beginnerRadio" value="Beginner" <c:if test="${exercise.level eq 'Beginner'}">checked</c:if>>
                                                            <label class="form-check-label" for="beginnerRadio">Beginner</label>
                                                        </div>
                                                        <div class="form-check form-check-inline mt-1">
                                                            <input class="form-check-input" type="radio" name="levelRadio" id="intermediateRadio" value="Intermediate" <c:if test="${exercise.level eq 'Intermediate'}">checked</c:if>>
                                                            <label class="form-check-label" for="intermediateRadio">Intermediate</label>
                                                        </div>
                                                        <div class="form-check form-check-inline mt-1">
                                                            <input class="form-check-input" type="radio" name="levelRadio" id="advancedRadio" value="Advanced" <c:if test="${exercise.level eq 'Advanced'}">checked</c:if>>
                                                            <label class="form-check-label" for="advancedRadio">Advanced</label>
                                                        </div>
                                                        <p id="levelError" class="text-danger mt-2"></p>
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
                                                            <p id="muscleError" class="text-danger mt-3"></p>
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
                                                    <p id="imageError" class="text-danger mt-3"></p>
                                                    <button type="button" id="chooseImageButton" class="btn btn-warning">Choose Image</button>
                                                    <br>
                                                    <input type="file" id="imageInput" name="image" style="display: none">
                                                    <div class="mt-2">
                                                        <img id="previewImage"  src="#" alt="Preview" style="display: none;" class="w-50">
                                                    </div>
                                                </div>


                                                <div class="mt-4">
                                                    <input type="text" id="youtubeLink" placeholder="Enter YouTube URL" class="form-control w-50" name="youtubeLink" required>
                                                    <p id="youtubeLinkError" class="text-danger mt-3"></p>
                                                    <button type="button" id="changeVideoBtn" class="btn btn-warning mt-1">Add Video</button>
                                                </div>

                                                <div id="playerContainer" style="display: none;" class="mt-2">
                                                    <div id="player"></div>
                                                </div>

                                                <div class="hello-park mt-3">
                                                    <textarea required class="form-control" id="exerciseDescription" rows="10" placeholder="Enter exercise description" name="exerciseDescription" wrap="soft"></textarea>
                                                    <p id="exerciseDescriptionError" class="text-danger mt-3"></p>
                                                </div>

                                                <div class="mt-3">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value="true" id="flexCheckDefault" name="isPrivate">
                                                        <label class="form-check-label" for="flexCheckDefault">
                                                            Private (Only you and the gymer working with you can see)
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="d-flex mt-3">
                                                    <button type="submit" class="btn btn-primary me-2">Create</button>
                                                    <a href="/exercise/" class="btn btn-danger">Cancel</a>
                                                </div>
                                            </form>

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


    <script src="../../../assets/js/jquery-3.6.0.min.js"></script>

    <script src="../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../../assets/js/feather.min.js"></script>

    <script src="../../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="../../../assets/js/script.js"></script>

    <script src="../../../assets/js/exercise/create/exercise-create-image-import.js"></script>
    <script src="../../../assets/js/exercise/create/exercise-create-youtube-extract.js"></script>
    <script src="../../../assets/js/exercise/create/exercise-create-submit-handler.js"></script>
</body>

</html>