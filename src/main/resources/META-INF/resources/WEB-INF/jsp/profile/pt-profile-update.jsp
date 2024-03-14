<%@include file="../common/header.jspf" %>
<%@include file="../common/head.jspf" %>
<%@include file="../common/sidebar.jspf" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
                                                <label class="col-lg-3 col-form-label" style="width: 64px;">Bank
                                                    Name</label>
                                                <div class="col-lg-3" style="width: 40%">
                                                    <input name="bankName" type="text" class="form-control"
                                                           value="${personalTrainer.getBankName()}" disabled>
                                                </div>
                                                <label class="col-lg-3 col-form-label" style="width: 78px;">Bank
                                                    Number</label>
                                                <div class="col-lg-3" style="width: 40%">
                                                    <input name="bankNumber" type="text" class="form-control"
                                                           value="${personalTrainer.getBankNumber()}" disabled>
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
                                                       value="${personalTrainer.getAccount().getFullName()}">
                                                <div id="error-message-fullName" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Mobile</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="phone" type="text" class="form-control"
                                                       value="${personalTrainer.getAccount().getPhone() == null ? '' : personalTrainer.getAccount().getPhone()}"
                                                       placeholder="${personalTrainer.getAccount().getPhone() == null ? 'Empty' : ''}">
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
                                            <label class="col-lg-3 col-form-label">Email</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input type="text" name="email" class="form-control"
                                                       value="${personalTrainer.getAccount().getEmail()}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Password</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="password" type="password" class="form-control"
                                                       value="${personalTrainer.getAccount().getPassword()}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Address</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="address" type="text" class="form-control"
                                                       value="${personalTrainer.getAccount().getAddress() == null ? '' : personalTrainer.getAccount().getAddress()}"
                                                       placeholder="${personalTrainer.getAccount().getAddress() == null ? 'Empty' : ''}">
                                                <div id="error-message-address" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Price</label>
                                            <div class="col-lg-9" style="width: 100%">
                                                <input name="price" type="number" class="form-control"
                                                       value="${personalTrainer.getPrice() == 0 ? "" : personalTrainer.getPrice()}"
                                                       placeholder="${personalTrainer.getPrice() == 0 ? '0' : ''}">
                                                <div id="error-message-price" style="color: red;"></div>
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
                            <div class="col-lg-4 col-md-4"
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
            validatePhoneNumber(phoneInput, 'error-message-phone');
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

        function validatePhoneNumber(phoneElement, errorMessageId) {
            const phoneValue = phoneElement.value;
            const hasNonDigits = /\D/.test(phoneValue); // Check for non-digit characters
            const errorMessageContainer = document.getElementById(errorMessageId);
            const submitButton = document.getElementById('submitButton'); // Assuming submitButton is the correct ID

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


        function validatePrice(priceElement) {
            const priceValue = priceElement.value;
            if (!Number.isInteger(Number(priceValue))) {
                displayErrorMessage('Price must be a valid integer.', 'error-message-price');
                priceElement.style.border = '2px solid red';
                submitButton.disabled = true;
            } else {
                clearErrorMessage('error-message-price');
                priceElement.style.border = '';
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

            const fullNameValid = !/[!@#$%^&*(),.?":{}|<>0-9]/.test(fullNameInput.value);
            const phoneValid = !/\D/.test(phoneInput.value);
            const addressValid = !/[!@#$%^&*().?":{}|<>]/.test(addressInput.value);
            const birthdayValid = birthdayInput.value <= new Date().toISOString().split('T')[0];
            const imgValid = !imgErrorContainer.textContent; // Check if there are no image errors
            const genderValid = [...genderInputs].some(input => input.checked);

            const isFormValid = fullNameValid && phoneValid && addressValid && birthdayValid && imgValid && genderValid;

            submitButton.disabled = !isFormValid;
        }

        fullNameInput.addEventListener('input', checkFormValidity);
        descInput.addEventListener('input', checkFormValidity);
        phoneInput.addEventListener('input', checkFormValidity);
        addressInput.addEventListener('input', checkFormValidity);
        birthdayInput.addEventListener('input', checkFormValidity);

    });


</script>


<script>
    var ptDto = ${personalTrainerDtoJson};
    $(document).ready(function () {
        $('#slider1').attr("src", "data:image/jpeg;base64, " + ptDto.certificateList[0]);
        $('#slider2').attr("src", "data:image/jpeg;base64, " + ptDto.certificateList[1]);
        $('#slider3').attr("src", "data:image/jpeg;base64, " + ptDto.certificateList[2]);
        console.log(ptDto)
    })
</script>
</body>
</html>