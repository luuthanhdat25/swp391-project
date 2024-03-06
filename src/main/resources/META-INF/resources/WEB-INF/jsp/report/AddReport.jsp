<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <link href="../../assets/css/report/AddReportRadio.css" rel="stylesheet"/>
</head>
<body>
<div class="d-flex justify-content-center formBody">
    <div>
        <form action="add-report" method="GET">
            <h1 class="container text-center">Report</h1>
            <div>Let's chose your report reason</div>

            <div class="input-container">
                <input type="radio" name="Reason" id="checkBox" value="1" onchange="toggleFormGroup()"
                       checked>
                <div class="radio-tile">
                    <label style="margin-bottom: 0;" for="checkBox">Personal trainers tend to adjust their training
                        programs arbitrarily</label>
                </div>
            </div>

            <div class="input-container">
                <input type="radio" name="Reason" id="checkBox" value="2" onchange="toggleFormGroup()"
                       checked>
                <div class="radio-tile">
                    <label style="margin-bottom: 0;" for="checkBox">Personal trainers are often unprofessional in
                        communicating with customers</label>
                </div>
            </div>

            <div class="input-container">
                <input type="radio" name="Reason" id="checkBox" value="3" onchange="toggleFormGroup()"
                       checked>
                <div class="radio-tile">
                    <label style="margin-bottom: 0;" for="checkBox">Personal trainer does not prepare exercise programs
                        to suit your needs</label>
                </div>
            </div>

            <div class="input-container">
                <input type="radio" name="Reason" id="checkBox" value="4" onchange="toggleFormGroup()"
                       checked>
                <div class="radio-tile">
                    <label style="margin-bottom: 0;" for="checkBox">Personal trainer advertises falsely and makes
                        promises that cannot be fulfilled</label>
                </div>
            </div>

            <div class="input-container">
                <input type="radio" name="Reason" id="otherReason" value="5" onchange="toggleFormGroup()">
                <div class="radio-tile">
                    <label style="margin-bottom: 0;" for="checkBox">Other reason</label>
                </div>
            </div>

            <div class="form-group" id="otherReasonFormGroup" style="display:none; margin-top: 10px;">
                <textarea class="form-control" style="min-height: 50px" id="OtherReason" rows="1" name="OtherReason"></textarea>
            </div>
            <br>
            <div class="form-group">
                <label for="Description">Description</label>
                <textarea class="form-control" id="Description" rows="2" name="Description" required></textarea>
            </div>
            <br>

            <div class="d-flex flex-row bd-highlight justify-content-center">
                <button type="button" class="btn btn-success" data-bs-dismiss="modal">Cancel</button>
                <button style="margin-left: 10px;" type="submit" class="btn btn-success">Send Report</button>
            </div>
        </form>
    </div>
</div>
<script>
    function toggleFormGroup() {
        var checkbox = document.getElementById('otherReason');
        var otherReasonFormGroup = document.getElementById('otherReasonFormGroup');

        if (checkbox.checked) {
            otherReasonFormGroup.style.display = 'block';
        } else {
            otherReasonFormGroup.style.display = 'none';
        }
    }
</script>
</body>