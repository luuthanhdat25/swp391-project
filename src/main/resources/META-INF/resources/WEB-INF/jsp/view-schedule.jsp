<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<link rel="stylesheet" href="../../../assets/css/style1.css">
<script>document.getElementsByTagName("html")[0].className += " js";</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<body>

<div class="main-wrapper">
    <%@ include file="common/head.jspf" %>
    <%@ include file="common/sidebar.jspf" %>
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">My Schedule</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item active">Schedule</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <div class="schedule-selects">
                                <form action="/selectWeek" method="get">
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
                            <div class="student-submit">
                                <button style="padding-top: 10px; padding-bottom: 10px" type="submit"
                                        class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#bank_details">Add new slot
                                </button>
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
                                                    <c:forEach items="${slotExercises}" var="slotE">
                                                        <c:if test="${slotE.day eq date}">
                                                            <li class="cd-schedule__event">
                                                                <a data-start="${slotE.start_hour}"
                                                                   data-end="${slotE.end_hour}"
                                                                   data-content="Exe${slotE.id}"
                                                                   data-event="event-1"
                                                                   href="#0">
                                                                    <em class="cd-schedule__name">Exercise</em>
                                                                </a>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:forEach items="${slotNutritions}" var="slotN">
                                                        <c:if test="${slotN.day eq date}">
                                                            <li class="cd-schedule__event">
                                                                <a data-start="${slotN.start_hour}"
                                                                   data-end="${slotN.end_hour}"
                                                                   data-content="Nut${slotN.id}"
                                                                   data-event="event-4"
                                                                   href="#0">
                                                                    <em class="cd-schedule__name">Nutrition</em>
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

                                    <div class="cd-schedule-modal__body">
                                        <div class="cd-schedule-modal__event-info"></div>
                                        <div class="cd-schedule-modal__body-bg"></div>
                                    </div>
                                    <a href="#0" class="cd-schedule-modal__close text-replace">Close</a>
                                </div>

                                <div class="cd-schedule__cover-layer"></div>

                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Recipient:</label>
                                                        <input type="text" class="form-control" id="recipient-name">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="message-text" class="col-form-label">Message:</label>
                                                        <textarea class="form-control" id="message-text"></textarea>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary">Send message</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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

    <div class="modal custom-modal fade bank-details" id="bank_details" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="form-header text-start mb-0">
                        <h4 class="mb-0">Add new slot</h4>
                    </div>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" action="/view-personal-schedule" onsubmit="return validateForm()">
                    <div class="modal-body">
                        <div class="bank-inner-details" id="scheduleDetails">
                            <div class="row">
                                <input type="hidden" value="${week}" name="week">
                                <input type="hidden" value="${year}" name="year">
                                <input type="hidden" value="${same-slot}" name="same-slot">
                                <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                        <label>Type of slot</label>
                                        <select class="form-control" name="typeOfSlot" id="typeOfSlot"
                                                onchange="showFields()">
                                            <option disabled selected>Choose type of slot</option>
                                            <option>Exercise</option>
                                            <option>Nutrition</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="form-group">
                                        <label>Day</label>
                                        <select class="form-control" name="day" id="day">
                                            <option selected disabled>Select day</option>
                                            <option>Monday</option>
                                            <option>Tuesday</option>
                                            <option>Wednesday</option>
                                            <option>Thursday</option>
                                            <option>Friday</option>
                                            <option>Saturday</option>
                                            <option>Sunday</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="form-group">
                                        <label>Slot</label>
                                        <select class="form-control" name="slot" id="slot">
                                            <option selected disabled>Select time</option>
                                            <option>05:00-07:00</option>
                                            <option>07:00-09:00</option>
                                            <option>09:00-11:00</option>
                                            <option>13:00-15:00</option>
                                            <option>15:00-17:00</option>
                                            <option>17:00-19:00</option>
                                            <option>19:00-21:00</option>
                                            <option>21:00-23:00</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                        <label>Note</label>
                                        <textarea class="form-control" rows="4" name="description" placeholder="Enter description"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 exercise-fields" style="display: none;">
                                    <div class="form-group">
                                        <label>Exercise
                                            <a href="javascript:void(0);" class="add-btn me-2" onclick="addExercise()"><i
                                                    class="fas fa-plus-circle"></i></a>
                                            <a href="javascript:void(0);" class="remove-btn" onclick="removeExercise()"><i
                                                    class="fas fa-minus-circle"></i></a>
                                        </label>
                                        <select class="form-control" name="exerciseSelect" id="exerciseSelect">
                                            <option disabled selected>Choose exercise</option>
                                            <c:forEach items="${exercises}" var="exe">
                                                <option value="${exe.id}" >${exe.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 exercise-fields" style="display: none;">
                                    <div class="form-group">
                                        <label>Set</label>
                                        <input type="text" class="form-control" placeholder="Enter set"
                                               name="exerciseSet">
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 exercise-fields" style="display: none;">
                                    <div class="form-group">
                                        <label>Rep</label>
                                        <input type="text" class="form-control" placeholder="Enter rep"
                                               name="exerciseRep">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 nutrition-fields" style="display: none;">
                                    <div class="form-group">
                                        <label>Nutrition
                                            <a href="javascript:void(0);" class="add-btn me-2" onclick="addNutritionFields()"><i
                                                    class="fas fa-plus-circle"></i></a>
                                            <a href="javascript:void(0);" class="remove-btn" onclick="removeNutritionFields()"><i
                                                    class="fas fa-minus-circle"></i></a>
                                        </label>
                                        <select class="form-control" name="nutritionSelect" id="nutritionSelect">
                                            <option disabled selected>Choose nutrition</option>
                                            <c:forEach items="${nutritions}" var="nutri">
                                                <option value="${nutri.nutritionId}">${nutri.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 nutrition-fields" style="display: none;">
                                    <div class="form-group">
                                        <label>Amount(gram)</label>
                                        <input type="text" class="form-control" placeholder="Enter amount"
                                               name="nutritionAmount">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <div class="bank-details-btn">
                            <a href="javascript:void(0);" data-bs-dismiss="modal"
                               class="btn bank-cancel-btn me-2">Cancel</a>
                            <button class="btn bank-save-btn" type="submit">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
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
    function showFields() {
        var typeOfSlot = document.getElementById("typeOfSlot").value;
        var exerciseFields = document.querySelectorAll(".exercise-fields");
        var nutritionFields = document.querySelectorAll(".nutrition-fields");

        if (typeOfSlot === "Exercise") {
            exerciseFields.forEach(function (field) {
                field.style.display = "block";
            });
            nutritionFields.forEach(function (field) {
                field.style.display = "none";
            });
        } else if (typeOfSlot === "Nutrition") {
            exerciseFields.forEach(function (field) {
                field.style.display = "none";
            });
            nutritionFields.forEach(function (field) {
                field.style.display = "block";
            });
        } else {
            exerciseFields.forEach(function (field) {
                field.style.display = "none";
            });
            nutritionFields.forEach(function (field) {
                field.style.display = "none";
            });
        }
    }
</script>

<script>
    function validateForm() {
        var typeOfSlot = document.getElementById("typeOfSlot").value;
        var day = document.getElementById("day").value;
        var slot = document.getElementById("slot").value;

        // Lấy giá trị của same-slot từ input hidden
        var sameSlotValue = document.querySelector('input[name="same-slot"]').value;

        // Kiểm tra nếu same-slot là true
        if (sameSlotValue === 'true') {
            // Hiển thị cảnh báo alert
            alert('Same time as another slot! Please choose another time!');
        }

        // Kiểm tra typeOfSlot
        if (typeOfSlot === "Choose type of slot") {
            alert("Please select slot type!");
            return false;
        }

        // Kiểm tra Day và Slot
        if (day === "Select day" ) {
            alert("Please select 1 day of the week!");
            return false;
        }

        if (slot === "Select time") {
            alert("Please choose your slot time of day!");
            return false;
        }

        if (typeOfSlot === "Exercise") {
            var exerciseSelect = document.getElementById("exerciseSelect").value;
            var exerciseSet = document.getElementsByName("exerciseSet")[0].value;
            var exerciseRep = document.getElementsByName("exerciseRep")[0].value;

            // Kiểm tra tên Exercise, Set và Rep
            if (exerciseSelect === "Choose exercise") {
                alert("Please choose 1 exercise from the list!");
                return false;
            }

            if (exerciseSet === null || exerciseSet === "") {
                alert("Please select number of sets!");
                return false;
            }

            if (exerciseRep === null || exerciseRep === "") {
                alert("Please select number of reps!");
                return false;
            }

            if (!validatePositiveInteger(exerciseSet) || !validatePositiveInteger(exerciseRep)) {
                alert("Sets and reps must be positive integers!");
                return false;
            }
        } else if (typeOfSlot === "Nutrition") {
            var nutritionSelect = document.getElementById("nutritionSelect").value;
            var nutritionAmount = document.getElementsByName("nutritionAmount")[0].value;

            // Kiểm tra tên Nutrition và Amount
            if (nutritionSelect === "Choose nutrition") {
                alert("Please choose 1 nutrition from the list!");
                return false;
            }

            if (nutritionAmount === null || nutritionAmount === "") {
                alert("Please select nutritional amount!");
                return false;
            }

            if (!validatePositiveInteger(nutritionAmount)) {
                alert("Nutritional amount must be a positive integer!");
                return false;
            }
        }

        return true;
    }

    function validatePositiveInteger(value) {
        return /^\d+$/.test(value) && parseInt(value) > 0;
    }

</script>

<script>
    function addExercise() {
        var newRow = document.createElement("div");
        newRow.classList.add("row", "exercise-fields");

        newRow.innerHTML = `
        <div class="col-lg-6 col-md-6">
            <div class="form-group">
                <select class="form-control exercise-select" name="exerciseSelect" id="exerciseSelect">
                    <option disabled selected>Choose exercise</option>
                    <c:forEach items="${exercises}" var="exe">
                        <option value="${exe.id}">${exe.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Enter set" name="exerciseSet">
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Enter rep" name="exerciseRep">
            </div>
        </div>
    `;
        document.querySelector('.bank-inner-details').appendChild(newRow);
    }

    function removeExercise() {
        // Lấy danh sách tất cả các hàng chứa cả 3 trường dữ liệu bài tập
        var exerciseRows = document.querySelectorAll('.exercise-fields');

        // Nếu chỉ còn 1 hàng(3trường), không cho phép xóa
        if (exerciseRows.length === 3) {
            alert("You need to keep at least 1 exercises for a workout slot!");
            return;
        }

        // Nếu có nhiều hơn 3 hàng, xóa hàng cuối cùng trong danh sách
        if (exerciseRows.length > 3) {
            var lastRow = exerciseRows[exerciseRows.length - 1];
            lastRow.parentNode.removeChild(lastRow);
        }
    }

    function addNutritionFields() {
        var newRow = document.createElement("div");
        newRow.classList.add("row", "nutrition-fields");

        newRow.innerHTML = `
        <div class="col-lg-6 col-md-6">
            <div class="form-group">
                <select class="form-control nutrition-select" name="nutritionSelect" id="nutritionSelect">
                    <option disabled selected>Choose nutrition</option>
                    <c:forEach items="${nutritions}" var="nutri">
                        <option value="${nutri.nutritionId}">${nutri.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-lg-6 col-md-6">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Enter amount" name="nutritionAmount">
            </div>
        </div>
    `;

        document.querySelector('.bank-inner-details').appendChild(newRow);
    }

    function removeNutritionFields() {
        // Đếm số lượng hàng hiện có
        var nutritionRows = document.querySelectorAll('.nutrition-fields');
        var rowCount = nutritionRows.length;

        // Nếu có ít hơn 1 hàng(2 trường), không cho phép xóa
        if (rowCount <= 2) {
            alert("You need to have at least 1 food in the nutrition slot");
            return;
        }

        // Xác định hàng cuối cùng và xóa nó
        var lastRow = nutritionRows[rowCount - 1];
        lastRow.parentNode.removeChild(lastRow);
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
</body>

</html>