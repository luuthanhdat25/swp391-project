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
                                        <input type="text" class="form-control" disabled
                                               value="${account.birthday.toString()}">
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
                                    <div class="row">

                                        <div id="calendar-events" class="col-md-6">
                                            <div class="ui-color-key">
                                                <div class="calendar-events" data-class="bg-info">
                                                    <li style="background-color: #F5556F">Conflic slot</li>
                                                </div>
                                                <div class="calendar-events" data-class="bg-success">
                                                    <li style="background-color: #93D199;">Slot Pending</li>
                                                </div>
                                                <div class="calendar-events" data-class="bg-danger">
                                                    <li style="background-color: rgb(194, 192, 192);">Ordered</li>
                                                </div>
                                                <div class="calendar-events" data-class="bg-danger">
                                                    <li style="background-color: #0BCBE3;">Slot ordering</li>
                                                </div>
                                            </div>
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
                                                       items="${['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']}">
                                                <c:set var="disabled" value="false"/>
                                                <c:set var="pending" value="false"/>
                                                <c:set var="conflic" value="false"/>
                                                <c:set var="ordering" value="false"/>
                                                <c:set var="slotContent" value=""/>
                                                <c:forEach items="${allSlots}" var="scheduleSlot">
                                                    <c:if test="${scheduleSlot.day eq day && fn:substringBefore(scheduleSlot.start_hour, ':') == hour
                                                    && fn:substringBefore(scheduleSlot.end_hour, ':') == (hour + 2)}">
                                                        <c:set var="disabled" value="true"/>
                                                        <c:set var="ordering" value="true"/>
                                                        <c:set var="slotContent" value="${scheduleSlot.getGymer().getAccount().getFullName()}"/>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${conflicSlot}" var="scheduleSlot">
                                                    <c:if test="${scheduleSlot.day eq day && fn:substringBefore(scheduleSlot.start_hour, ':') == hour
                                                     && fn:substringBefore(scheduleSlot.end_hour, ':') == (hour + 2)}">
                                                        <c:set var="disabled" value="true"/>
                                                        <c:set var="conflic" value="true"/>

                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${orderedSlot}" var="scheduleSlot">
                                                    <c:if test="${scheduleSlot.day eq day && fn:substringBefore(scheduleSlot.start_hour, ':') == hour
                                                    && fn:substringBefore(scheduleSlot.end_hour, ':') == (hour + 2)}">
                                                        <c:if test="${scheduleSlot.isPending()}">
                                                            <c:set var="pending" value="true"/>
                                                        </c:if>
                                                        <c:set var="disabled" value="true"/>
                                                        <c:set var="slotContent" value="${scheduleSlot.getGymer().getAccount().getFullName()}"/>

                                                    </c:if>
                                                </c:forEach>
                                                <c:choose>
                                                    <c:when test="${disabled}">
                                                        <td>
                                                            <input type="checkbox" name="checkedSlots"
                                                                   value="${day}-${hour}-${hour + 2}"
                                                                   id="${day.toLowerCase()}-${hour}${hour + 2}"
                                                                   onchange="limitSlots(this)"
                                                                ${disabled ? 'disabled="disabled" ' : ''}
                                                            />
                                                            <label for="${day.toLowerCase()}-${hour}${hour + 2}" style="
                                                            <c:choose>
                                                            <c:when test="${disabled && pending}">
                                                                    background-color: #93D199;
                                                            </c:when>
                                                            <c:when test="${disabled && ordering}">
                                                                    background-color: #0BCBE3;
                                                            </c:when>
                                                            <c:when test="${disabled && conflic}">
                                                                    background-color: #F5556F;
                                                            </c:when>
                                                            <c:when test="${disabled && !pending && !conflic && !ordering}">
                                                                    background-color: rgb(194, 192, 192);
                                                            </c:when>
                                                            <c:otherwise>
                                                                    /* Add any other styles you want for other cases */
                                                            </c:otherwise>
                                                                    </c:choose>"> <c:choose>
                                                                <c:when test="${disabled && pending}">
                                                                    <c:out value="${slotContent}"/>
                                                                </c:when>
                                                                <c:when test="${disabled && ordering}">
                                                                    <c:out value="${slotContent}"/>
                                                                </c:when>
                                                                <c:when test="${disabled && conflic}">
                                                                    <c:out value="${slotContent}"/>
                                                                </c:when>
                                                                <c:when test="${disabled && !pending && !conflic && !ordering}">
                                                                    <c:out value="${slotContent}"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    /* Add any other styles you want for other cases */
                                                                </c:otherwise>
                                                            </c:choose>


                                                                    </label>

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
                                <div id="conflictAlert" class="alert alert-danger" style="display:none;">
                                    <strong>Conflicting slot!</strong> There is a schedule conflict.
                                </div>
                                <c:choose>
                                    <c:when test="${empty MSG}">
                                        <!-- Display the "Accept" button only if MSG is empty -->
                                        <button type="submit" class="btn btn-primary" name="action" value="accept">
                                            Accept
                                        </button>
                                        <a href="/decline-order?orderId=${param.order_id}" class="btn btn-primary"
                                           name="action" value="decline">Decline</a>

                                    </c:when>
                                    <c:otherwise>
                                        <!-- If MSG is not empty, display the "Decline" button -->
                                        <a href="/decline-order?orderId=${param.order_id}" class="btn btn-primary"
                                           name="action" value="decline">Decline</a>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            <input type="hidden" name="MSG" value="${MSG}">


                            <input type="hidden" name="order" value="${param.order_id}">
                            <c:forEach var="slot" items="${allSlots}" varStatus="loop">
                                <input type="hidden" name="slotOrder" value="${slot.id}"/>
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
    var msgValue = "${MSG}".trim();

    if (msgValue !== "") {
        // If MSG is not empty, show the conflict alert for 2 seconds
        document.getElementById("conflictAlert").style.display = "block";
        setTimeout(function () {
            document.getElementById("conflictAlert").style.display = "none";
        }, 10000);
    }
</script>
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