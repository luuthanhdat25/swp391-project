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


var selectedSlotsAndDays = [];

function saveCheckboxData(slot, day, isChecked) {
    var slotAndDay = slot + '-' + day;
    if (isChecked) {
        selectedSlotsAndDays.push(slotAndDay);
    } else {
        // Remove from array if unchecked
        selectedSlotsAndDays = selectedSlotsAndDays.filter(item => item !== slotAndDay);
    }

    // Update the hidden input value
    document.getElementById('selectedSlotsAndDays').value = selectedSlotsAndDays.join(',');
}

