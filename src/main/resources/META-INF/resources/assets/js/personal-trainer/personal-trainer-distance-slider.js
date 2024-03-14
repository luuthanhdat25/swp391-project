var distanceProgressBar = document.querySelector("#distanceProgressBar .progressBar");
var distanceSliderBar = document.querySelector("#distanceSliderBar input");
var distanceInput = document.querySelectorAll("#distanceInput input");
var distancePreview = document.querySelector("#distance-preview");

distanceSliderBar.addEventListener("input", function() {
    let maxVal = parseInt(distanceSliderBar.value);

    distanceInput.forEach(input => {
        input.value = maxVal;
    });

    distanceProgressBar.style.right = (100 - (maxVal / distanceSliderBar.max) * 100) + "%";
    distancePreview.textContent = 'Within ' + maxVal + 'km';
});

distanceInput.forEach(input => {
    input.addEventListener('input', function() {
        let val = input.value ? parseInt(input.value) : 0;

        if (val <= 0) {
            val = 0;
        }else if( val >= 100){
            val = 100;
        }

        input.value = val;
        distanceSliderBar.value = val;
        distanceProgressBar.style.right = (100 - (val / distanceSliderBar.max) * 100) + "%";
        distancePreview.textContent = 'Within ' + val + 'km';
    });
});
