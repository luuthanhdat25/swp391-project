<%@ include file="../common/header.jspf" %>

<div class="main-wrapper login-body">
    <div class="login-wrapper">
        <div class="container">
            <div class="loginbox">
                <div class="login-left">
                    <img class="img-fluid" src="/assets/img/login.png" alt="Logo">
                </div>
                <div class="login-right">
                    <div class="login-right-wrap">
                        <h1>Welcome User!</h1>
                        <p class="account-subtitle">Need an account? <a href="/auth/registration">Sign Up</a></p>
                        <h2>Sign in</h2>

                        <form:form action="${pageContext.request.contextPath}/auth/login" method="post">
                            <div class="form-group">
                                <label>Email <span class="login-danger">*</span></label>
                                <input class="form-control" type="text" name="email" value="${email}" required>
                                <span class="profile-views"><i class="fas fa-user-circle"></i></span>
                            </div>
                            <div class="form-group">
                                <label>Password <span class="login-danger">*</span></label>
                                <input class="form-control pass-input" type="password" name="password" value="${password}" required>
                                <span class="profile-views feather-eye toggle-password"></span>
                            </div>
                            <div style="text-align: left" class="forgotpass">
                                <a href="/auth/forgot">Forgot Password?</a>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary btn-block" type="submit">Login</button>
                            </div>
                        </form:form>

                        <div class="text-danger font-weight-bold"><c:if test="${param.failed != null}">Email or password is not correct. Try again!</c:if></div>
                        <div class="text-danger font-weight-bold"><c:if test="${param.ban != null}">This account is BAN! Please try another account!</c:if></div>
                        <div class="text-success font-weight-bold"><c:if test="${param.successfully != null}">Everything is done! You can login now.</c:if></div>
                        <div class="text-success font-weight-bold"><c:if test="${param.inactive != null}">Your account already created! You can login now
                                                                                        but you might wait for admin accept to use our services.</c:if></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/script.jspf" %>