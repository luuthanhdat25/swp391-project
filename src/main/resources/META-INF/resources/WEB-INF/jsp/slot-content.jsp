<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Slot Content</title>--%>
<%--</head>--%>
<%--<body>--%>
<form class="exercise-form">
    <div class="row my-2"></div> <!-- Hàng trắng phía trên -->
    <h1>Check</h1>
<%--    <c:choose>--%>
<%--        <c:when test="${response[0].check eq 'Exe'}">--%>
<%--            <c:forEach var="slotExerciseDetailDTO" items="${response}" varStatus="loop">--%>
<%--                <div class="row exercise-item mb-2"> <!-- Khoảng trống dưới mỗi hàng -->--%>
<%--                    <div class="col-lg-6 col-md-6 exercise-fields"> <!-- Thêm class để điều khiển hiển thị -->--%>
<%--                        <div class="form-group">--%>
<%--                            <label>Exercise</label> <!-- Bắt đầu của thẻ label -->--%>
<%--                            <a href="javascript:void(0);" class="add-btn me-2" onclick="addExercise()"><i class="fas fa-plus-circle"></i></a> <!-- Thêm nút thêm -->--%>
<%--                            <a href="javascript:void(0);" class="remove-btn" onclick="removeExercise()"><i class="fas fa-minus-circle"></i></a> <!-- Thêm nút xoá -->--%>
<%--                            <select class="form-control exercise-select" name="exerciseName_${loop.index}">--%>
<%--                                <option disabled selected>Choose exercise</option>--%>
<%--                                <c:forEach var="exercise" items="${slotExerciseDetailDTO.exercises}">--%>
<%--                                    <option value="${exercise.id}" <c:if test="${exercise.id eq slotExerciseDetailDTO.exerciseId}">selected</c:if>>${exercise.name}</option>--%>
<%--                                </c:forEach>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="col-lg-3 col-md-6 exercise-fields">--%>
<%--                        <div class="form-group">--%>
<%--                            <label>Set</label>--%>
<%--                            <input type="text" class="form-control exercise-set" placeholder="Enter set" name="setExe_${loop.index}" value="${slotExerciseDetailDTO.setExe}">--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="col-lg-3 col-md-6 exercise-fields">--%>
<%--                        <div class="form-group">--%>
<%--                            <label>Rep</label>--%>
<%--                            <input type="text" class="form-control exercise-rep" placeholder="Enter rep" name="rep_${loop.index}" value="${slotExerciseDetailDTO.rep}">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>
<%--            <c:forEach var="slotNutritionDetailDTO" items="${response}" varStatus="loop">--%>
<%--                <div class="row exercise-item mb-2"> <!-- Mở một hàng mới -->--%>
<%--                    <div class="col-1"></div> <!-- Khoảng trống bên trái -->--%>
<%--                    <div class="col-sm-4">--%>
<%--                        <label for="nutritionName_${loop.index}">Nutrition Name:</label>--%>
<%--                        <select id="nutritionName_${loop.index}" name="nutritionName_${loop.index}" class="form-control">--%>
<%--                            <c:forEach var="nutrition" items="${slotNutritionDetailDTO.nutritions}">--%>
<%--                                <option value="${nutrition.id}" <c:if test="${nutrition.id eq slotNutritionDetailDTO.nutritionId}">selected</c:if>>${nutrition.name}</option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </div>--%>

<%--                    <div class="col-sm-4">--%>
<%--                        <label for="amount_${loop.index}">Amount:</label>--%>
<%--                        <input type="text" id="amount_${loop.index}" name="amount_${loop.index}" class="form-control" value="${slotNutritionDetailDTO.amount}">--%>
<%--                    </div>--%>
<%--                </div> <!-- Đóng tag div của hàng -->--%>
<%--            </c:forEach>--%>
<%--        </c:otherwise>--%>
<%--    </c:choose>--%>

<%--    <div class="row mb-2">--%>
<%--        <div class="col-1"></div>--%>
<%--        <div class="col-sm-8">--%>
<%--            <label for="description">Note:</label>--%>
<%--            <textarea id="description" name="description" class="form-control">${response[0].description}</textarea>--%>
<%--        </div>--%>
<%--    </div>--%>
</form>
<%--</body>--%>
<%--</html>--%>
