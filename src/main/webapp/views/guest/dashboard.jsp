<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/guest/header.jsp" %>

    <style>
        .feature-icon {
            font-size: 2rem;
            height: 3rem;
            width: 3rem;
            border-radius: 0.75rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .course-card {
            transition: transform 0.2s;
        }

        .course-card:hover {
            transform: translateY(-5px);
        }

        .hero-section {
            background: linear-gradient(135deg, #0061f2 0%, #00a3ff 100%);
            color: white;
            padding: 6rem 0;
            position: relative;
            overflow: hidden;
            margin-top: -72px;
            width: 100%;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100' height='100' viewBox='0 0 100 100'%3E%3Cg fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.1'%3E%3Cpath opacity='.5' d='M96 95h4v1h-4v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9zm-1 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9z'/%3E%3Cpath d='M6 5V0H5v5H0v1h5v94h1V6h94V5H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
            opacity: 0.1;
            animation: slide 50s linear infinite;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 650px;
        }

        .hero-title {
            font-size: 4rem;
            font-weight: 800;
            line-height: 1.1;
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, #ffffff, rgba(255,255,255,0.9));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            position: relative;
        }

        .hero-subtitle {
            font-size: 1.25rem;
            line-height: 1.6;
            margin-bottom: 2.5rem;
            opacity: 0.9;
            font-weight: 400;
            color: rgba(255, 255, 255, 0.9);
        }

        .hero-image-container {
            position: relative;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 30px 60px rgba(0,0,0,0.3);
            transform: perspective(1000px) rotateY(-5deg);
            transition: all 0.5s ease;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .hero-image-container:hover {
            transform: perspective(1000px) rotateY(0deg);
        }

        .hero-image {
            position: relative;
            overflow: hidden;
        }

        .hero-image img {
            width: 100%;
            height: auto;
            object-fit: cover;
            display: block;
            transition: transform 0.5s ease;
        }

        .hero-image-container:hover .hero-image img {
            transform: scale(1.05);
        }

        .hero-buttons {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .hero-button {
            padding: 1rem 2rem;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            text-decoration: none;
            position: relative;
            overflow: hidden;
        }

        .hero-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 100%);
            transform: translateX(-100%);
            transition: transform 0.5s ease;
        }

        .hero-button:hover::before {
            transform: translateX(0);
        }

        .hero-button-primary {
            background: #ffffff;
            color: #0061f2;
        }

        .hero-button-primary:hover {
            background: #f8f9fa;
            color: #0052cc;
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .hero-button-secondary {
            background: transparent;
            color: #ffffff;
            border: 2px solid rgba(255, 255, 255, 0.3);
        }

        .hero-button-secondary:hover {
            border-color: #ffffff;
            transform: translateY(-2px);
        }

        @keyframes slide {
            0% { background-position: 0 0; }
            100% { background-position: 100% 100%; }
        }

        @media (max-width: 768px) {
            .hero-section {
                padding: 5rem 0 3rem;
            }
            
            .hero-title {
                font-size: 2.5rem;
            }

            .hero-subtitle {
                font-size: 1.125rem;
            }

            .hero-image-container {
                margin-top: 3rem;
                transform: none;
            }

            .hero-buttons {
                flex-direction: column;
                justify-content: center;
            }

            .hero-button {
                width: 100%;
                justify-content: center;
            }
        }

        .stats-box {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 1rem;
            padding: 1.5rem;
            backdrop-filter: blur(10px);
        }

        .category-card {
            border: none;
            border-radius: 1rem;
            overflow: hidden;
            transition: all 0.3s ease;
            padding: 1.5rem !important;
        }

        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .category-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .search-box {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 2rem;
            padding: 2rem;
            backdrop-filter: blur(10px);
            margin-top: -50px;
            position: relative;
            z-index: 1;
        }

        .trending-tag {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 1rem;
            padding: 0.5rem 1rem;
            margin: 0.25rem;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .trending-tag:hover {
            background: rgba(255, 255, 255, 0.3);
            color: white;
        }

        /* New styles */
        .testimonial-card {
            background: linear-gradient(45deg, #ffffff 0%, #f8f9fa 100%);
            border: none;
            border-radius: 1.5rem;
            overflow: hidden;
            transition: all 0.3s ease;
            padding: 1.5rem !important;
        }

        .testimonial-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }

        .student-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 4px solid #fff;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .highlight-card {
            border: none;
            border-radius: 1.5rem;
            overflow: hidden;
            background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 100%);
            transition: all 0.3s ease;
        }

        .highlight-card:hover {
            transform: scale(1.03);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .highlight-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            background: linear-gradient(135deg, #0061f2 0%, #00a3ff 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .counter-box {
            background: white;
            padding: 1.5rem;
            border-radius: 20px;
            color: #2d3436;
            text-align: center;
            transition: all 0.3s ease;
            border: 1px solid rgba(0,97,242,0.1);
            position: relative;
            overflow: hidden;
        }

        .counter-box::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #0061f2, #00a3ff);
        }

        .counter-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,97,242,0.1);
        }

        .counter-icon {
            font-size: 2.5rem;
            color: #0061f2;
            margin-bottom: 1.5rem;
            display: inline-block;
            padding: 1rem;
            border-radius: 15px;
            background: rgba(0,97,242,0.1);
        }

        .counter-number {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            background: linear-gradient(90deg, #0061f2, #00a3ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-family: 'Inter', sans-serif;
        }

        .counter-label {
            font-size: 1.1rem;
            color: #64748b;
            font-weight: 500;
        }

        .section-dark {
            background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 100%);
            color: #2d3436;
        }

        .benefit-card {
            border: 2px solid #e9ecef;
            border-radius: 1rem;
            padding: 1.25rem;
            transition: all 0.3s ease;
            cursor: pointer;
            height: 100%;
        }

        .benefit-card:hover {
            border-color: #0061f2;
            background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 100%);
            transform: translateY(-5px);
        }

        .animated-bg {
            position: relative;
            overflow: hidden;
        }

        .animated-bg::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(255,255,255,0.1) 25%, transparent 25%, transparent 50%, rgba(255,255,255,0.1) 50%, rgba(255,255,255,0.1) 75%, transparent 75%, transparent);
            background-size: 100px 100px;
            animation: slide 20s linear infinite;
            opacity: 0.5;
        }

        @keyframes slide {
            0% { background-position: 0 0; }
            100% { background-position: 1000px 0; }
        }

        /* Add new styles for section containers */
        .section-full {
            width: 100%;
            padding: 3rem 0;
        }

        .section-contained {
            max-width: 1320px;
            margin: 0 auto;
            padding: 0 15px;
        }

        .section-light {
            background-color: #f8f9fa;
        }

        .section-dark {
            background-color: #0061f2;
            color: white;
        }

        /* Update section margins */
        .section-full h2.text-center {
            margin-bottom: 2rem !important;
        }

        /* Update call to action section spacing */
        .section-full.section-light {
            padding: 2.5rem 0;
        }

        /* Add teacher section styles */
        .teacher-section {
            background: linear-gradient(135deg, #0061f2 0%, #00a3ff 100%);
            color: white;
            position: relative;
            overflow: hidden;
        }

        .teacher-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3z' fill='rgba(255,255,255,0.1)' fill-rule='evenodd'/%3E%3C/svg%3E");
            opacity: 0.1;
        }

        .teacher-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 2rem;
            height: 100%;
            display: flex;
            flex-direction: column;
            transition: all 0.3s ease;
        }

        .teacher-card .card-content {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .teacher-card .benefits-list {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            margin: 1.5rem 0;
        }

        .teacher-card .text-center {
            margin-top: auto;
        }

        .teacher-card:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.15);
            border-color: rgba(255, 255, 255, 0.3);
        }

        .teacher-icon {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: white;
            background: rgba(255, 255, 255, 0.1);
            width: 80px;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.2);
        }

        .teacher-card h4 {
            color: white;
            margin-bottom: 1rem;
            font-weight: 600;
        }

        .teacher-card p {
            color: rgba(255, 255, 255, 0.9);
            font-size: 0.95rem;
            margin-bottom: 1.5rem;
        }

        .teacher-btn {
            background: white;
            color: #0061f2;
            border: none;
            padding: 0.8rem 2rem;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .teacher-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            background: #f8f9fa;
            color: #0052cc;
        }

        /* Success Counter Section Styles */
        .stats-section {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            padding: 5rem 0;
            position: relative;
            overflow: hidden;
        }

        .stats-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%230061f2' fill-opacity='0.05'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        }

        .stats-card {
            background: white;
            border-radius: 24px;
            padding: 2.5rem;
            text-align: center;
            position: relative;
            transition: all 0.3s ease;
            border: 1px solid rgba(0,97,242,0.1);
            overflow: hidden;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .stats-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #0061f2, #00a3ff);
            opacity: 0;
            transition: all 0.3s ease;
        }

        .stats-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,97,242,0.1);
        }

        .stats-card:hover::before {
            opacity: 1;
        }

        .stats-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, rgba(0,97,242,0.1) 0%, rgba(0,163,255,0.1) 100%);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2.5rem;
            color: #0061f2;
            transform: rotate(-5deg);
            transition: all 0.3s ease;
            flex-shrink: 0;
        }

        .stats-card:hover .stats-icon {
            transform: rotate(0deg) scale(1.1);
            background: linear-gradient(135deg, rgba(0,97,242,0.2) 0%, rgba(0,163,255,0.2) 100%);
        }

        .stats-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 100%;
        }

        .stats-number {
            font-size: 3.5rem;
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 0.5rem;
            background: linear-gradient(90deg, #0061f2, #00a3ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-family: 'Inter', sans-serif;
        }

        .stats-label {
            font-size: 1.1rem;
            color: #64748b;
            font-weight: 500;
            margin: 0;
            margin-bottom: 1rem;
        }

        .stats-description {
            color: #94a3b8;
            font-size: 0.9rem;
            line-height: 1.6;
            margin: 0;
        }
    </style>
        <!-- Home Hero Section -->
        <section class="hero-section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="hero-content">
                            <h1 class="hero-title">Transform Your Future with Infinity Learn</h1>
                            <p class="hero-subtitle">Join our global community of learners and master the skills that will shape tomorrow's technology landscape.</p>
                            <div class="hero-buttons">
                                <a href="/register" class="hero-button hero-button-primary">
                                    <i class="bi bi-rocket-takeoff"></i>
                                    Start Learning
                                </a>
                                <a href="/guest/course/list" class="hero-button hero-button-secondary">
                                    <i class="bi bi-collection-play"></i>
                                    Browse Courses
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="hero-image-container">
                            <div class="hero-image">
                                <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80" 
                                     alt="Students Learning" class="img-fluid">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Course Categories -->
        <section class="section-full">
            <div class="container">
                <h2 class="text-center mb-5">Explore Course Categories</h2>
                <div class="row g-4">
                    <div class="col-md-3">
                        <div class="category-card card text-center p-4">
                            <div class="category-icon text-primary">
                                <i class="bi bi-code-square"></i>
                            </div>
                            <h5>Programming</h5>
                            <p class="text-muted small mb-0">150+ Courses</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="category-card card text-center p-4">
                            <div class="category-icon text-success">
                                <i class="bi bi-graph-up"></i>
                            </div>
                            <h5>Data Science</h5>
                            <p class="text-muted small mb-0">80+ Courses</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="category-card card text-center p-4">
                            <div class="category-icon text-info">
                                <i class="bi bi-palette"></i>
                            </div>
                            <h5>Design</h5>
                            <p class="text-muted small mb-0">120+ Courses</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="category-card card text-center p-4">
                            <div class="category-icon text-warning">
                                <i class="bi bi-briefcase"></i>
                            </div>
                            <h5>Business</h5>
                            <p class="text-muted small mb-0">90+ Courses</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Success Counter -->
        <section class="stats-section">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6">
                        <div class="stats-card">
                            <div class="stats-icon">
                                <i class="bi bi-people-fill"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-number">50,000+</div>
                                <h3 class="stats-label">Active Students</h3>
                                <p class="stats-description">Learners actively pursuing their goals on our platform</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="stats-card">
                            <div class="stats-icon">
                                <i class="bi bi-collection-play"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-number">1,000+</div>
                                <h3 class="stats-label">Video Lessons</h3>
                                <p class="stats-description">High-quality video content across all courses</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="stats-card">
                            <div class="stats-icon">
                                <i class="bi bi-star-fill"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-number">4.8</div>
                                <h3 class="stats-label">Average Rating</h3>
                                <p class="stats-description">Consistently high satisfaction from our students</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="stats-card">
                            <div class="stats-icon">
                                <i class="bi bi-trophy-fill"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-number">95%</div>
                                <h3 class="stats-label">Success Rate</h3>
                                <p class="stats-description">Students achieving their learning objectives</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Popular Courses -->
        <section id="courses" class="section-full">
            <div class="container">
                <h2 class="text-center mb-5">Popular Courses</h2>
                <div class="row g-4">
                    <!-- Course 1 -->
                    <div class="col-md-4">
                        <div class="card h-100 border-0 shadow-sm course-card">
                            <img src="https://placehold.co/600x400/007bff/white?text=Web+Development" class="card-img-top" alt="Web Development">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="badge bg-primary">Beginner</span>
                                    <small class="text-muted">8 weeks</small>
                                </div>
                                <h5 class="card-title">Complete Web Development Bootcamp</h5>
                                <p class="card-text text-muted">Learn HTML, CSS, JavaScript, React, and more.</p>
                            </div>
                            <div class="card-footer bg-white border-0">
                                <a th:href="@{/register}" class="btn btn-outline-primary w-100">Enroll Now</a>
                            </div>
                        </div>
                    </div>

                    <!-- Course 2 -->
                    <div class="col-md-4">
                        <div class="card h-100 border-0 shadow-sm course-card">
                            <img src="https://placehold.co/600x400/28a745/white?text=Data+Science" class="card-img-top" alt="Data Science">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="badge bg-success">Intermediate</span>
                                    <small class="text-muted">10 weeks</small>
                                </div>
                                <h5 class="card-title">Data Science Fundamentals</h5>
                                <p class="card-text text-muted">Master Python, pandas, and machine learning basics.</p>
                            </div>
                            <div class="card-footer bg-white border-0">
                                <a th:href="@{/register}" class="btn btn-outline-primary w-100">Enroll Now</a>
                            </div>
                        </div>
                    </div>

                    <!-- Course 3 -->
                    <div class="col-md-4">
                        <div class="card h-100 border-0 shadow-sm course-card">
                            <img src="https://placehold.co/600x400/dc3545/white?text=UI+Design" class="card-img-top" alt="UI Design">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="badge bg-danger">Advanced</span>
                                    <small class="text-muted">6 weeks</small>
                                </div>
                                <h5 class="card-title">UI/UX Design Masterclass</h5>
                                <p class="card-text text-muted">Create beautiful and user-friendly interfaces.</p>
                            </div>
                            <div class="card-footer bg-white border-0">
                                <a th:href="@{/register}" class="btn btn-outline-primary w-100">Enroll Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Student Testimonials -->
        <section class="section-full section-light">
            <div class="container">
                <h2 class="text-center mb-5">What Our Students Say</h2>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="testimonial-card card p-4">
                            <div class="text-center mb-4">
                                <img src="https://placehold.co/200x200/007bff/white?text=J" class="student-avatar" alt="John">
                                <h5 class="mt-3 mb-1">John Smith</h5>
                                <p class="text-muted small">Web Development Graduate</p>
                            </div>
                            <p class="text-muted">"The course content was exceptional. I went from knowing nothing about web development to landing my dream job in just 6 months!"</p>
                            <div class="text-warning mt-3">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="testimonial-card card p-4">
                            <div class="text-center mb-4">
                                <img src="https://placehold.co/200x200/28a745/white?text=S" class="student-avatar" alt="Sarah">
                                <h5 class="mt-3 mb-1">Sarah Johnson</h5>
                                <p class="text-muted small">Data Science Student</p>
                            </div>
                            <p class="text-muted">"The hands-on projects and real-world applications made learning complex concepts much easier. Highly recommended!"</p>
                            <div class="text-warning mt-3">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-half"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="testimonial-card card p-4">
                            <div class="text-center mb-4">
                                <img src="https://placehold.co/200x200/dc3545/white?text=M" class="student-avatar" alt="Michael">
                                <h5 class="mt-3 mb-1">Michael Chen</h5>
                                <p class="text-muted small">UI/UX Design Professional</p>
                            </div>
                            <p class="text-muted">"The instructor's expertise and the community support made my learning journey enjoyable and effective."</p>
                            <div class="text-warning mt-3">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Benefits Section -->
        <section class="section-full">
            <div class="container">
                <h2 class="text-center mb-5">Benefits of Learning with Us</h2>
                <div class="row g-4">
                    <div class="col-md-3">
                        <div class="benefit-card text-center">
                            <i class="bi bi-clock display-4 text-primary mb-3"></i>
                            <h5>Flexible Schedule</h5>
                            <p class="text-muted small mb-0">Learn at your own pace, on your own time</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="benefit-card text-center">
                            <i class="bi bi-chat-dots display-4 text-primary mb-3"></i>
                            <h5>1-on-1 Mentoring</h5>
                            <p class="text-muted small mb-0">Personal guidance from expert mentors</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="benefit-card text-center">
                            <i class="bi bi-laptop display-4 text-primary mb-3"></i>
                            <h5>Hands-on Projects</h5>
                            <p class="text-muted small mb-0">Build real-world portfolio projects</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="benefit-card text-center">
                            <i class="bi bi-people display-4 text-primary mb-3"></i>
                            <h5>Community Support</h5>
                            <p class="text-muted small mb-0">Join a community of learners</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Teacher Application Section -->
        <section class="section-full teacher-section">
            <div class="container">
                <div class="row align-items-stretch g-4">
                    <div class="col-lg-6">
                        <h2 class="mb-4">Join Our Teaching Community</h2>
                        <p class="lead mb-4">Share your expertise and inspire the next generation of learners. Join our platform as an instructor and make a difference.</p>
                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="teacher-card">
                                    <div class="card-content">
                                        <div class="teacher-icon">
                                            <i class="bi bi-cash-stack"></i>
                                        </div>
                                        <h4>Competitive Earnings</h4>
                                        <p>Earn competitive compensation while doing what you love. Set your own course prices and reach students worldwide.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="teacher-card">
                                    <div class="card-content">
                                        <div class="teacher-icon">
                                            <i class="bi bi-tools"></i>
                                        </div>
                                        <h4>Teaching Tools</h4>
                                        <p>Access our suite of teaching tools and resources to create engaging content and deliver effective lessons.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="teacher-card">
                            <div class="card-content">
                                <div class="text-center">
                                    <div class="teacher-icon mx-auto">
                                        <i class="bi bi-mortarboard-fill"></i>
                                    </div>
                                    <h4>Become an Instructor</h4>
                                    <p>Turn your expertise into an opportunity. Create courses, share knowledge, and join our growing community of educators.</p>
                                </div>
                                <div class="benefits-list">
                                    <div class="row g-3">
                                        <div class="col-6">
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-check2-circle me-2"></i>
                                                <span>Flexible Schedule</span>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-check2-circle me-2"></i>
                                                <span>Global Reach</span>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-check2-circle me-2"></i>
                                                <span>Support Team</span>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-check2-circle me-2"></i>
                                                <span>Marketing Help</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <a href="/apply-teacher" class="teacher-btn">
                                        <i class="bi bi-person-plus"></i>
                                        Apply as Teacher
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Call to Action -->
        <section class="section-full section-light">
            <div class="container text-center">
                <h2 class="mb-4">Ready to Start Learning?</h2>
                <p class="lead mb-4">Join thousands of students already learning on Infinity Learn</p>
                <a th:href="@{/register}" class="btn btn-primary btn-lg px-5">Create Free Account</a>
            </div>
        </section>
    </main>

<%@ include file="/layouts/guest/footer.jsp" %>