<%@ include file="common/header.jspf" %>

<div class="main-wrapper login-body">
    <div class="login-wrapper">
        <div class="container">
            <div class="loginbox">
                <div class="login-left">
                    <img class="img-fluid" src="/theme2/img/login.png" alt="Logo">
                </div>
                <div class="login-right">
                    <div class="login-right-wrap">
                        <h1>Welcome User!</h1>
                        <p class="account-subtitle">Need an account? <a href="/registration">Sign Up</a></p>
                        <h2>Sign in</h2>

                        <form:form action="${pageContext.request.contextPath}/login" method="post">
                            <div class="form-group">
                                <label>Email <span class="login-danger">*</span></label>
                                <input class="form-control" type="text" name="email" required>
                                <span class="profile-views"><i class="fas fa-user-circle"></i></span>
                            </div>
                            <div class="form-group">
                                <label>Password <span class="login-danger">*</span></label>
                                <input class="form-control pass-input" type="text" name="password" required>
                                <span class="profile-views feather-eye toggle-password"></span>
                            </div>
                            <div class="forgotpass">
                                <div class="remember-me">
                                    <label class="custom_check mr-2 mb-0 d-inline-flex remember-me"> Remember me
                                        <input type="checkbox" name="radio">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <a href="#">Forgot Password?</a>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary btn-block" type="submit">Login</button>
                            </div>
                        </form:form >
                        <div class=" text-danger font-weight-bold">${fLogin}</div>
                        <div class="login-or">
                            <span class="or-line"></span>
                            <span class="span-or">or</span>
                        </div>

                        <div class="google-signin-box">
                            <div>
                                <a href="/oauth2/authorization/google">
                                <i class="fab fa-google-plus-g"></i>
                                <span class="google-signin-text">Login With Google</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="common/script.jspf" %>