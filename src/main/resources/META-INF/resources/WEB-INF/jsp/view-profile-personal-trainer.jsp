<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<body>
<div class="main-wrapper">
<div class="page-wrapper calendar_page">
        <div class="content container-fluid">
            <div class="row">
                <div class="col-xl-12 col-sm-12 col-12 mb-4">
                    <div class="breadcrumb-path">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="index.html"
                                ><img
                                        src="assets/img/dash.png"
                                        class="mr-2"
                                        alt="breadcrumb"
                                />Home</a
                                >
                            </li>
                            <li class="breadcrumb-item active">Calendar</li>
                        </ul>
                        <h3>Calendar</h3>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3 col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="calendar_head">Calendar</h2>
                        </div>
                        <div class="calendar_events">
                            <div id="calendar-events" class="mb-3">
                                <div class="ui-color-key">
                                    <div class="calendar-events" data-class="bg-info">
                                        <li style="--ui-color-key:var(--ColorSuccess)">Selected</li>
                                    </div>
                                    <div class="calendar-events" data-class="bg-success">
                                        <li style="--ui-color-key:var(--ColorError)">Sold</li>
                                    </div>
                                    <div class="calendar-events" data-class="bg-danger">
                                        <li style="--ui-color-key:var(--GrayCanvas)">Available</li>
                                    </div>
                                </div>

                            </div>
                            <div class="checkbox mb-3">
                                <input id="drop-remove" type="checkbox"/>
                                <label for="drop-remove"> Remove after drop </label>
                            </div>
                            <a
                                    href="#"
                                    data-toggle="modal"
                                    data-target="#add_new_event"
                                    class="btn mb-3 btn-primary btn-block"
                            >
                                <i class="fas fa-plus"></i> Create New
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8">
                    <div class="card bg-white">
                        <div class="card-body">
                            <div class="ageda">
                                <table>
                                    <thead>
                                    <tr>
                                        <th rowspan="2">
                                            <form id="weekForm" action="/SelectWeek" method="GET">
                                                <select id="year" class="form-control" name="y  ear"
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
                                    <form:form action="${pageContext.request.contextPath}/saveSchedule" method="post">

                                        <tbody>

                                        <c:forEach begin="1" end="8" var="slot">
                                            <tr>
                                                <td>Slot ${slot}</td>
                                                <c:forEach begin="1" end="7" var="day">
                                                    <c:set var="disabled" value="false"/>
                                                    <c:forEach items="${scheduleSlots}" var="scheduleSlot">
                                                        <c:if test="${scheduleSlot.slot == slot && scheduleSlot.day == day}">
                                                            <c:set var="disabled" value="true"/>
                                                        </c:if>
                                                    </c:forEach>
                                                    <td>
                                                        <fieldset class="ui-cinema">
                                                            <label aria-label="${slot}-${day}">
                                                                <input type="checkbox" value="${slot}-${day}"
                                                                       <c:if test="${disabled}">disabled="disabled"</c:if>
                                                                       onclick="saveCheckboxData(${slot}, ${day}, this.checked)">
                                                            </label>
                                                        </fieldset>
                                                    </td>
                                                </c:forEach>
                                            </tr>
                                        </c:forEach>

                                        <input type="hidden" id="selectedSlotsAndDays" name="selectedSlotsAndDays" value="">
                                        <button type="submit" class="btn btn-primary">Save Schedule</button>
                                        </tbody>

                                    </form:form >
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="customize_popup">
                <div
                        class="modal fade"
                        id="add_event"
                        data-backdrop="static"
                        data-keyboard="false"
                        tabindex="-1"
                        aria-labelledby="staticBackdropLabelevent"
                        aria-hidden="true"
                >
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabelevent">
                                    Add New Event
                                </h5>
                                <button
                                        type="button"
                                        class="close"
                                        data-dismiss="modal"
                                        aria-label="Close"
                                >
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="col-md-12 p-0">
                                    <div class="form-popup">
                                        <label>Event Name</label>
                                        <input type="text" placeholder="Insert Event Name"/>
                                    </div>
                                    <div class="form-popup">
                                        <label>Category Color</label>
                                        <select name="Danger">
                                            <option value="Danger">Danger</option>
                                            <option value="Success">Success</option>
                                            <option value="Warning">Warning</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-apply">Apply</button>
                                <button
                                        type="button"
                                        class="btn btn-secondary"
                                        data-dismiss="modal"
                                >
                                    Cancel
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="customize_popup">
                <div
                        class="modal fade"
                        id="my_event"
                        data-backdrop="static"
                        data-keyboard="false"
                        tabindex="-1"
                        aria-labelledby="staticBackdropLabeladd"
                        aria-hidden="true"
                >
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabeladd">
                                    Add New Event
                                </h5>
                                <button
                                        type="button"
                                        class="close"
                                        data-dismiss="modal"
                                        aria-label="Close"
                                >
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="col-md-12 p-0">
                                    <div class="form-popup">
                                        <label>Event Name</label>
                                        <input type="text" placeholder="Insert Event Name"/>
                                    </div>
                                    <div class="form-popup">
                                        <label>Category Color</label>
                                        <select name="Danger">
                                            <option value="Danger">Danger</option>
                                            <option value="Success">Success</option>
                                            <option value="Warning">Warning</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-apply">Apply</button>
                                <button
                                        type="button"
                                        class="btn btn-secondary"
                                        data-dismiss="modal"
                                >
                                    Cancel
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="customize_popup">
                <div
                        class="modal fade"
                        id="add_new_event"
                        data-backdrop="static"
                        data-keyboard="false"
                        tabindex="-1"
                        aria-labelledby="staticBackdropLabel"
                        aria-hidden="true"
                >
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">
                                    Add a category
                                </h5>
                                <button
                                        type="button"
                                        class="close"
                                        data-dismiss="modal"
                                        aria-label="Close"
                                >
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="col-md-12 p-0">
                                    <div class="form-popup">
                                        <label>Category Name</label>
                                        <input type="text" placeholder="Enter Name"/>
                                    </div>
                                    <div class="form-popup">
                                        <label>Choose Category Color</label>
                                        <select name="Success">
                                            <option value="Success">Success</option>
                                            <option value="Cancel">Danger</option>
                                            <option value="Cancel">Warning</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-apply">Apply</button>
                                <button
                                        type="button"
                                        class="btn btn-secondary"
                                        data-dismiss="modal"
                                >
                                    Cancel
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<script src="assets/js/feather.min.js"></script>

<script src="assets/js/jquery.slimscroll.min.js"></script>

<script src="assets/js/moment.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="assets/js/jquery-ui.min.js"></script>

<script src="assets/js/scriptCalander.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Sử dụng thư viện moment.js -->
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>--%>
</body>
</html>
