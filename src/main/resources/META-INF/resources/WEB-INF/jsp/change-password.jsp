<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Change Password</title>
    <link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4">Change Password</h2>

                    <form action="/profile/change-password" method="post">
                        <div class="mb-3">
                            <pre>${error}</pre>
                        </div>

                        <div class="mb-3">
                            <label for="pass" class="form-label">Old Password:</label>
                            <input type="password" id="pass" name="pass" class="form-control" placeholder="Old Password" required="required"/>
                        </div>

                        <div class="mb-3">
                            <label for="newPassword" class="form-label">New Password:</label>
                            <input type="password" id="newPassword" name="newPassword" class="form-control" placeholder="New Password" required="required"/>
                        </div>

                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Confirm Password:</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm Password" required="required"/>
                        </div>

                        <button type="submit" class="btn btn-primary">Change Password</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
</body>
</html>
