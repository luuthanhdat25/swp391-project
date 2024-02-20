function generateWeeks() {
    var year = $("#year").val();
    var weeks = [];

    // Tạo danh sách tuần tương ứng với năm được chọn
    for (var i = 1; i <= 52; i++) {
        var startOfWeek = moment().year(year).isoWeek(i).startOf('isoWeek');
        var endOfWeek = moment().year(year).isoWeek(i).endOf('isoWeek');
        var weekText = startOfWeek.format('DD/MM') + " - " + endOfWeek.format('DD/MM');
        weeks.push("<option value='" + i + "'>" + weekText + "</option>");
    }

    // Gán danh sách tuần vào khung chọn tuần
    $("#week").html(weeks.join(""));
}

// Sự kiện khi trang web được tải
$(document).ready(function () {
    // Lấy ngày hiện tại
    var currentDate = moment();

    // Set giá trị năm và tuần tương ứng với ngày hiện tại
    $("#year").val(currentDate.year());
    generateWeeks();
    $("#week").val(currentDate.isoWeek());

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