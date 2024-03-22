<%@ include file="../common/header.jspf" %>
<%@ include file="../common/head.jspf" %>
<%@ include file="../common/sidebar.jspf" %>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>

<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="card">
            <div class="row">

                <div class="col-xxl-4 col-xl-5 border-end">
                    <div class="chat-window">
                        <div class="px-4 pt-3 pb-4">
                            <h1 class="mb-0 h3">Chat</h1>
                            <div class="mt-1 mb-1">
                                <input type="search" class="form-control" id="search-input"
                                       placeholder="Search people, group and messages">
                            </div>
                        </div>
                        <div style="height: 550px; overflow:auto">
                            <ul id="chatBoxList"></ul>
                        </div>
                    </div>
                </div>

                <div class="col-xxl-8 col-xl-7">
                    <!-- chat list -->
                    <div class="chat-body w-100 h-100">
                        <div class="card-header sticky-top  ">

                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                    <div class="avatar">
                                        <img src="https://th.bing.com/th/id/R.b6f68cc0add0b85c614d88383d234d54?rik=FqGw3PQI9rx4zQ&pid=ImgRaw&r=0"
                                             alt="Image" class="rounded-circle" id="AvatarSender">
                                    </div>
                                    <div class=" ms-2">
                                        <h4 class="mb-0" id="NameSender">Sharad Mishra</h4>
                                    </div>
                                </div>
                                <div></div>
                            </div>

                            <div class="card-body" id="conversation-list" data-simplebar="init"
                                 style="height: 550px; overflow:auto">
                                <div class="simplebar-wrapper" style="margin: -20px;">
                                    <div class="simplebar-height-auto-observer-wrapper">
                                        <div class="simplebar-height-auto-observer"></div>
                                    </div>
                                    <div class="simplebar-mask">
                                        <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                            <div class="simplebar-content-wrapper" tabindex="0" role="region"
                                                 aria-label="" style="height: fit-content;">
                                                <div class="simplebar-content" style="padding: 20px;" id="messageList">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="simplebar-placeholder"
                                         style="width: auto; height: 200px;"></div>
                                </div>
                            </div>

                            <form>
                                <div class="position-relative d-flex justify-content-between">
                                    <input class="form-control" placeholder="Type a New Message"
                                           id="chat-input">
                                    <button style="background-color: #FFFFFF; border-radius: 0; border: #FFFFFF; padding: 0 10px 0 10px;"
                                            id="send-button">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
                                             fill="#00000" class="bi bi-send-fill" viewBox="0 0 16 16">
                                            <path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083zm-1.833 1.89L6.637 10.07l-.215-.338a.5.5 0 0 0-.154-.154l-.338-.215 7.494-7.494 1.178-.471z"/>
                                        </svg>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/script.jspf" %>
<script src="../../../assets/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<script>
    var chatBoxSelected;
    var nameSender;
    var avatarSender;

    $(document).ready(function () {
        retrieveChatBoxList();
    });

    function retrieveMessageList(chatBoxID) {
        $.ajax({
            url: '/View-message-list',
            type: 'GET',
            data: {chatBoxID: chatBoxID},
            success: function (response) {
                $('#messageList').empty();
                chatBoxSelected = chatBoxID;
                $('#NameSender').text(nameSender);
                $('#AvatarSender').attr('src', 'data:image/jpeg;base64, ' + avatarSender);
                $.each(response, function (index, message) {
                    var messageItem = $('<div>').addClass('d-flex mb-4 w-lg-40');
                    if (message.isCurrentUserMessage === 1) {
                        messageItem.addClass('justify-content-end');
                    }
                    var formattedTime = moment(message.timeStamp).format('HH:mm, DD/MM/YYYY');

                    if (message.isCurrentUserMessage === 0) {
                        var avatarImg = $('<img>').attr('src', 'data:image/jpeg;base64, ' + message.senderImage)
                            .attr('alt', 'Image')
                            .addClass('rounded-circle')
                            .css({'width': '40px', 'height': '40px'});

                        var messageContent = $('<div>').addClass('ms-3');
                        var usernameSmall = $('<small>').html('<span class="username">' + message.senderName + '</span>, ' + formattedTime);
                        var messageBody = $('<div>').addClass('d-flex flex-column');
                        var messageBubble = $('<div>').addClass('mt-2 rounded-top-md-left-0')
                            .html('<div class="p-3" style="background-color: #fff9ed;">' +
                                '<p class="mb-0">' + message.content + '</p>' +
                                '</div>');

                        messageItem.append(avatarImg);
                        messageItem.append(messageContent.append(messageBody));
                        messageItem.append(messageBody.append(usernameSmall).append(messageBubble));
                    } else {
                        var avatarImg = $('<img>').attr('src', 'data:image/jpeg;base64, ' + message.senderImage)
                            .attr('alt', 'Image')
                            .addClass('rounded-circle')
                            .css({'width': '40px', 'height': '40px', 'margin-left': '10px'});

                        var messageContent = $('<div>').addClass('ms-3', 'text-end');
                        var usernameSmall = $('<small>').html('<span class="username">' + message.senderName + '</span>, ' + formattedTime);
                        var messageBody = $('<div>').addClass('d-flex flex-column align-items-end');
                        var messageBubble = $('<div>').addClass('mt-2 rounded-top-md-end-0')
                            .html('<div class="p-3" style="background-color: #d2efff;">' +
                                '<p class="mb-0">' + message.content + '</p>' +
                                '</div>');

                        messageItem.append(messageContent.append(messageBody));
                        messageItem.append(messageBody.append(usernameSmall).append(messageBubble));
                        messageItem.append(avatarImg);
                    }
                    $('#messageList').append(messageItem);
                });
            },
            error: function (xhr, status, error) {
                console.error('ERROR: ' + error);
            }
        });
    }

    function retrieveChatBoxList() {
        var username = $('#search-input').val();
        $.ajax({
            url: "/View-box-chat-list",
            type: "GET",
            data: {username: username},
            dataType: "json",
            success: function (data) {
                var chatBoxList = $('#chatBoxList');
                chatBoxList.empty();
                $.each(data, function (index, chatBox) {
                    var formattedTime = moment(chatBox.lastTimeStamp).format('HH:mm, DD/MM/YYYY');
                    var listItem = $('<li>').addClass('py-1 px-1 chat-item contacts-link');
                    var itemContent = $('<div>').addClass('d-flex justify-content-between align-items-center');
                    var anchorTag = $('<a>').addClass('text-inherit').attr('href', '')
                        .css({
                            'box-shadow': '0 0 5px rgba(0, 0, 0, 0.25)',
                            'border-radius': '10px',
                            'width': '100%',
                            'padding': '10px'
                        }).attr('data-id', chatBox.id);
                    anchorTag.on('click', function (event) {
                        event.preventDefault();
                        var chatBoxID = $(this).data('id');
                        nameSender = chatBox.nameSender;
                        avatarSender = chatBox.avatarSender;
                        retrieveMessageList(chatBoxID)
                    });

                    var innerDiv = $('<div>').addClass('d-flex');
                    var avatarDiv = $('<div>').addClass('avatar').css('margin-right', '10px');
                    var img = $('<img>').attr('src', 'data:image/jpeg;base64, ' + chatBox.avatarSender).attr('alt', 'Image').addClass('rounded-circle');
                    var contentDiv = $('<div>').css('width', '90%');
                    var headerDiv = $('<div>').addClass('d-flex justify-content-between').css({
                        'width': '100%',
                        'margin-bottom': '4px'
                    });
                    var nameHeader = $('<h6>').addClass('mb-0').text(chatBox.nameSender);
                    var timeStampSmall = $('<small>').addClass('text-muted').text(formattedTime);
                    var messageParagraph = $('<p>').addClass('mb-0 text-muted text-truncate').css('max-width', '250px').text(chatBox.lastContent);

                    avatarDiv.append(img);
                    innerDiv.append(avatarDiv);
                    headerDiv.append(nameHeader);
                    headerDiv.append(timeStampSmall);
                    contentDiv.append(headerDiv);
                    contentDiv.append(messageParagraph);
                    innerDiv.append(contentDiv);
                    anchorTag.append(innerDiv);
                    itemContent.append(anchorTag);
                    listItem.append(itemContent);
                    chatBoxList.append(listItem);
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("ERROR " + errorThrown);
            }
        });
    }

    $(document).ready(function () {
        $('#search-input').keyup(function (event) {
               event.preventDefault();
               retrieveChatBoxList();
        });

        $('#send-button').click(function (event) {
            event.preventDefault();
            var content = $('#chat-input').val();

            $.ajax({
                type: 'GET',
                url: '/create-new-message',
                data: {
                    chatBoxId: chatBoxSelected,
                    content: content,
                },
                success: function (response) {
                    retrieveMessageList(chatBoxSelected);
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        });
    });
</script>
