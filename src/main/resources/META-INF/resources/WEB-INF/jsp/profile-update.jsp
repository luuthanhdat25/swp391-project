<%@include file="common/head.jspf" %>
<%@include file="common/header.jspf" %>
<%@include file="common/sidebar.jspf" %>

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
                            <a href="invoices.html">
                                <i class="fe fe-chevrons-left" ></i> Back to profile
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
                            <form action="/personal-trainer/update?id=${personalTrainer.getId()}" method="post">
                                <div class="student-profile-head" >
                                    <div class="row" style="height: 400px;justify-content: space-between">
                                        <div class="col-lg-4 col-md-4">
                                            <div class="profile-user-box">
                                                <div class="profile-user-img" style="top: 23px;">
                                                    <img style="border-radius: 50%;margin-left: 20px;border: 9px solid #fff;width: 350px;" src="../../assets/img/profile-user.jpg" alt="Profile">
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
                                        <div class="col-lg-4 col-md-4" style="display: flex; align-items: center; justify-content: center;">
                                            <div id="carouselExampleIndicators" class="carousel slide"
                                                 data-bs-ride="carousel">
                                                <ol class="carousel-indicators">
                                                    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                                        class="active"></li>
                                                    <li data-bs-target="#carouselExampleIndicators"
                                                        data-bs-slide-to="1"></li>
                                                    <li data-bs-target="#carouselExampleIndicators"
                                                        data-bs-slide-to="2"></li>
                                                </ol>
                                                <div class="carousel-inner" role="listbox">
                                                    <div class="carousel-item active">
                                                        <img id="slider1" class="d-block img-fluid" src="#"
                                                             alt="First slide">
                                                    </div>
                                                    <div class="carousel-item">
                                                        <img id="slider2" class="d-block img-fluid" src="#"
                                                             alt="Second slide">
                                                    </div>
                                                    <div class="carousel-item">
                                                        <img id="slider3" class="d-block img-fluid" src="#"
                                                             alt="Third slide">
                                                    </div>
                                                </div>
                                                <a class="carousel-control-prev" href="#carouselExampleIndicators"
                                                   role="button" data-bs-slide="prev">
                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Previous</span>
                                                </a>
                                                <a class="carousel-control-next" href="#carouselExampleIndicators"
                                                   role="button" data-bs-slide="next">
                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Next</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xl-6">
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Name</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="fullname" type="text" class="form-control" value="${personalTrainer.getAccount().getFullName()}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Mobile</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="phone" type="text" class="form-control" value="${personalTrainer.getAccount().getPhone() == null ? '' : personalTrainer.getAccount().getPhone()}" placeholder="${personalTrainer.getAccount().getPhone() == null ? 'Empty' : ''}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Birthday</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="birthday" class="form-control" type="date" value="${personalTrainer.getAccount().getBirthday()}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Gender</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" id="gender_male" value="M" ${personalTrainer.getAccount().getGender() == 'M' ? 'checked' : ''}>
                                                    <label class="form-check-label" for="gender_male">
                                                        Male
                                                    </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" id="gender_female" value="F" ${personalTrainer.getAccount().getGender() == 'F' ? 'checked' : ''}>
                                                    <label class="form-check-label" for="gender_female">
                                                        Female
                                                    </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" id="gender_other" value="O" ${personalTrainer.getAccount().getGender() == 'O' ? 'checked' : ''}>
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
                                                <input type="text" class="form-control" value="${personalTrainer.getAccount().getEmail()}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Password</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="password" type="text" class="form-control" value="${personalTrainer.getAccount().getPassword()}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Address</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="address" type="text" class="form-control" value="${personalTrainer.getAccount().getAddress() == null ? '' : personalTrainer.getAccount().getAddress()}" placeholder="${personalTrainer.getAccount().getAddress() == null ? 'Empty' : ''}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Price</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="price" type="number" class="form-control" value="${personalTrainer.getPrice() == 0 ? "" : personalTrainer.getPrice()}"  placeholder="${personalTrainer.getPrice() == 0 ? '0' : ''}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-end">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="../../assets/js/jquery-3.6.0.min.js"></script>
<script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../assets/js/feather.min.js"></script>
<script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../../assets/plugins/apexchart/apexcharts.min.js"></script>
<script src="../../assets/plugins/apexchart/chart-data.js"></script>
<script src="../../assets/plugins/select2/js/select2.min.js"></script>
<script src="../../assets/js/script.js"></script>
<script src="../../assets/plugins/moment/moment.min.js"></script>
<script src="../../assets/js/bootstrap-datetimepicker.min.js"></script>

<script>
    var ptDto = ${personalTrainerDto};
    $(document).ready(function(){
        $('#slider1').attr("src", "data:image/jpeg;base64, " + ptDto.certificateList[0]);
        $('#slider2').attr("src", "data:image/jpeg;base64, " + ptDto.certificateList[1]);
        $('#slider3').attr("src", "data:image/jpeg;base64, " + ptDto.certificateList[2]);
        console.log(ptDto)
    })

</script>
</body>
</html>