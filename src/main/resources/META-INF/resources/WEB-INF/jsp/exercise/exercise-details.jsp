<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../common/header.jspf" %>
<%@include file="../common/head.jspf" %>
<%@include file="../common/sidebar.jspf" %>
<html>
<body>
    <div class="main-wrapper">
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="student-personals-grp">
                                    <div class="card">
                                        <div class="card-body position-relative">
                                            <div id="exerciseImage"></div>
                                            <div class="mt-md-2" id="exerciseDetails"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="student-personals-grp">
                                    <div class="card mb-0">
                                        <div class="card-body">

                                            <div class="toast-container position-fixed end-0 p-3" style="top: 3rem">
                                                <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                                                    <div class="toast-header" id="statusBg">
                                                        <strong class="me-auto text-white" id="toastTitle"></strong>
                                                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                    </div>
                                                    <div class="toast-body"></div>
                                                </div>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center heading-detail">
                                                <h2 id="exerciseName"></h2>
                                                <a  style="display: none" href="personal-trainer/details" id="personalTrainerImageAtag">
                                                    <img id="personalTrainerImage" class="rounded-circle"  src="" style="width: 4rem; height: 4rem; max-width: 100px; object-fit: cover" alt="Small Image">
                                                </a>
                                                <a id="editButton" style="display: none" href="" class="btn btn-primary"> <i class="far fa-edit me-2"></i>Edit</a>
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
            </footer>

        </div>

    </div>


    <script src="../../../assets/js/jquery-3.6.0.min.js"></script>
    <script src="../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../../assets/js/feather.min.js"></script>
    <script src="../../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../../../assets/js/script.js"></script>

    <script>
        var toastDTO = ${toastDTO};

        if(toastDTO){
            if(toastDTO.status === 1){
                var toastElement = $('.toast');
                var statusBg = $('#statusBg');
                var toastTitle = $('#toastTitle')
                var contentMessage = $('.toast-body');
                statusBg.addClass('bg-success');
                toastTitle.html(toastDTO.title);
                contentMessage.html(toastDTO.message);
                var toast = new bootstrap.Toast(toastElement);
                toast.show();
            }
        }

    </script>

    <script>
        var exercise = ${exercise};
        var personalTrainerId = "${personalTrainerId}";
        console.log(exercise);
        console.log(exercise.personalTrainer_id);

        $(document).ready(function(){
            var role = "${account.getRole()}";
            console.log(role)

            if(role === "PT" && exercise.personalTrainer_id + '' === personalTrainerId){
                $('#editButton').show()
            }else{
                $('#personalTrainerImageAtag').show();
                if(exercise.personalTrainer_image){
                    $('#personalTrainerImage').attr('src', "data:image/jpeg;base64," + exercise.personalTrainer_image);
                    $('#personalTrainerImageAtag').attr('href', "/personal-trainer/details?id=" + exercise.personalTrainer_id);
                }else{
                    $('#personalTrainerImage').attr('src', "../../assets/img/sm-logo.png");
                    $('#personalTrainerImageAtag').attr('href', "#");
                }
            }
        });

    </script>

    <script src="../../../assets/js/exercise/details/exercise-details-load-data.js"></script>
    <script src="../../../assets/js/exercise/details/exercise-details-youtube-extract.js"></script>
</body>

</html>