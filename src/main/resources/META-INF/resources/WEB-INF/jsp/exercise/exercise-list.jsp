<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/header.jspf" %>
<%@include file="../common/head.jspf" %>
<%@include file="../common/sidebar.jspf" %>

<style>
    .ex-image {
        width: 100%;
        height: 9rem;
        object-fit: cover;
    }
</style>
<body>
    <div class="main-wrapper">
        <div class="page-wrapper">
            <div class="content container-fluid">

                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col">
                            <h3 class="page-title">Exercise Wiki</h3>
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

                <c:if test="${account ne null}">
                    <c:choose>
                        <c:when test="${account.getRole() eq 'PT' || account.getRole() eq 'ADMIN'}">
                            <div class="card invoices-tabs-card border-0 mt-3">
                                <div class="col-lg-12 col-md-12">
                                    <div class="invoices-settings-btn invoices-settings-btn-one">
                                        <a href="/exercise/create" class="btn"><i class="feather feather-plus-circle"></i>New Exercise</a>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- Other role-specific content here -->
                        </c:otherwise>
                    </c:choose>
                </c:if>


                <div id="exerciseContainer" class="row"></div>

<%--                <div>--%>
<%--                    <ul class="pagination mb-4">--%>
<%--                        <li class="page-item disabled">--%>
<%--                            <a class="page-link" href="#" tabindex="-1">Previous</a>--%>
<%--                        </li>--%>
<%--                        <li class="page-item active">--%>
<%--                            <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>--%>
<%--                        </li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link" href="#">Next</a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
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
        // Function to generate HTML for exercise cards
        function generateExerciseCards(exerciseList) {
            var defaultIconUrl = 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg';
            var cardHtml = '';
            exerciseList.forEach(function(exercise) {
                cardHtml +=
                    '<div class="col-lg-3 col mt-3" style="height: 350px;">' +
                    '<div class="card invoices-grid-card w-100 h-100">' +
                    '<div class="card-header d-flex justify-content-between align-items-center">' +
                    '<a href="/exercise/details?id=' + exercise.id + '" class="invoice-grid-link text-decoration-none w-75">' + exercise.name + '</a>' +
                    '<a href="view-invoice.html" class="avatar avatar-sm me-2 avatar-img rounded-circle" style="height: 3rem; width: 3rem">' +
                    '<img class="rounded-circle" src="' +  'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg' + '" alt="Edit Avatar">' +
                    '</a>' +
                    '</div>' +
                    '<div class="container position-relative h-100">' +
                    '<a href="/exercise/details?id=' + exercise.id + '" class="text-decoration-none text-dark d-block position-relative">' +
                    '<div class="image-wrapper" style="height: 200px;">' + // Tạo một phần tử bao bọc để giới hạn kích thước chiều cao của hình ảnh
                    '<img  style="object-fit: contain; height: 100%; width: 100%" src="data:image/jpeg;base64,' + (exercise.imageDescription || defaultIconUrl) + '" alt="User Image">' +
                    '</div>' +
                    '</a>' +
                    '<div class="position-absolute top-0 end-0">';


                var backgroundColor = 'bg-success';
                if (exercise.level === 'Intermediate') {
                    backgroundColor = 'bg-warning';
                } else if (exercise.level === 'Advanced') {
                    backgroundColor = 'bg-danger';
                }

                cardHtml += '<h2 class="m-100 p-1 ' + backgroundColor + ' text-white rounded small" style="font-size: 12px;">' + exercise.level + '</h2>' +
                    '</div>' +
                    '</a>' +
                    '</div>' +
                    '<div class="card-body">';

                cardHtml += '<div style="display: inline-block;">' +
                    '<h2 class="w-auto p-1 m-1 bg-info text-white rounded small" style="font-size: 15px;">' + exercise.type + '</h2>' +
                    '</div>';

                cardHtml += '<div style="display: inline-block;">' +
                    '<h2 class="w-auto p-1 m-1 bg-secondary text-white rounded small" style="font-size: 15px;">' + exercise.equipment + '</h2>' +
                    '</div>';
                cardHtml += '</div></div></div>';
            });
            return cardHtml;
        }

        function sendFilterJSON(filterObject) {
            var filterJSON = JSON.stringify(filterObject);
            console.log(filterJSON);
            $.ajax({
                url: '/api/exercises/search',
                type: 'POST',
                data: filterJSON,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(response) {
                    document.getElementById('exerciseContainer').innerHTML = generateExerciseCards(response);
                    console.log(response)
                },
                error: function(status, error) {
                    // Xử lý lỗi ở đây nếu cần
                }
            });
        }


        function sendFilterRequest(){
            var filterObject = {};
            var searchValue = $('#searchInput').val();
            filterObject.searchValue = searchValue;
            filterObject.categories = $('.category:checked').map(function() {
                return $(this).attr('name');
            }).get();
            filterObject.difficulties = $('.difficulty:checked').map(function() {
                return $(this).attr('name');
            }).get();


            filterObject.equipments = $('.equipment:checked').map(function() {
                return $(this).attr('name');
            }).get();

            sendFilterJSON(filterObject);
        }
    </script>

    <script>
        $(document).ready(function() {
            var exerciseList = ${exerciseList};
            document.getElementById('exerciseContainer').innerHTML = generateExerciseCards(exerciseList);
            console.log(exerciseList);
        })
    </script>

    <script>
        $(document).ready(function(){
            // Search form
            $('#search-exercise').submit(function(event) {
                event.preventDefault();

                var searchValue = $('#searchInput').val();
                if (searchValue.trim() !== '') {
                    sendFilterRequest()
                }
            });

            $('#search-exercise-button').click(function() {
                sendFilterRequest()
            });
            

            // Filter submit
            $('.submit-filter').click(function() {
                sendFilterRequest();
            });

            // Reset categories
            $('#reset-category').click(function() {
                $('.category').prop('checked', false);
                sendFilterRequest()
            });

            // Reset difficulty
            $('#reset-difficulty').click(function() {
                $('.difficulty').prop('checked', false);
                sendFilterRequest()
            });

            // Reset equipment
            $('#reset-equipment').click(function() {
                $('.equipment').prop('checked', false);
                sendFilterRequest()
            });
        });
    </script>


</body>

