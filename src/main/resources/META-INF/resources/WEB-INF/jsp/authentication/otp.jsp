<%@ include file="common/header.jspf" %>
<body>
<div class="main-wrapper login-body">
    <div class="login-wrapper">
        <div class="container">
            <div class="loginbox">
                <div class="login-left">
                    <img class="img-fluid" src="assets/img/login.png" alt="Logo">
                </div>
                <div class="login-right">
                    <div class="login-right-wrap">
                        <h1>OTP Verification</h1>
                        <p>A OTP Code with 6 digits already sent to your email.</p>
                        <b style="margin: 0">Enter OTP:</b>
                        <form:form action="otp" method="POST" onsubmit="concatenateDigits()" class="digit-group" data-group-name="digits" data-autosubmit="false" modelAttribute="account" autocomplete="off">
                            <input type="text" id="digit1" name="digit1" data-next="digit2" required/>
                            <input type="text" id="digit2" name="digit2" data-next="digit3" data-previous="digit1" required/>
                            <input type="text" id="digit3" name="digit3" data-next="digit4" data-previous="digit2" required/>
                            <input type="text" id="digit4" name="digit4" data-next="digit5" data-previous="digit3" required/>
                            <input type="text" id="digit5" name="digit5" data-next="digit6" data-previous="digit4" required/>
                            <input type="text" id="digit6" name="digit6" data-previous="digit5" required/>
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
<%@ include file="common/script.jspf" %>

<script>
    $(document).ready(function () {
        $('.digit-group').find('input').each(function() {
            $(this).attr('maxlength', 1);

            $(this).on('keyup', function(e) {
                var parent = $($(this).parent());
                var currentId = $(this).attr('id');

                if (e.keyCode === 8 || e.keyCode === 37) {
                    // Backspace or Left arrow key pressed
                    var prev = parent.find('input#' + $(this).data('previous'));
                    if (prev.length) {
                        $(prev).select();
                    }
                } else if ((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 65 && e.keyCode <= 90) || (e.keyCode >= 96 && e.keyCode <= 105) || e.keyCode === 39) {
                    // Numeric keys, alphabetic keys, numpad keys, or Right arrow key pressed
                    var next = parent.find('input#' + $(this).data('next'));
                    if (next.length) {
                        $(next).select();
                    } else {
                        // If there is no next input field, and autosubmit is enabled, submit the form
                        if (parent.data('autosubmit')) {
                            parent.submit();
                        }
                    }
                }
            });
        });
    });

</script>
</body>
