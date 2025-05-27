<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/student/header.jsp" %>
<%@ include file="/layouts/student/nav.jsp" %>
<style>
    .video-wrapper {
      max-width: 860px;
      margin: 0 auto;
    }
    .video-js {
      border-radius: 10px;
    }

    .playing {
      background-color: #f0f8ff;
    }
  </style>
    <div class="container py-5">
    <div class="row">
        <div class="col-md-8">
            <div class="video-wrapper mb-4">
                <video
                        id="my-video"
                        class="video-js vjs-16-9"
                        controls
                        preload="auto"
                        data-setup='{"fluid": true}'
                        poster="/FileController${video.thumbnail}"
                    >
                        <source src="/video/stream?path=${video.videoUrl}" type="video/mp4" />
                </video>
                
            </div>
                    <h1 id="video_title" class="mb-3">${video.title}</h1>
                    <div id="video_description" class="bg-white p-4 rounded shadow-sm">
                    ${video.description}
                    </div>
        </div>
        <div class="col-md-4">
        <div class="card mb-3 shadow-sm">
            <div class="card-header">
                <h5 class="mb-0">Lesson videos</h5>
            </div>
            <div class="card-body">
                <c:forEach var="relatedVideo" items="${videos}">
                    <div class="card mb-2 ${video.id == relatedVideo.id ? 'playing' : ''}" onclick="updateVideo(
                    ${relatedVideo.id}, 
                    '${relatedVideo.videoUrl}' , 
                    ${relatedVideo.progress},
                    '${relatedVideo.thumbnail}', 
                    '${relatedVideo.title}', 
                    '${relatedVideo.description}')" role="button" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4 flex justify-content-center align-items-center">
                            <div>
                                <img src="/FileController${relatedVideo.thumbnail}" width="100" height="65" alt="...">
                            </div>
                            </div>
                            <div class="col-md-8">
                            <div class="card-body">
                                <h6 class="card-title">${relatedVideo.title}</h6>
                                <%-- <p class="card-text text-sm text-truncate" style="max-width: 300px;">${relatedVideo.description}</p> --%>
                            </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

            
        </div>
    <div>
       

        

    </div>
        
  </div>

    </div>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/8.22.0/video.min.js"></script>

<script>
    let lastProgress = 0;
    let completed = false;
    let currentTime = 0;
    let updateVideoId = <c:out value="${video.id}"/>;
    
    var player = videojs('my-video', {
        controls: true,
        autoplay: false,
        preload: 'auto',
        poster: '/FileController${video.thumbnail}'
    });

    player.ready(function() {
        console.log('Player is ready.');
        
        player.one('loadedmetadata', function () {
            const resumeTime = <c:out value="${video.progress}" default="0"/>;
            console.log('Video duration:', player.duration());
            console.log('Resume time:', resumeTime);

            if (resumeTime > 0 && resumeTime < player.duration()) {
                player.currentTime(resumeTime);
                lastProgress = resumeTime;
            }
        });
    });

    function updateProgress(currentTime){
            fetch('/student/course/enroll/update_progress', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    video_id: updateVideoId,
                    course_id: ${course_id},
                    lesson_id: ${lesson_id},
                    progress: currentTime,
                    is_completed: completed
                })
            }).then(response => {
                if (!response.ok) {
                    console.error('Error updating progress:', response.statusText);
                }
            }).catch(error => {
                console.error('Error updating progress:', error);
            });
        }

    player.on('error', function() {
        console.error('Error occurred while playing the video.');
    });

    player.on('ended', function() {
        console.log('Video ended.');
        completed = true;
        updateProgress(currentTime);
    });

    player.on('play', function() {
        console.log('Video is playing.');
    });

    player.on('pause', function() {
        console.log('Video is paused.');
    });

    player.on('timeupdate', function() {
        var currentTime = player.currentTime();
        if(currentTime - lastProgress >= 5) {
            lastProgress = currentTime;
            console.log('Current time: ' + currentTime);
            updateProgress(currentTime);
        }
    });

    function updateVideo(videoId, videoUrl, progress, thumbnail, videoTitle, videoDescription) {
        window.location.href = '/student/course/enroll/watch?course_id=${course_id}&lesson_id=${lesson_id}&video_id=' + videoId;
        // window.history.pushState(null, '', '/student/course/enroll/watch?course_id=${course_id}&lesson_id=${lesson_id}&video_id=' + videoId);
        //location.reload();
        //lastProgress = progress;
        //updateVideoId = videoId;
        //player.src({ type: 'video/mp4', src: '/video/stream?path=' + videoUrl });
        //player.poster(thumbnail);
        //player.currentTime(progress);
        //player.play();

        //document.querySelector('#video_title').innerText = videoTitle;
        //document.querySelector('#video_description').innerHTML = videoDescription;
    }
</script>
<%@ include file="/layouts/student/footer.jsp" %>
