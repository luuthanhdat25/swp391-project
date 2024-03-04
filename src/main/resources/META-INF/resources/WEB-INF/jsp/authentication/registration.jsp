<%@ include file="common/header.jspf" %>
<body>
<div class="main-wrapper login-body">
    <div class="login-wrapper">
        <div class="container">
            <div class="loginbox">
                <div class="row">
                    <div class="col-sm-12">
                            <div class="card-body">
                                <%--@elvariable id="account" type=""--%>
                                <form:form action="${pageContext.request.contextPath}/auth/registration" method="post" modelAttribute="account">
                                    <a href="javascript:history.go(-1)" class="back-btn"><i
                                            class="feather-chevron-left"></i> Back</a>
                                    <div class="row">
                                        <div class="col-12">
                                            <h5 class="form-title"><span>Sign Up</span></h5>
                                        </div>
                                        <div class="col-12 col-sm-12">
                                            <div class="form-group local-forms">
                                                <label>Fullname <span class="login-danger">*</span></label>
                                                <input type="text" type="email" style="${not empty fullname ? 'border: 1px solid red' : ''}"
                                                       class="form-control" placeholder="Enter Fullname" name="fullName" value="${account.fullName}" required>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12">
                                            <div class="form-group local-forms">
                                                <label>Email<span class="login-danger">*</span></label>
                                                <input type="email" style="${not empty email ? 'border: 1px solid red' : ''}"
                                                       class="form-control" placeholder="Enter Email" name="email" value="${account.email}" required>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12">
                                            <div class="form-group local-forms">
                                                <label>Password <span class="login-danger">*</span></label>
                                                <input class="form-control pass-input" style="${not empty password ? 'border: 1px solid red' : ''}"
                                                       type="password" placeholder="Enter Password" name="password" value="${account.password}" required>
                                                <span class="profile-views feather-eye toggle-password"></span>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12">
                                            <div class="form-group local-forms">
                                                <label>Repeat Password <span class="login-danger">*</span></label>
                                                <input class="form-control pass-input" style="${not empty fRptPassword ? 'border: 1px solid red' : ''}"
                                                       type="password" placeholder="Repeat Password" name="rptPassword" value="${rptPassword}" required>
                                                <span class="profile-views feather-eye toggle-password"></span>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-4">
                                            <div class="form-group local-forms">
                                                <label>Gender <span class="login-danger">*</span></label>
                                                <select class="form-control select" name="gender" required>
                                                    <c:forEach var="gender" items="${genders}">
                                                        <option value="${gender}" <c:if test="${account.gender eq gender}">selected</c:if>>${gender.desc}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-4">
                                            <div class="form-group local-forms calendar-icon">
                                                <label>Birthday<span class="login-danger">*</span></label>
                                                <input class="form-control datetimepicker"
                                                       type="date" style="${not empty birthday ? 'border: 1px solid red' : ''}"
                                                       placeholder="DD-MM-YYYY" name="birthday" value="${account.birthday}" required>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-4">
                                            <div class="form-group local-forms">
                                                <label>Role <span class="login-danger">*</span></label>
                                                <select class="form-control select" name="role" required>
                                                    <c:forEach var="role" items="${roles}">
                                                        <c:if test="${role ne 'ADMIN'}">
                                                            <option value="${role}" <c:if test="${account.role eq role}">selected</c:if>>${role.label}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>


                                        <c:if test="${not empty MSG}">
                                            <pre class="text-danger">${MSG}</pre>
                                        </c:if>
                                        <div class="col-12">
                                            <div class="login-submit">
                                                <button type="submit" class="btn btn-primary">Sign Up</button>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<%@ include file="common/script.jspf" %>