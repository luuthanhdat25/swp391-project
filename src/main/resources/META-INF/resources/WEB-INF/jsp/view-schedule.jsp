<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Admin Dashboard</title>
    <script>document.getElementsByTagName("html")[0].className += " js";</script>
    <link rel="shortcut icon" href="../../assets/img/favicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&display=swap"rel="stylesheet">
    <link rel="stylesheet" href="../../assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/plugins/feather/feather.css">
    <link rel="stylesheet" href="../../assets/plugins/icons/flags/flags.css">
    <link rel="stylesheet" href="../../assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="../../assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="../../assets/css/style.css">
    <link rel="stylesheet" href="../../assets/css/style1.css">
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
                        <h3 class="page-title">My Schedule</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Booking</li>
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
                                    <select id="week" class="form-control" name="week"
                                            onchange="this.form.submit()">
                                        <!-- Options will be generated dynamically by JavaScript -->
                                    </select>
                                </form>
                            </div>
                            <div class="student-submit">
                                <button style="padding-top: 10px; padding-bottom: 10px" type="submit" class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#bank_details">Add new slot</button>
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
                                                   items="${['Monday', 'Tuesday', 'Wednesday', 'Thurday', 'Friday', 'Saturday', 'Sunday']}">
                                            <li class="cd-schedule__group">
                                                <div class="cd-schedule__top-info"><span>${date}</span></div>
                                                <ul>
                                                    <c:forEach items="${slotExercises}" var="slot">
                                                        <c:if test="${slot.day eq date}">
                                                            <li class="cd-schedule__event">
                                                                <a data-start="${slot.start_hour}"
                                                                   data-end="${slot.end_hour}"
                                                                   data-content="event-abs-circuit"
                                                                   data-event="event-1"
                                                                   href="#0">
                                                                    <em class="cd-schedule__name">Abs Circuit</em>
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
                <div class="modal-body">
                    <div class="bank-inner-details">
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="form-group">
                                    <label>Type of slot</label>
                                    <select class="form-control" id="typeOfSlot" onchange="showFields()">
                                        <option disabled selected>Choose type of slot</option>
                                        <option>Exercise</option>
                                        <option>Nutrition</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="form-group">
                                    <label>Day</label>
                                    <select class="form-control">
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
                                    <select class="form-control">
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
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 exercise-fields" style="display: none;">
                                <div class="form-group">
                                    <label>Exercise</label>
                                    <a href="javascript:void(0);" class="add-btn me-2"><i class="fas fa-plus-circle" onclick="addExercise()"></i></a>
                                    <select class="form-control">
                                        <option disabled selected>Choose exercise</option>
                                        <option>Exercise1</option>
                                        <option>Exercise2</option>
                                        <option>Exercise3</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 exercise-fields" style="display: none;">
                                <div class="form-group">
                                    <label>Set</label>
                                    <input type="text" class="form-control" placeholder="Enter set">
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 exercise-fields" style="display: none;">
                                <div class="form-group">
                                    <label>Rep</label>
                                    <input type="text" class="form-control" placeholder="Enter rep">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 nutrition-fields" style="display: none;">
                                <div class="form-group">
                                    <label>Nutrition</label>
                                    <a href="javascript:void(0);" class="add-btn me-2"><i class="fas fa-plus-circle" onclick="addNutrition()"></i></a>
                                    <select class="form-control" >
                                        <option disabled selected>Choose nutrition</option>
                                        <option>Nutrition1</option>
                                        <option>Nutrition2</option>
                                        <option>Nutrition3</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 nutrition-fields" style="display: none;">
                                <div class="form-group">
                                    <label>Amount(gram)</label>
                                    <input type="text" class="form-control" placeholder="Enter amount">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="bank-details-btn">
                        <a href="javascript:void(0);" data-bs-dismiss="modal"
                           class="btn bank-cancel-btn me-2">Cancel</a>
                        <a href="javascript:void(0);" class="btn bank-save-btn">Save Item</a>
                    </div>
                </div>
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
            exerciseFields.forEach(function(field) {
                field.style.display = "block";
            });
            nutritionFields.forEach(function(field) {
                field.style.display = "none";
            });
        } else if (typeOfSlot === "Nutrition") {
            exerciseFields.forEach(function(field) {
                field.style.display = "none";
            });
            nutritionFields.forEach(function(field) {
                field.style.display = "block";
            });
        } else {
            exerciseFields.forEach(function(field) {
                field.style.display = "none";
            });
            nutritionFields.forEach(function(field) {
                field.style.display = "none";
            });
        }
    }
</script>


<script>
    function addExercise() {
        var newRow = document.createElement("div");
        newRow.classList.add("row");

        newRow.innerHTML = `
                <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <select class="form-control">
                            <option disabled selected>Choose exercise</option>
                            <option>Exercise1</option>
                            <option>Exercise2</option>
                            <option>Exercise3</option>
                        </select>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Enter set">
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Enter rep">
                    </div>
                </div>
            `;

        document.querySelector('.bank-inner-details').appendChild(newRow);
    }
</script>

<script>
    function addNutrition() {
        var newRow = document.createElement("div");
        newRow.classList.add("row");

        newRow.innerHTML = `
            <div class="col-lg-6 col-md-6">
                <div class="form-group">
                    <select class="form-control">
                        <option disabled selected>Choose nutrition</option>
                        <option>Nutrition1</option>
                        <option>Nutrition2</option>
                        <option>Nutrition3</option>
                    </select>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Enter amount">
                </div>
            </div>
        `;

        document.querySelector('.bank-inner-details').appendChild(newRow);
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
            weeks.push("<option value='" +i+ "'>" + weekText + "</option>");
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