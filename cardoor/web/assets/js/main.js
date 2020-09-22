/*global jQuery */
(function ($) {
    "use strict";

    jQuery(document).ready(function ($) {
        /*---------------------------------
         All Window Scroll Function Start
         --------------------------------- */
        $(window).scroll(function () {
            // Header Fix Js Here
            if ($(window).scrollTop() >= 200) {
                $('#header-area').addClass('fixTotop');
            } else {
                $('#header-area').removeClass('fixTotop');
            }

            // Scroll top Js Here
            if ($(window).scrollTop() >= 400) {
                $('.scroll-top').slideDown(400);
            } else {
                $('.scroll-top').slideUp(400);
            }
        });
        /*--------------------------------
         All Window Scroll Function End
         --------------------------------- */

        // Home Page 0ne Date Picker JS
        var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
        $('#startDate').datepicker({
            uiLibrary: 'bootstrap4',
            iconsLibrary: 'fontawesome',
            minDate: today,
            maxDate: function () {
                return $('#endDate').val();
            }
        });

        $('#endDate').datepicker({
            uiLibrary: 'bootstrap4',
            iconsLibrary: 'fontawesome',
            minDate: function () {
                return $('#startDate').val();
            }
        });

        // Partner Carousel
        $(".partner-content-wrap").owlCarousel({
            loop: true,
            margin: 15,
            autoplay: true,
            autoplayTimeout: 1500,
            nav: false,
            dots: false,
            rtl: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 3
                },
                1000: {
                    items: 5
                }
            }
        }); // Partner Carousel End


        // Funfact Count JS
        $('.counter').counterUp({
            delay: 10,
            time: 1000
        });


        // Choose Popular Car Isotope
        $(".popucar-menu a, .home2-car-filter a").click(function () {

            $(".popucar-menu a, .home2-car-filter a").removeClass('active');
            $(this).addClass('active');

            var filterValue = $(this).attr('data-filter');
            $(".popular-car-gird").isotope({
                filter: filterValue
            });

            return false;
        }); // Choose Popular Car Isotope End


        // Choose Newest Car Isotope
        $(".newcar-menu a").click(function () {

            $(".newcar-menu a").removeClass('active');
            $(this).addClass('active');

            var filterValue = $(this).attr('data-filter');
            $(".newest-car-gird").isotope({
                filter: filterValue
            });

            return false;
        }); // Choose Newest Car Isotope End


        // Choose Car Maginific Popup
        $('.car-hover').magnificPopup({
            type: 'image',
            removalDelay: 300,
            mainClass: 'mfp-fade'
        }); // Maginific Popup End


        // Testimonial Carousel
        $(".testimonial-content").owlCarousel({
            loop: true,
            items: 1,
            autoplay: true,
            autoplayHoverPause: true,
            autoplayTimeout: 3000,
            nav: false,
            dots: true
        });
        // Testimonial Carousel End


        // Video Bg JS 
        $('#mobileapp-video-bg').YTPlayer({
            fitToBackground: true,
            videoURL: 'm5_AKjDdqaU',
            containment: '#mobile-app-area',
            quality: 'highres',
            loop: true,
            showControls: false,
            opacity: 1,
            mute: true
        }); // Video Bg End

        // Click to Scroll TOP
        $(".scroll-top").click(function () {
            $('html, body').animate({
                scrollTop: 0
            }, 1500);
        }); //Scroll TOP End

        // SlickNav or Mobile Menu
        $(".mainmenu").slicknav({
            'label': '',
            'prependTo': '#header-bottom .container .row'
        }); // SlickNav End


        // Home Page Two Slideshow
        $("#slideslow-bg").vegas({
            overlay: true,
            transition: 'fade',
            transitionDuration: 2000,
            delay: 4000,
            color: '#000',
            animation: 'random',
            animationDuration: 20000,
            slides: [{
                    src: '../assets/img/slider-img/slider-img-1.jpg'
                },
                {
                    src: '../assets/img/slider-img/slider-img-2.jpg'
                },
                {
                    src: '../assets/img/slider-img/slider-img-3.jpg'
                },
                {
                    src: '../assets/img/slider-img/slider-img-4.jpg'
                }
            ]
        }); //Home Page Two Slideshow

        // Home Page Two Date Picker JS

        $('#startDate2').datepicker({
            uiLibrary: 'bootstrap4',
            iconsLibrary: 'fontawesome',
            minDate: today,
            maxDate: function () {
                return $('#endDate2').val();
            }
        });

        $('#endDate2').datepicker({
            uiLibrary: 'bootstrap4',
            iconsLibrary: 'fontawesome',
            minDate: function () {
                return $('#startDate2').val();
            }
        });

        // Home Page 3 Slider Start
        $("#home-slider-area").owlCarousel({
            loop: true,
            items: 1,
            autoplay: true,
            autoplayHoverPause: false,
            autoplayTimeout: 3000,
            nav: false,
            dots: true,
            animateOut: 'slideOutDown',
            animateIn: 'slideInDown'
        });
        // Home Page 3 Slider End

        // Car Details Slider Start
        $(".car-preview-crousel").owlCarousel({
            loop: true,
            items: 1,
            autoplay: true,
            autoplayHoverPause: true,
            autoplayTimeout: 2000,
            nav: false,
            dots: true,
            animateOut: 'fadeOut',
            animateIn: 'fadeIn'
        });

        // Home 2 Service Carousel
        $(".service-container-wrap").owlCarousel({
            loop: true,
            items: 3,
            margin: 20,
            autoplay: true,
            autoplayHoverPause: true,
            autoplayTimeout: 2000,
            nav: false,
            dots: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 3
                }
            }
        });


    }); //Ready Function End

    jQuery(window).load(function () {
        jQuery('.preloader').fadeOut();
        jQuery('.preloader-spinner').delay(350).fadeOut('slow');
        jQuery('body').removeClass('loader-active');
        jQuery(".popular-car-gird").isotope();
    }); //window load End


}(jQuery));

function u_register_check() {

    var u_fname_id_val = document.getElementById("u_fname_id").value;
    var u_lname_id_val = document.getElementById("u_lname_id").value;
    var u_email_id_val = document.getElementById("u_email_id").value;
    var u_uname_id_val = document.getElementById("u_uname_id").value;
    var u_pwd_id_val = document.getElementById("u_pwd_id").value;
    var u_cpwd_id_val = document.getElementById("u_cpwd_id").value;


    var atr_err_lbl = document.getElementById("err_lbl");

    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var usernameformat = /^[a-zA-Z0-9]+$/;

    atr_err_lbl.innerHTML = ""; // clr err

    if (u_fname_id_val == "") {

        atr_err_lbl.innerHTML = "First Name is required !";

    } else if (u_lname_id_val == "") {

        atr_err_lbl.innerHTML = "Last Name is required !";

    } else if (u_email_id_val == "") {

        atr_err_lbl.innerHTML = "Email is required !";

    } else if (u_email_id_val.match(mailformat)) {

        if (u_uname_id_val == "") {

            atr_err_lbl.innerHTML = "Username is required !";

        } else if (!u_uname_id_val.match(usernameformat)) {

            atr_err_lbl.innerHTML = "Invalid Username !";

        } else if (u_pwd_id_val == "") {

            atr_err_lbl.innerHTML = "Password is required !";

        } else if (u_pwd_id_val.length < 6) {

            atr_err_lbl.innerHTML = "Password must contain at least of 6 characters !";

        } else if (u_cpwd_id_val == "") {

            atr_err_lbl.innerHTML = "Confirm your password !";

        } else if (u_cpwd_id_val != u_pwd_id_val) {

            atr_err_lbl.innerHTML = "Password Mismatch !";
            document.getElementById("u_pwd_id").value = "";
            document.getElementById("u_cpwd_id").value = "";
        } else {

            $.ajax({
                type: 'POST',
                url: '../registerServlet',
                data: $("#register_form").serialize(),
                beforeSend: function () {
                    $("#u_submit_btn").attr("disabled", true);
                },
                success: function (feedback) {
                    console.log(feedback);
                    document.getElementById("err_lbl_val").value = feedback;
                    var u_register_err_lbl_val = document.getElementById("err_lbl_val").value;
                    if (u_register_err_lbl_val == 'Success') {
                        //Registration successful !
                        var r = confirm(
                                'Registration successful !\n\n' +
                                "Login now ? "
                                );
                        if (r == true) {
                            location = "login.jsp";
                        } else {
                            location.reload();
                        }
                    } else {
                        $("#err_lbl").html(feedback);
                        $("#u_submit_btn").attr("disabled", false);
                    }

                },
                error: function (error) {
                    console.log(error);
                    $("#u_submit_btn").attr("disabled", false);
                }
            })

        }

    } else {
        atr_err_lbl.innerHTML = "Invalid Email !";
    }

}

function clr_err() {
    document.getElementById("err_lbl").innerHTML = "";
}


function encryptreg() {
    document.getElementById("u_encryptedpwd_id").value = CryptoJS.MD5(document.getElementById("u_pwd_id").value);
}


function encryptlog() {
    document.getElementById("lg_encryptpwd").value = CryptoJS.MD5(document.getElementById("lg_pwd").value);
}


function cal_duration() {
    const date1 = new Date(document.getElementById("startDate").value);
    const date2 = new Date(document.getElementById("endDate").value);
    const diffTime = Math.abs(date2 - date1);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

    document.getElementById("time_duration").value = diffDays;
    document.getElementById("due_dis").innerHTML = diffDays + " days";
}

function cal_duration2(xx) {
    const date1 = new Date(document.getElementById("str_date" + xx + "").value);
    const date2 = new Date(document.getElementById("ret_date" + xx + "").value);
    const diffTime = Math.abs(date2 - date1);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

    document.getElementById("time_duration" + xx + "").value = diffDays;
    document.getElementById("due_dis" + xx + "").innerHTML = diffDays + " days";

    var str1 = document.getElementById("str_date" + xx + "").value;
    var mm1 = str1.substring(5, 7);
    var dd1 = str1.substring(8, 10);
    var yy1 = str1.substring(0, 4);
    document.getElementById("str_date_val" + xx + "").value = mm1 + "/" + dd1 + "/" + yy1;

    var str2 = document.getElementById("ret_date" + xx + "").value;
    var mm2 = str2.substring(5, 7);
    var dd2 = str2.substring(8, 10);
    var yy2 = str2.substring(0, 4);
    document.getElementById("ret_date_val" + xx + "").value = mm2 + "/" + dd2 + "/" + yy2;
}
