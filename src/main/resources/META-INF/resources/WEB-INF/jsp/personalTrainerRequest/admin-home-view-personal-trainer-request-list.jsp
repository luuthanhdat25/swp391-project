<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-head.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
                <b>Personal Trainer's request management</b>
            </div>
            <div class="d-flex flex-column" style="width: 94%;">
                <div class="card mb-4" style="background-color: #FFFFFF;">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Personal Trainer's request table
                    </div>
                    <div class="d-flex justify-content-between align-items-center"
                         style="width: 100%; padding: 0 15px 0 15px; margin-top: 2px;">
                        <form action="manage-personal-trainer-request" method="GET"
                              style="width: 50%; margin-bottom: 0;">
                            <div class="input-group" style="width: 100%;">
                                <input type="text" class="form-control" style="border: 1px solid #4c4c4c;"
                                       placeholder="Enter the title of personal trainer's request" name="title">
                                <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                    <div class="card-body" style="width: 100%;">
                        <table id="datatablesSimple"
                               class="table table-hover table-centered mdi-format-vertical-align-center">
                            <thead class="table-secondary">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">title</th>
                                <th scope="col">Personal Trainer</th>
                                <th scope="col">Status</th>
                                <th scope="col">TimeStamp</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="request" items="${PersonalTrainerRequestList.content}">
                                <tr class="shadow p-3 mb-5 bg-body rounded" style="height: 30px;">
                                    <th class="align-baseline"
                                        scope="row">${PersonalTrainerRequestList.content.indexOf(request) + IndexStarting}</th>
                                    <td class="align-baseline">
                                        <div class="text-truncate"
                                             style="width: 350px; text-align: left;">${request.title}</div>
                                    </td>
                                    <td class="align-baseline">
                                        <img class="rounded-circle"
                                             style="width: 30px; height: 30px; margin-right: 5px;"
                                             src="data:image/jpeg;base64,${request.personalTrainerAccount.account.getAvatarImageAsString()}">
                                    </td>
                                    <td class="align-baseline">
                                            ${request.timeStamp.getHour()}:${request.timeStamp.getMinute()}
                                            ${request.timeStamp.getDayOfMonth()}/${request.timeStamp.getMonthValue()}/${request.timeStamp.getYear()}
                                    </td>
                                    <td class="align-baseline">
                                        <div class="badge ${request.status == 'REJECTED' ? 'badge-danger' : (request.status == 'APPROVED' ? 'badge-success' : 'badge-warning')}">${request.status}</div>
                                    </td>

                                    <td class="align-baseline">
                                        <div class="d-flex justify-content-between"
                                             style="height: fit-content;">

                                            <input type="hidden" name="requestID" value=${request.id}>
                                            <button type="submit" class="btn btn-info view-detail-btn"
                                                    style="height: 40px; width: 90px; color: #FFFFFF;"
                                                    data-bs-toggle="modal" data-bs-target="#exampleModal"
                                                    data-id=${request.id}>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                                     fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                                                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                                                </svg>
                                                view
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <nav aria-label="Page navigation example" style="height: 20px; margin: 20px 0 20px 0;">
                            <ul class="pagination justify-content-center ">
                                <%
                                    int totalPage = (int) request.getAttribute("TotalPage");
                                    int currentPage = (int) request.getAttribute("CurrentPage");
                                %>
                                <li class="page-item <%= currentPage - 1 < 1 ? "disabled" : "" %>">
                                    <a class="page-link"
                                       href="manage-personal-trainer-request?papeNo=<%=currentPage - 1%>&title=${title}">Previous</a>
                                </li>
                                <% for (int i = currentPage; i <= Math.min(totalPage, currentPage + 3); i++) { %>
                                <li class="page-item <%= i == currentPage ? "disabled" : "" %>">
                                    <a class="page-link"
                                       href="manage-personal-trainer-request?papeNo=<%=i%>&title=${title}"><%=i%>
                                    </a>
                                </li>
                                <% } %>
                                <li class="page-item <%= currentPage + 1 > totalPage ? "disabled" : "" %>">
                                    <a class="page-link"
                                       href="manage-personal-trainer-request?papeNo=<%=currentPage + 1%>&title=${title}">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #555B73;">
                    <h5 class="modal-title" id="exampleModalLabel" style="color: #FFFFFF;"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>

                <div class="modal-body" style="background-color: #e6e6e6;">
                    <div class="d-flex flex-column" style="width: 100%; margin-top: 3px;">
                        <div class="d-flex justify-content-between shadow mb-3 bg-body rounded "
                             style="padding: 15px;">
                            <div class="d-flex align-content-center" style="width: 80%;">
                                <img id="personalTrainerImage" class="rounded-circle"
                                     style="width: 110px; height: 110px; margin-right: 10px;
                                  border: 3px solid #ffe5e6; padding: 5px;" alt="Avatar"/>
                                <div class="d-flex flex-column bd-highlight mb-3 justify-content-center">
                                    <h3 id="personalTrainerName" style="display: inline-block;"></h3>
                                    <div id="title"></div>
                                    <div id="sendAt" class="text-muted"
                                         style="font-size: 14px; margin-top: 5px;">
                                    </div>
                                </div>
                            </div>
                            <div id="buttonGroup"></div>
                        </div>
                        <div class="shadow mb-5 bg-body rounded"
                             style="padding: 25px; margin-top: 10px;">${RequestDetail.content}
                            <img src="data:image/jpeg;base64,${Certificate_1}" alt="Certificate">
                            <img src="data:image/jpeg;base64,${Certificate_2}" alt="Certificate">
                            <img src="data:image/jpeg;base64,${Certificate_3}" alt="Certificate">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="../../../assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $('.view-detail-btn').click(function () {
        var requestID = $(this).data('id');
        $.ajax({
            type: "GET",
            url: "/get-personal-trainer-request-detail",
            data: {requestID: requestID},
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
        $('#exampleModalLabel').text(detail.personalTrainerName + "'s Request Detail");
        $('#personalTrainerImage').attr('src', 'data:image/jpeg;base64,' + detail.personalTrainerImage);
        $('.id').attr('value', detail.id);
        $('#personalTrainerID').attr('value', detail.personalTrainerID);
        $('#personalTrainerName').text(detail.personalTrainerName);
        $('#title').text(detail.title);
        $('#sendAt').text('Send at ' + formattedTime);
        $('#content').text(detail.content);

        var requestStatus = detail.status;
        var buttonGroup = document.getElementById("buttonGroup");

        if (requestStatus === "PENDING") {
            buttonGroup.innerHTML = `
            <div class="d-flex justify-content-between align-content-center">
                <form action="reject-personal-trainer-request" method="get">
                    <input type="hidden" name="requestID" class="id">
                    <button type="submit" class="btn btn-danger" style="margin-right: 5px; height: fit-content;">REJECT</button>
                </form>
                <form action="approve-personal-trainer-request" method="get">
                    <input type="hidden" name="requestID" class="id">
                    <button type="submit" class="btn btn-success" style="height: fit-content;">APPROVE</button>
                </form>
            </div>
        `;
        } else if (requestStatus === "REJECTED") {
             document.getElementById("buttonGroup").innerHTML = `
            <div class="badge bg-secondary" style="height: fit-content;">REJECTED</div>
        `;
        } else if (requestStatus === "APPROVED") {
            document.getElementById("buttonGroup").innerHTML = `
            <div class="badge bg-secondary" style="height: fit-content;">APPROVED</div>
        `;
        }
        $('#status').text(detail.status);
        $('#exampleModal').modal('show');
    }
</script>
<%@ include file="../common/script.jspf" %>

