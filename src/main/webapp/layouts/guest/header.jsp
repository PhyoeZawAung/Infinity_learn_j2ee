<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title layout:title-pattern="$CONTENT_TITLE - Infinity Learn">Infinity Learn</title>
    
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="/layouts/guest/styles.css" rel="stylesheet">
    
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        main {
            flex: 1 0 auto;
            margin-top: 72px;
        }

        .container-fluid {
            padding-left: 0;
            padding-right: 0;
        }

        /* Modern Navigation Styles */
        .navbar {
            padding: 1rem 0;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.95) !important;
            backdrop-filter: blur(10px);
        }

        .navbar.scrolled {
            padding: 0.75rem 0;
            box-shadow: 0 2px 20px rgba(0,0,0,0.08);
            background: rgba(255, 255, 255, 0.98) !important;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            padding: 0;
        }

        .navbar-brand img {
            height: 35px;
            transition: all 0.3s ease;
        }

        .navbar.scrolled .navbar-brand img {
            height: 30px;
        }

        .navbar-nav {
            gap: 0.5rem;
        }

        .nav-item {
            position: relative;
        }

        .nav-link {
            font-weight: 500;
            color: #2d3436 !important;
            padding: 0.5rem 1rem !important;
            transition: all 0.3s ease;
            position: relative;
            font-size: 0.95rem;
        }

        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 1rem;
            background: #0061f2;
            transition: all 0.3s ease;
            opacity: 0;
        }

        .nav-link:hover,
        .nav-link.active {
            color: #0061f2 !important;
        }

        .nav-link:hover::after,
        .nav-link.active::after {
            width: calc(100% - 2rem);
            opacity: 1;
        }

        .navbar-toggler {
            border: none;
            padding: 0;
            font-size: 1.5rem;
            color: #2d3436;
            transition: all 0.3s ease;
        }

        .navbar-toggler:focus {
            box-shadow: none;
        }

        .navbar-toggler:hover {
            color: #0061f2;
        }

        .btn {
            padding: 0.6rem 1.5rem;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }

        .btn-outline-primary {
            border-width: 2px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,97,242,0.15);
        }

        /* Profile Dropdown Styles */
        .profile-dropdown {
            position: relative;
        }

        .profile-toggle {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            border: 1px solid rgba(0,97,242,0.2);
            border-radius: 12px;
            background: transparent;
            color: #2d3436;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .profile-toggle:hover {
            background: rgba(0,97,242,0.05);
            border-color: rgba(0,97,242,0.3);
        }

        .profile-toggle img {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            object-fit: cover;
        }

        .profile-toggle i {
            color: #0061f2;
            transition: transform 0.3s ease;
        }

        .profile-toggle[aria-expanded="true"] i {
            transform: rotate(180deg);
        }

        .profile-menu {
            min-width: 200px;
            padding: 0.5rem;
            border: none;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            margin-top: 0.5rem;
        }

        .profile-menu .dropdown-item {
            padding: 0.75rem 1rem;
            border-radius: 8px;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            color: #2d3436;
            transition: all 0.3s ease;
        }

        .profile-menu .dropdown-item i {
            color: #0061f2;
            font-size: 1.1rem;
        }

        .profile-menu .dropdown-item:hover {
            background: rgba(0,97,242,0.05);
            color: #0061f2;
            transform: translateX(5px);
        }

        .profile-menu .dropdown-divider {
            margin: 0.5rem 0;
            border-color: rgba(0,0,0,0.05);
        }

        /* Add active state styles for mobile */
        @media (max-width: 991.98px) {
            .navbar-collapse {
                background: white;
                padding: 1rem;
                border-radius: 12px;
                box-shadow: 0 4px 20px rgba(0,0,0,0.08);
                margin-top: 1rem;
            }

            .nav-link::after {
                left: 0;
            }

            .nav-link:hover::after,
            .nav-link.active::after {
                width: 100%;
            }

            .nav-link.active {
                background: rgba(0,97,242,0.1);
                border-radius: 8px;
            }

            .btn {
                width: 100%;
                margin: 0.25rem 0;
            }
        }

        /* Add footer styles */
        .modern-footer {
            background: linear-gradient(135deg, #1a1f37 0%, #242b42 100%);
            color: #ffffff;
            padding: 4rem 0 2rem;
            margin-top: 4rem;
            position: relative;
            overflow: hidden;
        }

        .modern-footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, rgba(255,255,255,0) 0%, rgba(255,255,255,0.2) 50%, rgba(255,255,255,0) 100%);
        }

        .footer-heading {
            color: #ffffff;
            font-weight: 600;
            margin-bottom: 1.5rem;
            font-size: 1.1rem;
        }

        .footer-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-list li {
            margin-bottom: 0.75rem;
        }

        .footer-list a {
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 0.95rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .footer-list a:hover {
            color: #ffffff;
            transform: translateX(5px);
        }

        .footer-social {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .social-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 1.2rem;
        }

        .social-icon:hover {
            background: #ffffff;
            color: #0061f2;
            transform: translateY(-3px);
        }

        .footer-bottom {
            margin-top: 3rem;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.9rem;
        }

        .footer-logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: #ffffff;
            text-decoration: none;
            margin-bottom: 1rem;
            display: inline-block;
        }

        .footer-logo:hover {
            color: #ffffff;
        }

        .footer-description {
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container">
            <a class="navbar-brand"href="/index">
                <img src="/layouts/guest/logo.svg" alt="Infinity Learn">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <i class="bi bi-list"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                        <a class="nav-link ${active_nav == 'index' ? 'active' : ''}" href="/index" >Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${active_nav == 'course' ? 'active' : ''}" href="/guest/course/list" >Courses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${active_nav == 'about' ? 'active' : ''}" href="/about" >About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${active_nav == 'contact' ? 'active' : ''}" href="/contact-us">Contact</a>
                    </li>
                </ul>
                <c:if test="${empty auth_user}">
                    <div class="d-flex gap-2" sec:authorize="!isAuthenticated()">
                        <a href="/login" class="btn btn-outline-primary">Login</a>
                        <a href="/register" class="btn btn-primary">Register</a>
                    </div>
                </c:if>
                <c:if test="${not empty auth_user}">
                <div class="profile-dropdown">
                    <button class="profile-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="${auth_user.profile_image != null ? auth_user.profile_image : '/images/default-profile.png'}"
                             alt="Profile" class="profile-img">
                        <span >${auth_user.firstName} ${auth_user.lastName}</span> 
                        <i class="bi bi-chevron-down"></i>
                    </button>
                    <ul class="dropdown-menu profile-menu">
                        <li>
                            <a class="dropdown-item" href="/dashboard">
                                <i class="bi bi-speedometer2"></i>
                                Dashboard
                            </a>
                        </li>
                       
                        <li>
                            <a class="dropdown-item" href="/profile">
                                <i class="bi bi-person"></i>
                                My Profile
                            </a>
                        </li>
                        
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <form action="/logout" method="post" style="margin: 0;">
                                <button type="submit" class="dropdown-item">
                                    <i class="bi bi-box-arrow-right"></i>
                                    Logout
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
                </c:if>
                
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="container-fluid p-0">
        <div>
            <!-- Page content will be inserted here -->
 