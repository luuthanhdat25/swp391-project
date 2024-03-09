<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    .rounded-image {
        width: 3rem;
        height: 3rem;
        border-radius: 50%;
        object-fit: cover;
    }
</style>
<body>

    <div class="main-wrapper">
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-sub-header">
                                <h3 class="page-title">Nutrition</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item "><a class="text-muted"
                                            href="teachers.html">Nutrition</a></li>
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
                                        <div class="card-body">
                                            <div class="personal-activity">
                                                <div class="mb-3 w-100 input-group">
                                                    <label for="searchInput"
                                                        class="form-label visually-hidden">Search by Name</label>
                                                    <span class="input-group-text"><i
                                                            class="fas fa-search"></i></span>
                                                    <input type="text" class="form-control" id="searchInput"
                                                        placeholder="Enter search name">
                                                </div>
                                            </div>

                                            <div class="mb-3 w-100">
                                                <div class="d-flex justify-content-between">
                                                    <div class="d-flex">
                                                        <h6>Calories</h6>
                                                    </div>
                                                    <h6 class="font-weight-light" id="calo-preview">0 - 1000/100g</h6>
                                                </div>
                                                <div class="mt-3">
                                                    <div class="sliderBar bar" id="caloProgressBar">
                                                        <div class="progressBar bar"></div>
                                                    </div>
                                                    <div class="range-input" id="caloSliderBar">
                                                        <input type="range" class="range-min" min="0" max="1000"
                                                            value="0">
                                                        <input type="range" class="range-max" min="0" max="1000"
                                                            value="1000">
                                                    </div>
                                                </div>

                                                <div class="input-group mt-3" id="caloInput">
                                                    <input id="caloMinInput" type="number" class="form-control"
                                                        placeholder="Min" value="0" min="0" max="1000">
                                                    <span class="input-group-text">-</span>
                                                    <input id="caloMaxInput" type="number" class="form-control"
                                                        placeholder="Max" value="1000" min="0" max="1000">
                                                    <button id="submitCalo" class="btn btn-primary"
                                                        type="button">></button>
                                                </div>
                                            </div>

                                            <div class="mb-3 w-100">
                                                <div class="d-flex justify-content-between">
                                                    <div class="d-flex">
                                                        <h6>Protein</h6>
                                                    </div>
                                                    <h6 class="font-weight-light" id="protein-preview">0 - 1000/100g</h6>
                                                </div>
                                                <div class="mt-3">
                                                    <div class="sliderBar bar" id="proteinProgressBar">
                                                        <div class="progressBar bar"></div>
                                                    </div>
                                                    <div class="range-input" id="proteinSliderBar">
                                                        <input type="range" class="range-min" min="0" max="1000"
                                                            value="0">
                                                        <input type="range" class="range-max" min="0" max="1000"
                                                            value="1000">
                                                    </div>
                                                </div>

                                                <div class="input-group mt-3" id="proteinInput">
                                                    <input id="proteinMinInput" type="number" class="form-control"
                                                        placeholder="Min" value="0" min="0" max="1000">
                                                    <span class="input-group-text">-</span>
                                                    <input id="proteinMaxInput" type="number" class="form-control"
                                                        placeholder="Max" value="1000" min="0" max="1000">
                                                    <button id="submitProtein" class="btn btn-primary"
                                                        type="button">></button>
                                                </div>
                                            </div>

                                            <div class="mb-3 w-100">
                                                <div class="d-flex justify-content-between">
                                                    <div class="d-flex">
                                                        <h6>Fat</h6>
                                                    </div>
                                                    <h6 class="font-weight-light" id="fat-preview">0 - 1000/100g</h6>
                                                </div>
                                                <div class="mt-3">
                                                    <div class="sliderBar bar" id="fatProgressBar">
                                                        <div class="progressBar bar"></div>
                                                    </div>
                                                    <div class="range-input" id="fatSliderBar">
                                                        <input type="range" class="range-min" min="0" max="1000"
                                                            value="0">
                                                        <input type="range" class="range-max" min="0" max="1000"
                                                            value="1000">
                                                    </div>
                                                </div>

                                                <div class="input-group mt-3" id="fatInput">
                                                    <input id="fatMinInput" type="number" class="form-control"
                                                        placeholder="Min" value="0" min="0" max="1000">
                                                    <span class="input-group-text">-</span>
                                                    <input id="fatMaxInput" type="number" class="form-control"
                                                        placeholder="Max" value="1000" min="0" max="1000">
                                                    <button id="submitFat" class="btn btn-primary"
                                                        type="button">></button>
                                                </div>
                                            </div>

                                            <div class="mb-3 w-100">
                                                <div class="d-flex justify-content-between">
                                                    <div class="d-flex">
                                                        <h6>Carb</h6>
                                                    </div>
                                                    <h6 class="font-weight-light" id="carb-preview">0 - 1000/100g</h6>
                                                </div>
                                                <div class="mt-3">
                                                    <div class="sliderBar bar" id="carbProgressBar">
                                                        <div class="progressBar bar"></div>
                                                    </div>
                                                    <div class="range-input" id="carbSliderBar">
                                                        <input type="range" class="range-min" min="0" max="1000"
                                                            value="0">
                                                        <input type="range" class="range-max" min="0" max="1000"
                                                            value="1000">
                                                    </div>
                                                </div>

                                                <div class="input-group mt-3" id="carbInput">
                                                    <input id="carbMinInput" type="number" class="form-control"
                                                        placeholder="Min" value="0" min="0" max="1000">
                                                    <span class="input-group-text">-</span>
                                                    <input id="carbMaxInput" type="number" class="form-control"
                                                        placeholder="Max" value="1000" min="0" max="1000">
                                                    <button id="submitCarb" class="btn btn-primary"
                                                        type="button">></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8 " id="personalTrainerContainer">
                                <div class="student-personals-grp">
                                    <div class="card mb-0">
                                        <div class="card-body">
                                            <div class="table-responsive">

                                                <table
                                                    class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
                                                    <thead class="student-thread">
                                                        <tr>
                                                            <th></th>
                                                            <th>Name</th>
                                                            <th>Calories</th>
                                                            <th>Protein</th>
                                                            <th>Fat</th>
                                                            <th>Carb</th>
                                                            <th>Author</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="nutritionTableBody"></tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body row">
                            <div class="col-8">
                                <img class="w-100 mb-2" style="object-fit: cover;" id="modal-image" src=""
                                    alt="Nutrition Image">
                            </div>
                            <div class="col-4">
                                <p id="modal-calo"></p>
                                <p id="modal-protein"></p>
                                <p id="modal-fat"></p>
                                <p id="modal-carb"></p>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <a id="editButton" href="" class="btn btn-primary"> <i
                                    class="far fa-edit me-2"></i>Edit</a>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <footer>
                <p>Copyright © 2024 Gym On.</p>
            </footer>
        </div>
    </div>


    <script src="../../assets/js/jquery-3.6.0.min.js"></script>

    <script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../assets/js/feather.min.js"></script>

    <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="../../assets/js/script.js"></script>

    <script>
        var nutritionList = ${ nutritionList };
        console.log(nutritionList);
    </script>

    <script src="../../assets/js/nutrition/view_list/nutrition-view-list-generate.js"></script>
    <script src="../../assets/js/nutrition/view_list/nutrition-view-list-filter.js"></script>
</body>

</html>