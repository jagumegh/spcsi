// Navbar shrink on scroll
// window.addEventListener('scroll', function () {
//     const navbar = document.querySelector('.navbar');
//     if (window.scrollY > 50) {
//         navbar.style.padding = '10px 0';
//         navbar.style.boxShadow = '0 5px 15px rgba(0, 0, 0, 0.1)';
//     } else {
//         navbar.style.padding = '15px 0';
//         navbar.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.1)';
//     }
// });

// Smooth scroll for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();

        const targetId = this.getAttribute('href');
        if (targetId === '#') return;

        const targetElement = document.querySelector(targetId);
        if (targetElement) {
            window.scrollTo({
                top: targetElement.offsetTop - 80,
                behavior: 'smooth'
            });
        }
    });
});

// Set active nav link based on current page
document.addEventListener('DOMContentLoaded', function () {
    const currentPage = window.location.pathname.split('/').pop();
    const navLinks = document.querySelectorAll('.nav-link');

    navLinks.forEach(link => {
        const linkPage = link.getAttribute('href');
        if (linkPage === currentPage) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });

    // Set home as active if on index
    if (currentPage === 'index.html' || currentPage === '') {
        document.querySelector('.nav-link[href="index.html"]').classList.add('active');
    }
});

// Counter animation for stats
document.addEventListener('DOMContentLoaded', function () {
    // Animate counters when in viewport
    const observerOptions = {
        threshold: 0.5
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const statsElements = entry.target.querySelectorAll('.stats-number');
                statsElements.forEach(element => {
                    const target = parseInt(element.textContent);
                    const suffix = element.textContent.replace(/[0-9]/g, '');

                    // Reset to 0
                    let current = 0;
                    element.textContent = current + suffix;

                    // Animate to target
                    const increment = target / 50;
                    const timer = setInterval(() => {
                        current += increment;
                        if (current >= target) {
                            current = target;
                            clearInterval(timer);
                        }
                        element.textContent = Math.floor(current) + suffix;
                    }, 30);
                });

                // Stop observing after animation
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Observe the stats section
    const statsSection = document.querySelector('.why-choose-section');
    if (statsSection) {
        observer.observe(statsSection);
    }

    // Set current year in copyright if needed
    const yearElements = document.querySelectorAll('.current-year');
    yearElements.forEach(element => {
        element.textContent = new Date().getFullYear();
    });

    // Breadcrumb active page
    const currentPage = window.location.pathname.split('/').pop();
    const breadcrumbItems = document.querySelectorAll('.breadcrumb-item');
    breadcrumbItems.forEach(item => {
        const link = item.querySelector('a');
        if (link && link.getAttribute('href') === currentPage) {
            item.classList.add('active');
        }
    });
});
// Add to your script.js file
document.addEventListener('DOMContentLoaded', function () {
    const heroCarousel = document.getElementById('heroCarousel');
    if (heroCarousel) {
        new bootstrap.Carousel(heroCarousel, {
            interval: 2500,
            pause: 'hover',
            wrap: true,
            ride: 'carousel',
            touch: true
        });
    }
});




document.addEventListener("DOMContentLoaded", function () {

    const products = Array.from(document.querySelectorAll(".product-item"));
    const filterButtons = document.querySelectorAll(".filter-btn");
    const searchInput = document.getElementById("productSearch");
    const pagination = document.querySelector(".pagination");

    const ITEMS_PER_PAGE = 10;
    let currentPage = 1;
    let activeFilter = "all";

    function getFilteredProducts() {
        let filtered = products;

        // Category filter
        if (activeFilter !== "all") {
            filtered = filtered.filter(p =>
                p.dataset.category === activeFilter
            );
        }

        // Search filter
        const searchText = searchInput.value.toLowerCase();
        if (searchText) {
            filtered = filtered.filter(p =>
                p.innerText.toLowerCase().includes(searchText)
            );
        }

        return filtered;
    }

    function renderProducts() {
        products.forEach(p => p.style.display = "none");

        const filtered = getFilteredProducts();
        const start = (currentPage - 1) * ITEMS_PER_PAGE;
        const end = start + ITEMS_PER_PAGE;

        filtered.slice(start, end).forEach(p => {
            p.style.display = "block";
        });

        renderPagination(filtered.length);
    }

    function renderPagination(totalItems) {
        pagination.innerHTML = "";
        const totalPages = Math.ceil(totalItems / ITEMS_PER_PAGE);

        if (totalPages <= 1) return;

        // Prev
        pagination.innerHTML += `
            <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
                <a class="page-link" href="#" data-page="prev">&laquo;</a>
            </li>`;

        // Numbers
        for (let i = 1; i <= totalPages; i++) {
            pagination.innerHTML += `
                <li class="page-item ${i === currentPage ? 'active' : ''}">
                    <a class="page-link" href="#" data-page="${i}">${i}</a>
                </li>`;
        }

        // Next
        pagination.innerHTML += `
            <li class="page-item ${currentPage === totalPages ? 'disabled' : ''}">
                <a class="page-link" href="#" data-page="next">&raquo;</a>
            </li>`;
    }

    // Pagination click
    pagination.addEventListener("click", function (e) {
        e.preventDefault();
        const page = e.target.dataset.page;

        if (!page) return;

        const totalPages = Math.ceil(getFilteredProducts().length / ITEMS_PER_PAGE);

        if (page === "prev" && currentPage > 1) currentPage--;
        else if (page === "next" && currentPage < totalPages) currentPage++;
        else if (!isNaN(page)) currentPage = parseInt(page);

        renderProducts();
    });

    // Filter buttons
    filterButtons.forEach(btn => {
        btn.addEventListener("click", function () {
            filterButtons.forEach(b => b.classList.remove("active"));
            this.classList.add("active");

            activeFilter = this.dataset.filter;
            currentPage = 1;
            renderProducts();
        });
    });

    // Search
    searchInput.addEventListener("input", function () {
        currentPage = 1;
        renderProducts();
    });

    // Initial load
    renderProducts();

});








// Gallery Page JavaScript
document.addEventListener('DOMContentLoaded', function () {
    // Initialize variables
    const galleryItems = document.querySelectorAll('.gallery-item');
    const filterButtons = document.querySelectorAll('.filter-btn');
    const loadMoreBtn = document.getElementById('loadMoreBtn');
    const lightbox = document.getElementById('lightbox');
    const lightboxImg = document.getElementById('lightboxImage');
    const lightboxClose = document.getElementById('lightboxClose');
    const lightboxPrev = document.getElementById('lightboxPrev');
    const lightboxNext = document.getElementById('lightboxNext');
    const lightboxTitle = document.getElementById('lightboxTitle');
    const lightboxDescription = document.getElementById('lightboxDescription');
    const shareBtn = document.getElementById('shareBtn');
    const enquireBtn = document.getElementById('enquireBtn');

    let currentIndex = 0;
    let visibleItems = 4; // Initial number of visible items
    let currentFilter = 'all';
    let galleryData = [];

    // Initialize gallery data from DOM
    function initializeGalleryData() {
        galleryItems.forEach((item, index) => {
            const img = item.querySelector('img');
            const category = item.classList[1]; // Second class is the category
            const title = item.querySelector('.gallery-info h4')?.textContent || 'Stone Work';
            const description = item.querySelector('.gallery-info p')?.textContent || 'Beautiful stone craftsmanship';

            galleryData.push({
                element: item,
                src: img.src,
                alt: img.alt,
                category: category,
                title: title,
                description: description,
                index: index
            });
        });
    }

    // Filter functionality
    function initializeFilter() {
        filterButtons.forEach(button => {
            button.addEventListener('click', function () {
                // Update active button
                filterButtons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');

                // Get filter value
                currentFilter = this.dataset.filter;

                // Reset visible items
                visibleItems = 8;

                // Filter items
                galleryItems.forEach(item => {
                    if (currentFilter === 'all' || item.classList.contains(currentFilter)) {
                        item.style.display = 'block';
                        item.style.animation = 'fadeInUp 0.6s ease forwards';

                        // Reset animation delay for staggered effect
                        const delay = Array.from(galleryItems).indexOf(item) * 0.1;
                        item.style.animationDelay = `${delay}s`;
                    } else {
                        item.style.display = 'none';
                    }
                });

                // Update load more button
                updateLoadMoreButton();

                // Smooth scroll to gallery
                document.querySelector('.gallery-grid').scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            });
        });
    }

    // Load more functionality
    function initializeLoadMore() {
        // Initially hide items beyond visibleItems
        updateVisibleItems();

        loadMoreBtn.addEventListener('click', function () {
            // Show loading state
            const originalText = this.innerHTML;
            this.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i> Loading More...';
            this.disabled = true;

            // Simulate loading delay
            setTimeout(() => {
                visibleItems += 4;
                updateVisibleItems();

                // Restore button state
                this.innerHTML = originalText;
                this.disabled = false;

                // Smooth scroll to newly loaded items
                const newlyVisible = document.querySelectorAll('.gallery-item[style*="display: block"]');
                if (newlyVisible.length > 0) {
                    newlyVisible[newlyVisible.length - 1].scrollIntoView({
                        behavior: 'smooth',
                        block: 'nearest'
                    });
                }
            }, 500);
        });
    }

    function updateVisibleItems() {
        let visibleCount = 0;
        let hasMoreItems = false;

        galleryItems.forEach((item, index) => {
            // Check if item should be visible based on current filter
            const shouldShow = currentFilter === 'all' || item.classList.contains(currentFilter);

            if (shouldShow) {
                if (visibleCount < visibleItems) {
                    item.style.display = 'block';

                    // Add animation with staggered delay
                    item.style.animation = 'fadeInUp 0.6s ease forwards';
                    item.style.animationDelay = `${visibleCount * 0.05}s`;

                    visibleCount++;
                } else {
                    item.style.display = 'none';
                    hasMoreItems = true;
                }
            } else {
                item.style.display = 'none';
            }
        });

        // Update load more button visibility
        loadMoreBtn.style.display = hasMoreItems ? 'block' : 'none';
    }

    function updateLoadMoreButton() {
        const filteredItems = Array.from(galleryItems).filter(item =>
            currentFilter === 'all' || item.classList.contains(currentFilter)
        );

        const hasMoreItems = filteredItems.length > visibleItems;
        loadMoreBtn.style.display = hasMoreItems ? 'block' : 'none';
    }

    // Lightbox functionality
    function initializeLightbox() {
        // Click on gallery items
        galleryItems.forEach((item, index) => {
            item.addEventListener('click', function (e) {
                e.preventDefault();
                currentIndex = index;
                openLightbox(index);
            });
        });

        // Lightbox controls
        lightboxClose.addEventListener('click', closeLightbox);
        lightboxPrev.addEventListener('click', showPrevImage);
        lightboxNext.addEventListener('click', showNextImage);

        // Share button
        shareBtn.addEventListener('click', shareImage);

        // Enquire button
        enquireBtn.addEventListener('click', function () {
            const currentImage = galleryData[currentIndex];
            window.location.href = `quote.html?product=${encodeURIComponent(currentImage.title)}&image=${encodeURIComponent(currentImage.src)}`;
        });

        // Close lightbox on background click
        lightbox.addEventListener('click', function (e) {
            if (e.target === lightbox) {
                closeLightbox();
            }
        });

        // Keyboard navigation
        document.addEventListener('keydown', function (e) {
            if (lightbox.style.display === 'flex') {
                switch (e.key) {
                    case 'Escape':
                        closeLightbox();
                        break;
                    case 'ArrowLeft':
                        showPrevImage();
                        break;
                    case 'ArrowRight':
                        showNextImage();
                        break;
                }
            }
        });

        // Swipe gestures for mobile
        let touchStartX = 0;
        let touchEndX = 0;

        lightbox.addEventListener('touchstart', function (e) {
            touchStartX = e.changedTouches[0].screenX;
        });

        lightbox.addEventListener('touchend', function (e) {
            touchEndX = e.changedTouches[0].screenX;
            handleSwipe();
        });

        function handleSwipe() {
            const swipeThreshold = 50;
            const diff = touchStartX - touchEndX;

            if (Math.abs(diff) > swipeThreshold) {
                if (diff > 0) {
                    // Swipe left - next image
                    showNextImage();
                } else {
                    // Swipe right - previous image
                    showPrevImage();
                }
            }
        }
    }

    function openLightbox(index) {
        const imageData = galleryData[index];

        // Update lightbox content
        lightboxImg.src = imageData.src;
        lightboxImg.alt = imageData.alt;
        lightboxTitle.textContent = imageData.title;
        lightboxDescription.textContent = imageData.description;

        // Show lightbox
        lightbox.style.display = 'flex';
        document.body.style.overflow = 'hidden'; // Prevent scrolling

        // Update URL without page reload
        history.pushState({ lightbox: true }, '', `#image-${index}`);
    }

    function closeLightbox() {
        lightbox.style.display = 'none';
        document.body.style.overflow = ''; // Restore scrolling

        // Update URL
        history.replaceState(null, '', window.location.pathname + window.location.search);
    }

    function showNextImage() {
        currentIndex = (currentIndex + 1) % galleryData.length;

        // Skip items that don't match current filter
        if (currentFilter !== 'all') {
            let found = false;
            let checkIndex = currentIndex;

            for (let i = 0; i < galleryData.length; i++) {
                checkIndex = (currentIndex + i) % galleryData.length;
                if (galleryData[checkIndex].category === currentFilter) {
                    found = true;
                    break;
                }
            }

            if (found) {
                currentIndex = checkIndex;
            }
        }

        openLightbox(currentIndex);
    }

    function showPrevImage() {
        currentIndex = (currentIndex - 1 + galleryData.length) % galleryData.length;

        // Skip items that don't match current filter
        if (currentFilter !== 'all') {
            let found = false;
            let checkIndex = currentIndex;

            for (let i = 0; i < galleryData.length; i++) {
                checkIndex = (currentIndex - i + galleryData.length) % galleryData.length;
                if (galleryData[checkIndex].category === currentFilter) {
                    found = true;
                    break;
                }
            }

            if (found) {
                currentIndex = checkIndex;
            }
        }

        openLightbox(currentIndex);
    }

    function shareImage() {
        const imageData = galleryData[currentIndex];

        if (navigator.share) {
            navigator.share({
                title: imageData.title,
                text: `Check out this beautiful ${imageData.category} work from Shri Pramhans Stones`,
                url: window.location.href,
            })
                .then(() => console.log('Shared successfully'))
                .catch(error => console.log('Sharing failed:', error));
        } else {
            // Fallback for browsers that don't support Web Share API
            const shareUrl = `${window.location.origin}${window.location.pathname}#image-${currentIndex}`;
            navigator.clipboard.writeText(shareUrl)
                .then(() => {
                    alert('Link copied to clipboard!');
                })
                .catch(err => {
                    console.error('Failed to copy link:', err);
                });
        }
    }

    // Handle browser back/forward buttons
    window.addEventListener('popstate', function (event) {
        if (window.location.hash.startsWith('#image-')) {
            const index = parseInt(window.location.hash.replace('#image-', ''));
            if (!isNaN(index) && index >= 0 && index < galleryData.length) {
                currentIndex = index;
                openLightbox(currentIndex);
            }
        } else {
            closeLightbox();
        }
    });

    // Lazy loading for images
    function initializeLazyLoading() {
        if ('IntersectionObserver' in window) {
            const imageObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        img.src = img.dataset.src;
                        img.classList.remove('lazy');
                        imageObserver.unobserve(img);
                    }
                });
            });

            document.querySelectorAll('img.lazy').forEach(img => {
                imageObserver.observe(img);
            });
        }
    }

    // Add loading animation to images
    function addImageLoadingStates() {
        galleryItems.forEach(item => {
            const img = item.querySelector('img');

            img.addEventListener('load', function () {
                item.classList.remove('loading');
            });

            img.addEventListener('error', function () {
                item.classList.remove('loading');
                console.error('Failed to load image:', this.src);
            });

            // Add loading class initially
            if (!img.complete) {
                item.classList.add('loading');
            }
        });
    }

    // Initialize everything
    function init() {
        initializeGalleryData();
        initializeFilter();
        initializeLoadMore();
        initializeLightbox();
        initializeLazyLoading();
        addImageLoadingStates();

        // Check for hash on page load
        if (window.location.hash.startsWith('#image-')) {
            const index = parseInt(window.location.hash.replace('#image-', ''));
            if (!isNaN(index) && index >= 0 && index < galleryData.length) {
                currentIndex = index;
                setTimeout(() => openLightbox(currentIndex), 100);
            }
        }

        console.log('Gallery initialized with', galleryData.length, 'items');
    }

    // Start initialization
    init();

    // Export functions for debugging
    window.gallery = {
        openLightbox,
        closeLightbox,
        filterByCategory: function (category) {
            const button = document.querySelector(`[data-filter="${category}"]`);
            if (button) button.click();
        },
        getCurrentFilter: () => currentFilter,
        getGalleryData: () => galleryData
    };
});

// Add CSS for lazy loading
const style = document.createElement('style');
style.textContent = `
    img.lazy {
        opacity: 0;
        transition: opacity 0.3s;
    }
    
    img.lazy.loaded {
        opacity: 1;
    }
    
    .gallery-item.loading {
        min-height: 280px;
        background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
        background-size: 200% 100%;
        animation: loading 1.5s infinite;
    }
    
    @keyframes loading {
        0% { background-position: 200% 0; }
        100% { background-position: -200% 0; }
    }
`;
document.head.appendChild(style);
