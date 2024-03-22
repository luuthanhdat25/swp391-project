<%@ include file="common/header.jspf" %>
<%@ include file="common/admin-head.jspf" %>
<%@ include file="common/admin-sidebar.jspf" %>
<script src="../../../assets/js/jquery-3.6.0.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .img-thumbnail {
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }

</style>

    <link href="../assets/css/notification/view-notification-list.css" rel="stylesheet"/>
    <link href="../assets/css/style-table.css" rel="stylesheet"/>
</head>

<div class="main-wrapper">
    <div>
        <div class="page-wrapper d-flex flex-column align-items-center"
             style="width: 75%; height: fit-content; float: right; padding: 70px 0 40px 0;">

            <div class="notification-detail d-flex flex-column align-items-center">
                <div class="shadow mb-2 rounded" style="width: 94%; height: fit-content; background-color: #333B59;
                border-radius: 6px; padding: 10px; font-size: 20px; color: #FFFFFF;  text-align: center;
                margin-bottom: 0px;">
                    <b>Account management</b>
                </div>
                <div class="d-flex flex-column" style="width: 94%;">
                    <div class="card mb-4" style="background-color: #FFFFFF;">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Account table
                        </div>

                        <div class="row">
                            <div class="col-3" style="margin-left: 16px; width: 40%; padding: 0 15px 0 15px;">
                                <form id="searchForm" style="width: 90%; margin-bottom: 0;">
                                    <div class="input-group" style="width: 100%;">
                                        <input id="usernameInput" type="text" class="form-control" style="border: 1px solid #4c4c4c;" placeholder="Enter name here" name="title">
                                        <!-- Remove the button for now, we'll handle the filtering on input change -->
                                    </div>
                                </form>
                            </div>
                            <div class="col-3">
                                <select class="form-select" id="filterCriteria">
                                    <option selected disabled>Filter Category...</option>
<%--                                    <option value="pt">Personal Trainer</option>--%>
                                    <option value="Gymer">Gymer</option>
<%--                                    <option value="true">Locked Account</option>--%>
                                </select>
                            </div>
                        </div>
                        <div class="card-body" style="width: 100%;">
                            <table id="datatablesSimple"
                                   class="table table-hover table-centered mdi-format-vertical-align-center">
                                <thead class="table-secondary">
                                <tr>
                                    <th style="text-align: left">Name</th>
                                    <th class="text-start">Email</th>
                                    <th style="text-align: center">Phone</th>
                                    <th style="text-align: center">Birthday</th>
                                    <th style="text-align: center">Role</th>
                                    <th style="text-align: center">Lock Status</th>
                                    <th style="text-align: center">Action </th>
                                </tr>
                                </thead>
                                <tbody id="tableBody">
                                <c:forEach var="account" items="${accountList}">
                                    <tr>
                                        <td style="text-align: left;">
                                            <img class="img-thumbnail" src="data:image/png;base64,${account.getAvatarImageAsString()}" alt="Customer image Image">
                                                ${account.fullName} </td>
                                        <td class="text-start">${account.email}</td>
                                        <td style="${empty account.phone ? 'color: #777171; font-style: italic;' : ''}">${(account.phone != null) ? account.phone : '[Empty]'}</td>
                                        <td style="${empty account.birthday ? 'color: #777171; font-style: italic;' : ''}">${(account.birthday != null) ? account.birthday : '[Empty]'}</td>
                                        <td>${account.role}</td>
                                        <td><div class="badge ${account.isBan ? 'badge-danger' : 'badge-success'}">${account.isBan ? 'Locked' : 'Unlocked'}</div>
                                        </td>
                                        <td><a href="manage-account/details?id=${account.id}" class="view"
                                               title="View Details" data-toggle="tooltip"><i class="fas fa-book" style='font-size:24px'></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${param.locked != null}">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        <strong>Congratulations!</strong> Account have been <strong>locked</strong> successfully
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>
                                <c:if test="${param.unlocked != null}">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        <strong>Congratulations!</strong> Account have been <strong>unlocked</strong> successfully
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    // Get reference to search input field
    const searchInput = document.getElementById("usernameInput");

    // Get reference to table body
    const tableBody = document.getElementById("tableBody");

    // Add event listener to search input field
    searchInput.addEventListener("input", function() {
        const searchQuery = this.value.trim().toLowerCase();
        filterRows(searchQuery);
    });

    // Function to filter rows based on search query
    function filterRows(searchQuery) {
        const rows = tableBody.querySelectorAll("tr");
        rows.forEach(function(row) {
            const text = row.textContent.toLowerCase();
            if (text.includes(searchQuery)) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        });
    }

    <%--// Get reference to sort select element--%>
    <%--const sortSelect = document.getElementById("sortCriteria");--%>

    <%--// Add event listener to sort select element--%>
    <%--sortSelect.addEventListener("change", function() {--%>
    <%--    const sortCriterion = this.value;--%>
    <%--    sortRows(sortCriterion);--%>
    <%--});--%>

    <%--// Function to sort rows based on selected criterion--%>
    <%--function sortRows(sortCriterion) {--%>
    <%--    // Sorting logic goes here--%>
    <%--    // Example: Sort rows based on a specific column--%>
    <%--    const rows = Array.from(tableBody.querySelectorAll("tr"));--%>
    <%--    rows.sort((a, b) => {--%>
    <%--        const aValue = a.querySelector(`[data-${sortCriterion}]`).getAttribute(`data-${sortCriterion}`);--%>
    <%--        const bValue = b.querySelector(`[data-${sortCriterion}]`).getAttribute(`data-${sortCriterion}`);--%>
    <%--        return aValue.localeCompare(bValue);--%>
    <%--    });--%>
    <%--    tableBody.innerHTML = ''; // Clear existing rows--%>
    <%--    rows.forEach(row => tableBody.appendChild(row)); // Append sorted rows--%>
    <%--}--%>

    const filterSelect = document.getElementById("filterCriteria");


    filterSelect.addEventListener("change", function() {
        const filterCriterion = this.value;
        const searchQuery = this.value.trim().toLowerCase();
        console.log(searchQuery)
        filterRows(searchQuery);
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="../../../assets/js/jquery-3.6.0.min.js"></script>
<%@ include file="common/script.jspf" %>
