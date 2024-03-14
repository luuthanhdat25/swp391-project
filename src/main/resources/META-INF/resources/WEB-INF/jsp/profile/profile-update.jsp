<%@include file="../common/header.jspf" %>
<%@include file="../common/head.jspf" %>
<%@include file="../common/sidebar.jspf" %>

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
                            <form:form action="/profile/update?id=${gymer.getGymerId()}" enctype="multipart/form-data"
                                       method="post">
                                <div class="student-profile-head">
                                    <div class="row" style="height: 400px">
                                        <div class="col-lg-4 col-md-4">
                                            <div class="profile-user-box">
                                                <div class="profile-user-img" style="top: 23px;">
                                                    <img style="border-radius: 50%;margin-left: 20px;border: 1px solid;border: 9px solid #00000014;width: 350px;height: 350px"
                                                         src="data:image/jpeg;base64, ${gymer.getAccount().getAvatarImageAsString()}"
                                                         id="avatar-image"
                                                         alt="Profile">
                                                    <div class="form-group students-up-files profile-edit-icon mb-0">
                                                        <div class="uplod d-flex">
                                                            <label class="file-upload profile-upbtn mb-0">
                                                                <i class="feather-edit-3"></i><input type="file"
                                                                                                     name="avatar">
                                                            </label>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="error-message-container-img"
                                                 style="flex: none;color: red; margin-top: 37px; padding-left: 1.5%"></div>
                                        </div>
                                        <div class="col-lg-3 col-md-3"
                                             style="display: flex; flex-direction: column; justify-content: center;">
                                            <div class="form-group row">
                                                <label class="col-lg-5 col-form-label">Weight(kg)</label>
                                                <div class="col-lg-3" style="width: 100%">
                                                    <input name="weight" type="number" class="form-control"
                                                           value="${gymer.getWeight()}">
                                                </div>
                                                <div id="error-message-weight" style="color: red;"></div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-5 col-form-label">Height(cm)</label>
                                                <div class="col-lg-3" style="width: 100%">
                                                    <input name="height" type="number" class="form-control"
                                                           value="${gymer.getHeight()}">
                                                </div>
                                                <div id="error-message-height" style="color: red;"></div>
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
                                        <div class="col-lg-5 col-md-5"
                                             style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                            <label class="col-lg-3 col-form-label">Desciption</label>
                                            <div class="form-group ">
                                                <div class="col-lg-4">
                                                    <textarea style="min-width: 440px; height: 200px;"
                                                              class="form-control"
                                                              placeholder="Enter text here" name="description" id="description"
                                                              value="${gymer.getDescription()}">${gymer.getDescription()}</textarea>
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
                                                <input name="fullName" id="fullNameInput" type="text" class="form-control" value="${gymer.getAccount().getFullName()}" required>
                                                <div id="error-message-fullName" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Mobile</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="phone" type="text" class="form-control"
                                                       value="${gymer.getAccount().getPhone() == null ? '' : gymer.getAccount().getPhone()}"
                                                       placeholder="${gymer.getAccount().getPhone() == null ? 'Empty' : ''}" required>
                                            </div>
                                            <div id="error-message-phone" style="color: red;"></div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Birthday</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="birthday" class="form-control" type="date"
                                                       value="${gymer.getAccount().getBirthday()}" required>
                                                <div id="error-message-birthday" style="color: red;"></div >
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
                                                       name="email" value="${gymer.getAccount().getEmail()}" disabled required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-12 col-form-label" style="display: flex; justify-content: space-between;">Password
                                                <a href="#" id="changePasswordLink">Change Password?</a></label>
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
                                                       placeholder="${gymer.getAccount().getAddress() == null ? 'Empty' : ''}" required>
                                                <div id="error-message-address" style="color: red;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-end">
                                    <button href="javascript:history.go(-1)" class="btn btn-primary">Back</button>
                                    <button id="submitButton" type="submit" class="btn btn-primary" disabled>Submit
                                    </button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form:form id="changePasswordForm">
                                <div class="form-group local-forms">
                                    <label for="currentPassword">Current Password <span class="login-danger">*</span></label>
                                    <input class="mb-3 mt-3 form-control pass-input" type="password" placeholder="Enter Current Password" id="currentPassword" minlength="8" maxlength="20" required>
                                    <span class="profile-views feather-eye toggle-password"></span>
                                </div>
                                <div class="form-group local-forms">
                                    <label for="newPassword">New Password <span class="login-danger">*</span></label>
                                    <input class="mb-3 form-control pass-new" type="password" placeholder="Enter New Password" id="newPassword" minlength="8" maxlength="20" required>
                                    <span class="profile-views feather-eye new-toggle-password"></span>
                                </div>
                                <div class="form-group local-forms">
                                    <label for="repeatPassword">Repeat New Password <span class="login-danger">*</span></label>
                                    <input class="form-control pass-confirm" type="password" placeholder="Repeat Password" id="repeatPassword" minlength="8" maxlength="20" required>
                                    <span class="profile-views feather-eye reg-toggle-password"></span>
                                </div>
                                <div id="changePasswordErrorMessage" style="color: red;"></div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" onclick="" id="changePasswordButton">Save changes</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    $(document).ready(function () {
        $("#changePasswordLink").click(function (e) {
            e.preventDefault();
            $("#changePasswordModal").modal("show");
        });

        $("#changePasswordForm").submit(function (e) {
            $("#changePasswordModal").modal("hide");
        });
    });

    document.addEventListener('DOMContentLoaded', function () {
        const fileInput = document.querySelector('input[name="avatar"]');
        const avatarImage = document.getElementById('avatar-image');
        const fullNameInput = document.getElementById('fullNameInput');
        const phoneInput = document.querySelector('input[name="phone"]');
        const addressInput = document.querySelector('input[name="address"]');
        const birthdayInput = document.querySelector('input[name="birthday"]');
        const submitButton = document.getElementById('submitButton');
        const descInput = document.getElementById('description');
        const weightInput = document.querySelector('input[name="weight"]');
        const heightInput = document.querySelector('input[name="height"]');

        weightInput.addEventListener('input', function () {
            validateNumericInput(weightInput, 'error-message-weight');
        });

        heightInput.addEventListener('input', function () {
            validateNumericInput(heightInput, 'error-message-height');
        });

        function validateNumericInput(inputElement, errorMessageId) {
            const inputValue = inputElement.value;

            if (isNaN(inputValue) || inputValue <= 0) {
                const errorMessageContainer = document.getElementById(errorMessageId);
                errorMessageContainer.textContent = 'Please enter a valid positive number.';
                inputElement.style.border = '2px solid red';
                submitButton.disabled = true;
            } else {
                const errorMessageContainer = document.getElementById(errorMessageId);
                errorMessageContainer.textContent = '';
                inputElement.style.border = '';
                submitButton.disabled = false;
            }
        }

        fileInput.addEventListener('change', function () {
            const file = fileInput.files[0];

            if (file) {
                const validExtensions = ['jpg', 'jpeg', 'png', 'gif'];
                const extension = file.name.split('.').pop().toLowerCase();

                if (validExtensions.includes(extension)) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        avatarImage.src = e.target.result;
                        avatarImage.style.border = '';
                        submitButton.disabled = false;
                        clearErrorMessage('error-message-container-img');
                    };

                    reader.readAsDataURL(file);
                } else {
                    submitButton.disabled = true;
                    avatarImage.style.border = '4px solid red';
                    displayErrorMessage('Invalid image type. Please select a valid image file.', 'error-message-container-img');
                }
            } else {
                avatarImage.src = 'data:image/jpeg;base64, ${personalTrainer.getAccount().getAvatarImageAsString()}';
            }
        });

        fullNameInput.addEventListener('input', function () {
            validateTextWithoutSpecialCharacters(fullNameInput, 'error-message-fullName');
        });

        descInput.addEventListener('input', function () {
            submitButton.disabled = false;
        })

        phoneInput.addEventListener('input', function () {
            validatePhoneNumber(phoneInput, 'error-message-phone');
        });

        addressInput.addEventListener('input', function () {
            validateTextForAddress(addressInput, 'error-message-address');
        });

        birthdayInput.addEventListener('input', function () {
            validateBirthday(birthdayInput);
        });

        function validateTextWithoutSpecialCharacters(inputElement, errorMessageId) {
            const inputValue = inputElement.value;
            const hasSpecialCharacters = /[!@#$%^&*(),.?":{}|<>0-9]/.test(inputValue);
            const errorMessageContainer = document.getElementById(errorMessageId);

            if (hasSpecialCharacters) {
                errorMessageContainer.textContent = 'Fullname cannot contain numbers or special characters.';
                inputElement.style.border = '2px solid red';
                submitButton.disabled = true;
            } else {
                errorMessageContainer.textContent = '';
                inputElement.style.border = '';
                submitButton.disabled = false;
            }
        }

        function validateTextForAddress(inputElement, errorMessageId) {
            const inputValue = inputElement.value;
            const hasSpecialCharacters = /[!@#$%^&*().?":{}|<>]/.test(inputValue);
            const errorMessageContainer = document.getElementById(errorMessageId);

            if (hasSpecialCharacters) {
                errorMessageContainer.textContent = 'Address cannot contain special characters.';
                inputElement.style.border = '2px solid red';
                submitButton.disabled = true;
            } else {
                errorMessageContainer.textContent = '';
                inputElement.style.border = '';
                submitButton.disabled = false;
            }
        }

        function validatePhoneNumber(phoneElement, errorMessageId) {
            const phoneValue = phoneElement.value;
            const hasNonDigits = /\D/.test(phoneValue);
            const errorMessageContainer = document.getElementById(errorMessageId);
            const submitButton = document.getElementById('submitButton');

            if (hasNonDigits) {
                errorMessageContainer.textContent = 'Phone cannot contain letters or special characters.';
                phoneElement.style.border = '2px solid red';
                submitButton.disabled = true;
            } else {
                errorMessageContainer.textContent = '';
                phoneElement.style.border = '';
                submitButton.disabled = false;
            }
        }

        function validateBirthday(birthdayElement) {
            const currentDate = new Date().toISOString().split('T')[0];
            if (birthdayElement.value > currentDate) {
                displayErrorMessage('Birthday cannot exceed the current date.', 'error-message-birthday');
                birthdayElement.style.border = '2px solid red';
                submitButton.disabled = true;
            } else {
                clearErrorMessage('error-message-birthday');
                birthdayElement.style.border = '';
                submitButton.disabled = false;
            }
        }

        function displayErrorMessage(message, errorMessageId) {
            let errorContainer = document.getElementById(errorMessageId);
            if (!errorContainer) {
                const container = document.createElement('div');
                container.id = errorMessageId;
                container.style.color = 'red';
                container.style.marginTop = '10px';
                inputElement.parentNode.appendChild(container);
                errorContainer = container;
            }
            errorContainer.textContent = message;
        }

        function clearErrorMessage(errorMessageId) {
            const errorContainer = document.getElementById(errorMessageId);
            if (errorContainer) {
                errorContainer.textContent = '';
            }
        }


        const genderInputs = document.querySelectorAll('input[name="gender"]');
        genderInputs.forEach(input => {
            input.addEventListener('change', checkFormValidity);
        });


        function checkFormValidity() {
            const imgErrorContainer = document.getElementById('error-message-container-img');
            const weightValid = !isNaN(weightInput.value) && weightInput.value > 0;
            const heightValid = !isNaN(heightInput.value) && heightInput.value > 0;
            const fullNameValid = !/[!@#$%^&*(),.?":{}|<>0-9]/.test(fullNameInput.value);
            const phoneValid = !/\D/.test(phoneInput.value);
            const addressValid = !/[!@#$%^&*().?":{}|<>]/.test(addressInput.value);
            const birthdayValid = birthdayInput.value <= new Date().toISOString().split('T')[0];
            const imgValid = !imgErrorContainer.textContent; // Check if there are no image errors

            const isFormValid = fullNameValid && phoneValid && addressValid && birthdayValid && imgValid && weightValid && heightValid && genderValid;

            console.log(fullNameValid);

            submitButton.disabled = !isFormValid;
        }

        fullNameInput.addEventListener('input', checkFormValidity);
        descInput.addEventListener('input', checkFormValidity);
        phoneInput.addEventListener('input', checkFormValidity);
        addressInput.addEventListener('input', checkFormValidity);
        birthdayInput.addEventListener('input', checkFormValidity);
        weightInput.addEventListener('input', checkFormValidity);
        heightInput.addEventListener('input', checkFormValidity);
    });


</script>

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