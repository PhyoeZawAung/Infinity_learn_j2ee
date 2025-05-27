<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/guest/header.jsp" %>
        <style>
            .course-card {
                height: 100%;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                border: none;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            
            .course-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            }

            .course-thumbnail {
                height: 200px;
                object-fit: cover;
            }

            .category-badge {
                position: absolute;
                top: 10px;
                right: 10px;
                background: rgba(255,255,255,0.9);
                padding: 5px 10px;
                border-radius: 20px;
                font-size: 0.8rem;
            }

            .course-stats {
                font-size: 0.9rem;
                color: #6c757d;
            }

            .search-box {
                border-radius: 50px;
                padding-left: 20px;
                padding-right: 20px;
            }

            .filter-section {
                background: #f8f9fa;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 30px;
            }
        </style>

        <div class="container py-5">
            <!-- Search and Filter Section -->
            <div class="filter-section mb-4">
                <div class="row g-3">
                    <div class="col-md-6">
                        <input type="text" class="form-control search-box" placeholder="Search courses..." th:value="${searchQuery}">
                    </div>
                    <div class="col-md-3">
                        <select class="form-select" th:value="${selectedCategory}">
                            <option value="">All Categories</option>
                            <option th:each="category : ${categories}" 
                                    th:value="${category.id}"
                                    th:text="${category.name}"
                                    th:selected="${category.id == selectedCategory}">Category</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="form-select" th:value="${selectedSort}">
                            <option value="newest" th:selected="${selectedSort == 'newest'}">Newest First</option>
                            <option value="oldest" th:selected="${selectedSort == 'oldest'}">Oldest First</option>
                            <option value="popular" th:selected="${selectedSort == 'popular'}">Most Popular</option>
                            <option value="rating" th:selected="${selectedSort == 'rating'}">Highest Rated</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Courses Grid -->
            <div class="row g-4">
                <!-- Course Card -->
				<c:forEach items="${courses}" var="course">
					<div class="col-md-6 col-lg-4">
					<div class="card course-card">
						<c:if test="${course.banner_image == null}">
							<img src="https://placehold.co/600x400?text=No+Image" 
								 class="card-img-top course-thumbnail" 
								 alt="${course.title}">
						</c:if>
						<c:if test="${course.banner_image != null}">
                        <img src="/FileController/${course.banner_image}" 
                             class="card-img-top course-thumbnail" 
                             alt="${course.title}">
                        </c:if>
                        <span class="category-badge">${course.category}</span>
                        <div class="card-body">
                            <h5 class="card-title">${course.title}</h5>
                            <p class="card-text text-truncate">
                                ${course.shortDescription}
                            </p>
                            <div class="course-stats d-flex justify-content-between align-items-center mb-3">
                                <%-- <span>
                                    <i class="fas fa-users"></i>
                                    <span th:text="${course.enrollmentCount + ' students'}">100 students</span>
                                </span>
                                <span>
                                    <i class="fas fa-star text-warning"></i>
                                    <span th:text="${course.rating + ' (' + course.reviewCount + ')'}">4.5 (50)</span>
                                </span> --%>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="/guest/course/detail?id=${course.id}" 
                                   class="btn btn-primary">View Course</a>
                    
                            </div>
                        </div>
                    </div>
					</div>
					
				</c:forEach>
               
			   <c:if test="${empty courses}">
					 <div class="empty-state">
                        <i class="fas fa-books fa-3x mb-3 text-muted"></i>
                        <h3>No Courses Found</h3>
                        <p class="text-muted">Try adjusting your search or filter criteria</p>
                    </div>
			   </c:if>

               
            </div>

            <!-- Pagination -->
            <%-- <nav th:if="${totalPages > 1}" class="mt-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item" th:classappend="${currentPage == 0 ? 'disabled' : ''}">
                        <a class="page-link" th:href="@{/guest/courses(page=${currentPage - 1}, category=${selectedCategory}, search=${searchQuery}, sort=${selectedSort})}">&laquo;</a>
                    </li>
                    <li class="page-item" th:each="i : ${#numbers.sequence(0, totalPages - 1)}"
                        th:classappend="${currentPage == i ? 'active' : ''}">
                        <a class="page-link" th:href="@{/guest/courses(page=${i}, category=${selectedCategory}, search=${searchQuery}, sort=${selectedSort})}" th:text="${i + 1}">1</a>
                    </li>
                    <li class="page-item" th:classappend="${currentPage == totalPages - 1 ? 'disabled' : ''}">
                        <a class="page-link" th:href="@{/guest/courses(page=${currentPage + 1}, category=${selectedCategory}, search=${searchQuery}, sort=${selectedSort})}">&raquo;</a>
                    </li>
                </ul>
            </nav> --%>
        </div>
    </div>

        <%-- <script>
            // Search functionality
            document.querySelector('.search-box').addEventListener('input', function(e) {
                updateFilters();
            });

            // Filter functionality
            document.querySelectorAll('.form-select').forEach(select => {
                select.addEventListener('change', function(e) {
                    updateFilters();
                });
            });

            function updateFilters() {
                const search = document.querySelector('.search-box').value;
                const category = document.querySelector('select:nth-of-type(1)').value;
                const sort = document.querySelector('select:nth-of-type(2)').value;
                
                window.location.href = `/guest/courses?search=${encodeURIComponent(search)}&category=${encodeURIComponent(category)}&sort=${encodeURIComponent(sort)}`;
            }
        </script> --%>
<%@ include file="/layouts/guest/footer.jsp" %>