<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-head.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link href="../../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
    <link href="../../assets/css/style-table.css" rel="stylesheet"/>
</head>

<div class="main-wrapper">
    <div>
        <div class="page-wrapper d-flex flex-column align-items-center"
             style="width: 75%; height: fit-content; float: right; padding: 70px 0 40px 0;">

            <div class="notification-detail d-flex flex-column align-items-center">
                <div class="shadow mb-2 rounded" style="width: 94%; height: fit-content; background-color: #333B59;
                border-radius: 6px; padding: 10px; font-size: 20px; color: #FFFFFF;  text-align: center;
                margin-bottom: 0px;">
                    <b>Notification management</b>
                </div>
                <div class="d-flex flex-column" style="width: 94%;">
                    <div class="card mb-4" style="background-color: #FFFFFF;">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Notification table
                        </div>
                        <div class="d-flex justify-content-between align-items-center"
                             style="width: 100%; padding: 0 15px 0 15px;">
                            <form action="manage-notification" method="GET" style="width: 50%; margin-bottom: 0;">
                                <div class="input-group" style="width: 100%;">

                                    <input type="text" class="form-control" style="border: 1px solid #4c4c4c;"
                                           placeholder="Enter notification's title" name="title">
                                    <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </form>

                            <!-- Modal -->
                            <div class="modal fade" id="createNotificationModal" tabindex="-1"
                                 aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" style="max-width: 600px;">
                                    <div class="modal-content" style="background-color: #86432F;">
                                        <div class="modal-header">
                                            <h5 class="modal-title" style="color:#FFFFFF;">Creating a notification</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body" style="background-color: #e6e6e6;">
                                            <div class="d-flex">
                                                <span style="margin-right: 5px;">Title</span>
                                                <input type="text" class="form-control" id="title"
                                                       style="height: 70px;" required>
                                                <div class="invalid-feedback">Please enter title</div>
                                            </div>
                                            <div class="d-flex align-items-center mt-1 mb-1">
                                                <span style="margin-right: 5px;">URL</span>
                                                <input type="text" class="form-control" id="url">
                                            </div>
                                            <div class="d-flex mb-1 mt-3">
                                                <div style="margin-right: 5px;">Send to:</div>
                                                <div class="form-check" style="margin-right: 10px;">
                                                    <input class="form-check-input" type="checkbox" value=""
                                                           id="allGymer">
                                                    <label class="form-check-label" for="allGymer"> All gymers </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value=""
                                                           id="allPersonalTrainer">
                                                    <label class="form-check-label" for="allPersonalTrainer"> All
                                                        personal trainers </label>
                                                </div>
                                            </div>

                                            <div class="border border-2 mb-1 d-flex flex-wrap accountSelected"
                                                 style="width: 100%; height: fit-content; padding: 10px; margin-right: 5px; background-color: #FFFFFF; overflow-y: scroll;">
                                            </div>
                                            <div>
                                                <div style="width: 100%; height: 300px; background-color: #f7f7f7;"
                                                     class="border border-2">
                                                    <div class="input-group d-flex align-items-center"
                                                         style="width: 100%; height: 20%; padding: 2px; background-color: #FFFFFF;">
                                                        <input type="text" class="form-control"
                                                               style="width: 70%; margin: 5px;"
                                                               placeholder="Enter username" name="username">
                                                        <button style="width: 100px; height: 40px" type="button"
                                                                class="btn btn-success search-username-btn"
                                                                data-id=username>Search
                                                        </button>
                                                    </div>
                                                    <div class="overflow-auto accounts"
                                                         style="height: 80%; width: 100%; padding: 5px 5px 5px 5px;"></div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="modal-footer" style="background-color: #FFFFFF;">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="button" class="btn btn-primary send-notification-btn">Send
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" style="height: 50px; width: 164px; background-color: #3c763d;"
                                    class="btn btn-success" data-bs-toggle="modal"
                                    data-bs-target="#createNotificationModal">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                                     class="bi bi-plus-square-fill" viewBox="0 0 16 16">
                                    <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0"/>
                                </svg>
                                add notification
                            </button>
                        </div>
                        <div class="card-body" style="width: 100%;">
                            <table id="datatablesSimple"
                                   class="table table-hover table-centered mdi-format-vertical-align-center">
                                <thead class="table-secondary">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Recipient</th>
                                    <th scope="col">TimeStamp</th>
                                    <th scope="col">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="GroupNotificationList" items="${NotificationList.content}">
                                    <tr class="shadow p-3 mb-5 bg-body rounded" style="height: 30px;">
                                        <th scope="row"
                                            class="align-baseline">${NotificationList.content.indexOf(GroupNotificationList) + IndexStarting}</th>
                                        <td style="text-align: left;" class="align-baseline">
                                            <div class="text-truncate"
                                                 style="width: 350px;">${GroupNotificationList.title}</div>
                                        </td>
                                        <td class="align-baseline">
                                            <div class="d-flex align-baseline"
                                                 style="width: 100px; height: fit-content;">
                                                <div style="color: #ffffff00;">i</div>

                                                <c:choose>
                                                    <c:when test="${fn:length(GroupNotificationList.imageDatas) > 3}">
                                                        <c:forEach var="imageData"
                                                                   items="${GroupNotificationList.imageDatas}"
                                                                   varStatus="loop">
                                                            <c:if test="${loop.index < 3}">
                                                                <img class="rounded-circle"
                                                                     style="width: 30px; height: 30px; border: 3px solid #e4e4df;
                                                                            margin-right: -5px;"
                                                                     src="data:image/jpeg;base64,${imageData}"/>
                                                            </c:if>
                                                        </c:forEach>
                                                        <div class="rounded-circle"
                                                             style="border: 3px solid #e4e4df; padding: 1px; background-color: #FFFFFF;">
                                                            <div class="rounded-circle d-flex align-items-center justify-content-center"
                                                                 style="width: 24px; height: 24px; font-size: 10px; font-weight: bold;">
                                                                +${fn:length(GroupNotificationList.imageDatas) - 3}</div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="imageData"
                                                                   items="${GroupNotificationList.imageDatas}">
                                                            <img class="rounded-circle"
                                                                 style="width: 30px; height: 30px; border: 3px solid #e4e4df;
                                                                            margin-right: -5px;"
                                                                 src="data:image/jpeg;base64,${imageData}"/>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </td>
                                        <td class="align-baseline">
                                                ${GroupNotificationList.timeStamp.getHour()}:${GroupNotificationList.timeStamp.getMinute()}
                                                ${GroupNotificationList.timeStamp.getDayOfMonth()}/${GroupNotificationList.timeStamp.getMonthValue()}/${GroupNotificationList.timeStamp.getYear()}
                                        </td>
                                        <td class="align-baseline">
                                            <div class="d-flex justify-content-between"
                                                 style="width: 210px; height: fit-content;">

                                                <input type="hidden" name="notificationID"
                                                       value=${GroupNotificationList.groupNumber}>
                                                <button type="submit" class="btn btn-info view-detail-btn"
                                                        style="height: 40px; width: 90px; color: #FFFFFF;"
                                                        data-bs-toggle="modal" data-bs-target="#exampleModal"
                                                        data-id=${GroupNotificationList.groupNumber}>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                                         fill="currentColor" class="bi bi-eye-fill"
                                                         viewBox="0 0 16 16">
                                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                                                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                                                    </svg>
                                                    view
                                                </button>

                                                <form action="delete-notification-detail" method="get"
                                                      style="margin-bottom: 0;">
                                                    <input type="hidden" name="deleteNotificationID"
                                                           value=${GroupNotificationList.groupNumber}>
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
                            <nav aria-label="Page navigation example" style="height: 20px; margin: 0 0 20px 0;">
                                <ul class="pagination justify-content-center ">
                                    <%
                                        int totalPage = (int) request.getAttribute("TotalPage");
                                        int currentPage = (int) request.getAttribute("CurrentPage");
                                    %>
                                    <li class="page-item <%= currentPage - 1 < 1 ? "disabled" : "" %>">
                                        <a class="page-link"
                                           href="manage-notification?papeNo=<%=currentPage - 1%>&title=${title}">Previous</a>
                                    </li>
                                    <% for (int i = currentPage; i <= Math.min(totalPage, currentPage + 3); i++) { %>
                                    <li class="page-item <%= i == currentPage ? "disabled" : "" %>">
                                        <a class="page-link"
                                           href="manage-notification?papeNo=<%=i%>&title=${title}"><%=i%>
                                        </a>
                                    </li>
                                    <% } %>
                                    <li class="page-item <%= currentPage + 1 > totalPage ? "disabled" : "" %>">
                                        <a class="page-link"
                                           href="manage-notification?papeNo=<%=currentPage + 1%>&title=${title}">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
                        <div class="d-flex justify-content-between shadow mb-3 bg-body rounded" style="padding: 15px;">
                            <div class="d-flex align-content-center" style="width: 80%;">
                                <img id="avatarSender" class="rounded-circle"
                                     style="width: 110px; height: 110px; margin-right: 10px;
                                  border: 3px solid #ffe5e6; padding: 5px;" alt="Avatar"/>
                                <div class="d-flex flex-column bd-highlight mb-3 justify-content-center">
                                    <h3 id="nameSender" style="display: inline-block;"></h3>
                                    <div id="titleNotification"></div>
                                    <div id="sendAt" class="text-muted"
                                         style="font-size: 14px; margin-top: 5px;">
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex flex-column">
                                <form action="http://localhost:8080/admin-home/delete-report" method="get">
                                    <input type="hidden" name="deleteReportDetail" id="id">
                                    <button type="submit" class="btn btn-danger"
                                            style="margin-bottom: 5px; width: 131px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                             fill="currentColor" class="bi bi-trash3-fill"
                                             viewBox="0 0 16 16">
                                            <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"/>
                                        </svg>
                                        Remove
                                    </button>
                                </form>
                            </div>
                        </div>
                        <div class="shadow mb-5 bg-body rounded d-flex flex-column align-items-center"
                             style="padding: 25px; margin-top: 10px;" id="content">
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
    var userAccountsSelected = [];

    $('.send-notification-btn').click(function () {
        var title = $('#title').val().trim();
        if (title === '') {
            alert('Please enter title');
            return;
        }

        if (userAccountsSelected.length === 0 && !$('#allGymer').is(':checked') && !$('#allPersonalTrainer').is(':checked')) {
            alert('You have not selected a sender yet');
            return;
        }

        var queryString = 'title=' + encodeURIComponent($('#title').val());
        queryString += '&url=' + encodeURIComponent($('#url').val());
        queryString += '&isSendToAllGymer=' + ($('#allGymer').is(':checked') ? 'true' : 'false');
        queryString += '&isSendToAllPersonalTrainer=' + ($('#allPersonalTrainer').is(':checked') ? 'true' : 'false');
        queryString += '&userAccountsSelected=' + userAccountsSelected.join('&userAccountsSelected=');

        $.ajax({
            type: "GET",
            url: "/send-notification?" + queryString,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                console.log("Data sent successfully to the controller.");
                location.reload();
            },
            error: function (error) {
                console.error("Error sending data to the controller: " + JSON.stringify(error));
            }
        });
    })

    function createAccountElement(account) {
        var listItem = $("<div class='d-flex flex-column align-items-center'></div>");
        var accountDiv = $("<div class='d-flex justify-content-between align-items-center mb-1 bg-white shadow rounded' style='width: 98%; height: 50px; border-radius: 5px; padding: 2px;'></div>");
        var image = $("<img class='rounded-circle' style='width: 43px; height: 43px; margin-right: 10px; object-fit: cover'>");
        image.attr("src", "data:image/jpeg;base64," + account.image);

        var fullName = $("<div></div>").text(account.fullName);
        var roleBadge = $("<div class='badge badge-info m-r-5'></div>").text(account.role);
        var isAlreadySelected = userAccountsSelected.includes(account.id);
        var addButton;
        if (isAlreadySelected) {
            addButton = $("<button type='button' style='width: 40px; height: 40px; border-radius: 50%;' disabled>-</button>");
        } else {
            addButton = $("<button type='button' style='width: 40px; height: 40px; border-radius: 50%;'>+</button>");
            addButton.data("accountId", account.id);
            addButton.on("click", function () {
                var accountId = $(this).data("accountId");
                getAccountDetail(accountId);
                searchUserByName();
            });
        }

        accountDiv.append($("<div class='d-flex align-items-center'></div>").append(image).append(fullName));
        accountDiv.append($("<div></div>").append(roleBadge).append(addButton));
        listItem.append(accountDiv);
        return listItem;
    }

    function getAccountDetail(accountID) {
        $.ajax({
            type: "GET",
            url: "/get-account-detail",
            data: {accountID: accountID},
            success: function (data) {
                var accountElement = createAccountSelected(data);
                $('.accountSelected').append(accountElement);
                userAccountsSelected.push(accountID);
            },
            error: function (error) {
                console.error("Error loading account detail: " + JSON.stringify(error));
            }
        });
    }

    function createAccountSelected(data) {
        var accountDiv = $("<div style='padding: 10px; width: fit-content; height: 40px; border-radius: 5px; " +
            "background-color: #f8d794; margin: 0 5px 5px 0; white-space: nowrap;' class='d-flex justify-content-between align-items-center'></div>");
        var image = $("<img class='rounded-circle' style='width: 30px; height: 30px; margin-right: 10px; object-fit: cover'>");
        image.attr("src", "data:image/jpeg;base64," + data.image);
        var nameDiv = $("<div style='width: fit-content;'></div>").text(data.fullName);
        var closeButton = $("<button style='background: transparent; border: none; cursor: pointer;'>x</button>");

        closeButton.click(function () {
            accountDiv.remove();
            var index = userAccountsSelected.indexOf(data.id);
            if (index !== -1) {
                userAccountsSelected.splice(index, 1);
            }
            searchUserByName();
        });

        accountDiv.append(image);
        accountDiv.append(nameDiv);
        accountDiv.append(closeButton);
        return accountDiv;
    }

    function searchUserByName() {
        var name = $('input[name="username"]').val();

        $.ajax({
            type: "GET",
            url: "/search-account-by-name",
            data: {name: name},
            success: function (accounts) {
                $('.accounts').empty();

                $.each(accounts, function (index, account) {
                    var accountElement = createAccountElement(account);
                    $('.accounts').append(accountElement);
                });
            },
            error: function (error) {
                console.error("Error loading notification detail: " + JSON.stringify(error));
            }
        });
    }

    $('.search-username-btn').click(function () {
        searchUserByName();
    });

    $('.view-detail-btn').click(function () {
        var notificationID = $(this).data('id');
        $.ajax({
            type: "GET",
            url: "/get-notification-detail",
            data: {notificationID: notificationID},
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
        $('#exampleModalLabel').text("'s Notification Detail");
        $('#avatarSender').attr('src', 'data:image/jpeg;base64,' + detail.avatarSender);
        $('#id').attr('value', detail.id);
        $('#nameSender').text(detail.nameSender);
        $('#titleNotification').text(detail.title);
        $('#sendAt').text('Send at ' + formattedTime);
        $('#content').text(detail.content);
        $('#exampleModal').modal('show');
    }
</script>
<%@ include file="../common/script.jspf" %>
