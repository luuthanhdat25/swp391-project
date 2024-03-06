<div class="notification-detail">
    <div class="notification-header d-flex justify-content-between align-items-center">
        <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex justify-content-between align-items-center">
                <img class="rounded-circle" style="width: 80px;" src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"/>
                <div class="d-flex flex-column" style="margin-left: 15px; width: 640px;">
                    <div class="d-flex justify-content-between align-items-center" style="margin: 10px 0 0px 0;">
                        <h2 class="fw-bold text-primary" style="margin-bottom: 0px;"> Nguyen Thai Bao</h2>
                        <div class="d-flex justify-content-between" style="font-style: italic;">
                            <div style="margin-right: 5px;">${NotificationDetail.timeStamp.getHour()}:${NotificationDetail.timeStamp.getMinute()}</div>
                            <div>${NotificationDetail.timeStamp.getDayOfMonth()}/${NotificationDetail.timeStamp.getMonthValue()}/${NotificationDetail.timeStamp.getYear()}</div>
                        </div>
                    </div>
                    <hr style="margin: 8px 0px;">
                    <div class="fw-bold"
                         style="margin-bottom: 5px; color: #797979; font-size: math ;">${NotificationDetail.title}</div>
                </div>
            </div>
        </div>
        <form action="delete-notification-detail" method="GET">
            <input type="hidden" name="deleteNotificationID" value="${NotificationDetail.id}"/>
            <button type="submit" class="btn btn-success"
                    style="height: 50px; width: 110px; background-color: #3c763d;">
                <svg xmlns="http://www.w3.org/2000/svg" width="19" height=19 fill="currentColor" class="bi bi-trash"
                     viewBox="0 0 16 16">
                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"></path>
                    <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"></path>
                </svg>
                Remove
            </button>
        </form>
    </div>

    <div class="notification-header d-flex justify-content-between align-items-center"
         style="margin-top: 10px; padding: 50px;">
        <div class="d-flex justify-content-between align-items-center">
            <div>${NotificationDetail.content}</div>
        </div>
    </div>
</div>