function generateWeeks() {
    var year = parseInt($("#year").val());
    var currentDate = moment();
    var weeks = [];

    for (var i = 1; i <= 52; i++) {
        var startOfWeek = moment().year(year).isoWeek(i).startOf('isoWeek');
        var endOfWeek = moment().year(year).isoWeek(i).endOf('isoWeek');
        var weekText = startOfWeek.format('DD/MM') + " - " + endOfWeek.format('DD/MM');

        if ((year === currentDate.year() && i >= currentDate.isoWeek()) || year > currentDate.year()) {
            // Include only future weeks for the current year and all weeks for future years
            weeks.push("<option value='" + i + "'>" + weekText + "</option>");
        }
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
    var accountIdParam = urlParams.get('accountId');
    if (weekParam && yearParam) {
        $("#week").val(weekParam);
        $("#year").val(yearParam);
    } else {
        $("#year").val(currentDate.year);
        $("#week").val(currentDate.isoWeek());
    }
    $("#accountId").val(accountIdParam);
    updateTable(); // Cập nhật bảng khi trang web được tải
});

// Sự kiện khi thay đổi khung chọn năm
$("#year").change(function () {
    generateWeeks();
    // Do not submit the form when changing the year
    updateTable(); // Cập nhật bảng khi thay đổi năm
});

// Hàm để cập nhật bảng khi người dùng chọn tuần mới
$("#week").change(function () {
    updateTable(); // Cập nhật bảng khi thay đổi tuần
});

// Hàm để cập nhật bảng khi người dùng chọn tuần mới
function updateTable() {
    updateDays();   // Cập nhật giá trị ngày của từng thứ trong tuần
    var year = $("#year").val();
    var week = $("#week").val();
    var accountId = $("#accountId").val();
    //
    // // Update the URL parameters without triggering a page reload
    //
    // Gửi AJAX request để load lại file với tham số tuần
    $.ajax({
        type: "POST",
        url: "/bookPT1", // Update to the correct URL
        data: {
            week: week,
            year: year,
            accountId: accountId
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
$(document).ready(function () {
    // Event handler for the Training Time select change
    $('#trainingTimeSelect').change(function () {
        // Get selected training time value
        var trainingTime = parseInt($(this).val());

        // Get the Training fee from the hidden input field
        var trainingFee = parseInt($('#trainingFee').text()); // Extract the value from the span

        // Get the Training slot per week
        var trainingSlotPerWeek = 5; // Change this value as needed

        // Calculate total amount based on the selected training time
        var totalAmount;
        if (trainingTime === 1) {
            totalAmount = trainingFee * trainingSlotPerWeek * 4;
        } else if (trainingTime === 2) {
            totalAmount = trainingFee * trainingSlotPerWeek * 3 * 4;
        } else if (trainingTime === 3) {
            totalAmount = trainingFee * trainingSlotPerWeek * 6 * 4;
        } else {
            // Handle invalid or default case
            totalAmount = 0;
        }

        // Update the Total Amount span
        $('#totalAmountSpan').text('$' + totalAmount.toFixed(2)); // Format as currency
        $('#totalPrice').val(totalAmount.toFixed(2));
    });
});

var selectedSlots = 0;

function limitSlots(checkbox) {
    if (checkbox.checked) {
        if (selectedSlots >= 5) {
            document.getElementById("warningMessage").style.display = "block";
            checkbox.checked = false;
        } else {
            selectedSlots++;
        }
    } else {
        selectedSlots--;
        document.getElementById("warningMessage").style.display = "none";
    }
}
