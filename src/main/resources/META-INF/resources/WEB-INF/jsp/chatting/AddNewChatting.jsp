<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <link href="../../assets/css/report/AddReportRadio.css" rel="stylesheet"/>
</head>
<body>

<div class="modal-header" style="background-color: #555B73;">
    <h5 class="modal-title" id="exampleModalLabel" style="color: #FFFFFF;"></h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>

<div class="modal-body">
    <button type="button" name="goal" class="btn btn-outline-primary goal-btn" style="margin-bottom: 4px;">Hello
    </button>
    <button type="button" name="goal" class="btn btn-outline-primary goal-btn" style="margin-bottom: 4px;">Good morning
    </button>
    <button type="button" name="goal" class="btn btn-outline-primary goal-btn" style="margin-bottom: 4px;">What times are open for booking?
    </button>
    <button type="button" name="goal" class="btn btn-outline-primary goal-btn" style="margin-bottom: 4px;">Can you share your schedule for booking sessions?
    </button>
    <button type="button" name="goal" class="btn btn-outline-primary goal-btn" style="margin-bottom: 4px;">How far in advance should I schedule?
    </button>
    <button type="button" name="goal" class="btn btn-outline-primary goal-btn" style="margin-bottom: 4px;">Can we discuss scheduling options?
    </button>
    <button type="button" name="goal" class="btn btn-outline-primary goal-btn" style="margin-bottom: 4px;">"Hey, good to see you!
    </button>
    <button type="button" name="goal" class="btn btn-outline-primary goal-btn" style="margin-bottom: 4px;">Hi, hope you're having a great day!
    </button>
</div>

<div class="modal-footer" style="height: fit-content; padding: 5px;">
    <div class="position-relative d-flex justify-content-between" style="width: 100%;">
        <input class="form-control" placeholder="Type a New Message"
               id="chat-input" style="width: 98%;">
        <button style="background-color: #FFFFFF; border-radius: 0; border: #FFFFFF; padding: 0 5px 0 10px;"
                id="send-button">
            <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
                 fill="#00000" class="bi bi-send-fill" viewBox="0 0 16 16">
                <path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083zm-1.833 1.89L6.637 10.07l-.215-.338a.5.5 0 0 0-.154-.154l-.338-.215 7.494-7.494 1.178-.471z"/>
            </svg>
        </button>
    </div>
</div>
</body>

<script>
    var personalTrainer = ${personaltrainer};
    $(document).ready(function () {
        $('.goal-btn').click(function () {
            var buttonContent = $(this).text();
            $('#chat-input').val(buttonContent);
        });

        $('#send-button').click(function (event) {
            event.preventDefault();
            var firstMessageContent = $('#chat-input').val();
            var receiverID = personalTrainer.id;
            $.ajax({
                type: 'GET',
                url: '/create-new-chat-box',
                data: {
                    receiverID: receiverID,
                    firstMessageContent: firstMessageContent
                },
                success: function (response) {
                     $('#chattingModal').modal('hide');
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        });
    });
</script>

