function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

function setupFilter(progressBar, sliderBars, inputs, gap, previewText) {
    sliderBars.forEach(function(input) {
        input.addEventListener("input", function(e) {
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
            previewText.textContent = formatNumberWithCommas(minVal) + ' - ' + formatNumberWithCommas(maxVal) + 'đ';
        });
    });

    inputs.forEach(function(input, index) {
        input.addEventListener("input", function(e) {
            var minVal = parseInt(inputs[0].value);
            var maxVal = parseInt(inputs[1].value);

            if ((maxVal - minVal >= gap) && maxVal <= sliderBars[1].max) {
                if (index === 0) {
                    sliderBars[0].value = minVal;
                    progressBar.style.left = (minVal / sliderBars[0].max) * 100 + "%";
                }
                if (index === 1) {
                    sliderBars[1].value = maxVal;
                    progressBar.style.right = 100 - (maxVal / sliderBars[1].max) * 100 + "%";
                }
                previewText.textContent = formatNumberWithCommas(minVal) + ' - ' + formatNumberWithCommas(maxVal) + 'đ';
            }
        });
    });

}

var priceProgressBar = document.querySelector("#priceProgressBar .progressBar");
var priceSliderBar = document.querySelectorAll("#priceSliderBar input");
var priceInput = document.querySelectorAll("#priceInput input");
var pricePreview = document.querySelector("#price-preview");
var priceGap = 50000;

setupFilter(priceProgressBar, priceSliderBar, priceInput, priceGap, pricePreview);
