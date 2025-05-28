<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Watch Course - ${video.title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/video.js/8.22.0/video-js.min.css" rel="stylesheet">
    <link href="digitaltheatre/videojs-theme-dt/dist/theme/index.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <style>
        body {
            background-color: #f8fafc;
        }

        .video-container {
            background: white;
            border-radius: 1rem;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .video-wrapper {
            max-width: 100%;
            margin: 0 auto;
            border-radius: 0.75rem;
            overflow: hidden;
        }

        .video-js {
            border-radius: 0.75rem;
        }

        .video-info {
            margin-top: 1.5rem;
        }

        .video-title {
            color: #1e293b;
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .video-description {
            color: #475569;
            font-size: 1rem;
            line-height: 1.6;
            background: #f8fafc;
            padding: 1.5rem;
            border-radius: 0.75rem;
        }

        .playlist-container {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .playlist-header {
            background: #2563eb;
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 1rem 1rem 0 0;
            font-weight: 600;
        }

        .playlist-body {
            padding: 1rem;
            max-height: 600px;
            overflow-y: auto;
        }

        .video-item {
            background: #f8fafc;
            border-radius: 0.75rem;
            padding: 1rem;
            margin-bottom: 0.75rem;
            cursor: pointer;
            transition: all 0.2s ease;
            border: 2px solid transparent;
        }

        .video-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .video-item.playing {
            background: #eff6ff;
            border-color: #2563eb;
        }

        .video-thumbnail {
            width: 120px;
            height: 80px;
            object-fit: cover;
            border-radius: 0.5rem;
        }

        .video-item-title {
            color: #1e293b;
            font-size: 0.95rem;
            font-weight: 500;
            margin: 0;
        }

        .video-item.playing .video-item-title {
            color: #2563eb;
        }

        .progress-indicator {
            width: 4px;
            height: 100%;
            background: #e2e8f0;
            border-radius: 2px;
            position: relative;
        }

        .progress-indicator::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: var(--progress);
            background: #2563eb;
            border-radius: 2px;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-8">
                <div class="video-container">
                    <div class="video-wrapper">
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
                    <div class="video-info">
                        <h1 class="video-title">${video.title}</h1>
                        <div class="video-description">
                            ${video.description}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="playlist-container">
                    <div class="playlist-header">
                        <i class="bi bi-collection-play"></i> Course Videos
                    </div>
                    <div class="playlist-body">
                        <c:forEach var="relatedVideo" items="${videos}">
                            <div class="video-item ${video.id == relatedVideo.id ? 'playing' : ''}" 
                                 onclick="updateVideo(
                                    ${relatedVideo.id}, 
                                    '${relatedVideo.videoUrl}', 
                                    ${relatedVideo.progress},
                                    '${relatedVideo.thumbnail}', 
                                    '${relatedVideo.title}', 
                                    '${relatedVideo.description}')">
                                <div class="d-flex gap-3">
                                    <div class="position-relative">
                                        <img src="/FileController${relatedVideo.thumbnail}" class="video-thumbnail" alt="${relatedVideo.title}">
                                        <div class="progress-indicator" style="--progress: ${relatedVideo.progress}%"></div>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="video-item-title">${relatedVideo.title}</h6>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
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
        }
    </script>
</body>
</html>
