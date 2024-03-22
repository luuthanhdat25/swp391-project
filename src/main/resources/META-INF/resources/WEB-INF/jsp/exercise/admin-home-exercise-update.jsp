<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-head.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<head>
    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
</head>

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
    <div class="page-wrapper d-flex flex-column align-items-center" style="width: 75%; height: fit-content; float: right; padding: 70px 0 40px 0;">

        <div class="content container-fluid">
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-sub-header">
                            <h3 class="page-title">Exercise Create</h3>
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

                                        <form id="exerciseForm" action="/admin-home/manage-exercise/edit" method="post" enctype="multipart/form-data">
                                            <div class="row mt-3">
                                                <div class="w-50 col-md-6">
                                                    <div>Exercise Name<span style="color: red">*</span></div>
                                                    <input id="exerciseName" type="text" name="exerciseName" class="form-control mt-2" placeholder="Exercise Name" />
                                                    <p id="exerciseNameError" class="text-danger mt-2"></p>
                                                </div>

                                                <div class="col-md-6" id="exerciseLevel">
                                                    <div class="mb-2 mt-2">Level<span style="color: red">*</span></div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="levelRadio" id="beginnerRadio" value="Beginner">
                                                        <label class="form-check-label" for="beginnerRadio">Beginner</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="levelRadio" id="intermediateRadio" value="Intermediate">
                                                        <label class="form-check-label" for="intermediateRadio">Intermediate</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="levelRadio" id="advancedRadio" value="Advanced">
                                                        <label class="form-check-label" for="advancedRadio">Advanced</label>
                                                    </div>
                                                    <p id="levelError" class="text-danger mt-2"></p>
                                                </div>
                                            </div>



                                            <div class="row mt-3">
                                                <div class="col-md-6">
                                                    <div id="exerciseType">
                                                        <div class="mb-2">Affected Muscle<span style="color: red">*</span></div>
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
                                                    <p id="muscleError" class="text-danger mt-3"></p>
                                                </div>

                                                <div class="col-md-6">
                                                    <div id="exerciseEquipment">
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
                                                <div class="mb-2">Image description<span style="color: red">*</span></div>
                                                <p id="imageError" class="text-danger mt-3"></p>
                                                <button type="button" id="chooseImageButton" class="btn btn-warning">Choose Image</button>
                                                <br>
                                                <input type="file" id="imageInput" style="display: none;" name="image">
                                                <div class="mt-2">
                                                    <img id="previewImage"  src="#" alt="Preview" style="display: none;" class="w-50">
                                                </div>
                                            </div>


                                            <div class="mt-4">
                                                <div class="mb-2">Video description <span style="color: red">*</span>
                                                </div>
                                                <input type="text" id="youtubeLink" placeholder="Enter YouTube URL" class="form-control w-50" name="youtubeLink">
                                                <p id="youtubeLinkError" class="text-danger mt-3"></p>
                                                <button type="button" id="changeVideoBtn" class="btn btn-warning mt-1">Add Video</button>
                                            </div>

                                            <div id="playerContainer" style="display: none;" class="mt-2">
                                                <div id="player"></div>
                                            </div>

                                            <div class="hello-park mt-3">
                                                <div class="mb-2">Exercise description<span style="color: red">*</span></div>
                                                <textarea class="form-control" id="exerciseDescription" rows="10" placeholder="Enter exercise description" name="exerciseDescription"></textarea>
                                                <p id="exerciseDescriptionError" class="text-danger mt-3"></p>
                                            </div>

                                            <div class="mt-3">
                                                <div class="form-check" style="display: none">
                                                    <input class="form-check-input" type="checkbox" value="true" id="flexCheckDefault" name="isPrivate">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="d-flex mt-3">
                                                <button type="submit" class="btn btn-primary me-2">
                                                    Update
                                                </button>
                                                <a id="cancel" href="edit-invoice.html" class="btn btn-danger">
                                                    Cancel
                                                </a>
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
    </div>
</div>


<script src="../../../assets/js/jquery-3.6.0.min.js"></script>

<script src="../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="../../../assets/js/feather.min.js"></script>

<script src="../../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="../../../assets/js/script.js"></script>

<script>
    $(document).ready(function() {
        $("#cancel").click(function(event) {
            event.preventDefault();
            window.history.back();
        });
    });
</script>


<script>
    var exercise = ${exercise};
    console.log(exercise);
</script>
<script src="../../../assets/js/exercise/update/exercise-update-load-old-data.js"></script>
<script src="../../../assets/js/exercise/update/exercise-update-youtube-change.js"></script>
<script src="../../../assets/js/exercise/update/exercise-update-image-change.js"></script>
<script src="../../../assets/js/exercise/update/exercise-update-submit-handler.js">
<%@ include file="../common/script.jspf" %>

