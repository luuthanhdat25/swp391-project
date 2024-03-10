<%@ include file="../common/header.jspf" %>
<%@ include file="../common/admin-sidebar.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
        <link href = "../../assets/css/notification/view-notification-list.css" rel = "stylesheet"/>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<div class="main-wrapper">
    <div>
        <%-- Div này hiển thị notification's list khi user click vào "Manage notification" button --%>
            <div class="page-wrapper d-flex flex-column align-items-center"
                 style="width: 77%; height: 100%; float: right; padding-top: 70px;">

                <div class="notification-detail d-flex flex-column align-items-center">
                     <form action="create-notification-detail" method="GET" style="width: 80%; margin-top: 100px;">
                        <label>Title</label>
                        <input type="text" class="form-control" name="title" placeholder="Enter title">
                        <label>Content</label>
                        <textarea id="summernote" name="content"></textarea>

                         <div class="form-check">
                          <input class="form-check-input" type="checkbox" value="" id="flexCheckIndeterminate">
                          <label class="form-check-label" for="flexCheckIndeterminate">
                              Send to everyone
                          </label>
                        </div>

                        <input type="hidden" name="senderID" value="3" />
                        <input type="hidden" name="receiverID" value="4" />
                        <div class="d-flex justify-content-between" style="width: 200px;">
                            <button type="submit" class="btn-warning">Cancel</button>
                            <button type="submit" class="btn-success">Send Notification</button>
                        </div>

                    </form>
                </div>
            </div>
       </div>
    </div>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script>
        $('#summernote').summernote({
            placeholder: 'Enter content',
            tabsize: 2,
            height: 300
        });
    </script>
</div>

<%@ include file="../common/script.jspf" %>
