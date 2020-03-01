!function (e) {
    "use strict";
    var n = {
        mobile_menu: function () {
            e("header nav").meanmenu({
                meanMenuClose: "X",
                meanMenuCloseSize: "18px",
                meanScreenWidth: "992",
                meanExpandableChildren: !0,
                meanMenuContainer: ".mobile-menu"
            })
        }, stickyheader: function () {
            if (e("#sticky-header").length) {
                e(".header-inner").clone().appendTo("#sticky-header");
                e(window).on("scroll", function () {
                    e(window).width() > 500 && (e(this).scrollTop() > 300 ? e("#sticky-header").slideDown(500) : e("#sticky-header").slideUp(500))
                })
            }
        }, scroll_top: function () {
            e("body").append("<a href='#top' id='scroll-top' class='topbutton btn-hide'><span class='fa fa-angle-double-up'></span></a>");
            var n = e("#scroll-top");
            e(window).on("scroll", function () {
                e(this).scrollTop() > e(this).height() ? n.addClass("btn-show").removeClass("btn-hide") : n.addClass("btn-hide").removeClass("btn-show")
            }), e("a[href='#top']").on("click", function () {
                return e("html, body").animate({scrollTop: 0}, "normal"), !1
            })
        }, courses_counter: function () {
            e(".counter").counterUp({delay: 10, time: 1e3})
        }, bg_parallax: function () {
            e(".home-header-two").parallax("50%", -.1), e(".counter-section").parallax("50%", .15), e(".testimonial-area.bg-image").parallax("50%", .12), e(".page-heading-section").parallax("50%", -.15)
        }, partner_carousel: function () {
            e("#client-carousel").owlCarousel({
                center: !1,
                items: 4,
                autoplay: !0,
                autoplayTimeout: 5e3,
                autoplayHoverPause: !0,
                singleItem: !1,
                loop: !0,
                margin: 30,
                nav: !1,
                dots: !0,
                responsive: {
                    280: {items: 1},
                    400: {items: 2},
                    500: {items: 2},
                    768: {items: 2},
                    800: {items: 3},
                    1e3: {items: 4},
                    1200: {items: 4},
                    1400: {items: 4}
                }
            })
        }, customer_reviews: function () {
            e("#customer-reviews").owlCarousel({
                center: !0,
                items: 1,
                smartSpeed: 800,
                autoplay: !0,
                autoplayTimeout: 3e3,
                loop: !0,
                margin: 0,
                nav: !1,
                dots: !1,
                animateOut: "slideOutDown",
                animateIn: "bounceIn",
                thumbs: !0,
                thumbsPrerendered: !0
            })
        }, grid_masonry: function () {
            if (e("#masonry").length > 0) {
                var n = e("#masonry");
                n.imagesLoaded(function () {
                    n.masonry({itemSelector: ".grid"})
                })
            }
        }, magnific_popup: function () {
            e(".video-btn").magnificPopup({
                type: "iframe",
                iframe: {
                    patterns: {
                        youtube: {
                            index: "youtube.com/", id: function (e) {
                                var n = e.match(/[\\?\\&]v=([^\\?\\&]+)/);
                                return n && n[1] ? n[1] : null
                            }, src: "https://www.youtube.com/embed/Jt1qgiNdzB0?autoplay=1"
                        }
                    }
                }
            }), e(".single-category, .single-gal-item").magnificPopup({
                type: "image",
                removalDelay: 300,
                mainClass: "mfp-with-zoom",
                gallery: {enabled: !0},
                zoom: {
                    enabled: !0, duration: 300, easing: "ease-in", opener: function (e) {
                        return e.is("img") ? e : e.find("img")
                    }
                }
            }), e(".album-thumb").magnificPopup({
                type: "image",
                removalDelay: 300,
                mainClass: "mfp-with-zoom",
                gallery: {enabled: !1},
                zoom: {
                    enabled: !0, duration: 300, easing: "ease-in", opener: function (e) {
                        return e.is("img") ? e : e.find("img")
                    }
                }
            })
        }, portfolio_isotop: function () {
            var n = e(".courses-item-content");
            n.isotope({
                filter: "*",
                animationOptions: {duration: 1e3, easing: "linear", queue: !1}
            }), e(".popular-filter-nav > li a").on("click", function () {
                var o = e(this).attr("data-filter");
                return n.isotope({filter: o, animationOptions: {duration: 1e3, easing: "linear", queue: !1}}), !1
            })
        }, count_down: function () {
            e("#countdown").syotimer({year: 2018, month: 12, day: 9, hour: 20, minute: 30})
        }, initializ: function () {
            n.mobile_menu(), n.stickyheader(), n.scroll_top(), n.courses_counter(), n.bg_parallax(), n.partner_carousel(), n.customer_reviews(), n.grid_masonry(), n.magnific_popup(), n.portfolio_isotop(), n.count_down()
        }
    };
    e(function () {
        n.initializ()
    })
}(jQuery);