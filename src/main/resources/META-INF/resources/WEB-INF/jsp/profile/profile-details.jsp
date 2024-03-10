<%@ include file="../common/header.jspf" %>
<%@ include file="../common/head.jspf" %>
<%@ include file="../common/sidebar.jspf" %>
<style>
    .empty-text {
        color: gray;
        font-style: italic;
    }
</style>
<body>
<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="student-profile-head">
                                <div class="profile-bg-img">
                                    <img src="../../assets/img/profile-bg.jpg" alt="Profile">
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <div class="profile-user-box">
                                            <div class="profile-user-img">
                                                <img src="#" id="avatar" alt="Profile">
                                            </div>
                                            <div class="names-profiles">
                                                <h4 class="name"></h4>
                                                <h4 style="color: #0060eb">Gymer</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6"
                                         style="display: flex;padding-top: 27px;align-items: center;justify-content: space-between;">
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-user"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Weight</h4>
                                                <h5 id="weight">78 KG</h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-phone-call"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Height</h4>
                                                <h5 id="height">175 CM</h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-phone-call"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Goals</h4>
                                                <h5 id="goal"></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="student-personals-grp">
                                <div class="card">
                                    <div class="card-body">
                                        <div style="display: flex;align-items: center;justify-content: space-between;"
                                             class="heading-detail">
                                            <h4>Personal Details</h4>
                                            <a class="edit-link" style="margin-bottom: auto; cursor: pointer"
                                               data-bs-toggle="modal" id="sendToUpdate"><i
                                                    class="far fa-edit me-1"></i>Edit</a>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-user"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Name</h4>
                                                <h5 class="name"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-phone-call"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Mobile</h4>
                                                <h5 id="phone"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-calendar"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Date of Birth</h4>
                                                <h5 id="birthday"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-mail"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Email</h4>
                                                <h5 id="email"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity">
                                            <div class="personal-icons">
                                                <i class="feather-user"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Gender</h4>
                                                <h5 id="gender"></h5>
                                            </div>
                                        </div>
                                        <div class="personal-activity mb-0">
                                            <div class="personal-icons">
                                                <i class="feather-map-pin"></i>
                                            </div>
                                            <div class="views-personal">
                                                <h4>Address</h4>
                                                <h5 id="address"></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="student-personals-grp">
                                <div class="card mb-0">
                                    <div class="card-body">
                                        <div class="heading-detail">
                                            <h4>About Me</h4>
                                        </div>
                                        <div class="hello-park" id="desc">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

    var gymerDto = ${gymerDtoJson}
        $(document).ready(function () {
            $('#avatar').attr('src', 'data:image/jpeg;base64,' + gymerDto.avatarImage);
            $('.name').html(gymerDto.fullName ? gymerDto.fullName : '<span class="empty-text">[Empty]</span>');
            $('#phone').html(gymerDto.phone ? gymerDto.phone : '<span class="empty-text">[Empty]</span>');
            var birthday = gymerDto.birthday;
            if (birthday) {
                var [year, month, day] = birthday.split('-');

                var monthNames = ["January", "Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                var monthName = monthNames[parseInt(month, 10) - 1];

                var formattedBirthday = monthName + " " + day + ", " + year;

                $('#birthday').html(formattedBirthday);
            } else {
                $('#birthday').html('<span class="empty-text">Empty</span>');
            }
            $('#email').html(gymerDto.email ? gymerDto.email : '<span class="empty-text">[Empty]</span>');
            $('#gender').html(gymerDto.gender ? gymerDto.gender : '<span class="empty-text">[Empty]</span>');
            $('#address').html(gymerDto.address ? gymerDto.address : '<span class="empty-text">[Empty]</span>');

            $('#weight').html(gymerDto.weight + ' KG');
            $('#height').html(gymerDto.height + ' CM')
            $('#goal').html(gymerDto.goal);
            $('#desc').html(gymerDto.description)
            console.log(gymerDto)

            $('#sendToUpdate').click(function () {
                window.location.href = `/profile/update?id=` + gymerDto.id;
            });
        })


</script>

<%@include file="../common/script.jspf" %>