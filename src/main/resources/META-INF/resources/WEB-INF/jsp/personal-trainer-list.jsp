<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<body>
    <div class="main-wrapper">
         <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-sub-header">
                                <h3 class="page-title">Personal Trainer</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item "><a class="text-muted" href="/personal-trainer">Personal Trainer</a></li>
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
                                                    <label for="searchInput" class="form-label visually-hidden">Search by Name</label>
                                                    <span class="input-group-text"><i class="fas fa-search"></i></span>
                                                    <input type="text" class="form-control" id="searchInput" placeholder="Enter search name">
                                                </div>
                                            </div>

                                            <div class="mb-3 w-100">
                                                <div class="d-flex justify-content-between">
                                                    <div class="d-flex">
                                                        <i class="far fa-money-bill-alt text-primary"></i>
                                                        <h6 class="px-2">Price</h6>
                                                    </div>
                                                    <h6 class="font-weight-light" id="price-preview">0 - 500.000đ</h6>
                                                </div>
                                                <div class="mt-3">
                                                    <div class="sliderBar bar" id="priceProgressBar">
                                                        <div class="progressBar bar"></div>
                                                    </div>
                                                    <div class="range-input" id="priceSliderBar">
                                                        <input type="range" class="range-min" id="minRange" min="0" max="500000" value="0">
                                                        <input type="range" class="range-max" min="0" max="500000" value="500000">
                                                    </div>
                                                </div>

                                                <div class="input-group mt-3" id="priceInput">
                                                    <input type="number" class="form-control" id="priceMinInput" placeholder="Min" value="0">
                                                    <span class="input-group-text">-</span>
                                                    <input type="number" class="form-control" id="priceMaxInput" placeholder="Max" value="500000">
                                                    <button id="submitPrice" class="btn btn-primary" type="button">></button>
                                                </div>
                                            </div>

                                            <div class="w-100 mt-4 mb-3" id="distanceSlider" style="display: none">
                                                <div class="d-flex justify-content-between">
                                                    <div class="d-flex">
                                                        <i class="feather-map-pin text-primary"></i>
                                                        <h6 class="px-2">Distance</h6>
                                                        <p style="font-style: italic; opacity: 0.7; font-size: 0.9rem;">- From your address</p>
                                                    </div>
                                                    <h6 class="font-weight-light" id="distance-preview">Within 100km</h6>
                                                </div>
                                                <div class="">
                                                    <div class="sliderBar bar" id="distanceProgressBar">
                                                        <div class="progressBar bar"></div>
                                                    </div>
                                                    <div class="range-input" id="distanceSliderBar">
                                                        <input type="range" class="range-max" min="0" max="100" value="100">
                                                    </div>
                                                </div>

                                                <div class="input-group mt-3" id="distanceInput">
                                                    <input type="number" class="form-control" id="distanceMaxInput" placeholder="Within" value="100">
                                                    <button id="submitDistance" class="btn btn-primary" type="button">></button>
                                                </div>
                                            </div>

                                            <div class="personal-activity">
                                                <div class="mb-3 w-100">
                                                    <label for="genderSelect" class="form-label">Gender</label>
                                                    <select class="form-select" id="genderSelect">
                                                        <option value="">Select gender</option>
                                                        <option value="male">Male</option>
                                                        <option value="female">Female</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8 " id="personalTrainerContainer">

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer>
            </footer>
        </div>
    </div>


    <script src="../../assets/js/jquery-3.6.0.min.js"></script>

    <script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../assets/js/feather.min.js"></script>

    <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="../../assets/js/script.js"></script>

    <script>
        var personalTrainerList = ${personalTrainerList};
        var role = "${account.getRole().getLabel()}";
        console.log(personalTrainerList)
        if(role) {
            $(document).ready(function(){
                if(role === "Gymer") {
                    $("#distanceSlider").show(); // If the role is Gymer, show the distanceSlider
                } else {
                    $("#distanceSlider").hide(); // Otherwise, hide it
                }
            });
        }
    </script>

    <script src="../../assets/js/personal-trainer/personal-trainer-list-generate.js"></script>
    <script src="../../assets/js/personal-trainer/personal-trainer-distance-slider.js"></script>
    <script src="../../assets/js/personal-trainer/personal-trainer-price-slider.js"></script>
    <script src="../../assets/js/personal-trainer/personal-trainer-list-search-handler.js"></script>
</body>

</html>