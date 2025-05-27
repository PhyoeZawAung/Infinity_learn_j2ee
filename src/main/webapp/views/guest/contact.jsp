<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/guest/header.jsp" %>
<style>
        .contact-hero {
            background: linear-gradient(135deg, #0061f2 0%, #00a3ff 100%);
            color: white;
            padding: 6rem 0;
            position: relative;
            overflow: hidden;
            margin-top: -72px;
        }

        .contact-hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.05'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
            opacity: 0.1;
        }

        .contact-form {
            background: white;
            border-radius: 24px;
            padding: 3rem;
            box-shadow: 0 20px 40px rgba(0,97,242,0.1);
            margin-top: -100px;
            position: relative;
            z-index: 1;
        }

        .contact-info-card {
            background: white;
            border-radius: 24px;
            padding: 2rem;
            height: 100%;
            transition: all 0.3s ease;
            border: 1px solid rgba(0,97,242,0.1);
        }

        .contact-info-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0,97,242,0.1);
        }

        .contact-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, rgba(0,97,242,0.1) 0%, rgba(0,163,255,0.1) 100%);
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
            color: #0061f2;
        }

        .office-card {
            background: white;
            border-radius: 24px;
            padding: 2rem;
            height: 100%;
            transition: all 0.3s ease;
            border: 1px solid rgba(0,97,242,0.1);
            text-align: center;
        }

        .office-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0,97,242,0.1);
        }

        .office-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, rgba(0,97,242,0.1) 0%, rgba(0,163,255,0.1) 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2rem;
            color: #0061f2;
        }

        .form-control {
            padding: 0.75rem 1.25rem;
            border-radius: 12px;
            border: 1px solid #e9ecef;
        }

        .form-control:focus {
            border-color: #0061f2;
            box-shadow: 0 0 0 0.2rem rgba(0,97,242,0.25);
        }

        .btn-contact {
            padding: 0.75rem 2rem;
            border-radius: 12px;
            background: linear-gradient(135deg, #0061f2 0%, #00a3ff 100%);
            border: none;
            color: white;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-contact:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,97,242,0.2);
        }

        .faq-card {
            background: white;
            border-radius: 16px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            border: 1px solid rgba(0,97,242,0.1);
            transition: all 0.3s ease;
        }

        .faq-card:hover {
            transform: translateX(5px);
            border-color: #0061f2;
        }
    </style>
</head>
<body>
    <main layout:fragment="content">
        <!-- Contact Hero Section -->
        <section class="contact-hero">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-8 mx-auto text-center">
                        <h1 class="display-4 fw-bold mb-4">Get in Touch</h1>
                        <p class="lead mb-4">Have questions? We'd love to hear from you. Send us a message and we'll respond as soon as possible.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact Form Section -->
        <section class="section-full">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <div class="contact-form">
                            <form>
                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="name" class="form-label">Your Name</label>
                                            <input type="text" class="form-control" id="name" placeholder="John Doe">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="email" class="form-label">Email Address</label>
                                            <input type="email" class="form-control" id="email" placeholder="john@example.com">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label for="subject" class="form-label">Subject</label>
                                            <input type="text" class="form-control" id="subject" placeholder="How can we help?">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label for="message" class="form-label">Message</label>
                                            <textarea class="form-control" id="message" rows="5" placeholder="Your message here..."></textarea>
                                        </div>
                                    </div>
                                    <div class="col-12 text-center">
                                        <button type="submit" class="btn btn-contact">Send Message</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact Information -->
        <section class="section-full">
            <div class="container">
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="contact-info-card">
                            <div class="contact-icon">
                                <i class="bi bi-envelope"></i>
                            </div>
                            <h4>Email Us</h4>
                            <p class="text-muted mb-2">For general inquiries:</p>
                            <a href="mailto:info@infinitylearn.com" class="text-primary">info@infinitylearn.com</a>
                            <p class="text-muted mb-2 mt-3">For support:</p>
                            <a href="mailto:support@infinitylearn.com" class="text-primary">support@infinitylearn.com</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-info-card">
                            <div class="contact-icon">
                                <i class="bi bi-telephone"></i>
                            </div>
                            <h4>Call Us</h4>
                            <p class="text-muted mb-2">Monday to Friday, 9am to 6pm</p>
                            <a href="tel:+1234567890" class="text-primary">+1 (234) 567-890</a>
                            <p class="text-muted mb-2 mt-3">24/7 Technical Support:</p>
                            <a href="tel:+1234567899" class="text-primary">+1 (234) 567-899</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-info-card">
                            <div class="contact-icon">
                                <i class="bi bi-chat-dots"></i>
                            </div>
                            <h4>Live Chat</h4>
                            <p class="text-muted mb-3">Chat with our support team in real-time</p>
                            <button class="btn btn-outline-primary">Start Chat</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Office Locations -->
        <section class="section-full bg-light">
            <div class="container">
                <h2 class="text-center mb-5">Our Offices</h2>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="office-card">
                            <div class="office-icon">
                                <i class="bi bi-building"></i>
                            </div>
                            <h4>New York</h4>
                            <p class="text-muted">123 Business Avenue<br>New York, NY 10001<br>United States</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="office-card">
                            <div class="office-icon">
                                <i class="bi bi-building"></i>
                            </div>
                            <h4>London</h4>
                            <p class="text-muted">456 Tech Street<br>London, SW1A 1AA<br>United Kingdom</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="office-card">
                            <div class="office-icon">
                                <i class="bi bi-building"></i>
                            </div>
                            <h4>Singapore</h4>
                            <p class="text-muted">789 Innovation Road<br>Singapore, 018956<br>Singapore</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- FAQs -->
        <section class="section-full">
            <div class="container">
                <h2 class="text-center mb-5">Frequently Asked Questions</h2>
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <div class="faq-card">
                            <h5>How can I enroll in a course?</h5>
                            <p class="text-muted mb-0">Simply browse our course catalog, select your desired course, and click the "Enroll Now" button. You'll be guided through the registration process.</p>
                        </div>
                        <div class="faq-card">
                            <h5>What payment methods do you accept?</h5>
                            <p class="text-muted mb-0">We accept all major credit cards, PayPal, and bank transfers. Payment plans are available for selected courses.</p>
                        </div>
                        <div class="faq-card">
                            <h5>How can I become an instructor?</h5>
                            <p class="text-muted mb-0">Visit our "Become an Instructor" page to learn about our requirements and application process.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
<%@ include file="/layouts/guest/footer.jsp" %>