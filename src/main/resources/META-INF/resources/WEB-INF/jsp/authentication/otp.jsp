<%@ include file="../common/header.jspf" %>
<body>
<div class="main-wrapper login-body">
    <div class="login-wrapper">
        <div class="container">
            <div class="loginbox">
                <div class="login-left">
                    <img class="img-fluid" src="/assets/img/login.png" alt="Logo">
                </div>
                <div class="login-right">
                    <div class="login-right-wrap">
                        <h1>OTP Verification</h1>
                        <p>A OTP Code with 6 digits already sent to your email.</p>
                        <b style="margin: 0">Enter OTP:</b>
                        <form:form action="otp" method="POST" onsubmit="concatenateDigits()" class="digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off">
                            <input type="text" id="digit1" name="digit1" value="${digit1}" data-next="digit2" maxlength="1" oninput="moveToNextOrPreviousInput(this, 'digit2', 'digit1')" required/>
                            <input type="text" id="digit2" name="digit2" value="${digit2}" data-next="digit3" data-previous="digit1" maxlength="1" oninput="moveToNextOrPreviousInput(this, 'digit3', 'digit1')" required/>
                            <input type="text" id="digit3" name="digit3" value="${digit3}" data-next="digit4" data-previous="digit2" maxlength="1" oninput="moveToNextOrPreviousInput(this, 'digit4', 'digit2')" required/>
                            <input type="text" id="digit4" name="digit4" value="${digit4}" data-next="digit5" data-previous="digit3" maxlength="1" oninput="moveToNextOrPreviousInput(this, 'digit5', 'digit3')" required/>
                            <input type="text" id="digit5" name="digit5" value="${digit5}" data-next="digit6" data-previous="digit4" maxlength="1" oninput="moveToNextOrPreviousInput(this, 'digit6', 'digit4')" required/>
                            <input type="text" id="digit6" name="digit6" value="${digit6}" data-previous="digit5" maxlength="1" oninput="moveToNextOrPreviousInput(this, null, 'digit5')" required/>
                            <c:if test="${not empty MSG}">
                                <pre class="text-danger">${MSG}</pre>
                            </c:if>
                            <div class="form-group">
                                <button class="btn btn-primary btn-block" type="submit">Submit</button>
                            </div>
                        </form:form>
                            <p class="account-subtitle">
                                Back to login? <a href="login">Login Here</a>
                            </p>
                        <div class="mt-2 text-danger font-weight-bold">${fPVERIFY}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/script.jspf" %>

<script>
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
</body>
