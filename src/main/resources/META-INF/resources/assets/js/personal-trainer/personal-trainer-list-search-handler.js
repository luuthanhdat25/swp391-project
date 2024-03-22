if(role) {
    $(document).ready(function(){

        if(role === "Gymer") {
            console.log(canSearchDistance)
            $("#distanceFilter").show();
            if(canSearchDistance){
                $("#distanceSlider").show();
            }else{
                $("#waringAddress").show();
            }
        } else {
            $("#distanceSlider").hide(); // Otherwise, hide it
        }
    });
}


function handleSearch() {
    var searchName = $("#searchInput").val();
    var priceMin = $("#priceMinInput").val();
    var priceMax = $("#priceMaxInput").val();
    var distanceMax = $("#distanceMaxInput").val();
    var gender = $("#genderSelect").val();

    var searchData = {
        "searchName": searchName,
        "priceMin": priceMin,
        "priceMax": priceMax,
        "distanceMax": distanceMax,
        "gender": gender
    };


    console.log(JSON.stringify(searchData));

    $.ajax({
        type: "POST",
        url: "/api/personal-trainer/search",
        contentType: "application/json",
        data: JSON.stringify(searchData),
        success: function(response) {
            console.log('Response: ');
            console.log(response);

            if (response && response.length > 0) {
                personalTrainerList = response;
                currentPage = 1;
                displayItems(currentPage);
                renderPagination();
            } else {
                personalTrainerList = [];
                renderPagination();
                $('.page-item').addClass('disabled');
                document.getElementById('personalTrainerContainer').innerHTML = "<p class='fs-3 text text-secondary mt-3'>Not found any Personal Trainer!</p>";
            }
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
}

$(document).ready(function() {
    // Function to handle search
    // Handle search name input and submit on enter
    $("#searchInput").keypress(function(event) {
        if (event.which == 13) {
            event.preventDefault();
            handleSearch();
        }
    });

    // Handle price submit
    $("#submitPrice").click(function() {
        handleSearch();
    });

    // Handle distance submit
    $("#submitDistance").click(function() {
        handleSearch();
    });

    // Handle gender selection change
    $("#genderSelect").change(function() {
        handleSearch();
    });
});
