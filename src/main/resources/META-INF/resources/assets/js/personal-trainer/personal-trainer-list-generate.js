var itemsPerPage = 3;
var currentPage = 1;

function formatPrice(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

function displayItems(page) {
    var startIndex = (page - 1) * itemsPerPage;
    var endIndex = startIndex + itemsPerPage;
    var paginatedItems = personalTrainerList.slice(startIndex, endIndex);
    const container = $('<div class="student-personals-grp"></div>');
    var defaultIconUrl = 'https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg';

    paginatedItems.forEach(personalTrainer => {
        var displayDescription;
        if(personalTrainer.description){
            var limitlength = 200;
            displayDescription = personalTrainer.description.length > limitlength
                ? personalTrainer.description.substring(0, limitlength) + '...' : personalTrainer.description;
        }

        const card = $('<div class="card mb-0 mb-3"></div>');
        const cardBody = $('<div class="card-body row"></div>');

        // Left column (Image)
        const leftColumn = $('<div class="col"></div>');

        const imageLink = $('<a></a>').attr('href', '/personal-trainer/details?id=' + personalTrainer.id);
        const image = $('<img class="rounded-circle" style="height: 7rem; width: 7rem; object-fit:;box-shadow: 0 0 3px rgba(0, 0, 0, 0.5);" alt="Profile">').attr('src', 'data:image/jpeg;base64,' + (personalTrainer.avatarImage || defaultIconUrl));
        imageLink.append(image);

        leftColumn.append(imageLink);


        // Middle column (Details)
        const middleColumn = $('<div class="col-lg-8"></div>');
        const headingDetail = $('<div class="heading-detail d-flex align-items-center"></div>');
        const trainerName = $('<h5 class="mb-0"></h5>').text(personalTrainer.fullName);

        const ratingContainer = $('<div></div>');
        const averageRating = personalTrainer.averageVotes;
        const numberOfVotes = personalTrainer.numberOfVotes;

        const rating = $('<h6 class="text-muted mb-0 ms-2"></h6>').html(`(${averageRating.toFixed(1)} from ${numberOfVotes} ratings)`);
        ratingContainer.append(rating);
        headingDetail.append(trainerName, ratingContainer);
        const personalActivity = $('<div class="personal-activity mt-2"></div>');
        const personalIcons = $('<div class="personal-icons d-flex align-items-center bg-light rounded-2 p-2 w-auto"></div>');
        const locationIcon = $('<i class="feather-map-pin text-black"></i>');
        const locationText = $('<h6 class="text-black mb-0 ms-2"></h6>').text(personalTrainer.address);
        personalIcons.append(locationIcon, locationText);
        personalActivity.append(personalIcons);
        const description = $('<div class="hello-park shortDescription"></div>');
        const descriptionParagraph = $('<p></p>').text(displayDescription);
        description.append(descriptionParagraph);
        middleColumn.append(headingDetail, personalActivity, description);

        // Right column (Price and Button)
        const rightColumn = $('<div class="col"></div>');
        const priceText = $('<div></div>');
        const priceHeading = $('<h6 class="text-muted">Price</h6>');
        const price = $('<h5></h5>').text(formatPrice(personalTrainer.price) + 'đ');
        priceText.append(priceHeading, price);
        const viewProfileButton = $('<button class="btn btn-primary font-weight-bold" type="button" style="font-size: 95%">View Profile</button>');
        rightColumn.append(priceText, viewProfileButton);
        viewProfileButton.click(function() {
            window.location.href = `/personal-trainer/details?id=` + personalTrainer.id;
        });
        cardBody.append(leftColumn, middleColumn, rightColumn);
        card.append(cardBody);
        container.append(card);
    });

    $('#personalTrainerContainer').html(container);
}

function renderPagination() {
    var totalPages = Math.ceil(personalTrainerList.length / itemsPerPage);
    var paginationHtml = '';

    paginationHtml += '<li class="page-item ' + (currentPage === 1 ? 'disabled' : '') + '"><a class="page-link" href="#" data-page="' + (currentPage - 1) + '">Previous</a></li>';
    for (var i = 1; i <= totalPages; i++) {
        paginationHtml += '<li class="page-item ' + (currentPage === i ? 'active' : '') + '"><a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>';
    }
    paginationHtml += '<li class="page-item ' + (currentPage === totalPages ? 'disabled' : '') + '"><a class="page-link" href="#" data-page="' + (currentPage + 1) + '">Next</a></li>';

    $('#pagination').html(paginationHtml);
}

displayItems(currentPage);
renderPagination();

$(document).on('click', '.pagination .page-link', function(e) {
    e.preventDefault();
    var page = parseInt($(this).data('page'));
    if (!isNaN(page)) {
        currentPage = page;
        displayItems(currentPage);
        renderPagination();
    }
});