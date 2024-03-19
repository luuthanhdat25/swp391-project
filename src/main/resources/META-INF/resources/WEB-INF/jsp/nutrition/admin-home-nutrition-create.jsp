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
                            <h3 class="page-title">Nutrition Create</h3>
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

                                        <form id="nutritionForm" action="/admin-home/manage-nutrition/create" name="nutritionForm" method="post" enctype="multipart/form-data">
                                            <div class="row mt-3">
                                                <div class="w-50 col-md-6">
                                                    <div>Nutrition Name</div>
                                                    <input required type="text" name="nutritionName" id="nutritionName" class="form-control mt-2" placeholder="Nutrition Name" />
                                                    <p id="nutritionNameError" class="text-danger mt-3"></p>
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col">
                                                    <div>Calories/100g</div>
                                                    <input required name="calories" id="caloryInput" min="0" max="1000" type="number"  class="form-control mt-2" placeholder="Number calories" />
                                                </div>
                                                <div class="col">
                                                    <div>Protein/100g</div>
                                                    <input required name="protein" id="proteinInput" min="0" max="1000" type="number"  class="form-control mt-2" placeholder="Number protein" />
                                                </div>
                                                <div class="col">
                                                    <div>Fat/100g</div>
                                                    <input required name="fat" id="fatInput" min="0" max="1000" type="number"  class="form-control mt-2" placeholder="Number fat" />
                                                </div>
                                                <div class="col">
                                                    <div>Carb/100g</div>
                                                    <input required name="carb" id="carbInput" min="0" max="1000" type="number"  class="form-control mt-2" placeholder="Number carb" />
                                                </div>
                                            </div>

                                            <div class="mt-3">
                                                <div class="mb-2">Image description</div>
                                                <p id="imageError" class="text-danger mt-3"></p>
                                                <button type="button" id="chooseImageButton" class="btn btn-warning">Choose Image</button>
                                                <br>
                                                <input type="file" id="imageInput" style="display: none;" name="image">
                                                <div class="mt-2">
                                                    <img id="previewImage"  src="#" alt="Preview" style="display: none;" class="w-50">
                                                </div>
                                            </div>


                                            <div class="mt-3">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="true" id="flexCheckDefault" name="isPrivate">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        Private
                                                    </label>
                                                </div>
                                            </div>

                                            <div id="errorMessages">
                                            </div>


                                            <div class="d-flex mt-3">
                                                <button type="submit" class="btn btn-primary me-2">Create</button>
                                                <a href="/nutrition/" class="btn btn-danger">Cancel</a>
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

<script src="../../../assets/js/exercise/create/exercise-create-image-import.js"></script>
<script src="../../../assets/js/nutrition/create/nutrition-create-submit-handler.js"></script>
<%@ include file="../common/script.jspf" %>

