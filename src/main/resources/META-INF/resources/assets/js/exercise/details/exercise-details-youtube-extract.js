var youtubeLink = exercise.videoDescription;
var videoId = extractVideoId(youtubeLink);

function extractVideoId(url) {
    var regex = /^(?:(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11}))/;
    var match = url.match(regex);
    return match ? match[1] : null;
}

$(document).ready(function() {
    if (videoId) {
        var tag = $('<script>', {
            src: 'https://www.youtube.com/iframe_api'
        });
        $('script:first').before(tag);

        window.onYouTubeIframeAPIReady = function() {
            player = new YT.Player('player', {
                height: '270',
                width: '480',
                playerVars: {
                    'playsinline': 1,
                },
                videoId: videoId,
                events: {
                    'onReady': onPlayerReady,
                    'onStateChange': onPlayerStateChange
                }
            });
        };

        function onPlayerReady(event) {
            event.target.playVideo();
        }

        function onPlayerStateChange(event) {
            if (event.data == YT.PlayerState.PLAYING && !done) {
                setTimeout(stopVideo, 6000);
                done = true;
            }
        }

        if (videoId) {
            $('#playerContainer').show();
            player.loadVideoById(videoId);
        } else {
            alert("Invalid YouTube link. Please enter a valid link.");
        }
    } else {
        // Invalid YouTube link
        console.error("Invalid YouTube link. Please enter a valid link.");
    }
});