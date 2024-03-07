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