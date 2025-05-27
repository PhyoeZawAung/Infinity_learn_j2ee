<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/guest/header.jsp" %>
<style>
        /* Course Header Styles */
        .course-header {
            background: linear-gradient(135deg, #0061f2 0%, #00a3ff 100%);
            padding: 4rem 0 3rem;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .course-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('/images/pattern.svg') repeat;
            opacity: 0.1;
        }

        .breadcrumb {
            background: transparent;
            padding: 0;
            margin-bottom: 2rem;
        }

        .breadcrumb-item a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
        }

        .breadcrumb-item.active {
            color: white;
        }

        .breadcrumb-item + .breadcrumb-item::before {
            color: rgba(255, 255, 255, 0.6);
        }

        .course-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .course-meta {
            display: flex;
            gap: 2rem;
            margin: 1.5rem 0;
            flex-wrap: wrap;
        }

        .meta-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: rgba(255, 255, 255, 0.9);
        }

        .meta-item i {
            font-size: 1.2rem;
        }

        .category-badges {
            margin-top: 1rem;
        }

        .category-badge {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 20px;
            padding: 0.4rem 1rem;
            margin-right: 0.5rem;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }

        .category-badge:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }

        /* Course Content Styles */
        .course-content {
            padding: 3rem 0;
        }

        .content-section {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: #1e2a35;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .section-title i {
            color: #0061f2;
        }

        /* Course Curriculum */
        .curriculum-section {
            border: 1px solid #e9ecef;
            border-radius: 8px;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }

        .curriculum-section:hover {
            border-color: #0061f2;
            box-shadow: 0 4px 12px rgba(0,97,242,0.1);
        }

        .curriculum-header {
            padding: 1.25rem;
            background: #f8f9fa;
            border-radius: 8px 8px 0 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
        }

        .curriculum-header h3 {
            margin: 0;
            font-size: 1.1rem;
            font-weight: 600;
            color: #1e2a35;
        }

        .curriculum-content {
            padding: 1rem;
        }

        .lesson-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            border-bottom: 1px solid #e9ecef;
            transition: all 0.3s ease;
        }

        .lesson-item:last-child {
            border-bottom: none;
        }

        .lesson-item:hover {
            background: #f8f9fa;
        }

        .lesson-icon {
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #e9ecef;
            border-radius: 50%;
            color: #0061f2;
        }

        .lesson-info {
            flex: 1;
        }

        .lesson-title {
            font-weight: 500;
            color: #1e2a35;
            margin-bottom: 0.25rem;
        }

        .lesson-duration {
            font-size: 0.85rem;
            color: #64748b;
        }

        /* Instructor Section */
        .instructor-card {
            display: flex;
            gap: 1.5rem;
            align-items: center;
            padding: 1.5rem;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .instructor-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            overflow: hidden;
        }

        .instructor-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .instructor-info h4 {
            margin-bottom: 0.5rem;
            color: #1e2a35;
        }

        .instructor-info p {
            color: #64748b;
            margin-bottom: 1rem;
        }

        .instructor-stats {
            display: flex;
            gap: 2rem;
            margin-top: 1rem;
        }

        .stat-item {
            text-align: center;
        }

        .stat-value {
            font-size: 1.25rem;
            font-weight: 600;
            color: #0061f2;
        }

        .stat-label {
            font-size: 0.85rem;
            color: #64748b;
        }

        /* Reviews Section */
        .review-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }

        .review-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .reviewer-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .reviewer-avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            overflow: hidden;
        }

        .reviewer-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .reviewer-name {
            font-weight: 600;
            color: #1e2a35;
            margin-bottom: 0.25rem;
        }

        .review-date {
            color: #64748b;
            font-size: 0.9rem;
        }

        .rating-stars {
            color: #ffc107;
            font-size: 1.1rem;
        }

        .review-content {
            color: #64748b;
            line-height: 1.6;
        }

        /* Enrollment Card */
        .enrollment-card {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            margin-top: 2rem;
        }

        .enrollment-card.sticky-top {
            z-index: 100;
            background: white;
            transition: all 0.3s ease;
        }

        @media (max-width: 991px) {
            .enrollment-card.sticky-top {
                position: relative !important;
                top: 0 !important;
                margin-top: 2rem;
                margin-bottom: 2rem;
            }
        }

        .course-price {
            font-size: 2.5rem;
            font-weight: 700;
            color: #1e2a35;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .enrollment-features {
            list-style: none;
            padding: 0;
            margin: 2rem 0;
        }

        .enrollment-features li {
            padding: 0.75rem 0;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            color: #64748b;
            border-bottom: 1px solid #e9ecef;
        }

        .enrollment-features li:last-child {
            border-bottom: none;
        }

        .enrollment-features i {
            color: #0061f2;
            font-size: 1.1rem;
        }

        .enroll-btn {
            width: 100%;
            padding: 1rem;
            font-size: 1.1rem;
            margin-bottom: 1rem;
            border-radius: 8px;
        }

        .money-back {
            text-align: center;
            color: #64748b;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        @media (max-width: 768px) {
            .course-header {
                padding: 2rem 0;
            }

            .course-title {
                font-size: 2rem;
            }

            .course-meta {
                flex-direction: column;
                gap: 1rem;
            }

            .instructor-card {
                flex-direction: column;
                text-align: center;
                padding: 1rem;
            }

            .instructor-stats {
                justify-content: center;
            }

            .enrollment-card {
                position: static;
                margin-bottom: 2rem;
            }
        }
    </style>
</head>

<body>
    <div layout:fragment="content">
        <!-- Course Header -->
        <section class="course-header">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/guest/course/list">Courses</a></li>
                        <li class="breadcrumb-item active">${course.title}</li>
                    </ol>
                </nav>
                
                <div class="row align-items-center">
                    <div class="col-lg-8">
                        <h1 class="course-title" >${course.title}</h1>
                        <p class="lead mb-0" >${course.shortDescription}</p>
                        
                        <div class="course-meta">
                            <div class="meta-item">
                                <i class="bi bi-clock"></i>
                                <span >20 Hours</span>
                            </div>
                            <div class="meta-item">
                                <i class="bi bi-people"></i>
                                <span >${enrolledCount} Students</span>
                            </div>
                            <div class="meta-item">
                                <i class="bi bi-star-fill"></i>
                                <span>4.8</span>
                                <span></span>
                            </div>
                            <div class="meta-item">
                                <i class="bi bi-translate"></i>
                                <span>English</span>
                            </div>
                        </div>

                        <div class="category-badges">
                            <span 
                                  class="category-badge" 
                                  >${course.category}</span>
                        </div>
                    </div>
                    <div class="col-lg-4">
                    <c:if test="${course.banner_image == null}">
                        <img src="https://placehold.co/600x400?text=No+Image" 
                             class="img-fluid rounded-3" 
                             alt="${course.title}">
                    </c:if>
                    <c:if test="${course.banner_image != null}">
                        <img src="/FileController${course.banner_image}" 
                             class="img-fluid rounded-3" 
                             alt="${course.title}">
                    </c:if>
                    </div>
                </div>
            </div>
        </section>

        <!-- Course Content -->
        <section class="course-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <!-- Course Description -->
                        <div class="content-section">
                            <h2 class="section-title">
                                <i class="bi bi-info-circle"></i>
                                Course Description
                            </h2>
                            <div class="course-description">
                                ${course.description}
                            </div>
                        </div>

                        <!-- Course Curriculum -->
                        <div class="content-section">
                            <h2 class="section-title">
                                <i class="bi bi-journal-text"></i>
                                Course Curriculum
                            </h2>
                            <div class="curriculum-sections">
                                <c:forEach items="${course.lessons}" var="section">
                                    <div class="curriculum-section">
                                        <div class="curriculum-header" data-bs-toggle="collapse" 
                                         data-bs-target="#section${section.id}">
                                        <h3>${section.title}</h3>
                                        <span>2 hours</span>
                                    </div>
                                    <div class="curriculum-content collapse" id="section${section.id}">
                                        <c:forEach items="${section.lessonVideos}" var="video">
                                            <div class="lesson-item">
                                                <div class="lesson-icon">
                                                    <i class="bi bi-play-circle"></i>
                                                </div>
                                                <div class="lesson-info">
                                                    <div class="lesson-title">${video.title}</div>
                                                    <div class="lesson-duration">15 minutes</div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        
                                    </div>
                                    </div>
                                </c:forEach>
                                
                            </div>
                        </div>

                        <!-- Instructor -->
                        <div class="content-section">
                            <h2 class="section-title">
                                <i class="bi bi-person-video3"></i>
                                Your Instructor
                            </h2>
                            <div class="instructor-card">
                                <div class="instructor-avatar">
                                    <img src="/FileController${instructor.profile_image}" 
                                         alt="${instructor.firstName}"
                                         src="https://placehold.co/100x100">
                                </div>
                                <div class="instructor-info">
                                    <h4 >${instructor.firstName} ${instructor.lastName}</h4>
                                    <%-- <p class="instructor-title" th:text="${instructor.title}">Professional Title</p>
                                    <p class="instructor-bio" th:text="${instructor.bio}">Instructor bio</p>
                                    <div class="instructor-stats">
                                        <div class="stat-item">
                                            <div class="stat-value" th:text="${instructor.totalStudents}">10K+</div>
                                            <div class="stat-label">Students</div>
                                        </div>
                                        <div class="stat-item">
                                            <div class="stat-value" th:text="${instructor.totalCourses}">15</div>
                                            <div class="stat-label">Courses</div>
                                        </div>
                                        <div class="stat-item">
                                            <div class="stat-value" th:text="${instructor.rating}">4.9</div>
                                            <div class="stat-label">Rating</div>
                                        </div>
                                    </div> --%>
                                </div>
                            </div>
                        </div>

                        <!-- Reviews -->
                        <%-- <div class="content-section">
                            <h2 class="section-title">
                                <i class="bi bi-star"></i>
                                Student Reviews
                            </h2>
                            
                            <!-- Reviews List -->
                            <div th:if="${!#lists.isEmpty(course.reviews)}">
                                <div th:each="review : ${course.reviews}" class="review-card">
                                    <div class="review-header">
                                        <div class="reviewer-info">
                                            <div class="reviewer-avatar">
                                                <img th:src="${review.user.profilePictureUrl}" 
                                                     th:alt="${review.user.name}"
                                                     src="https://placehold.co/48x48">
                                            </div>
                                            <div>
                                                <div class="reviewer-name" th:text="${review.user.name}">Reviewer Name</div>
                                                <div class="review-date" 
                                                     th:text="${#temporals.format(review.createdAt, 'dd MMM yyyy')}">
                                                    Review Date
                                                </div>
                                            </div>
                                        </div>
                                        <div class="rating-stars">
                                            <th:block th:each="i : ${#numbers.sequence(1, 5)}">
                                                <i th:class="${i <= review.rating ? 'bi bi-star-fill' : 'bi bi-star'}"></i>
                                            </th:block>
                                        </div>
                                    </div>
                                    <div class="review-content" th:text="${review.content}">Review Content</div>
                                </div>
                            </div>
                            
                            <!-- Empty Reviews State -->
                            <div th:if="${#lists.isEmpty(course.reviews)}" 
                                 class="text-center py-4">
                                <i class="bi bi-chat-square-text display-4 text-muted"></i>
                                <p class="text-muted mt-3">No reviews yet. Be the first to review this course!</p>
                            </div>
                        </div> --%>
                    </div>
                    
                    <!-- Sidebar -->
                    <div class="col-lg-4">
                        <div class="enrollment-card sticky-top" style="top: 20px;">
                            <div class="course-price">$ ${course.price}</div>
                            
                            <ul class="enrollment-features">
                                <li>
                                    <i class="bi bi-play-circle"></i>
                                    <%-- <span th:text="${course.totalHours + ' hours of video content'}"></span> --%>
                                </li>
                                <li>
                                    <i class="bi bi-file-earmark-text"></i>
                                    <span>Downloadable resources</span>
                                </li>
                                <li>
                                    <i class="bi bi-trophy"></i>
                                    <span>Certificate of completion</span>
                                </li>
                                <li>
                                    <i class="bi bi-infinity"></i>
                                    <span>Lifetime access</span>
                                </li>
                                <li>
                                    <i class="bi bi-phone"></i>
                                    <span>Access on mobile and TV</span>
                                </li>
                            </ul>

                            <form method="post" action="/student/enroll">
                                <input type="hidden" name="course_id" value="${course.id}" />
                                <button type="submit" class="btn btn-primary enroll-btn">Enroll Now</button>
                            </form>

                          

                            <div class="money-back">
                                <i class="bi bi-shield-check"></i>
                                30-day money-back guarantee
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- Additional JavaScript -->
    
        <script>
            // Initialize all collapse elements
            document.addEventListener('DOMContentLoaded', function() {
                // Show first curriculum section by default
                const firstSection = document.querySelector('.curriculum-content');
                if (firstSection) {
                    firstSection.classList.add('show');
                }
            });
        </script>
    
<%@ include file="/layouts/guest/footer.jsp" %>