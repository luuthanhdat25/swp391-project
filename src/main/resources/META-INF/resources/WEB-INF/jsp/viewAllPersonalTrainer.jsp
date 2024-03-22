<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<body>
<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content container-fluid">

            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Book a Personal Trainer</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Booking</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Request form</h5>
                        </div>
                        <div class="card-body">
                            <c:if test="${not empty personalTrainers}">
                                <table border="1">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Full Name</th>
                                        <th>Email</th>
                                        <th>Book</th>
                                        <!-- Add other columns as needed -->
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="account" items="${personalTrainers}">
                                        <tr>
                                            <td>${account.id}</td>
                                            <td>${account.fullName}</td>
                                            <td>${account.email}</td>
                                            <td><a href="/bookPT1?accountId=${account.id}">Book</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>

                            <c:if test="${empty personalTrainers}">
                                <p>No Personal Trainers found.</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <p>Copyright © 2022 Dreamguys.</p>
        </footer>

    </div>

</div>

<script src="../../theme2/js/scriptBook.js"></script>
<script src="../../theme2/js/jquery-3.6.0.min.js"></script>
<script src="../../theme2/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../theme2/js/feather.min.js"></script>
<script src="../../theme2/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../../theme2/plugins/apexchart/apexcharts.min.js"></script>
<script src="../../theme2/plugins/apexchart/chart-data.js"></script>
<script src="../../theme2/js/script.js"></script>
</body>

</html>