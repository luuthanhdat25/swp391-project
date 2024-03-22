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
                                <form action="#" method="GET" style="width: 90%; margin-bottom: 0;">
                                    <div class="input-group" style="width: 100%;">
                                        <input type="text" class="form-control" style="border: 1px solid #4c4c4c;" placeholder="Enter name here" name="title">
                                        <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-3">
                                <select class="form-select" id="sortCriteria">
                                    <option selected disabled>Sort Category...</option>
                                    <option value="name">Name</option>
                                    <option value="email">Email</option>
                                    <option value="birthday">Birthday</option>
                                </select>
                            </div>
                            <div class="col-3">
                                <select class="form-select" id="filterCriteria">
                                    <option selected disabled>Filter Category...</option>
                                    <option value="pt">Personal Trainer</option>
                                    <option value="gymer">Gymer</option>
                                    <option value="lockAcc">Locked Account</option>
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
                                <tbody>
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
    $(document).ready(function() {
        var accounts = ${accountList}; // Initialize accounts variable with the account list from JSP

        $('#sortCriteria, #filterCriteria').change(function() {
            var sortBy = $('#sortCriteria').val();
            var filterBy = $('#filterCriteria').val();

            var filteredAndSortedAccounts = [...accounts]; // Create a copy of the accounts array

            // Sorting logic
            if (sortBy === 'name') {
                filteredAndSortedAccounts.sort((a, b) => (a.fullName > b.fullName) ? 1 : -1);
            } else if (sortBy === 'email') {
                filteredAndSortedAccounts.sort((a, b) => (a.email > b.email) ? 1 : -1);
            } else if (sortBy === 'birthday') {
                filteredAndSortedAccounts.sort((a, b) => moment(a.birthday) - moment(b.birthday));
            }

            // Filtering logic
            if (filterBy === 'pt') {
                filteredAndSortedAccounts = filteredAndSortedAccounts.filter(account => account.role === 'Personal Trainer');
            } else if (filterBy === 'gymer') {
                filteredAndSortedAccounts = filteredAndSortedAccounts.filter(account => account.role === 'Gymer');
            } else if (filterBy === 'lockAcc') {
                filteredAndSortedAccounts = filteredAndSortedAccounts.filter(account => account.isBan);
            }

            // Update the table with the filtered and sorted account list
            updateAccountTable(filteredAndSortedAccounts);
        });

        // Function to update the account table with the filtered and sorted account list
        function updateAccountTable(accounts) {
            var tableBody = $('#datatablesSimple tbody');
            tableBody.empty(); // Clear existing table rows

            // Append rows for each account in the updated list
            accounts.forEach(function(account) {
                var row = $('<tr>');
                row.append($('<td>').text(account.fullName));
                row.append($('<td>').text(account.email));
                row.append($('<td>').text(account.phone));
                row.append($('<td>').text(account.birthday ? account.birthday : '[Empty]'));
                row.append($('<td>').text(account.role));
                var badge = $('<div>').addClass('badge ' + (account.isBan ? 'badge-danger' : 'badge-success')).text(account.isBan ? 'Banned' : 'Unbanned');
                row.append($('<td>').append(badge));
                row.append($('<td>').html('<a href="#" class="view" title="View Details" data-toggle="tooltip"><i class="fas fa-book" style="font-size:24px"></i></a>'));
                tableBody.append(row);
            });
        }

        // Call the sorting and filtering logic initially
        $('#sortCriteria, #filterCriteria').change();
    });

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="../../../assets/js/jquery-3.6.0.min.js"></script>
<%@ include file="common/script.jspf" %>
