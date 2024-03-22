<%@include file="common/header.jspf" %>
<%@include file="common/head.jspf" %>
<%@include file="common/sidebar.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<body>
    <div class="main-wrapper">
       <div class="page-wrapper">
            <div class="content container-fluid">

                <div class="container mt-5 d-flex justify-content-center">
                    <div class="row">
                        <div class="col-md-auto ">
                            <div class="card">
                                <div class="card-header bg-white d-flex justify-content-center">
                                    <i class="fas fa-check-circle fa-3x text-success"></i>
                                </div>

                                <div class="card-body text-center">
                                    <h3 class="card-title">Payment Successful</h3>

                                    <p class="card-text">
                                        You have been connected with Personal Trainer ${personalTrainerName} <br>
                                        There are ${numberSlot} slots in total. <br>
                                        Starting from ${orderPayment.datetime_start} to ${orderPayment.datetime_end}.
                                    </p>
                                    <a href="/accept" class="btn btn-primary">Continue</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <script src="../../assets/js/jquery-3.6.0.min.js"></script>

    <script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../assets/js/feather.min.js"></script>

    <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="../../assets/plugins/select2/js/select2.min.js"></script>

    <script src="../../assets/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../assets/plugins/datatables/datatables.min.js"></script>

    <script src="../../assets/plugins/moment/moment.min.js"></script>
    <script src="../../assets/js/bootstrap-datetimepicker.min.js"></script>

    <script src="../../assets/js/script.js"></script>
</body>

