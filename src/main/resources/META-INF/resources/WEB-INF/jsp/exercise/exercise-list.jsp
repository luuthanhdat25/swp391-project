<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/header.jspf" %>
<%@include file="../common/head.jspf" %>
<%@include file="../common/sidebar.jspf" %>

<body>
    <div class="main-wrapper">
        <div class="page-wrapper">
            <div class="content container-fluid">
                <p id="warningPT" class="fs-6 text-danger fst-italic" style="display: none">You can only create exercises only if your personal trainer account has been approved</p>
                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col-sm-6">
                            <div class="page-sub-header">
                                <h3 class="page-title">Exercise Wiki</h3>
                            </div>
                        </div>

                        <div class="col-sm-6 text-right">
                            <div id="createExercise" style="display: none">
                                <div class="invoices-settings-btn invoices-settings-btn-one">
                                    <a href="/exercise/create" class="btn"><i class="feather feather-plus-circle"></i>New Exercise</a>
                                </div>
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



                <div id="exerciseContainer" class="row" style="height: 760px; overflow-y: auto"></div>

                <div class="mt-3 w-100 d-flex justify-content-center">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination" id="pagination"></ul>
                    </nav>
                </div>

                <div class="w-100" style="height: 2rem"></div>
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
        var personalTrainerId = ${personalTrainerId};
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

    <script src="../../../assets/js/exercise/view-list/exercise-view-list-generate.js"></script>
</body>

