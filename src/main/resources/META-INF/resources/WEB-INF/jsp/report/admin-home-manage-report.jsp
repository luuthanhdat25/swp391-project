<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-head.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
    <link href="../../assets/css/style-table.css" rel="stylesheet"/>
</head>

<div class="main-wrapper">

    <div class="page-wrapper d-flex flex-column align-items-center"
         style="width: 75%; height: fit-content; float: right; padding: 70px 0 40px 0;">

        <div class="notification-detail d-flex flex-column align-items-center">

            <div class="shadow mb-2 rounded" style="width: 94%; height: fit-content; background-color: #333B59;
                border-radius: 6px; padding: 10px; font-size: 20px; color: #FFFFFF;  text-align: center;
                margin-bottom: 0px;">
                <b>Report management</b>
            </div>

            <div class="d-flex flex-column" style="width: 94%;">
                <div class="card mb-4" style="background-color: #FFFFFF;">

                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Report table
                    </div>

                    <div class="d-flex justify-content-between align-items-center"
                         style="width: 100%; padding: 0 15px 0 15px; margin-top: 2px;">
                        <form action="manage-report" method="GET" style="width: 50%; margin-bottom: 0;">
                            <div class="input-group" style="width: 100%;">
                                <input type="text" class="form-control" style="border: 1px solid #4c4c4c;"
                                       placeholder="Enter report's reason" name="title">
                                <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </div>

                    <div class="card-body" style="width: 100%;">
                        <table id="datatablesSimple" class="table table-hover table-centered mdi-format-vertical-align-center">

                            <thead class="table-secondary">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col"></th>
                                    <th scope="col">Reason</th>
                                    <th scope="col">Reporter</th>
                                    <th scope="col">TimeStamp</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="report" items="${ReportLists.content}">
                                <tr class="shadow p-3 mb-5 bg-body rounded" style="height: 30px;">
                                    <th class="align-baseline"
                                        scope="row">${ReportLists.content.indexOf(report) + IndexStarting}</th>
                                    <td class="align-baseline">
                                        <img class="rounded-circle" style="width: 30px; height: 30px; margin-right: 5px;"
                                             src="data:image/jpeg;base64,${report.personalTrainerAccount.account.getAvatarImageAsString()}">
                                    </td>
                                    <td class="align-baseline">
                                        <div class="text-truncate" style="width: 430px; text-align: left;">${report.reason}</div>
                                    </td>
                                    <td class="align-baseline">
                                        <img class="rounded-circle" style="width: 30px; height: 30px; margin-right: 5px;"
                                             src="data:image/jpeg;base64,${report.gymerAccount.account.getAvatarImageAsString()}">
                                    </td>
                                    <td class="align-baseline">
                                            ${report.timeStamp.getHour()}:${report.timeStamp.getMinute()}
                                            ${report.timeStamp.getDayOfMonth()}/${report.timeStamp.getMonthValue()}/${report.timeStamp.getYear()}
                                    </td>
                                    <td class="align-baseline">
                                        <div class="d-flex justify-content-between" style="width: 210px; height: fit-content;">

                                            <button type="submit" class="btn btn-info view-detail-btn"
                                                    style="height: 40px; width: 90px; color: #FFFFFF;"
                                                    data-bs-toggle="modal" data-bs-target="#reportDetailModal"
                                                    data-id=${report.id}>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                                     fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                                                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                                                </svg>
                                                view
                                            </button>

                                            <form action="delete-report" method="get" style="margin-bottom: 0;">
                                                <input type="hidden" name="deleteReportDetail" value=${report.id}>
                                                <button type="submit" class="btn btn-danger"
                                                        style="height: 40px; width: 110px;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                                         fill="currentColor" class="bi bi-trash3-fill"
                                                         viewBox="0 0 16 16">
                                                        <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"/>
                                                    </svg>
                                                    remove
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <%-- Phan Trang --%>
                        <nav aria-label="Page navigation example" style="height: 20px; margin: 20px 0 20px 0;">
                            <ul class="pagination justify-content-center ">
                                <%
                                    int totalPage = (int) request.getAttribute("TotalPage");
                                    int currentPage = (int) request.getAttribute("CurrentPage");
                                %>
                                <li class="page-item <%= currentPage - 1 < 1 ? "disabled" : "" %>">
                                    <a class="page-link"
                                       href="manage-report?papeNo=<%=currentPage - 1%>&reason=${reason}">Previous</a>
                                </li>
                                <% for (int i = currentPage; i <= Math.min(totalPage, currentPage + 3); i++) { %>
                                <li class="page-item <%= i == currentPage ? "disabled" : "" %>">
                                    <a class="page-link" href="manage-report?papeNo=<%=i%>&reason=${reason}"><%=i%>
                                    </a>
                                </li>
                                <% } %>
                                <li class="page-item <%= currentPage + 1 > totalPage ? "disabled" : "" %>">
                                    <a class="page-link"
                                       href="manage-report?papeNo=<%=currentPage + 1%>&reason=${reason}">Next</a>
                                </li>
                            </ul>
                        </nav>

                    </div>

                </div>
            </div>
        </div>
    </div>

    <%---- START - MODAL: Report detail ---------------------------------------------------------------------------------------%>
    <div class="modal fade" id="reportDetailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">

               <%-- Header - Modal --%>
                <div class="modal-header" style="background-color: #555B73;">
                    <h5 class="modal-title" id="exampleModalLabel" style="color: #FFFFFF;"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <%-- Body - Modal --%>
                <div class="modal-body" style="background-color: #e6e6e6;">
                    <div class="d-flex flex-column" style="width: 100%; margin-top: 3px;">

                        <%-- Header - Body - Modal --%>
                        <div class="d-flex justify-content-between shadow mb-3 bg-body rounded" style="padding: 15px;">

                           <%-- PT_detail - Header - Body - Modal --%>
                            <div class="d-flex align-content-center" style="width: 80%;">

                                <img id="personalTrainerImage" class="rounded-circle"
                                     style="width: 110px; height: 110px; margin-right: 10px;
                                     border: 3px solid #ffe5e6; padding: 5px;" alt="Avatar"/>

                                <div class="d-flex flex-column bd-highlight mb-3 justify-content-center">
                                    <h3 id="personalTrainerName" style="display: inline-block;"></h3>
                                    <div id="reason"></div>
                                    <div class="d-flex align-items-center">
                                        <div id="reportedAt" class="text-muted" style="font-size: 14px; margin-top: 5px;"></div>
                                        <img id="gymerImage" class="rounded-circle"
                                             style="width: 25px; height: 25px; margin: 0 5px 0 5px;" alt="Avatar"/>
                                        <div class="text-muted" id="gymerName"></div>
                                    </div>
                                </div>

                            </div>

                            <%-- Buttons - Header - Body - Modal --%>
                            <div class="d-flex flex-column">

                                <form action="http://localhost:8080/admin-home/delete-report" method="get">
                                    <input type="hidden" name="deleteReportDetail" id="id">
                                    <button type="submit" class="btn btn-danger" style="margin-bottom: 5px; width: 131px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                             fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                            <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038
                                            3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5
                                            0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5
                                            8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"/>
                                        </svg>
                                        Remove
                                    </button>
                                </form>

                                <form action="http://localhost:8080/admin-home/manage-account/details" method="get">
                                    <input type="hidden" name="id" id="personalTrainerID">
                                    <button type="submit" class="btn btn-success">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                             fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                            <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                                            <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                                        </svg>
                                        View Profile
                                    </button>
                                </form>

                            </div>
                        </div>

                        <%-- Body - Body - Modal --%>
                        <div class="shadow mb-1 bg-body rounded"
                             style="padding: 25px; margin-top: 10px;" id="description"></div>
                    </div>
                </div>

                <%-- Footer - Modal --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>
    <%----END - MODAL: Report detail---------------------------------------------------------------------------------------%>
</div>


<%-----AJAX, JQUERY---------------------------------------------------------------------------------------%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="../../../assets/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
    $('.view-detail-btn').click(function () {
        var reportID = $(this).data('id');
        $.ajax({
            type: "GET",
            url: "/get-report-detail",
            data: {reportID: reportID},
            success: function (detail) {
                showModal(detail);
            },
            error: function (error) {
                console.error("Error loading notification detail: " + JSON.stringify(error));
            }
        });
    });

    function showModal(detail) {
        var formattedTime = moment(detail.timeStamp).format('HH:mm, DD/MM/YYYY');
        $('#exampleModalLabel').text(detail.personalTrainerName + "'s Report Detail");
        $('#personalTrainerImage').attr('src', 'data:image/jpeg;base64,' + detail.personalTrainerImage);
        $('#id').attr('value', detail.id);
        $('#personalTrainerID').attr('value', detail.personalTrainerID);
        $('#personalTrainerName').text(detail.personalTrainerName);
        $('#reason').text(detail.reason);
        $('#reportedAt').text('Reported at ' + formattedTime + ' by ');
        $('#gymerImage').attr('src', 'data:image/jpeg;base64,' + detail.gymerImage);
        $('#gymerName').text(detail.gymerName);
        $('#description').text(detail.description);
        $('#exampleModal').modal('show');
    }
</script>
<%@ include file="../common/script.jspf" %>
<%------------------------------------------------------------------------------------------------------------%>
