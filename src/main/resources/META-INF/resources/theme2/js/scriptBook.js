function collectCheckedCheckboxes() {
    var checkedCheckboxes = []; // Array to store IDs of checked checkboxes

    // Loop through all checkboxes
    $('input[type="checkbox"]:checked').each(function() {
        checkedCheckboxes.push($(this).attr('id')); // Add ID of checked checkbox to array
    });

    // Send the array of checked checkbox IDs to the server
    $.ajax({
        type: "POST",
        url: "/book-pt",
        contentType: "application/json", // Set content type to JSON
        data: JSON.stringify(checkedCheckboxes), // Convert array to JSON string
        success: function(response) {
            // Handle success response from server if needed
            console.log("Checked checkboxes sent successfully.");
        },
        error: function(xhr, status, error) {
            // Handle error response from server if needed
            console.error("Error sending checked checkboxes:", error);
        }
    });
}