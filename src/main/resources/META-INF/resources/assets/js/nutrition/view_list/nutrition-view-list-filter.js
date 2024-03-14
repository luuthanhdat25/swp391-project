function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

function setupFilter(progressBar, sliderBars, inputs, gap, previewText) {
    sliderBars.forEach(function (input) {
        input.addEventListener("input", function (e) {
            var minVal = parseInt(sliderBars[0].value);
            var maxVal = parseInt(sliderBars[1].value);

            if (maxVal - minVal < gap) {
                if (e.target === sliderBars[0]) {
                    sliderBars[0].value = maxVal - gap;
                    minVal = parseInt(sliderBars[0].value);
                }
                if (e.target === sliderBars[1]) {
                    sliderBars[1].value = minVal + gap;
                    maxVal = parseInt(sliderBars[1].value);
                }
            }

            inputs[0].value = minVal;
            inputs[1].value = maxVal;
            progressBar.style.left = (minVal / sliderBars[0].max) * 100 + "%";
            progressBar.style.right = 100 - (maxVal / sliderBars[1].max) * 100 + "%";
            previewText.textContent = formatNumberWithCommas(minVal) + ' - ' + formatNumberWithCommas(maxVal) + '/100g';
        });
    });

    inputs.forEach(function (input, index) {
        input.addEventListener("input", function (e) {
            var minVal = parseInt(inputs[0].value);
            var maxVal = parseInt(inputs[1].value);

            if ((maxVal - minVal >= gap) && maxVal <= sliderBars[1].max) {
                if (index === 0 && minVal >= 0) {
                    sliderBars[0].value = minVal;
                    progressBar.style.left = (minVal / sliderBars[0].max) * 100 + "%";
                }
                if (index === 1 && maxVal >= 0) {
                    sliderBars[1].value = maxVal;
                    progressBar.style.right = 100 - (maxVal / sliderBars[1].max) * 100 + "%";
                }
                previewText.textContent = formatNumberWithCommas(minVal) + ' - ' + formatNumberWithCommas(maxVal) + '/100g';
            }
        });
    });
}

var caloProgressBar = document.querySelector("#caloProgressBar .progressBar");
var caloSliderBar = document.querySelectorAll("#caloSliderBar input");
var caloInput = document.querySelectorAll("#caloInput input");
var caloPreview = document.querySelector("#calo-preview");
var caloGap = 100;

setupFilter(caloProgressBar, caloSliderBar, caloInput, caloGap, caloPreview);



var proteinProgressBar = document.querySelector("#proteinProgressBar .progressBar");
var proteinSliderBar = document.querySelectorAll("#proteinSliderBar input");
var proteinInput = document.querySelectorAll("#proteinInput input");
var proteinPreview = document.querySelector("#protein-preview");
var proteinGap = 100;

setupFilter(proteinProgressBar, proteinSliderBar, proteinInput, proteinGap, proteinPreview);



var fatProgressBar = document.querySelector("#fatProgressBar .progressBar");
var fatSliderBar = document.querySelectorAll("#fatSliderBar input");
var fatInput = document.querySelectorAll("#fatInput input");
var fatPreview = document.querySelector("#fat-preview");
var fatGap = 100;

setupFilter(fatProgressBar, fatSliderBar, fatInput, fatGap, fatPreview);




var carbProgressBar = document.querySelector("#carbProgressBar .progressBar");
var carbSliderBar = document.querySelectorAll("#carbSliderBar input");
var carbInput = document.querySelectorAll("#carbInput input");
var carbPreview = document.querySelector("#carb-preview");
var carbGap = 100;

setupFilter(carbProgressBar, carbSliderBar, carbInput, carbGap, carbPreview);

//------------------------------ Switch
var isAdvancedSearch = false;

$(document).ready(function(){
    $('#advancedSearch').hide();

    $('#flexSwitchCheckDefault').change(function() {
        if($(this).is(":checked")) {
            $('#normalSearch').slideUp();
            $('#advancedSearch').slideDown();
        } else {
            $('#advancedSearch').slideUp();
            $('#normalSearch').slideDown();
        }
        isAdvancedSearch = !isAdvancedSearch;
        // console.log(isAdvancedSearch)
    });
});
//------------------------------
function removeAllButtonActive(){
    var buttons = document.querySelectorAll('#buttonGroup .btn');
    buttons.forEach(function(btn) {
        btn.classList.remove('active');
    });
}

function toggleButton(button) {
    removeAllButtonActive();
    var id = button.id;
    handleSearch(id)
    button.classList.add('active');
}

function resetButtons(button) {
    removeAllButtonActive();
    handleSearch(button.id)
}

function handleSearch(id) {
    var searchName = $("#searchInput").val();
    var caloMin = $("#caloMinInput").val();
    var caloMax = $("#caloMaxInput").val();
    var proteinMin = $("#proteinMinInput").val();
    var proteinMax = $("#proteinMaxInput").val();
    var fatMin = $("#fatMinInput").val();
    var fatMax = $("#fatMaxInput").val();
    var carbMin = $("#carbMinInput").val();
    var carbMax = $("#carbMaxInput").val();

    if(id){
        console.log(id)
        caloMin = 0;
        caloMax = 1000;
        proteinMin = 0;
        proteinMax = 1000;
        fatMin = 0;
        fatMax = 1000;
        carbMin = 0;
        carbMax = 1000;

        if(id === "lowCalo") caloMax = caloMin;
        if(id === "lowFat") fatMax = fatMin;
        if(id === "highProtein") proteinMin = proteinMax;
    }else{
        removeAllButtonActive();
    }

    var searchData = {
        "searchName": searchName,
        "caloMin": caloMin,
        "caloMax": caloMax,
        "proteinMin": proteinMin,
        "proteinMax": proteinMax,
        "fatMin": fatMin,
        "fatMax": fatMax,
        "carbMin": carbMin,
        "carbMax": carbMax
    };

    console.log('Request: ' + JSON.stringify(searchData));

    $.ajax({
        type: "POST",
        url: "/api/nutritions/search",
        contentType: "application/json",
        data: JSON.stringify(searchData),
        success: function(response) {
            console.log('Response: ');
            console.log(response);

            if (response && response.length > 0) {
                renderNutritionList(response)
            } else {
                document.getElementById('nutritionTableBody').innerHTML = "<p class='fs-3 text text-secondary mt-3'>Not found any Nutrition!</p>";
            }
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
}

function getActiveButtonIds() {
    var activeButtonIds = [];
    var buttons = document.querySelectorAll('#buttonGroup .btn');
    buttons.forEach(function(btn) {
        if (btn.classList.contains('active')) {
            activeButtonIds.push(btn.id);
        }
    });
    return activeButtonIds;
}


$(document).ready(function () {
    // Handle search name input and submit on enter
    $("#searchInput").keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
            if(isAdvancedSearch === true){
                handleSearch();
            }else{
                var searchNormal;
                if(getActiveButtonIds()[0]){
                    searchNormal = getActiveButtonIds()[0];
                }else{
                    searchNormal = 'searchNameNormal';
                }
                handleSearch(searchNormal);
            }
        }
    });

    $("#submitCalo").click(function () {
        handleSearch();
    });

    $("#submitProtein").click(function () {
        handleSearch();
    });

    $("#submitFat").click(function () {
        handleSearch();
    });

    $("#submitCarb").click(function () {
        handleSearch();
    });

    handleSearch();
})
