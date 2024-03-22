<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<body>

<div class="main-wrapper">
   <div class="page-wrapper">
        <div class="content container-fluid">

            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Book a Personal Trainer</h3>
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
                        <div class="card-header">
                            <h5 class="card-title">Request form</h5>
                        </div>
                        <div class="card-body">

                            <div class="col-md-2">

                            </div>

                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th rowspan="2">
                                        <form action="/Schedule-by-pt" method="get">
                                            <select id="year" class="form-control" name="year"
                                                    onchange="updateWeeks()">
                                                <!-- Thay đổi dải số năm tùy ý -->
                                                <script>
                                                    var currentYear = new Date().getFullYear();
                                                    for (var i = currentYear; i <= currentYear + 5; i++) {
                                                        document.write("<option value='" + i + "'>" + i + "</option>");
                                                    }
                                                </script>
                                            </select>

                                            <select id="week" class="form-control" name="week"
                                                    onchange="this.form.submit()">
                                                <!-- Options will be generated dynamically by JavaScript -->
                                            </select>
                                            <input type="hidden" name="accountId" value="${param.accountId}">
                                        </form>
                                    </th>
                                    <th align="center">Mon</th>
                                    <th align="center">Tue</th>
                                    <th align="center">Wed</th>
                                    <th align="center">Thu</th>
                                    <th align="center">Fri</th>
                                    <th align="center">Sat</th>
                                    <th align="center">Sun</th>
                                </tr>
                                <tr id="dayRow">
                                    <th align="center"></th>
                                    <th align="center"></th>
                                    <th align="center"></th>
                                    <th align="center"></th>
                                    <th align="center"></th>
                                    <th align="center"></th>
                                    <th align="center"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach begin="5" end="21" var="hour" step="2">
                                    <tr>
                                        <td style="width: 150px;" class="time-column">${hour}:00 - ${hour + 2}:00
                                        </td>
                                        <c:forEach var="day"
                                                   items="${['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']}">
                                            <c:set var="disabled" value="false"/>
                                            <c:forEach items="${allSlots}" var="scheduleSlot">
                                                <c:if test="${scheduleSlot.start_hour == hour && scheduleSlot.end_hour == hour + 2 && scheduleSlot.day eq day.toLowerCase()
                                                        }">
                                                    <c:set var="disabled" value="true"/>
                                                </c:if>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${disabled}">
                                                    <td>
                                                        <input type="checkbox" name="checkedSlots"
                                                               value="${day.toLowerCase()}-${hour}-${hour + 2}"
                                                               disabled="disabled" class="disabled-checkbox"
                                                               id="${day.toLowerCase()}-${hour}${hour + 2}">
                                                        <label for="${day.toLowerCase()}-${hour}${hour + 2}">${account.fullName}</label>
                                                    </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>
                                                    </td>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:forEach>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>Copyright  2022 Dreamguys.</p>
    </footer>
</div>

</div>
<script>
    function saveCheckedSlots() {
        var checkboxes = document.getElementsByName("checkedSlots");
        var checkedValues = [];

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                checkedValues.push(checkboxes[i].value);
            }
        }

        var jsonBody = JSON.stringify(checkedValues);

        fetch('/api/save-checked', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: jsonBody,
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // Xử lý phản hồi từ server (nếu cần)
            })
            .catch(error => console.error('Error:', error));
    }
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const selectElement = document.querySelector('.select');
        const invoiceTotalCard = document.getElementById('invoiceTotalCard');

        // Function to show or hide the invoice total card based on selected option
        function toggleInvoiceTotalCard() {
            if (selectElement.value === null || selectElement.value === "") {
                invoiceTotalCard.style.display = 'none';
            } else {
                invoiceTotalCard.style.display = 'block';
            }
        }

        // Event listener for changes in the select element
        selectElement.addEventListener('change', toggleInvoiceTotalCard);
    });
</script>


<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<script src="assets/js/feather.min.js"></script>

<script src="assets/js/ jquery.slimscroll.min.js"></script>

<script src="assets/js/moment.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="assets/js/jquery-ui.min.js"></script>
<script src="assets/js/scriptViewSchedule.js"></script>
</body>

</html>