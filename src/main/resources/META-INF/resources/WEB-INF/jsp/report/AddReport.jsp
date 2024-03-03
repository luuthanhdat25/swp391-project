<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
       <link href = "../../assets/css/report/AddReportRadio.css" rel = "stylesheet"/>
</head>
<body>
       <div class="d-flex justify-content-center formBody">
              <div >
                       <form action="add-report" method="GET">
                              <h1 class="container text-center">Report</h1>
                              <div>Let's chose your report reason</div>
                              <c:forEach items = "${TemplateReports}" var = "Template">
                                   <c:if test = "${Template.getId() eq TemplateReports.size()}">
                                          <div class="input-container">
                                                 <input type="radio" name="Reason" id="otherReason" value = "${Template.getId()}" onchange="toggleFormGroup()" >
                                                 <div class = "radio-tile">
                                                        <label for="checkBox">${Template.getContent()}</label>
                                                 </div>
                                          </div>
                                   </c:if>
                                   <c:if test = "${Template.getId() ne TemplateReports.size()}">
                                          <div class="input-container">
                                                 <input type="radio" name="Reason" id="checkBox" value = "${Template.getId()}" onchange="toggleFormGroup()" checked>
                                                 <div class = "radio-tile">
                                                        <label for="checkBox">${Template.getContent()}</label>
                                                 </div>
                                          </div>
                                   </c:if>
                              </c:forEach><br>
                             <div class="form-group" id="otherReasonFormGroup" style="display:none;">
                                   <textarea class="form-control" id="OtherReason" rows="1" name="OtherReason"></textarea>
                             </div>
                              <br>
                              <div class="form-group">
                                  <label for="Description">Description</label>
                                  <textarea class="form-control" id="Description" rows="2" name = "Description" required></textarea>
                              </div><br>
                                
                              <div class="d-flex flex-row bd-highlight justify-content-center">
                                   <button type="button" class="btn btn-success" data-bs-dismiss="modal">Cancel</button>
                                   <button style = "margin-left: 10px;" type="submit" class="btn btn-success">Send Report</button>
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