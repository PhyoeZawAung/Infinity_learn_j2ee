<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/guest/header.jsp" %>
    <style>
        .about-hero {
            background: linear-gradient(135deg, #0061f2 0%, #00a3ff 100%);
            color: white;
            padding: 6rem 0;
            position: relative;
            overflow: hidden;
            margin-top: -72px;
        }

        .about-hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.05'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
            opacity: 0.1;
        }

        .about-card {
            background: white;
            border-radius: 24px;
            padding: 2.5rem;
            height: 100%;
            transition: all 0.3s ease;
            border: 1px solid rgba(0,97,242,0.1);
        }

        .about-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0,97,242,0.1);
        }

        .value-icon {
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
        }

        .team-member {
            text-align: center;
            margin-bottom: 2rem;
        }

        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 1rem;
            border: 4px solid white;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .stats-row {
            background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 100%);
            padding: 4rem 0;
            border-radius: 24px;
            margin: 3rem 0;
        }

        .milestone {
            text-align: center;
            padding: 2rem;
        }

        .milestone-number {
            font-size: 3rem;
            font-weight: 700;
            color: #0061f2;
            margin-bottom: 0.5rem;
        }

        .milestone-text {
            color: #64748b;
            font-size: 1.1rem;
        }
    </style>
</head>
<body>
    <main layout:fragment="content">
        <!-- About Hero Section -->
        <section class="about-hero">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-8 mx-auto text-center">
                        <h1 class="display-4 fw-bold mb-4">About Infinity Learn</h1>
                        <p class="lead mb-4">Empowering learners worldwide with quality education and innovative learning solutions.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Our Story Section -->
        <section class="section-full">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-6">
                        <div class="about-card">
                            <h2 class="mb-4">Our Story</h2>
                            <p class="lead text-muted">Founded in 2023, Infinity Learn began with a simple mission: to make quality education accessible to everyone, everywhere.</p>
                            <p class="text-muted">What started as a small team of passionate educators has grown into a global platform, connecting learners with expert instructors across various disciplines. Our journey is driven by the belief that education should be engaging, effective, and available to all.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="about-card">
                            <h2 class="mb-4">Our Mission</h2>
                            <p class="lead text-muted">To transform lives through accessible, high-quality education and foster a community of lifelong learners.</p>
                            <p class="text-muted">We strive to create an environment where students can discover their potential, develop new skills, and achieve their career goals. Through innovative technology and expert instruction, we're making education more engaging and effective than ever before.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Key Milestones -->
        <section class="section-full">
            <div class="container">
                <div class="stats-row">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="milestone">
                                <div class="milestone-number">50K+</div>
                                <div class="milestone-text">Active Students</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="milestone">
                                <div class="milestone-number">200+</div>
                                <div class="milestone-text">Expert Instructors</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="milestone">
                                <div class="milestone-number">1000+</div>
                                <div class="milestone-text">Video Lessons</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="milestone">
                                <div class="milestone-number">95%</div>
                                <div class="milestone-text">Success Rate</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Our Values -->
        <section class="section-full bg-light">
            <div class="container">
                <h2 class="text-center mb-5">Our Values</h2>
                <div class="row g-4">
                    <div class="col-md-3">
                        <div class="about-card text-center">
                            <div class="value-icon">
                                <i class="bi bi-lightbulb"></i>
                            </div>
                            <h4>Innovation</h4>
                            <p class="text-muted">Embracing new technologies and teaching methods to enhance learning experiences.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="about-card text-center">
                            <div class="value-icon">
                                <i class="bi bi-people"></i>
                            </div>
                            <h4>Community</h4>
                            <p class="text-muted">Building strong connections between learners and educators worldwide.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="about-card text-center">
                            <div class="value-icon">
                                <i class="bi bi-star"></i>
                            </div>
                            <h4>Excellence</h4>
                            <p class="text-muted">Maintaining high standards in education and student support.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="about-card text-center">
                            <div class="value-icon">
                                <i class="bi bi-shield-check"></i>
                            </div>
                            <h4>Integrity</h4>
                            <p class="text-muted">Operating with transparency and ethical principles in all we do.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Leadership Team -->
        <section class="section-full">
            <div class="container">
                <h2 class="text-center mb-5">Our Leadership Team</h2>
                <div class="row">
                    <div class="col-md-3">
                        <div class="team-member">
                            <img src="https://placehold.co/300x300/007bff/white?text=J" alt="John Doe">
                            <h5>John Doe</h5>
                            <p class="text-muted">CEO & Founder</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="team-member">
                            <img src="https://placehold.co/300x300/28a745/white?text=S" alt="Sarah Smith">
                            <h5>Sarah Smith</h5>
                            <p class="text-muted">Head of Education</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="team-member">
                            <img src="https://placehold.co/300x300/dc3545/white?text=M" alt="Mike Johnson">
                            <h5>Mike Johnson</h5>
                            <p class="text-muted">Tech Lead</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="team-member">
                            <img src="https://placehold.co/300x300/ffc107/white?text=A" alt="Anna Lee">
                            <h5>Anna Lee</h5>
                            <p class="text-muted">Operations Director</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Join Us CTA -->
        <section class="section-full bg-light">
            <div class="container text-center">
                <h2 class="mb-4">Join Our Learning Community</h2>
                <p class="lead mb-4">Be part of our mission to transform education worldwide</p>
                <a th:href="@{/register}" class="btn btn-primary btn-lg px-5">Get Started Today</a>
            </div>
        </section>
    </main>
<%@ include file="/layouts/guest/footer.jsp" %>