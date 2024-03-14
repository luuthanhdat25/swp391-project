<%@ include file="common/header.jspf" %>
<%@ include file="common/admin-head.jspf" %>
<%@ include file="common/admin-sidebar.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .img-thumbnail {
        width: 50px; /* Đặt kích thước của hình ảnh */
        height: 50px;
        border-radius: 50%; /* Làm cho hình ảnh tròn */
    }

</style>

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
                                                <input type="text" class="form-control" name="title"
                                                       style="height: 70px;">
                                            </div>
                                            <div class="d-flex align-items-center mt-1 mb-1">
                                                <span style="margin-right: 5px;">URL</span>
                                                <input type="text" class="form-control" name="title">
                                            </div>
                                            <div class="d-flex mb-1 mt-3">
                                                <div style="margin-right: 5px;">Send to:</div>
                                                <div class="form-check" style="margin-right: 10px;">
                                                    <input class="form-check-input" type="checkbox" value="" >
                                                    <label class="form-check-label" for="flexCheckIndeterminate"> All gymers  </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckIndeterminate">
                                                    <label class="form-check-label" for="flexCheckIndeterminate"> All personal trainers </label>
                                                </div>
                                            </div>

                                            <div class="border border-2 mb-1"
                                                 style="width: 100%; height: 42px; margin-right: 5px; background-color: #FFFFFF; "></div>

                                            <div>
                                                <div style="width: 100%; height: 300px; background-color: #f7f7f7;"
                                                     class="border border-2">
                                                    <div class="input-group d-flex align-items-center"
                                                         style="width: 100%; height: 20%; padding: 2px; background-color: #FFFFFF;">
                                                        <input type="text" class="form-control"
                                                               style="width: 70%; margin: 5px;"
                                                               placeholder="Enter username" name="username">
                                                        <button style="width: 100px; height: 40px" type="button"
                                                                class="btn btn-success">Search
                                                        </button>
                                                    </div>
                                                    <div class="overflow-auto"
                                                         style="height: 80%; width: 100%; padding: 5px 5px 5px 5px;">
                                                        <div class="d-flex flex-column align-items-center">
                                                            <div style="width: 98%; height: 50px; border-radius: 5px; padding: 2px;"
                                                                 class="d-flex justify-content-between align-items-center mb-1 bg-white shadow rounded">
                                                                <div class="d-flex align-items-center">
                                                                    <img class="rounded-circle"
                                                                         style="width: 43px; height: 43px; margin-right: 5px;"
                                                                         src="https://avatars2.githubusercontent.com/u/38502132?v=4?s=100">
                                                                    Victor Dave
                                                                </div>
                                                                <div>
                                                                    <div class="badge badge-info m-r-5">Gymer</div>
                                                                    <button type="button"
                                                                            style="width: 40px; height: 40px; border-radius: 50%;">
                                                                        +
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex flex-column align-items-center">
                                                            <div style="width: 98%; height: 50px; border-radius: 5px; padding: 2px;"
                                                                 class="d-flex justify-content-between align-items-center mb-1 bg-white shadow rounded">
                                                                <div class="d-flex align-items-center">
                                                                    <img class="rounded-circle"
                                                                         style="width: 43px; height: 43px; margin-right: 5px;"
                                                                         src="https://avatars2.githubusercontent.com/u/38502132?v=4?s=100">
                                                                    Victor Dave
                                                                </div>
                                                                <div>
                                                                    <div class="badge badge-info m-r-5">Gymer</div>
                                                                    <button type="button"
                                                                            style="width: 40px; height: 40px; border-radius: 50%;">
                                                                        +
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex flex-column align-items-center">
                                                            <div style="width: 98%; height: 50px; border-radius: 5px; padding: 2px;"
                                                                 class="d-flex justify-content-between align-items-center mb-1 bg-white shadow rounded">
                                                                <div class="d-flex align-items-center">
                                                                    <img class="rounded-circle"
                                                                         style="width: 43px; height: 43px; margin-right: 5px;"
                                                                         src="https://avatars2.githubusercontent.com/u/38502132?v=4?s=100">
                                                                    Victor Dave
                                                                </div>
                                                                <div>
                                                                    <div class="badge badge-info m-r-5">Gymer</div>
                                                                    <button type="button"
                                                                            style="width: 40px; height: 40px; border-radius: 50%;">
                                                                        +
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex flex-column align-items-center">
                                                            <div style="width: 98%; height: 50px; border-radius: 5px; padding: 2px;"
                                                                 class="d-flex justify-content-between align-items-center mb-1 bg-white shadow rounded">
                                                                <div class="d-flex align-items-center">
                                                                    <img class="rounded-circle"
                                                                         style="width: 43px; height: 43px; margin-right: 5px;"
                                                                         src="https://avatars2.githubusercontent.com/u/38502132?v=4?s=100">
                                                                    Victor Dave
                                                                </div>
                                                                <div>
                                                                    <div class="badge badge-info m-r-5">Gymer</div>
                                                                    <button type="button"
                                                                            style="width: 40px; height: 40px; border-radius: 50%;">
                                                                        +
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex flex-column align-items-center">
                                                            <div style="width: 98%; height: 50px; border-radius: 5px; padding: 2px;"
                                                                 class="d-flex justify-content-between align-items-center mb-1 bg-white shadow rounded">
                                                                <div class="d-flex align-items-center">
                                                                    <img class="rounded-circle"
                                                                         style="width: 43px; height: 43px; margin-right: 5px;"
                                                                         src="https://avatars2.githubusercontent.com/u/38502132?v=4?s=100">
                                                                    Victor Dave
                                                                </div>
                                                                <div>
                                                                    <div class="badge badge-info m-r-5">Gymer</div>
                                                                    <button type="button"
                                                                            style="width: 40px; height: 40px; border-radius: 50%;">
                                                                        +
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex flex-column align-items-center">
                                                            <div style="width: 98%; height: 50px; border-radius: 5px; padding: 2px;"
                                                                 class="d-flex justify-content-between align-items-center mb-1 bg-white shadow rounded">
                                                                <div class="d-flex align-items-center">
                                                                    <img class="rounded-circle"
                                                                         style="width: 43px; height: 43px; margin-right: 5px;"
                                                                         src="https://avatars2.githubusercontent.com/u/38502132?v=4?s=100">
                                                                    Victor Dave
                                                                </div>
                                                                <div>
                                                                    <div class="badge badge-info m-r-5">Gymer</div>
                                                                    <button type="button"
                                                                            style="width: 40px; height: 40px; border-radius: 50%;">
                                                                        +
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex flex-column align-items-center">
                                                            <div style="width: 98%; height: 50px; border-radius: 5px; padding: 2px;"
                                                                 class="d-flex justify-content-between align-items-center mb-1 bg-white shadow rounded">
                                                                <div class="d-flex align-items-center">
                                                                    <img class="rounded-circle"
                                                                         style="width: 43px; height: 43px; margin-right: 5px;"
                                                                         src="https://avatars2.githubusercontent.com/u/38502132?v=4?s=100">
                                                                    Victor Dave
                                                                </div>
                                                                <div>
                                                                    <div class="badge badge-info m-r-5">Gymer</div>
                                                                    <button type="button"
                                                                            style="width: 40px; height: 40px; border-radius: 50%;">
                                                                        +
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="modal-footer" style="background-color: #FFFFFF;">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="button" class="btn btn-primary">Send</button>
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

                                    <th style="text-align: left">Name</th>
                                    <th style="text-align: center">Email</th>
                                    <th style="text-align: center">Phone</th>
                                    <th style="text-align: center">Role</th>
                                    <th style="text-align: center">Ban Status</th>
                                    <th style="text-align: center">Action </th>

                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="account" items="${account}">
                                    <tr>
                                        <td style="text-align: left;"><img class="img-thumbnail" src="data:image/png;base64,${account.getAvatarImageAsString()}" alt="Customer image Image">
                                                ${account.fullName} </td>
                                        <td>${account.email}</td>
                                        <td>${account.phone}</td>
                                        <td>${account.role}</td>
                                        <td><div class="badge ${account.isBan ? 'badge-danger' : 'badge-success'}">${account.isBan ? 'Banned' : 'Unbanned'}</div>
                                        </td>
                                        <td><a href="#" class="view"
                                               title="View Details" data-toggle="tooltip"><i class="fas fa-book" style='font-size:24px'></td>
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
                                    <div id="title"></div>
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
        $('#title').text(detail.title);
        $('#sendAt').text('Send at ' + formattedTime);
        $('#content').text(detail.content);
        $('#exampleModal').modal('show');
    }
</script>
<%@ include file="common/script.jspf" %>
