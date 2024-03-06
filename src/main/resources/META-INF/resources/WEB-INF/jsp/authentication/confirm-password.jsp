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
                        <h2 >Recovery Password</h2>
                        <form:form action="${pageContext.request.contextPath}/auth/recover" method="post">
                            <div class="form-group">
                                <label>Password <span class="login-danger">*</span></label>
                                <input class="form-control pass-input" type="text" name="password" minlength="8" maxlength="20" value="${password}" required>
                                <span class="profile-views feather-eye toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <label>Repeat Password <span class="login-danger">*</span></label>
                                <input class="form-control pass-input" type="text" name="rPassword" minlength="8" maxlength="20" value="${rPassword}" required>
                                <span class="profile-views feather-eye toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary btn-block" type="submit">Confirm</button>
                            </div>
                        </form:form>
                        <div class="text-success font-weight-bold"><c:if test="${validOtp != null}">${validOtp}</c:if></div>
                        <div class="text-danger font-weight-bold"><c:if test="${param.failed != null}">The repeat password did not match!</c:if></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/script.jspf" %>