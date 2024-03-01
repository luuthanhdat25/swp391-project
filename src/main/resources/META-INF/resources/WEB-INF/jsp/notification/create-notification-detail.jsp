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
        <form action="create-payment-notification" method="GET">
           <input type="hidden" name="senderID" value="5" />
           <input type="hidden" name="receiverID" value="6" />
           <button type="submit" style="height: 50px; width: 140px; background-color: #3c763d;" class="btn btn-success">Add Payment</button>
        </form>
    </div>

    <div class="page-wrapper">
        <div style="width: 80%; margin-top: 100px;">
            <form action="create-notification-detail" method="GET">
                <label>Title</label>
                <input type="text" class="form-control" name="title" placeholder="Enter title">
                <label>Content</label>
                <textarea id="summernote" name="content"></textarea>

                <input type="hidden" name="senderID" value="5" />
                <input type="hidden" name="receiverID" value="6" />
                <button type="submit" class="btn-success">Send Notification</button>
            </form>
        </div>
    </div>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script>
      $('#summernote').summernote({
        placeholder: 'Enter content',
        tabsize: 2,
        height: 100
      });
    </script>
</div>
<%@ include file="../common/script.jspf" %>
