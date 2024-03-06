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
                        <h1>Email Verification</h1>
                        <p class="account-subtitle">Enter email address to reset password</p>
                        <form id="form" action="#" method="post" onsubmit="return validateForm()">
                            <div class="form-group">
                                <label>Enter your registered email address <span class="login-danger">*</span></label>
                                <input class="form-control" type="text" name="email" id="email" value="${email}" style="border: 1px solid #ccc;">
                                <div id="emailValidationMessage" style="color: red;"></div>
                                <c:if test="${wrongEmail!=null}">
                                    <script>
                                        document.getElementById("emailValidationMessage").innerHTML = "${wrongEmail}";
                                        document.getElementById("email").style.border = "1px solid red";
                                    </script>
                                </c:if>
                                <c:choose>
                                    <c:when test="${isSent}">
                                        <button id="sendBtn" style="position: absolute; top: 11px; right: 2px; border: none; background-color: #FFFFFF; color: #8b8b9c; font-weight: bold" type="submit">Sent</button>
                                        <p style="color: #62a2ff; margin-top: 5px">A OTP Code with 6 digits already sent to your email.</p>
                                        <script>
                                            document.getElementById("submitBtn").removeAttribute("disabled")
                                        </script>
                                    </c:when>
                                    <c:otherwise>
                                        <button id="sendBtn" style="position: absolute; top: 11px; right: 2px; border: none; background-color: #FFFFFF; color: blue; font-weight: bold" type="submit">Send</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </form>
                        <p id="otpMessage" style="color: #007fff; display: none;">A OTP Code with 6 digits already sent to your email.</p>
                        <b style="margin: 0">Enter OTP:</b>
                            <form:form action="/auth/forgot/otp" method="POST" onsubmit="" class="digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off" >
                                <input type="text" id="digit1" name="digit1" value="${digit1}" data-next="digit2" maxlength="1" oninput="moveToNextOrPreviousInput(this, 'digit2', 'digit1')" required/>
                                <input type="text" id="digit2" name="digit2" value="${digit2}" data-next="digit3" data-previous="digit1" maxlength="1" oninput="moveToNextOrPreviousInput(this, 'digit3', 'digit1')" required/>
                                <input type="text" id="digit3" name="digit3" value="${digit3}" data-next="digit4" data-previous="digit2" maxlength="1" oninput="moveToNextOrPreviousInput(this, 'digit4', 'digit2')" required/>
                                <input type="text" id="digit4" name="digit4" value="${digit4}" data-next="digit5" data-previous="digit3" maxlength="1" oninput="moveToNextOrPreviousInput(this, 'digit5', 'digit3')" required/>
                                <input type="text" id="digit5" name="digit5" value="${digit5}" data-next="digit6" data-previous="digit4" maxlength="1" oninput="moveToNextOrPreviousInput(this, 'digit6', 'digit4')" required/>
                                <input type="text" id="digit6" name="digit6" value="${digit6}" data-previous="digit5" maxlength="1" oninput="moveToNextOrPreviousInput(this, null, 'digit5')" required/>
                                <c:if test="${not empty wrongOtp}">
                                    <p class="text-danger">${wrongOtp}</p>
                                </c:if>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-block" disabled id="submitBtn" type="submit">Submit</button>
                                </div>
                                <c:if test="${isSent}">
                                    <script>
                                        document.getElementById("submitBtn").removeAttribute("disabled")
                                    </script>
                                </c:if>
                            </form:form>

                        <div class="text-danger font-weight-bold"><c:if test="${param.failed != null}">Email or password is not correct. Try again!</c:if></div>
                        <div class="text-success font-weight-bold"><c:if test="${param.successfully != null}">Your account created successfully!</c:if></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function validateForm() {
        // Get the email input value
        var emailInput = document.getElementById("email").value;

        // Validate email format using a regular expression
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        var isValidEmail = emailRegex.test(emailInput);

        if(emailInput.trim() === "") {
            document.getElementById("emailValidationMessage").innerHTML = "The email is required!";
            document.getElementById("email").style.border = "1px solid red";
            return false;
        }

        // If email is invalid, show error message and make border red
        if (!isValidEmail) {
            document.getElementById("emailValidationMessage").innerHTML = "Please enter a valid email address.";
            document.getElementById("email").style.border = "1px solid red";
            return false; // Prevent form submission
        }

        // If email is valid, clear error message and reset border
        document.getElementById("emailValidationMessage").innerHTML = "";
        document.getElementById("email").style.border = "1px solid #ccc";
        window.location = '/auth/fotgot/otp?email='+emailInput;

        setTimeout(function () {
            document.getElementById("sendBtn").disabled = false;
            document.getElementById("sendBtn").innerHTML = "Send";
            document.getElementById("sendBtn").style = "position: absolute; top: 11px; right: 2px; border: none; background-color: #FFFFFF; color: blue; font-weight: bold"
        }, 3000);
        return false;
    }

    function moveToNextOrPreviousInput(currentInput, nextInputId, previousInputId) {
        if (event.inputType === 'deleteContentBackward' && previousInputId) {
            var previousInput = document.getElementById(previousInputId);
            previousInput.focus();
        } else if (currentInput.value.length === 1 && nextInputId) {
            var nextInput = document.getElementById(nextInputId);
            nextInput.focus();
        }
    }

</script>
<%@ include file="../common/script.jspf" %>