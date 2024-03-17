<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../common/header.jspf" %>
<%@include file="../common/head.jspf" %>
<%@include file="../common/sidebar.jspf" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
    .carousel-inner img {
        margin-top: 2%;
        max-width: 100%;
        width: 100%;
        height: auto;
    }
</style>

<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="page-header invoices-page-header">
            <div class="row align-items-center">
                <div class="col">
                    <ul>
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
                            <form:form action="/personal-trainer/update?id=${personalTrainer.getId()}"
                                       enctype="multipart/form-data" method="post">
                                <div class="student-profile-head">
                                    <div class="row" style="height: 400px;justify-content: space-between">
                                        <div class="col-lg-4 col-md-4">
                                            <div class="profile-user-box">
                                                <div class="profile-user-img" style="top: 23px">
                                                    <img style="border-radius: 50%;margin-left: 20px;border: 1px solid;border: 9px solid #00000014;width: 350px;height: 350px"
                                                         src="data:image/jpeg;base64, ${personalTrainer.getAccount().getAvatarImageAsString()}"
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

                                        <div class="col-lg-8 col-md-8"
                                             style="display: flex; flex-direction: column; justify-content: center;">
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" style="width: 64px;">Bank Name</label>
                                                <div class="form-group local-forms" style="width: 50%">
                                                    <select class="form-control select" id="bankName" name="bankName" required>
                                                    </select>
                                                </div>

                                                <label class="col-lg-3 col-form-label" style="width: 78px;">Bank Number</label>
                                                <div class="col-lg-3" style="width: 30%">
                                                    <input name="bankNumber" type="text" class="form-control" id="bankNumber" value="${personalTrainer.getBankNumber()}" required>
                                                    <div id="error-message-bank-number" style="color: red;"></div>
                                                </div>
                                            </div>
                                            <label class="col-lg-3 col-form-label">Desciption</label>
                                            <div class="form-group ">
                                                <div class="col-lg-4">
                                                    <textarea style="width: 731px ; height: 200px; max-height: 200px"
                                                              class="form-control"
                                                              placeholder="Enter text here" name="description"
                                                              id="description"
                                                              value="${personalTrainer.getDescription()}">${personalTrainer.getDescription()}</textarea>
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
                                                <input name="fullName" id="fullNameInput" type="text"
                                                       class="form-control"
                                                       value="${personalTrainer.getAccount().getFullName()}" required>
                                                <div id="error-message-fullName" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Mobile</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="phone" type="text" class="form-control"
                                                       value="${personalTrainer.getAccount().getPhone() == null ? '' : personalTrainer.getAccount().getPhone()}"
                                                       placeholder="${personalTrainer.getAccount().getPhone() == null ? 'Empty' : ''}" required>
                                                <div id="error-message-phone" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Birthday</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="birthday" class="form-control" type="date"
                                                       value="${personalTrainer.getAccount().getBirthday()}">
                                                <div id="error-message-birthday" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Gender</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           id="gender_male"
                                                           value="M" ${personalTrainer.getAccount().getGender() == 'M' ? 'checked' : ''}>
                                                    <label class="form-check-label" for="gender_male">
                                                        Male
                                                    </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           id="gender_female"
                                                           value="F" ${personalTrainer.getAccount().getGender() == 'F' ? 'checked' : ''}>
                                                    <label class="form-check-label" for="gender_female">
                                                        Female
                                                    </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           id="gender_other"
                                                           value="O" ${personalTrainer.getAccount().getGender() == 'O' ? 'checked' : ''}>
                                                    <label class="form-check-label" for="gender_other">
                                                        Other
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="form-group row">
                                            <label class="col-lg-12 col-form-label" style="display: flex; justify-content: space-between;">Email
                                                <a href="#" id="changePasswordLink">Change Password?</a></label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input type="text" name="email" class="form-control"
                                                       value="${personalTrainer.getAccount().getEmail()}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Address</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="address" type="text" class="form-control"
                                                       value="${personalTrainer.getAccount().getAddress() == null ? '' : personalTrainer.getAccount().getAddress()}"
                                                       placeholder="${personalTrainer.getAccount().getAddress() == null ? 'Empty' : ''}" required>
                                                <div id="error-message-address" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-9 col-form-label">Price (Amount of money per slot (VND))</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="price" type="number" class="form-control"
                                                       value="${personalTrainer.getPrice() == 0 ? "" : personalTrainer.getPrice()}"
                                                       placeholder="Amount of money per slot (VND) | min: 10000 VND"  min="10000" required>
                                                <div id="error-message-price" style="color: red;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-end">
                                    <button id="submitButton" type="submit" class="btn btn-primary" disabled>Submit
                                    </button>
                                </div>
                            </form:form>
                            <div class="col-lg-10 col-md-10"
                                 style="display: flex; align-items: center; justify-content: center;">
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
                </div>
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
                <form id="changePasswordForm">
                    <div class="form-group local-forms">
                        <label for="currentPassword">Current Password <span class="login-danger">*</span></label>
                        <input class="mb-1 mt-3 form-control pass-input" type="password" placeholder="Enter Current Password" id="currentPassword" minlength="8" maxlength="20" required>
                        <span class="profile-views feather-eye-off toggle-password" id="currentPasswordEye"></span>
                    </div>
                    <div class="error-message" id="currentPasswordError" style="color: red"></div>
                    <div class="form-group local-forms">
                        <label for="newPassword">New Password <span class="login-danger">*</span></label>
                        <input class="mb-1 form-control pass-new" type="password" placeholder="Enter New Password" id="newPassword" minlength="8" maxlength="20" required>
                        <span class="profile-views feather-eye-off new-toggle-password" id="newPasswordEye"></span>
                    </div>
                    <div class="error-message" id="newPasswordError" style="color: red"></div>
                    <div class="form-group local-forms">
                        <label for="repeatPassword">Repeat New Password <span class="login-danger">*</span></label>
                        <input class="mb-1 form-control pass-confirm" type="password" placeholder="Repeat Password" id="repeatPassword" minlength="8" maxlength="20" required>
                        <span class="profile-views feather-eye-off reg-toggle-password" id="repeatPasswordEye"></span>
                    </div>
                    <div class="error-message" id="repeatPasswordError" style="color: red"></div>
                    <div id="changePasswordErrorMessage" style="color: red;"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="changePasswordButton">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Function to validate the form
    function validateForm() {
        var currentPassword = document.getElementById("currentPassword");
        var newPassword = document.getElementById("newPassword");
        var repeatPassword = document.getElementById("repeatPassword");
        var isValid = true;
        // Reset error messages and borders
        document.getElementById("currentPasswordError").innerHTML = "";
        document.getElementById("newPasswordError").innerHTML = "";
        document.getElementById("repeatPasswordError").innerHTML = "";

        // Reset margin-bottom
        var formGroups = document.getElementsByClassName("form-group local-forms");
        for (var i = 0; i < formGroups.length; i++) {
            formGroups[i].style.marginBottom = "20px";
        }

        // Check current password
        if (currentPassword.value === "") {
            document.getElementById("currentPasswordError").innerHTML = "Current Password is required.";
            currentPassword.style.border = "1px solid red";
            currentPassword.parentElement.style.marginTop = "20px";
            currentPassword.parentElement.style.marginBottom = "0px"; // Adjust margin-bottom
            isValid = false;
        } else {
            currentPassword.style.border = "1px solid #000000";
        }

        // Check new password
        if (newPassword.value === "") {
            document.getElementById("newPasswordError").innerHTML = "New Password is required.";
            newPassword.style.border = "1px solid red";
            newPassword.parentElement.style.marginTop = "20px";
            newPassword.parentElement.style.marginBottom = "0px"; // Adjust margin-bottom
            isValid = false;
        } else if (newPassword.value.length < 8 || newPassword.value.length > 20) {
            document.getElementById("newPasswordError").innerHTML = "New Password must be between 8 and 20 characters.";
            newPassword.style.border = "1px solid red";
            newPassword.parentElement.style.marginTop = "20px";
            newPassword.parentElement.style.marginBottom = "0px"; // Adjust margin-bottom
            isValid = false;
        }

        if (repeatPassword.value === "") {
            document.getElementById("repeatPasswordError").innerHTML = "Repeat Password is required.";
            repeatPassword.style.border = "1px solid red";
            repeatPassword.parentElement.style.marginTop = "20px";
            repeatPassword.parentElement.style.marginBottom = "0px";
            isValid = false;
        } else if (repeatPassword.value.length < 8 || repeatPassword.value.length > 20) {
            document.getElementById("repeatPasswordError").innerHTML = "Repeat Password must be between 8 and 20 characters.";
            repeatPassword.style.border = "1px solid red";
            repeatPassword.parentElement.style.marginTop = "20px";
            repeatPassword.parentElement.style.marginBottom = "0px";
            isValid = false;
        }

        // Check if new password and repeat password match
        if (newPassword.value !== repeatPassword.value) {
            document.getElementById("newPasswordError").innerHTML = "New Password and Repeat Password do not match.";
            document.getElementById("repeatPasswordError").innerHTML = "New Password and Repeat Password do not match.";
            newPassword.style.border = "1px solid red";
            repeatPassword.style.border = "1px solid red";
            newPassword.parentElement.style.marginBottom = "0px"; // Adjust margin-bottom
            repeatPassword.parentElement.style.marginBottom = "0px"; // Adjust margin-bottom
            isValid = false;
        }

        return isValid;
    }

    // Function to handle form submission
    document.getElementById("changePasswordButton").addEventListener("click", function() {
        if (validateForm()) {
            console.log("Form submitted successfully!");
            // You can proceed with form submission or other actions here
        }
    });
</script>

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
    
    document.addEventListener('DOMContentLoaded', function () {
        const fileInput = document.querySelector('input[name="avatar"]');
        const avatarImage = document.getElementById('avatar-image');
        const fullNameInput = document.getElementById('fullNameInput');
        const phoneInput = document.querySelector('input[name="phone"]');
        const addressInput = document.querySelector('input[name="address"]');
        const priceInput = document.querySelector('input[name="price"]');
        const birthdayInput = document.querySelector('input[name="birthday"]');
        const submitButton = document.getElementById('submitButton');
        const descInput = document.getElementById('description');

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
                        clearErrorMessage('error-message-container-img');
                    };

                    reader.readAsDataURL(file);
                } else {
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
            validateNumber(phoneInput, 'error-message-phone');
        });

        addressInput.addEventListener('input', function () {
            validateTextForAddress(addressInput, 'error-message-address');
        });

        priceInput.addEventListener('input', function () {
            validatePrice(priceInput);
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

        function validateBirthday(birthdayElement) {
            const currentDate = new Date();
            const minimumAgeDate = new Date(currentDate.getFullYear() - 18, currentDate.getMonth(), currentDate.getDate());
            const selectedDate = new Date(birthdayElement.value);

            if (selectedDate > minimumAgeDate) {
                displayErrorMessage('You must be at least 18 years old.', 'error-message-birthday');
                birthdayElement.style.border = '2px solid red';
                submitButton.disabled = true;
            } else {
                clearErrorMessage('error-message-birthday');
                birthdayElement.style.border = '';
                submitButton.disabled = false;
            }
        }

        function validateTextForAddress(inputElement, errorMessageId) {
            const inputValue = inputElement.value;
            const hasSpecialCharacters = /[!@#$%^&*()?":{}|<>]/.test(inputValue);
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

        function validateNumber(element, errorMessageId) {
            const elementValue = element.value;
            const hasNonDigits = /\D/.test(elementValue);
            const errorMessageContainer = document.getElementById(errorMessageId);
            const submitButton = document.getElementById('submitButton');

            if (hasNonDigits) {
                errorMessageContainer.textContent = 'This filed must contains only numbers.';
                element.style.border = '2px solid red';
                submitButton.disabled = true;
            } else {
                errorMessageContainer.textContent = '';
                element.style.border = '';
                submitButton.disabled = false;
            }
        }


        function validatePrice(priceElement) {
            const priceValue = priceElement.value;
            if (!Number.isInteger(Number(priceValue))) {
                displayErrorMessage('Price must be a positive integer.', 'error-message-price');
                priceElement.style.border = '2px solid red';
                submitButton.disabled = true;
            } else {
                clearErrorMessage('error-message-price');
                priceElement.style.border = '';
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

        const bankNameSelect = $('#bankName');
        const personalTrainerDto = ${personalTrainerDtoJson};

        function updateBankNameInDto(bankName) {
            personalTrainerDto.bankName = bankName;
        }

        bankNameSelect.on('change', function () {
            const selectedBankName = bankNameSelect.select2('data')[0].text;
            updateBankNameInDto(selectedBankName);
            checkFormValidity();
        });
        const bankNumberInput = document.querySelector('input[name="bankNumber"]');


        bankNumberInput.addEventListener('input', function () {
            validateNumber(bankNumberInput, 'error-message-bank-number');
        });

        function checkFormValidity() {
            const imgErrorContainer = document.getElementById('error-message-container-img');
            const fullNameValid = !/[!@#$%^&*(),.?":{}|<>0-9]/.test(fullNameInput.value);
            const phoneValid = !/\D/.test(phoneInput.value);
            const addressValid = !/[!@#$%^&*().?":{}|<>]/.test(addressInput.value);
            const birthdayValid = birthdayInput.value <= new Date().toISOString().split('T')[0];
            const bankNameValid = bankNameSelect.select2('data')[0].text !== '';
            const bankNumberValid = !/\D/.test(bankNumberInput.value);
            const priceValid = !isNaN(priceInput.value) && priceInput.value > 0;
            const imgValid = !imgErrorContainer.textContent;
            const genderValid = [...genderInputs].some(input => input.checked);

            const isFormValid = fullNameValid && phoneValid && addressValid && birthdayValid && imgValid && genderValid && priceValid & bankNameValid && bankNumberValid;

            submitButton.disabled = !isFormValid;
        }
        fileInput.addEventListener('change', checkFormValidity);
        bankNumberInput.addEventListener('input', checkFormValidity);
        fullNameInput.addEventListener('input', checkFormValidity);
        descInput.addEventListener('input', checkFormValidity);
        phoneInput.addEventListener('input', checkFormValidity);
        addressInput.addEventListener('input', checkFormValidity);
        birthdayInput.addEventListener('input', checkFormValidity);
    });
</script>


<%-- Bank List Options--%>
<script>
    const bankNames = [
        "Ngân hàng TMCP Ngoại Thương Việt Nam (Vietcombank)",
        "Ngân hàng TMCP Công Thương Việt Nam (VietinBank)",
        "Ngân hàng Thương mại Cổ phần Quân đội (MBBank)",
        "Ngân hàng Thương mại Cổ phần Công thương Việt Nam (Techcombank)",
        "Ngân hàng TMCP Sài Gòn Thương Tín (Sacombank)",
        "Ngân hàng Thương mại Cổ phần Đầu tư và Phát triển Việt Nam (BIDV)",
        "Ngân hàng TMCP Á Châu (ACB)",
        "Ngân hàng TMCP Đông Á (DongA Bank)",
        "Ngân hàng TMCP Hàng Hải Việt Nam (Maritime Bank)",
        "Ngân hàng TMCP Sài Gòn (SCB)",
        "Ngân hàng Thương mại Cổ phần Xăng dầu Petrolimex (PGBank)",
        "Ngân hàng Thương mại Cổ phần Ngoại thương và Phát triển (PVcomBank)",
        "Ngân hàng Thương mại Cổ phần Tiên Phong (TPBank)",
        "Ngân hàng TMCP Kỹ Thương Việt Nam (Techcombank)",
        "Ngân hàng TMCP Đầu tư và Phát triển Việt Nam (BIDV)",
        "Ngân hàng Thương mại Cổ phần Kỹ thương Việt Nam (Techcombank)",
        "Ngân hàng Thương mại Cổ phần Tiên Phong (TPBank)",
        "Ngân hàng Thương mại Cổ phần Quốc Dân (NCB)",
        "Ngân hàng Thương mại Cổ phần Đông Nam Á (SeABank)",
        "Ngân hàng Thương mại Cổ phần Dầu khí Toàn Cầu (GPBank)",
        "Ngân hàng Thương mại Cổ phần An Bình (ABBank)",
        "Ngân hàng TMCP Sài Gòn Công Thương (Saigonbank)",
        "Ngân hàng Thương mại Cổ phần Quốc tế (VIB)",
        "Ngân hàng TMCP Sài Gòn (SCB)",
        "Ngân hàng Thương mại Cổ phần Quốc tế (VIB)",
        "Ngân hàng Thương mại Cổ phần Đông Nam Á (SeABank)",
        "Ngân hàng Thương mại Cổ phần An Bình (ABBank)",
        "Ngân hàng TMCP Sài Gòn Công Thương (Saigonbank)",
        "Ngân hàng Thương mại Cổ phần Quốc tế (VIB)",
        "Ngân hàng TMCP Công Thương Việt Nam (VietinBank)",
        "Ngân hàng Thương mại Cổ phần Đông Á (DongA Bank)",
        "Ngân hàng Thương mại Cổ phần Đầu tư và Phát triển Việt Nam (BIDV)",
        "Ngân hàng TMCP Hàng Hải Việt Nam (Maritime Bank)",
        "Ngân hàng TMCP Quân Đội (MB Bank)",
        "Ngân hàng Thương mại Cổ phần Sài Gòn - Hà Nội (SHB)",
        "Ngân hàng Thương mại Cổ phần Á Châu (ACB)",
        "Ngân hàng Thương mại Cổ phần Phát triển Thành phố Hồ Chí Minh (HDBank)",
        "Ngân hàng Thương mại Cổ phần Việt Nam Thịnh Vượng (VPBank)",
        "Ngân hàng TMCP Quốc Dân (NCB)",
        "Ngân hàng Thương mại Cổ phần Quốc tế (VIB)",
        "Ngân hàng Thương mại Cổ phần Đông Nam Á (SeABank)",
        "Ngân hàng Thương mại Cổ phần An Bình (ABBank)",
        "Ngân hàng TMCP Sài Gòn Công Thương (Saigonbank)",
        "Ngân hàng Thương mại Cổ phần Quốc tế (VIB)",
        "Ngân hàng TMCP Công Thương Việt Nam (VietinBank)",
        "Ngân hàng Thương mại Cổ phần Đông Á (DongA Bank)",
        "Ngân hàng Thương mại Cổ phần Đầu tư và Phát triển Việt Nam (BIDV)",
        "Ngân hàng TMCP Hàng Hải Việt Nam (Maritime Bank)",
        "Ngân hàng TMCP Quân Đội (MB Bank)",
        "Ngân hàng Thương mại Cổ phần Sài Gòn - Hà Nội (SHB)",
        "Ngân hàng Thương mại Cổ phần Á Châu (ACB)",
        "Ngân hàng Thương mại Cổ phần Phát triển Thành phố Hồ Chí Minh (HDBank)",
        "Ngân hàng Thương mại Cổ phần Việt Nam Thịnh Vượng (VPBank)",
        "Ngân hàng TMCP Quốc Dân (NCB)",
        "Ngân hàng Thương mại Cổ phần Quốc tế (VIB)",
        "Ngân hàng Thương mại Cổ phần Đông Nam Á (SeABank)",
        "Ngân hàng Thương mại Cổ phần An Bình (ABBank)",
        "Ngân hàng TMCP Sài Gòn Công Thương (Saigonbank)",
        "Ngân hàng Thương mại Cổ phần Quốc tế (VIB)",
        "Ngân hàng TMCP Công Thương Việt Nam (VietinBank)",
        "Ngân hàng Thương mại Cổ phần Đông Á (DongA Bank)",
        "Ngân hàng Thương mại Cổ phần Đầu tư và Phát triển Việt Nam (BIDV)",
        "Ngân hàng TMCP Hàng Hải Việt Nam (Maritime Bank)",
        "Ngân hàng TMCP Quân Đội (MB Bank)",
        "Ngân hàng Thương mại Cổ phần Sài Gòn - Hà Nội (SHB)",
        "Ngân hàng Thương mại Cổ phần Á Châu (ACB)",
        "Ngân hàng Thương mại Cổ phần Phát triển Thành phố Hồ Chí Minh (HDBank)",
        "Ngân hàng Thương mại Cổ phần Việt Nam Thịnh Vượng (VPBank)",
        "Ngân hàng TMCP Quốc Dân (NCB)"
    ];



    function fetchAndPopulateBankNames() {
        const bankSelect = document.getElementById('bankName');
        bankNames.forEach(function(bankName) {
            const option = document.createElement('option');
            option.text = bankName;
            bankSelect.add(option);
        });
    }

    function setDefaultBankValues() {
        const bankName = "${personalTrainerDto.getBankName()}";
        const bankNumber = "${personalTrainer.getBankNumber()}";
        const bankSelect = document.getElementById('bankName');
        const bankNumberInput = document.querySelector('input[name="bankNumber"]');

        for (let i = 0; i < bankSelect.options.length; i++) {
            if (bankSelect.options[i].text === bankName) {
                bankSelect.selectedIndex = i;
                break;
            }
        }

        bankNumberInput.value = bankNumber;
    }

    $(document).ready(function () {
        $("#changePasswordLink").click(function (e) {
            e.preventDefault();
            $("#changePasswordModal").modal("show");
        });

        $("#changePasswordForm").submit(function (e) {
            $("#changePasswordModal").modal("hide");
        });
        fetchAndPopulateBankNames();
        setDefaultBankValues();
    });
</script>


<script>
    var ptDto = ${personalTrainerDtoJson};
    $(document).ready(function () {
        $('#slider1').attr("src", "data:image/jpeg;base64, " + ptDto.certificateList[0]);
        $('#slider2').attr("src", "data:image/jpeg;base64, " + ptDto.certificateList[1]);
        $('#slider3').attr("src", "data:image/jpeg;base64, " + ptDto.certificateList[2]);
    })
</script>
</body>
</html>