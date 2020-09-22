<%@page import="common.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
    if ((session.getAttribute("user_type")) == null || !(session.getAttribute("user_type")).equals("admin")) {
        out.println("<script type=\"text/javascript\">");
        out.println("location='../index.jsp';");
        out.println("</script>");
    } else {

    }
    String pb_prev_car_price = "";
%>
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

        <!--=== ajax ===-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Google Maps JavaScript library -->
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyAlqVEFevLvQgYn8mDer-Q61VzK5doIBcY"></script>


        <!--[if lt IE 9]>
            <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

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

        <!--== Header Area Start ==-->
        <header id="header-area" class="fixed-top">
            <!--== Header Top Start ==-->
            <div id="header-top" class="d-none d-xl-block">
                <div class="container">
                    <div class="row">
                        <!--== Single HeaderTop Start ==-->
                        <div class="col-lg-3 text-left">
                            <i class="fa fa-map-marker"></i> 41/2, Colombo, Srilanka
                        </div>
                        <!--== Single HeaderTop End ==-->

                        <!--== Single HeaderTop Start ==-->
                        <div class="col-lg-3 text-center">
                            <i class="fa fa-mobile"></i> +94 77 1546569
                        </div>
                        <!--== Single HeaderTop End ==-->

                        <!--== Single HeaderTop Start ==-->
                        <div class="col-lg-3 text-center">
                            <i class="fa fa-clock-o"></i> Mon-Fri 09.00 - 17.00
                        </div>
                        <!--== Single HeaderTop End ==-->

                        <!--== Social Icons Start ==-->
                        <div class="col-lg-3 text-right">
                            <div class="header-social-icons">
                                <a href="#"><%=session.getAttribute("user_username")%></a>
                                <a href="../access/login.jsp" title="Logout"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                        <!--== Social Icons End ==-->
                    </div>
                </div>
            </div>
            <!--== Header Top End ==-->

            <!--== Header Bottom Start ==-->
            <div id="header-bottom">
                <div class="container">
                    <div class="row">
                        <!--== Logo Start ==-->
                        <div class="col-lg-4">
                            <a href="index.jsp" class="logo">
                                <img src="../assets/logo/logo.png" alt="JSOFT">
                            </a>
                        </div>
                        <!--== Logo End ==-->

                        <!--== Main Menu Start ==-->
                        <div class="col-lg-8 d-none d-xl-block">
                            <nav class="mainmenu alignright">
                                <ul>
                                    <li><a href="index.jsp">Home</a></li>
                                    <li class="active"><a href="bookings.jsp">Bookings</a></li>
                                    <li><a href="about.jsp">About</a></li>
                                    <li><a href="cars.jsp">Cars</a></li>
                                    <li><a href="#">Pages</a>
                                        <ul>
                                            <li><a href="package.jsp">Pricing</a></li>
                                            <li><a href="driver.jsp">Driver</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.jsp">Contact</a></li>

                                </ul>
                            </nav>
                        </div>
                        <!--== Main Menu End ==-->
                    </div>
                </div>
            </div>
            <!--== Header Bottom End ==-->
        </header>
        <!--== Header Area End ==-->

        <!--== Page Title Area Start ==-->
        <section id="page-title-area" class="section-padding overlay">
            <div class="container">
                <div class="row">
                    <!-- Page Title Start -->
                    <div class="col-lg-12">
                        <div class="section-title  text-center">
                            <h2>My Bookings</h2>
                            <span class="title-line"><i class="fa fa-car"></i></span>
                            <p>That wonderful feeling , you start the engine and your adventure begins...</p>
                        </div>
                    </div>
                    <!-- Page Title End -->
                </div>
            </div>
        </section>
        <!--== Page Title Area End ==-->

        <!--== Car List Area Start ==-->
        <section id="car-list-area" class="section-padding">
            <div class="container">
                <div class="row">
                    <!-- Car List Content Start -->
                    <div class="col-lg-8">
                        <div class="car-list-content">

                            <%
                                try {
                                    Statement statement = null;
                                    ResultSet resultSet = null;

                                    DB_Connection obj_DB_Connection = new DB_Connection();
                                    Connection connection = obj_DB_Connection.get_connection();
                                    statement = connection.createStatement();
                                    String sql = "SELECT * FROM bookings ORDER BY b_placed_datentime DESC";
                                    resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                            %>

                            <!-- Single Car Start -->
                            <div class="single-car-wrap">
                                <div class="row">
                                    <!-- Single Car Thumbnail -->
                                    <div class="col-lg-5">
                                        <div class="car-list-thumb">
                                            <%
                                                try {
                                                    Statement statement2 = null;
                                                    ResultSet resultSet2 = null;

                                                    DB_Connection obj_DB_Connection2 = new DB_Connection();
                                                    Connection connection2 = obj_DB_Connection2.get_connection();
                                                    statement2 = connection2.createStatement();
                                                    String sql2 = "SELECT * FROM cars WHERE c_id='" + resultSet.getString("b_car_id") + "' ";
                                                    resultSet2 = statement2.executeQuery(sql2);
                                                    if (resultSet2.next()) {

                                            %>


                                            <!-- Single Popular Car Start -->
                                            <div class="col-lg">
                                                <div class="single-popular-car">
                                                    <div class="p-car-thumbnails">
                                                        <a class="car-hover" href="../<%=resultSet2.getString("c_img_url")%>">
                                                            <img src="../<%=resultSet2.getString("c_img_url")%>" alt="JSOFT">
                                                        </a>
                                                    </div>

                                                    <div class="p-car-content">
                                                        <h3>
                                                            <a href="javascript:void(0)"><%=resultSet2.getString("c_name")%></a>
                                                            <span class="price"><i class="fa fa-tag"></i> $<%=resultSet2.getString("c_price")%>/day</span>
                                                        </h3>
                                                        <%
                                                            pb_prev_car_price = resultSet2.getString("c_price");
                                                        %>

                                                        <div class="p-car-feature">
                                                            <a href="javascript:void(0)"><%=resultSet2.getString("c_description")%></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Single Popular Car End -->

                                            <%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </div>
                                    </div>
                                    <!-- Single Car Thumbnail -->

                                    <!-- Single Car Info -->
                                    <div class="col-lg">
                                        <div class="display-table">
                                            <div class="display-table-cell">
                                                <div class="car-list-info" id="detailscard<%=resultSet.getString("b_id")%>"><!-------------detailscard-->
                                                    <h2><a href="javascript:void(0)"><i class="fa fa-bookmark"></i> Booking ID - <%=resultSet.getString("b_id")%></a></h2>
                                                    <h5><a href="javascript:void(0)">@<%=resultSet.getString("b_placed_by")%></a></h5>
                                                    <h5>
                                                        <%=resultSet.getString("b_pick_up_date")%> -- <%=resultSet.getString("b_return_date")%><br>
                                                        <%=resultSet.getString("b_duration_days")%> days
                                                    </h5>
                                                    <p><i class="fa fa-location-arrow" aria-hidden="true"></i> <%=resultSet.getString("b_pick_up_location")%></p>
                                                    <ul class="car-info-list">
                                                        <li style="font-variant:small-caps;"><%=resultSet.getString("b_car_manufacturer")%></li>
                                                        <li style="font-variant:small-caps;"><%=resultSet.getString("b_car_type")%></li>
                                                    </ul>
                                                    <p class="rating">
                                                        <i style="color: gray;"><%=resultSet.getString("b_placed_datentime")%></i><br>
                                                        <i style="color: MediumSeaGreen; font-size: 30px;">$<%=resultSet.getString("b_price")%></i>
                                                    </p>


                                                    <form action="../deleteABookingServlet" method="POST">
                                                        <button class="btn cursorp" style="background-color: red; border: none;color: white;"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                                        <input class="dnone" name="book_id" type="text" value="<%=resultSet.getString("b_id")%>">
                                                        <input class="dnone" name="car_id" type="text" value="<%=resultSet.getString("b_car_id")%>">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Car info -->
                                </div>
                            </div>
                            <!-- Single Car End -->

                            <%
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>

                        </div>

                    </div>
                    <!-- Car List Content End -->

                    <!-- Sidebar Area Start -->
                    <div class="col-lg-4">
                        <div class="sidebar-content-wrap m-t-50">
                            <!-- Single Sidebar Start -->
                            <div class="single-sidebar">
                                <h3>For More Informations</h3>

                                <div class="sidebar-body">
                                    <p><i class="fa fa-mobile"></i> +94 77 1546569</p>
                                    <p><i class="fa fa-clock-o"></i> Mon - Sat 8.00 - 18.00</p>
                                </div>
                            </div>
                            <!-- Single Sidebar End -->

                            <!-- Single Sidebar Start -->
                            <div class="single-sidebar">
                                <h3>Rental Tips</h3>

                                <div class="sidebar-body">
                                    <ul class="recent-tips">
                                        <li class="single-recent-tips">
                                            <div class="recent-tip-thum">
                                                <a href="#"><img src="../assets/img/we-do/service1-img.png" alt="JSOFT"></a>
                                            </div>
                                            <div class="recent-tip-body">
                                                <h4><a href="#">How to Enjoy Losses Angeles Car Rentals</a></h4>
                                                <span class="date">February 5, 2018</span>
                                            </div>
                                        </li>

                                        <li class="single-recent-tips">
                                            <div class="recent-tip-thum">
                                                <a href="#"><img src="../assets/img/we-do/service3-img.png" alt="JSOFT"></a>
                                            </div>
                                            <div class="recent-tip-body">
                                                <h4><a href="#">How to Enjoy Losses Angeles Car Rentals</a></h4>
                                                <span class="date">February 5, 2018</span>
                                            </div>
                                        </li>

                                        <li class="single-recent-tips">
                                            <div class="recent-tip-thum">
                                                <a href="#"><img src="../assets/img/we-do/service2-img.png" alt="JSOFT"></a>
                                            </div>
                                            <div class="recent-tip-body">
                                                <h4><a href="#">How to Enjoy Losses Angeles Car Rentals</a></h4>
                                                <span class="date">February 5, 2018</span>
                                            </div>
                                        </li>

                                        <li class="single-recent-tips">
                                            <div class="recent-tip-thum">
                                                <a href="#"><img src="../assets/img/we-do/service3-img.png" alt="JSOFT"></a>
                                            </div>
                                            <div class="recent-tip-body">
                                                <h4><a href="#">How to Enjoy Losses Angeles Car Rentals</a></h4>
                                                <span class="date">February 5, 2018</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Single Sidebar End -->

                            <!-- Single Sidebar Start -->
                            <div class="single-sidebar">
                                <h3>Connect with Us</h3>

                                <div class="sidebar-body">
                                    <div class="social-icons text-center">
                                        <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                                        <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                                        <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Sidebar End -->
                        </div>
                    </div>
                    <!-- Sidebar Area End -->
                </div>
            </div>
        </section>
        <!--== Car List Area End ==-->

        <!--== Testimonials Area Start ==-->
        <section id="testimonial-area" class="section-padding">
            <div class="container">
                <div class="row">
                    <!-- Section Title Start -->
                    <div class="col-lg-12">
                        <div class="section-title  text-center">
                            <h2>Recent Reviews</h2>
                            <span class="title-line"><i class="fa fa-car"></i></span>
                            <p>That wonderful feeling , you start the engine and your adventure begins...</p>
                        </div>
                    </div>
                    <!-- Section Title End -->
                </div>

                <div class="row">
                    <div class="col-lg-8 col-md-12 m-auto">
                        <div class="testimonial-content">

                            <%
                                try {
                                    Statement statement = null;
                                    ResultSet resultSet = null;
                                    Integer rev_count = 0;

                                    DB_Connection obj_DB_Connection = new DB_Connection();
                                    Connection connection = obj_DB_Connection.get_connection();
                                    statement = connection.createStatement();
                                    String sql = "SELECT * FROM reviews ORDER BY r_datentime DESC";
                                    resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {

                                        if (rev_count < 5) {
                                            rev_count++;

                            %>

                            <!--== Single Testimoial Start ==-->
                            <div class="single-testimonial">
                                <p><%=resultSet.getString("r_Message")%> -( <%=resultSet.getString("r_datentime")%> )</p>
                                <h3>@<%=resultSet.getString("r_user")%></h3>
                            </div>
                            <!--== Single Testimoial End ==-->

                            <%    }
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--== Testimonials Area End ==-->

        <!--== Footer Area Start ==-->
        <section id="footer-area">
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
                                                How old do I have to be to rent a car?
                                                <i class="fa fa-long-arrow-right"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Can I book a hire car for someone else?
                                                <i class="fa fa-long-arrow-right"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Are all fees included in the rental price?
                                                <i class="fa fa-long-arrow-right"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                What should I look for when I'm choosing a car?
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

                                    <ul class="get-touch">
                                        <li><i class="fa fa-map-marker"></i> 41/2, Colombo, Srilanka</li>
                                        <li><i class="fa fa-mobile"></i> +94 77 1546569</li>
                                        <li><i class="fa fa-envelope"></i> Cardoor@gmail.com</li>
                                    </ul>
                                    <a href="https://www.google.com.bd/maps/place/NSBM+Green+University+Town/@6.8213478,80.0393967,17z/data=!3m1!4b1!4m5!3m4!1s0x3ae2523b05555555:0x546c34cd99f6f488!8m2!3d6.8213425!4d80.0415854?hl=en" class="map-show" target="_blank">Show Location</a>
                                </div>
                            </div>
                        </div>
                        <!-- Single Footer Widget End -->
                    </div>
                </div>
            </div>
            <!-- Footer Widget End -->

            <!-- Footer Bottom Start -->
            <div class="footer-bottom-area dnone">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <p>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;
                                <script>
                                    //document.write(new Date().getFullYear());
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

        <!--== Scroll Top Area Start ==-->
        <div class="scroll-top">
            <img src="../assets/img/scroll-top.png" alt="JSOFT">
        </div>
        <!--== Scroll Top Area End ==-->

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