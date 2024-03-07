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
            <label for="Description" style="font-weight: bold; margin-bottom: 0; color: #6f6f6f;">Let's chose your
                report reason</label>
            <div class="input-container">
                <input type="radio" name="Reason" id="checkBox1" value="1" onchange="toggleFormGroup()"
                       checked>
                <div class="radio-tile">
                    <label style="margin-bottom: 0;" for="checkBox1">Personal trainer tend to adjust their training
                        programs arbitrarily</label>
                </div>
            </div>

            <div class="input-container">
                <input type="radio" name="Reason" id="checkBox2" value="2" onchange="toggleFormGroup()"
                       checked>
                <div class="radio-tile">
                    <label style="margin-bottom: 0;" for="checkBox2">Personal trainer are often unprofessional in
                        communicating with customers</label>
                </div>
            </div>

            <div class="input-container">
                <input type="radio" name="Reason" id="checkBox3" value="3" onchange="toggleFormGroup()"
                       checked>
                <div class="radio-tile">
                    <label style="margin-bottom: 0;" for="checkBox3">Personal trainer does not prepare exercise programs
                        to suit your needs</label>
                </div>
            </div>

            <div class="input-container">
                <input type="radio" name="Reason" id="checkBox4" value="4" onchange="toggleFormGroup()"
                       checked>
                <div class="radio-tile">
                    <label style="margin-bottom: 0;" for="checkBox4">Personal trainer frequently use disrespectful
                        language
                    </label>
                </div>
            </div>

            <div class="input-container">
                <input type="radio" name="Reason" id="checkBox5" value="5" onchange="toggleFormGroup()"
                       checked>
                <div class="radio-tile">
                    <label style="margin-bottom: 0;" for="checkBox5">Personal trainer advertises falsely and makes
                        promises that cannot be fulfilled</label>
                </div>
            </div>

            <div class="input-container">
                <input type="radio" name="Reason" id="otherReason" value="6" onchange="toggleFormGroup()">
                <div class="radio-tile">
                    <label style="margin-bottom: 0;" for="otherReason">Other reason</label>
                </div>
            </div>

            <div class="form-group" id="otherReasonFormGroup" style="display:none; margin-top: 10px;">
                <textarea class="form-control" style="min-height: 70px" id="EnterOtherReason" rows="1" name="OtherReason"
                          placeholder="Enter reason's content" maxlength="125"></textarea>
            </div>
            <br>
            <div class="form-group">
                <label for="Description" style="font-weight: bold; color: #6f6f6f;">Description</label>
                <textarea class="form-control" id="Description" rows="2" name="Description"
                          placeholder="Enter reason's description" required></textarea>
            </div>
            <br>

            <div class="d-flex flex-row bd-highlight justify-content-center">
                <button type="button" style="background-color: #FC8A32; color: #FFFFFF;" class="btn"
                        data-bs-dismiss="modal">Cancel
                </button>
                <input type="hidden" name="PersonalTrainerID" value="9">
                <input type="hidden" name="GymerID" value="2">
                <button style="margin-left: 10px; background-color: #70c4cf; color: #FFFFFF;" type="submit" class="btn">
                    Send Report
                </button>
            </div>
        </form>
    </div>
</div>
<script>
    function toggleFormGroup() {
        var checkbox = document.getElementById('otherReason');
        var otherReasonFormGroup = document.getElementById('otherReasonFormGroup');
        var enterReasonContent = document.getElementById('EnterOtherReason');

        if (checkbox.checked) {
            otherReasonFormGroup.style.display = 'block';
            enterReasonContent.required = true;
        } else {
            otherReasonFormGroup.style.display = 'none';
            enterReasonContent.required = false;
        }
    }
</script>
</body>