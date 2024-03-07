<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                            <%--                            <form:form action="${pageContext.request.contextPath}/save-checked" method="post">--%>

                            <div class="row">
                                <div class="col-md-6">


                                    <form:form action="${pageContext.request.contextPath}/accept-order" method="post">
                                    <h5 class="card-title">Purpose details</h5>
                                        <div class="form-group">
                                            <label>Gymer Name:</label>
                                            <input type="text" class="form-control" disabled value="${account.fullName}">
                                        </div>
                                        <div class="form-group">
                                            <label>Email:</label>
                                            <input type="text" class="form-control" disabled value="${account.email}">
                                        </div>
                                        <div class="form-group">
                                            <label>BirthDay:</label>
                                            <input type="text" class="form-control" disabled value="${account.birthday.toString()}">
                                        </div>
                                        <div class="form-group">
                                            <label>Address:</label>
                                            <input type="text" class="form-control" disabled value="${account.address}">
                                        </div>

                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Height:</label>
                                                <input type="text" placeholder="${gymer.height}" readonly
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Weight:</label>
                                                <input type="text" placeholder="${gymer.weight}" readonly
                                                       class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Start Date:</label>
                                                <input type="text" placeholder="${DateStart}" readonly
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>End Date:</label>
                                                <input type="text" placeholder="${DateEnd}" readonly
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Total money:</label>
                                            <input type="text" placeholder="${orderRequest.total_of_money}" readonly
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <h5 class="card-title">Choose your training schedule</h5>
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
                                                            <!-- Nội dung khi không thỏa mãn điều kiện -->
                                                        </td>
                                                    </c:otherwise>
                                                </c:choose>

                                            </c:forEach>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>



                            <div>
                                <button type="submit" class="btn btn-primary">Accept

                                </button>
                                <a href="/decline-order?orderId=${param.order_id}" class="btn btn-primary">Decline</a>
                            </div>
                                <input type="hidden" name="MSG" value="${MSG}">
                                ${MSG}
                                <input type="hidden" name="order" value="${param.order_id}">
                                <c:forEach var="slot" items="${allSlots}" varStatus="loop">
                                    <input type="hidden" name="slotOrder" value="${slot.id}" />
                                </c:forEach>

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
<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<script src="assets/js/feather.min.js"></script>

<script src="assets/js/jquery.slimscroll.min.js"></script>

<script src="assets/js/moment.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="assets/js/jquery-ui.min.js"></script>
<script src="assets/js/scriptBook.js"></script>
</body>

</html>