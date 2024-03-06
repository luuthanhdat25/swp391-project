<%@ include file="../common/header.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
        <link href = "../../assets/css/notification/view-notification-list.css" rel = "stylesheet"/>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<div class="main-wrapper">
    <div class="header">

        <div class="header-left">
            <a href="index.html" class="logo">
                <img src="/META-INF/resources/assets/img/logo.png" alt="Logo">
            </a>
            <a href="index.html" class="logo logo-small">
                <img src="/META-INF/resources/assets/img/logo-small.png" alt="Logo" width="30" height="30">
            </a>
        </div>

        <div class="menu-toggle">
            <a href="javascript:void(0);" id="toggle_btn">
                <i class="fas fa-bars"></i>
            </a>
        </div>

        <div class="top-nav-search">
            <form>
                <input type="text" class="form-control" placeholder="Search here">
                <button class="btn" type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>

        <ul class="nav user-menu">
            <button class="btn btn-rounded btn-outline-danger"><a href="login">Login</a></button>
            <button class="btn btn-rounded btn-outline-danger"><a href="/registration">Sign up</a></button>
        </ul>

    </div>
    <div>
        <%-- Div này là một sidebar dùng để hiển thị các button:  Manage account, manage notification ... --%>
            <div class="sidebar" id="sidebar" style="width: 20%; background-color: #adb5bd;">
                <div class="sidebar-inner slimscroll">

                    <%--Hiển thị tiêu đề của sidebar và danh sách các manage button--%>
                    <p class="h6" style="padding-left: 9px; margin-top: 10px;">Manage</p>
                    <ul id="sidebar-menu" class="sidebar-menu" style="padding: 2px 9px 9px 9px;">
                        <li style="margin-bottom: 4px;">
                            <a class="input-container" onclick=""> Manage account </a>
                        </li>
                        <li style="margin-bottom: 4px;">
                            <a class="input-container" onclick=""> Manage notification </a>
                        </li>
                        <li style="margin-bottom: 4px;">
                            <a class="input-container" onclick=""> Manage report </a>
                        </li>
                        <li style="margin-bottom: 4px;">
                            <a class="input-container" onclick=""> Manage request </a>
                        </li>
                        <li style="margin-bottom: 4px;">
                           <a class="input-container" onclick=""> Manage exercise </a>
                        </li>
                        <li style="margin-bottom: 4px;">
                             <a class="input-container" onclick=""> Manage exercise </a>
                        </li>
                    </ul>

                </div>
            </div>

        <%-- Div này hiển thị notification's list khi user click vào "Manage notification" button --%>
            <div class="page-wrapper d-flex flex-column align-items-center"
                 style="width: 80%; height: 100%; float: right; padding-top: 70px;">

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

                        <input type="hidden" name="senderID" value="5" />
                        <input type="hidden" name="receiverID" value="6" />
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
