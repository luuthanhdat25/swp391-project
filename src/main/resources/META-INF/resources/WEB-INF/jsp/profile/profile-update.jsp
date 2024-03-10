<%@include file="../common/header.jspf" %>
<%@include file="../common/head.jspf" %>
<%@include file="../common/sidebar.jspf" %>

<style>
    .carousel-inner img {
        max-width: 100%;
        max-height: 300px;
        width: 100%;
        height: auto;
    }
</style>

<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="page-header invoices-page-header">
            <div class="row align-items-center">
                <div class="col">
                    <ul class="breadcrumb invoices-breadcrumb">
                        <li class="breadcrumb-item invoices-breadcrumb-item">
                            <a href="javascript:history.go(-1)">
                                <i class="fe fe-chevrons-left"></i> Back to profile
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Edit Profile</h5>
                        </div>

                        <div class="card-body">
                            <form:form action="/profile/update?id=${gymer.getGymerId()}" enctype="multipart/form-data" method="post">
                                <div class="student-profile-head">
                                    <div class="row" style="height: 400px">
                                        <div class="col-lg-4 col-md-4">
                                            <div class="profile-user-box">
                                                <div class="profile-user-img" style="top: 23px;">
                                                    <img style="border-radius: 50%;margin-left: 20px;border: 1px solid;border: 9px solid #00000014;width: 350px;height: 350px"
                                                         src="data:image/jpeg;base64, ${gymer.getAccount().getAvatarImageAsString()}" id="avatar-image"
                                                         alt="Profile">
                                                    <div class="form-group students-up-files profile-edit-icon mb-0">
                                                        <div class="uplod d-flex">
                                                            <label class="file-upload profile-upbtn mb-0">
                                                                <i class="feather-edit-3"></i><input type="file" name="avatar">
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3"
                                             style="display: flex; flex-direction: column; justify-content: center;">
                                            <div class="form-group row">
                                                <label class="col-lg-5 col-form-label">Weight(kg)</label>
                                                <div class="col-lg-3" style="width: 100%">
                                                    <input name="weight" type="text" class="form-control"
                                                           value="${gymer.getWeight()}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-5 col-form-label">Height(cm)</label>
                                                <div class="col-lg-3" style="width: 100%">
                                                    <input name="height" type="text" class="form-control"
                                                           value="${gymer.getHeight()}">
                                                </div>
                                            </div>
                                            <div class="form-group row ">
                                                <label class="col-lg-5 col-form-label">Goal</label>
                                                <select class="form-control col-lg-3 select" name="goal" required>
                                                    <c:forEach var="goal" items="${goals}">
                                                        <option value="${goal}"
                                                                <c:if test="${gymer.getGoal() eq goal}">selected</c:if>>${goal.label}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-5 col-md-5" style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                            <label class="col-lg-3 col-form-label">Desciption</label>
                                            <div class="form-group ">
                                                <div class="col-lg-4">
                                                    <textarea style="min-width: 440px; height: 200px;" class="form-control"
                                                              placeholder="Enter text here" name="description" value="${gymer.getDescription()}">${gymer.getDescription()}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xl-6">
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Name</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="fullName" type="text" class="form-control"
                                                       value="${gymer.getAccount().getFullName()}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Mobile</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="phone" type="text" class="form-control"
                                                       value="${gymer.getAccount().getPhone() == null ? '' : gymer.getAccount().getPhone()}"
                                                       placeholder="${gymer.getAccount().getPhone() == null ? 'Empty' : ''}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Birthday</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="birthday" class="form-control" type="date"
                                                       value="${gymer.getAccount().getBirthday()}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Gender</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           id="gender_male"
                                                           value="M" ${gymer.getAccount().getGender() == 'M' ? 'checked' : ''}>
                                                    <label class="form-check-label" for="gender_male">
                                                        Male
                                                    </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           id="gender_female"
                                                           value="F" ${gymer.getAccount().getGender() == 'F' ? 'checked' : ''}>
                                                    <label class="form-check-label" for="gender_female">
                                                        Female
                                                    </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           id="gender_other"
                                                           value="O" ${gymer.getAccount().getGender() == 'O' ? 'checked' : ''}>
                                                    <label class="form-check-label" for="gender_other">
                                                        Other
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Email</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input type="text" class="form-control"
                                                      name="email" value="${gymer.getAccount().getEmail()}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Password</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="password" type="password" class="form-control"
                                                       value="${gymer.getAccount().getPassword()}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Address</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="address" type="text" class="form-control"
                                                       value="${gymer.getAccount().getAddress() == null ? '' : gymer.getAccount().getAddress()}"
                                                       placeholder="${gymer.getAccount().getAddress() == null ? 'Empty' : ''}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-end">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="../../../assets/js/jquery-3.6.0.min.js"></script>
<script src="../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../assets/js/feather.min.js"></script>
<script src="../../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../../../assets/plugins/apexchart/apexcharts.min.js"></script>
<script src="../../../assets/plugins/apexchart/chart-data.js"></script>
<script src="../../../assets/plugins/select2/js/select2.min.js"></script>
<script src="../../../assets/js/script.js"></script>
<script src="../../../assets/plugins/moment/moment.min.js"></script>
<script src="../../../assets/js/bootstrap-datetimepicker.min.js"></script>
</body>
</html>