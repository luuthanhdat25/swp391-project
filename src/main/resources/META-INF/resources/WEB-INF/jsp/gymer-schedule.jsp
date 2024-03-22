<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Admin Dashboard</title>
    <script>document.getElementsByTagName("html")[0].className += " js";</script>
    <link rel="shortcut icon" href="../../assets/img/favicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="../../assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/plugins/feather/feather.css">
    <link rel="stylesheet" href="../../assets/plugins/icons/flags/flags.css">
    <link rel="stylesheet" href="../../assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="../../assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="../../assets/css/style.css">
    <link rel="stylesheet" href="../../assets/css/style1.css">
    <style>
        .cd-schedule__popup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 40px; /* Thay đổi giá trị padding để làm cho khung to ra hơn */
            border: 1px solid #ccc;
            border-radius: 10px; /* Bo tròn các góc của khung */
            z-index: 1000;
            width: 100%; /* Thay đổi giá trị width để điều chỉnh kích thước của khung */
            max-width: 500px; /* Giới hạn kích thước tối đa của khung */
        }


        .cd-schedule__popup.active {
            display: block;
        }


        .cd-schedule__popup-overlay {
            /*position: fixed;*/
            /*top: 0;*/
            /*left: 0;*/
            /*width: 100%;*/
            /*height: 100%;*/
            /*!*background-color: rgba(0, 0, 0, 0.5);*!*/
            /*z-index: 999;*/
        }

        .cd-schedule__popup-overlay.active {
            display: block;
        }

        .attendant-PRESENT {
            background-color: #389444; /* Change this to the desired color for 'PRESENT' status */
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .attendant-WAITING {
            background-color: #947957; /* Change this to the desired color for 'WAITING' status */
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .attendant-ABSENT {
            background-color: #991720; /* Change this to the desired color for 'ABSENT' status */
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .hidden-column {
            display: none;
        }
    </style>
</head>
<body>

<div class="main-wrapper">
    <%@ include file="common/head.jspf" %>
    <%@ include file="common/sidebar.jspf" %>
    <div class="page-wrapper">
        <div class="content container-fluid">

            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Training schedule with my Personal Trainer</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item active">Training schedule</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <div class="schedule-selects">
                                <form action="/select-week" method="get">
                                    <div style="display: flex;">
                                        <div style="margin-right: 1%;">
                                            <select id="week" class="form-control" name="week"
                                                    onchange="this.form.submit()">
                                                <!-- Options will be generated dynamically by JavaScript -->
                                            </select>
                                        </div>
                                        <div>
                                            <select id="year" class="form-control" name="year"
                                                    onchange="updateWeeks()">
                                                <!-- Thay đổi dải số năm tùy ý -->
                                                <script>
                                                    var currentYear = new Date().getFullYear();
                                                    for (var i = currentYear; i >= currentYear - 10; i--) {
                                                        document.write("<option value='" + i + "'>" + i + "</option>");
                                                    }
                                                </script>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="cd-schedule cd-schedule--loading margin-top-lg margin-bottom-lg js-cd-schedule">
                                <div class="cd-schedule__timeline">
                                    <ul>
                                        <li><span>05:00</span></li>
                                        <li><span>06:00</span></li>
                                        <li><span>07:00</span></li>
                                        <li><span>08:00</span></li>
                                        <li><span>09:00</span></li>
                                        <li><span>10:00</span></li>
                                        <li><span>11:00</span></li>
                                        <li><span>12:00</span></li>
                                        <li><span>13:00</span></li>
                                        <li><span>14:00</span></li>
                                        <li><span>15:00</span></li>
                                        <li><span>16:00</span></li>
                                        <li><span>17:00</span></li>
                                        <li><span>18:00</span></li>
                                        <li><span>19:00</span></li>
                                        <li><span>20:00</span></li>
                                        <li><span>21:00</span></li>
                                        <li><span>22:00</span></li>
                                        <li><span>23:00</span></li>
                                    </ul>
                                </div> <!-- .cd-schedule__timeline -->

                                <div class="cd-schedule__events">
                                    <ul>
                                        <c:forEach var="date"
                                                   items="${['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']}">
                                            <li class="cd-schedule__group">
                                                <div class="cd-schedule__top-info"><span>${date}</span></div>
                                                <ul>
                                                    <c:forEach items="${slotExes}" var="slotE">
                                                        <c:if test="${slotE.day eq date}">
                                                            <li class="cd-schedule__event">
                                                                <a data-start="${slotE.start_hour}"
                                                                   data-end="${slotE.end_hour}"
                                                                   data-content="event-abs-circuit"
                                                                   data-event="event-1"
                                                                   data-slot-id="${slotE.id}"
                                                                   href="#0" style="background: #26294f;">
                                                                    <c:choose>
                                                                        <c:when test="${account.role ne 'GYMER'}">
                                                                            <em class="cd-schedule__name">
                                                                                    ${slotE.gymer.account.fullName}</em>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <em class="cd-schedule__name" style="font-size: 16px;">Training with:
                                                                                ${slotE.personalTrainer.account.fullName}</em>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <em class="cd-schedule__name attendant-${slotE.attendantStatus}">
                                                                            ${slotE.attendantStatus}
                                                                    </em>
                                                                </a>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="cd-schedule-modal">
                                    <header class="cd-schedule-modal__header">
                                        <div class="cd-schedule-modal__content">
                                            <span class="cd-schedule-modal__date"></span>
                                            <h3 class="cd-schedule-modal__name"></h3>
                                        </div>
                                        <div class="cd-schedule-modal__header-bg"></div>
                                    </header>
                                    <c:choose>
                                        <c:when test="${account.role ne 'GYMER'}">
                                            <div id="popup-form" class="cd-schedule__popup">
                                                <form id="myForm" method="post" action="/insert-exercise-detail">
                                                    <table class="table">
                                                        <thead class="thead-dark">
                                                        <tr>
                                                            <th class="hidden-column">id</th>
                                                            <th>Exercise Name</th>
                                                            <th>Set</th>
                                                            <th>Rep</th>
                                                            <th>Delete</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach var="slotDetail" items="${SlotDetail}">
                                                            <tr data-slot-id="${slotDetail.slotExercise.id}">
                                                                <td class="hidden-column"
                                                                    style="display: none">${slotDetail.id}</td>
                                                                <td>${slotDetail.exercise.name}</td>
                                                                <td>${slotDetail.setExe}</td>
                                                                <td>${slotDetail.rep}</td>
                                                                <td>
                                                                    <button type="button"
                                                                            class="btn btn-default btn-sm"
                                                                            onclick="deleteRow(this)">
                                                                        <span class="glyphicon glyphicon-minus"></span>
                                                                        <strong>-</strong>
                                                                    </button>

                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <div class="form-group">
                                                        <label for="attendantSelect">Select Attendant:</label>
                                                        <select class="form-control" id="attendantSelect"
                                                                name="attendant">
                                                            <option value="PRESENT">Present</option>
                                                            <option value="ABSENT">Absent</option>
                                                        </select>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="bank-inner-details" id="scheduleDetails">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Note</label>
                                                                        <textarea class="form-control" rows="4"
                                                                                  id="description" name="description"
                                                                                  placeholder="Enter description"></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="exerciseFieldsContainer">
                                                                <button type="button" class="btn btn-primary"
                                                                        onclick="addExerciseField()">Add
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" id="slotId" name="slotId" value="">
                                                    <!-- Hidden input to hold the JSON string of exercise data -->
                                                    <input type="hidden" id="exerciseDataInput"
                                                           name="exerciseDataInput">
                                                    <div class="modal-footer">
                                                        <div class="bank-details-btn">
                                                            <button class="btn bank-save-btn" type="submit"
                                                                    onclick="submitForm()">Save
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" value="" name="detailDeleteID"
                                                           id="detailDeleteID">

                                                    <input type="hidden" value="${param.week}" name="week" >
                                                    <input type="hidden" value="${param.year}" name="year">
                                                    <input type="hidden" id="currentURL" name="currentURL">
                                                </form>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div id="popup-form" class="cd-schedule__popup">
                                                <input type="hidden" id="slotIdl" name="slotId" value="">
                                                <table class="table">
                                                    <thead class="thead-dark">
                                                    <tr>
                                                        <th>Exercise Name</th>
                                                        <th>Set</th>
                                                        <th>Rep</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="slotDetail" items="${SlotDetail}">
                                                        <tr data-slot-id="${slotDetail.slotExercise.id}">
                                                            <td>${slotDetail.exercise.name}</td>
                                                            <td>${slotDetail.setExe}</td>
                                                            <td>${slotDetail.rep}</td>

                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </c:otherwise>
                                    </c:choose>

                                    <div id="popup-overlay" class="cd-schedule__popup-overlay"></div>


                                    <div class="cd-schedule-modal__body">
                                        <div class=" cd-schedule-modal__event-info">
                                        </div>
                                        <div class="cd-schedule-modal__body-bg"></div>
                                    </div>
                                    <a href="#0" class="cd-schedule-modal__close text-replace">Close</a>
                                </div>

                                <div class="cd-schedule__cover-layer"></div>
                            </div> <!-- .cd-schedule -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <p>Copyright © 2022 Dreamguys.</p>
        </footer>
    </div>
</div>
<script src="../../assets/js/jquery-3.6.0.min.js"></script>
<script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../assets/js/feather.min.js"></script>
<script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../../assets/plugins/apexchart/apexcharts.min.js"></script>
<script src="../../assets/plugins/apexchart/chart-data.js"></script>
<script src="../../assets/js/script.js"></script>
<script src="../../assets/js/util.js"></script>
<script src="../../assets/js/main.js"></script>
<script src="assets/js/moment.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="assets/js/jquery-ui.min.js"></script>
<script>
    var deletedSlotDetailIDs = []; // Mảng để lưu trữ các slotDetail.id bị xóa

    function deleteRow(button) {
        var row = button.closest('tr'); // Truy cập đến hàng chứa nút "minus"
        var slotDetailId = row.querySelector('td:first-child').innerText.trim(); // Lấy giá trị slotDetail.id từ cột đầu tiên

        deletedSlotDetailIDs.push(slotDetailId); // Thêm giá trị slotDetail.id vào mảng

        row.remove(); // Xóa hàng
        updateDeletedIDsInput(); // Cập nhật giá trị của input ẩn
    }

    function updateDeletedIDsInput() {
        // Cập nhật giá trị của input ẩn với các slotDetail.id bị xóa
        document.getElementById('detailDeleteID').value = deletedSlotDetailIDs.join(',');
    }
</script>
<script>
    function generateWeeks() {
        var year = $("#year").val();
        var weeks = [];
        for (var i = 1; i <= 52; i++) {
            var startOfWeek = moment().year(year).isoWeek(i).startOf('isoWeek');
            var endOfWeek = moment().year(year).isoWeek(i).endOf('isoWeek');
            var weekText = startOfWeek.format('DD/MM') + " - " + endOfWeek.format('DD/MM');
            weeks.push("<option value='" + i + "'>" + weekText + "</option>");
        }
        $("#week").html(weeks.join(""));
    }

    $(document).ready(function () {
        var currentDate = moment();

        // Set giá trị năm tương ứng với ngày hiện tại

        generateWeeks();

        // Extract week parameter from the URL and set it as the selected value
        var urlParams = new URLSearchParams(window.location.search);
        var weekParam = urlParams.get('week');

        var yearParam = urlParams.get('year');

        if (weekParam && yearParam) {
            $("#week").val(weekParam);
            $("#year").val(yearParam);
        } else {
            $("#year").val(currentDate.year);
            $("#week").val(currentDate.isoWeek());
        }

        updateTable(); // Cập nhật bảng khi trang web được tải
    });

    // Sự kiện khi thay đổi khung chọn năm
    $("#year").change(function () {
        generateWeeks();
        updateTable(); // Cập nhật bảng khi thay đổi năm
    });

    // Hàm để cập nhật bảng khi người dùng chọn tuần mới
    function updateTable() {
        updateDays();   // Cập nhật giá trị ngày của từng thứ trong tuần
        var year = $("#year").val();
        var week = $("#week").val();

        // Gửi AJAX request để load lại file với tham số tuần
        $.ajax({
            type: "POST",
            url: "/SelectWeek", // Update to the correct URL
            data: {
                week: week,
                year: year,
            },
            contentType: 'application/x-www-form-urlencoded;charset=UTF-8', // Explicitly set the content type
            success: function (response) {
                // Xử lý response, ví dụ: cập nhật nội dung trang
                // response có thể là HTML, JSON, hoặc bất kỳ định dạng dữ liệu nào khác
                console.log(response);
            },
            error: function (error) {
                console.error("Error loading file:", error);
            }
        });
    }

    // Hàm để cập nhật giá trị ngày của từng thứ trong tuần
    function updateDays() {
        var year = $("#year").val();
        var week = $("#week").val();

        if (year && week) {
            var startOfWeek = moment().year(year).isoWeek(week).startOf('isoWeek');

            // Cập nhật giá trị ngày trong từng thứ của tuần
            for (var i = 0; i <= 6; i++) {
                var day = startOfWeek.clone().add(i, 'days');
                $("#dayRow th:eq(" + i + ")").text(day.format('DD/MM'));
            }
        }
    }
</script>
<script>
    var deletedRowsData = [];
    function deleteRow(button) {
        var row = button.closest('tr');
        var rowData = {
            html: row.outerHTML, // Lưu trữ HTML của hàng
            index: Array.from(row.parentNode.children).indexOf(row) // Lưu trữ chỉ số của hàng trong danh sách
        };
        row.remove();
        deletedRowsData.push(rowData); // Thêm thông tin của hàng đã xóa vào danh sách
    }
    // Hiển thị lại các hàng đã bị xóa
    deletedRowsData.forEach(function(rowData) {
        var tbody = document.querySelector('.table tbody');
        tbody.insertAdjacentHTML('beforeend', rowData.html); // Chèn HTML của hàng vào cuối tbody
    });

    document.addEventListener("DOMContentLoaded", function () {
        var popupForm = document.getElementById("popup-form");
        var popupOverlay = document.getElementById("popup-overlay");
        var triggerElement = document.querySelectorAll(".cd-schedule__event a");

        triggerElement.forEach(function (element) {
            element.addEventListener("click", function (event) {
                event.preventDefault();

                // Get slotId from the data attribute of the clicked element
                var slotId = this.dataset.slotId;
                var hiddenInput = document.querySelector("input[name='slotId']");
                hiddenInput.value = slotId;

                // Show popup form and overlay
                popupForm.classList.add("active");
                popupOverlay.classList.add("active");

                // Filter and display Slot Details based on slotId
                var slotDetails = document.querySelectorAll("#popup-form .table tbody tr");
                slotDetails.forEach(function (detail) {
                    var detailSlotId = detail.getAttribute("data-slot-id");
                    if (detailSlotId === slotId) {
                        detail.style.display = "table-row";
                    } else {
                        detail.style.display = "none";
                    }
                });
            });
        });

        // Close popup form when clicking on overlay or close button
        popupOverlay.addEventListener("click", closePopup);
        document.getElementById("close-popup-btn").addEventListener("click", closePopup);

        function closePopup() {
            popupForm.classList.remove("active");
            popupOverlay.classList.remove("active");
        }
    });
</script>
<%--<c:forEach var="exercise" items="${exerciseList}">--%>
<%--    <option value="${exercise.id}">${exercise.name}</option>--%>
<%--</c:forEach>--%>
<script !src="">
    function addExerciseField() {
        var exerciseFieldsContainer = $('#exerciseFieldsContainer');
        var numberOfExerciseFields = exerciseFieldsContainer.children().length + 1;

        // Create new exercise field
        var newExerciseField = `
        <div class="row exerciseFields" id="exerciseFields${numberOfExerciseFields}">
            <div class="col-lg-12 col-md-12">
                <button type="button" class="btn btn-danger remove-exercise-field">Remove</button>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Exercise</label>
                    <select class="form-control" name="exerciseSelect${numberOfExerciseFields}">
                        <c:forEach var="exercise" items="${exerciseList}">
    <option value="${exercise.id}">${exercise.name}</option>
</c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="form-group">
                    <label>Set</label>
                    <input type="text" class="form-control exerciseSet" placeholder="Enter set" name="exerciseSet${numberOfExerciseFields}" required >
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="form-group">
                    <label>Rep</label>
                    <input type="text" class="form-control exerciseRep" placeholder="Enter rep" reqirename="exerciseRep${numberOfExerciseFields}" required >
                </div>
            </div>
        </div>`;
        exerciseFieldsContainer.append(newExerciseField);
        // Add click event listener to the newly created "Remove" button
        $('.remove-exercise-field').off('click').on('click', function () {
            $(this).closest('.exerciseFields').remove();
        });
    }

    function collectExerciseData() {
        var exerciseData = [];
        $('.exerciseFields').each(function () {
            var exerciseSelect = $(this).find('[name^="exerciseSelect"]').val();
            var exerciseSet = $(this).find('[name^="exerciseSet"]').val();
            var exerciseRep = $(this).find('[name^="exerciseRep"]').val();
            exerciseData.push({
                exerciseId: exerciseSelect,
                set: exerciseSet,
                rep: exerciseRep
            });
        });
        return exerciseData;
    }
    function setCurrentURL() {
        // Lấy URL hiện tại
        var currentURL = window.location.href;

        // Tìm vị trí của "http://localhost:8080" trong URL
        var index = currentURL.indexOf("http://localhost:8080");

        // Kiểm tra xem chuỗi "http://localhost:8080" có tồn tại trong URL hay không
        if (index !== -1) {
            // Trích xuất phần sau "http://localhost:8080" bao gồm "/"
            var extractedPart = currentURL.substring(index + "http://localhost:8080".length);

            // Đặt giá trị của phần URL trích xuất vào trường ẩn trong biểu mẫu
            document.getElementById("currentURL").value = extractedPart;
        }
    }
    function submitForm() {
        var description = $('#description').val();
        var slotId = $('#slotId').val();
        var exerciseData = collectExerciseData();

        // Convert exerciseData array to JSON string
        var exerciseDataJson = JSON.stringify(exerciseData);

        // Đặt URL hiện tại vào trường ẩn trong biểu mẫu
        setCurrentURL();

        // Đặt giá trị JSON của dữ liệu bài tập vào trường ẩn trong biểu mẫu
        $('#exerciseDataInput').val(exerciseDataJson);

        // Gửi biểu mẫu
        document.getElementById("myForm").submit();
    }


</script>
</body>

</html>