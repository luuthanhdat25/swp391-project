<%@include file="common/header.jspf" %>
<%@ include file="common/head.jspf" %>
<%@ include file="common/sidebar.jspf" %>

<link rel="stylesheet" href="../../assets/css/styleBook.css">
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
                                <form action="/bookPT1" method="get">
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
                            </div>

                            <form:form action="${pageContext.request.contextPath}/save-checked" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h5 class="card-title">Purpose details</h5>
                                        <div class="form-group">
                                            <label>Goals:</label>
                                            <input type="text" class="form-control" name="goals">
                                        </div>
                                        <div class="form-group">
                                            <label>Description:</label>
                                            <textarea rows="5" cols="5" class="form-control"
                                                      placeholder="Details about your goals"
                                                      name="description"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Training time:</label>
                                            <select class="select" name="TrainingTime" id="trainingTimeSelect">
                                                <option selected disabled>Select Training Time</option>
                                                <option value="4">1 months</option>
                                                <option value="12">3 months</option>
                                                <option value="24">6 months</option>
                                            </select>
                                        </div>
                                        <div class="invoice-total-card" id="invoiceTotalCard" style="display: none;">
                                            <div class="invoice-total-box">
                                                <div class="invoice-total-inner">
                                                    <p>Training slot per week <span>5</span></p>
                                                    <p>Slot duration<span>2 hours</span></p>
                                                    <p>Training fee<span id="trainingFee">${personalTrainer.price}</span></p>
                                                </div>
                                                <div class="invoice-total-footer">
                                                    <h4>Total Amount <span id="totalAmountSpan">$0.00</span></h4>
                                                    <input type="hidden" id="totalPrice" name="totalPrice" value="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h5 class="card-title">Personal Trainer information</h5>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Full Name:</label>
                                                    <input type="text" placeholder="${pt.account.fullName}" readonly
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Birthday:</label>
                                                    <input type="text" placeholder="${pt.account.birthday}" readonly
                                                           class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Gender:</label>
                                                    <input type="text" placeholder="${pt.account.gender}" readonly
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Phone:</label>
                                                    <input type="text" placeholder="${pt.account.phone}" readonly
                                                           class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Email:</label>
                                                    <input type="text" placeholder="${pt.account.email}" readonly
                                                           class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Address line:</label>
                                                    <input type="text" placeholder="${pt.account.address}" readonly
                                                           class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <h5 class="card-title">Choose your training schedule</h5>
                                    <div class="col-md-2">

                                    </div>
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th rowspan="2">

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
                                                    <c:forEach items="${allSlot}" var="Slot">
                                                        <c:if test="${Slot.start_hour == hour && Slot.end_hour == hour + 2 && Slot.day eq day.toLowerCase()
                                                        && Slot.CheckPending() == false}">
                                                            <c:set var="disabled" value="true"/>
                                                        </c:if>
                                                    </c:forEach>

                                                    <td>
                                                        <input type="checkbox" name="checkedSlots"
                                                               value="${day.toLowerCase()}-${hour}-${hour + 2}"
                                                               <c:if test="${disabled}">disabled="disabled"</c:if>
                                                               id="${day.toLowerCase()}-${hour}${hour + 2}"
                                                               onchange="limitSlots(this)">
                                                        <label for="${day.toLowerCase()}-${hour}${hour + 2}"></label>
                                                    </td>
                                                </c:forEach>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="warningMessage" style="display: none; color: red;">
                                    Use just select 5 slot
                                </div>
                                <div>
                                    <button style="width: 10%;" type="submit" class="btn btn-primary"
                                            onclick="saveCheckedSlots()">Send
                                    </button>
                                </div>
                                <input type="hidden" name="year" value="${param.year}">
                                <input type="hidden" name="week" value="${param.week}">
                                <input type="hidden" name="accountId" value="${param.accountId}">
                            </form:form>
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
<script src="assets/js/scriptBook.js"></script>
</body>

</html>