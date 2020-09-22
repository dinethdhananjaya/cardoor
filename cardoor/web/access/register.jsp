<!DOCTYPE html>
<html class="no-js" lang="eng">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--=== Favicon ===-->
        <link rel="shortcut icon" href="../assets/logo/favicon.ico" type="image/x-icon" />

        <title>Cardoor</title>

        <!--=== Bootstrap CSS ===-->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
        <!--=== Slicknav CSS ===-->
        <link href="../assets/css/plugins/slicknav.min.css" rel="stylesheet">
        <!--=== Magnific Popup CSS ===-->
        <link href="../assets/css/plugins/magnific-popup.css" rel="stylesheet">
        <!--=== Owl Carousel CSS ===-->
        <link href="../assets/css/plugins/owl.carousel.min.css" rel="stylesheet">
        <!--=== Gijgo CSS ===-->
        <link href="../assets/css/plugins/gijgo.css" rel="stylesheet">
        <!--=== FontAwesome CSS ===-->
        <link href="../assets/css/font-awesome.css" rel="stylesheet">
        <!--=== Theme Reset CSS ===-->
        <link href="../assets/css/reset.css" rel="stylesheet">
        <!--=== Main Style CSS ===-->
        <link href="../assets/css/style.css" rel="stylesheet">
        <!--=== Responsive CSS ===-->
        <link href="../assets/css/responsive.css" rel="stylesheet">
        <!--=== encreption JS ===-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>


        <!--[if lt IE 9]>
            <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <style>
        body {
            background-image: url("../assets/img/banner.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>

    <body class="loader-active">

        <!--== Preloader Area Start ==-->
        <div class="preloader">
            <div class="preloader-spinner">
                <div class="loader-content">
                    <img src="../assets/img/preloader.gif" alt="JSOFT">
                </div>
            </div>
        </div>
        <!--== Preloader Area End ==-->

        <!--== Login Page Content Start ==-->
        <section id="lgoin-page-wrap" class="section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-8 m-auto">
                        <div class="login-page-content" style="background-color: white;">
                            <div class="login-form">
                                <img src="../assets/logo/favicon.ico" alt="JSOFT" style="height:25px;">
                                <h3>Sign Up</h3>
                                <form id="register_form">
                                    <div class="name">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="text" placeholder="First Name" name="u_fname" id="u_fname_id" onfocus="clr_err()">
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" placeholder="Last Name" name="u_lname" id="u_lname_id" onfocus="clr_err()">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="username">
                                        <input type="email" placeholder="Email" name="u_email" id="u_email_id" onfocus="clr_err()">
                                    </div>
                                    <div class="username">
                                        <input type="text" placeholder="Username" name="u_uname" id="u_uname_id" onfocus="clr_err()">
                                    </div>
                                    <div class="password">
                                        <input type="password" placeholder="Password" id="u_pwd_id" onfocus="clr_err()" onkeyup="encryptreg()">
                                    </div>
                                    <div class="password dnone">
                                        <input type="text" placeholder="Encrypt" name="u_pwd" id="u_encryptedpwd_id" onfocus="clr_err()">
                                    </div>
                                    <div class="password">
                                        <input type="password" placeholder="Confirm Password" name="u_cpwd" id="u_cpwd_id" onfocus="clr_err()">
                                    </div>
                                    
                                    <div>
                                        <span><b id="err_lbl" style="color:red;"></b></span>
                                        <input type="text" id="err_lbl_val" class="dnone">
                                    </div>
                                    <div class="log-btn">
                                        <button type="button" id="u_submit_btn" onclick="u_register_check()"><i class="fa fa-check-square"></i> Sign Up</button>
                                    </div>
                                </form>
                            </div>
                            <div class="create-ac">
                                <p>Have an account? <a href="login.jsp">Sign In</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--== Login Page Content End ==-->

        <!--== Footer Area Start ==-->
        <section id="footer-area" style="display: none;">
            <!-- Footer Widget Start -->
            <div class="footer-widget-area">
                <div class="container">
                    <div class="row">
                        <!-- Single Footer Widget Start -->
                        <div class="col-lg-4 col-md-6">
                            <div class="single-footer-widget">
                                <h2>About Us</h2>
                                <div class="widget-body">
                                    <img src="../assets/logo/logo.png" alt="JSOFT">
                                    <p>Lorem ipsum dolored is a sit ameted consectetur adipisicing elit. Nobis magni assumenda distinctio debitis, eum fuga fugiat error reiciendis.</p>

                                    <div class="newsletter-area">
                                        <form action="index.jsp">
                                            <input type="email" placeholder="Subscribe Our Newsletter">
                                            <button type="submit" class="newsletter-btn"><i class="fa fa-send"></i></button>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Single Footer Widget End -->

                        <!-- Single Footer Widget Start -->
                        <div class="col-lg-4 col-md-6">
                            <div class="single-footer-widget">
                                <h2>Recent Posts</h2>
                                <div class="widget-body">
                                    <ul class="recent-post">
                                        <li>
                                            <a href="#">
                                                Hello Bangladesh! 
                                                <i class="fa fa-long-arrow-right"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Lorem ipsum dolor sit amet
                                                <i class="fa fa-long-arrow-right"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Hello Bangladesh! 
                                                <i class="fa fa-long-arrow-right"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                consectetur adipisicing elit?
                                                <i class="fa fa-long-arrow-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Single Footer Widget End -->

                        <!-- Single Footer Widget Start -->
                        <div class="col-lg-4 col-md-6">
                            <div class="single-footer-widget">
                                <h2>get touch</h2>
                                <div class="widget-body">
                                    <p>Lorem ipsum doloer sited amet, consectetur adipisicing elit. nibh auguea, scelerisque sed</p>

                                    <ul class="get-touch">
                                        <li><i class="fa fa-map-marker"></i> 800/8, Kazipara, Dhaka</li>
                                        <li><i class="fa fa-mobile"></i> +880 01 86 25 72 43</li>
                                        <li><i class="fa fa-envelope"></i> kazukamdu83@gmail.com</li>
                                    </ul>
                                    <a href="https://goo.gl/maps/b5mt45MCaPB2" class="map-show" target="_blank">Show Location</a>
                                </div>
                            </div>
                        </div>
                        <!-- Single Footer Widget End -->
                    </div>
                </div>
            </div>
            <!-- Footer Widget End -->

            <!-- Footer Bottom Start -->
            <div class="footer-bottom-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <p>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;
                                <script>
                                    document.write(new Date().getFullYear());
                                </script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer Bottom End -->
        </section>
        <!--== Footer Area End ==-->

        <!--=======================Javascript============================-->
        <!--=== Jquery Min Js ===-->
        <script src="../assets/js/jquery-3.2.1.min.js"></script>
        <!--=== Jquery Migrate Min Js ===-->
        <script src="../assets/js/jquery-migrate.min.js"></script>
        <!--=== Popper Min Js ===-->
        <script src="../assets/js/popper.min.js"></script>
        <!--=== Bootstrap Min Js ===-->
        <script src="../assets/js/bootstrap.min.js"></script>
        <!--=== Gijgo Min Js ===-->
        <script src="../assets/js/plugins/gijgo.js"></script>
        <!--=== Vegas Min Js ===-->
        <script src="../assets/js/plugins/vegas.min.js"></script>
        <!--=== Isotope Min Js ===-->
        <script src="../assets/js/plugins/isotope.min.js"></script>
        <!--=== Owl Caousel Min Js ===-->
        <script src="../assets/js/plugins/owl.carousel.min.js"></script>
        <!--=== Waypoint Min Js ===-->
        <script src="../assets/js/plugins/waypoints.min.js"></script>
        <!--=== CounTotop Min Js ===-->
        <script src="../assets/js/plugins/counterup.min.js"></script>
        <!--=== YtPlayer Min Js ===-->
        <script src="../assets/js/plugins/mb.YTPlayer.js"></script>
        <!--=== Magnific Popup Min Js ===-->
        <script src="../assets/js/plugins/magnific-popup.min.js"></script>
        <!--=== Slicknav Min Js ===-->
        <script src="../assets/js/plugins/slicknav.min.js"></script>

        <!--=== Mian Js ===-->
        <script src="../assets/js/main.js"></script>

    </body>

</html>