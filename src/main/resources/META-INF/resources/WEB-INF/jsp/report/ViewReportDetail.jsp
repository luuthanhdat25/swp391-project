<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<div class="d-flex justify-content-center" data-backdrop = "static">
       <div style = "width: 100%; padding: 20px;">
                <h1 class="container text-center" style = "margin-bottom: 25px;">Report detail</h1>
                <div class="d-flex flex-row bd-highlight justify-content-center border border-dark" style = "padding: 10px;">
                     <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle" style="width: 150px; margin-right: 20px;" alt="Avatar" />
                     <div class = "d-flex flex-column bd-highlight mb-3 justify-content-center">
                            <div>Nguyen Van An</div>
                            <div><a href = "" class = "btn btn-success">View Profile</a></div>
                            <div>Reported at ${ReportDetail.getDateTime()}</div>
                     </div>
                </div>
                
                <br><label>Reason</label>
                <div class = "border border-dark" style = "padding: 5px; margin-top: 10px;">${ReportDetail.getTitle()}</div>    
                <br><label>Description</label>
                <div class = "border border-dark" style = "padding: 5px; margin-top: 10px;">${ReportDetail.getDescription()}</div>                
                <br>            
              	<div class="d-flex flex-row bd-highlight justify-content-center">
                     <button type="submit" class="btn btn-success" data-bs-dismiss="modal">Cancel</button>
                </div>   
       </div>
</div>