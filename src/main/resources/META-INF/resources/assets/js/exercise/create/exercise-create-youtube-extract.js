function extractVideoId(url) {
    var regex = /^(?:(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11}))/;
    var match = url.match(regex);
    return match ? match[1] : null;
}

function changeVideo() {
    var youtubeLink = $('#youtubeLink').val();
    var videoId = extractVideoId(youtubeLink);

    if (videoId) {
        $('#playerContainer').show();
        player.loadVideoById(videoId);
    } else {
        alert("Invalid YouTube link. Please enter a valid link.");
    }
}

$(document).ready(function() {
    var tag = $('<script>', {
        src: 'https://www.youtube.com/iframe_api'
    });
    $('script:first').before(tag);

    window.onYouTubeIframeAPIReady = function() {
        player = new YT.Player('player', {
            height: '390',
            width: '640',
            playerVars: {
                'playsinline': 1
            },
            events: {
                'onReady': onPlayerReady,
                'onStateChange': onPlayerStateChange
            }
        });
    };

    function onPlayerReady(event) {
        event.target.playVideo();
    }

    // The API calls this function when the player's state changes
    // The function indicates that when playing a video (state=1),
    // the player should play for six seconds and then stop
    var done = false;
    function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
            setTimeout(stopVideo, 6000);
            done = true;
        }
    }

    // Function to stop the video
    function stopVideo() {
        player.stopVideo();
    }

    // Attach click event to the button
    $('#changeVideoBtn').on('click', changeVideo);
});
