<%@page import="common.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
    if ((session.getAttribute("user_type")) == null || !(session.getAttribute("user_type")).equals("user")) {
        out.println("<script type=\"text/javascript\">");
        out.println("location='../index.jsp';");
        out.println("</script>");
    } else {

    }
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
                                    <li class="active"><a href="index.jsp">Home</a></li>
                                    <li><a href="bookings.jsp">Bookings</a></li>
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

        <!--== Slider Area Start ==-->
        <section id="slider-area">
            <!--== slide Item One ==-->
            <div class="single-slide-item overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="book-a-car">
                                <form action="../addABookingServlet" method="POST">
                                    <!--== Pick Up Location ==-->
                                    <div class="pickup-location book-item">
                                        <h4>PICK-UP LOCATION:</h4>
                                        <input type="text" name="pick_up_location" class="custom-input" id="location_input" required="" placeholder="Location"/>
                                    </div>
                                    <!--== Pick Up Location ==-->

                                    <script>
                                        var searchInput = 'location_input';

                                        $(document).ready(function () {
                                            var autocomplete;
                                            autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)), {
                                                types: ['geocode'],
                                                componentRestrictions: {
                                                    country: "lk"
                                                }
                                            });

                                            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                                                var near_place = autocomplete.getPlace();
                                            });
                                        });
                                    </script>

                                    <!--== Pick Up Date ==-->
                                    <div class="pick-up-date book-item">
                                        <h4>PICK-UP DATE:</h4>
                                        <input type="text" id="startDate" name="pick_up_date" placeholder="Pick Up Date" required="" onchange="cal_duration()"/>
                                        <div class="return-car">
                                            <h4>Return DATE: <label id="due_dis" style="float:right;"></label></h4>
                                            <input type="text" id="endDate" name="return_date" placeholder="Return Date" required="" onchange="cal_duration()"/>
                                        </div>
                                        <input type="text" placeholder="duration" name="duration" id="time_duration" class="dnone"/>
                                    </div>
                                    <!--== Pick Up Location ==-->

                                    <!--== Car Choose ==-->
                                    <div class="choose-car-type book-item">
                                        <h4>CHOOSE CAR:</h4>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <select name="car_manufacturer" class="custom-select" required="">
                                                    <option value="notselected">Select</option>
                                                    <%
                                                        try {
                                                            Statement statement = null;
                                                            ResultSet resultSet = null;
                                                            String ava_bmw = "0";
                                                            String ava_audi = "0";
                                                            String ava_toyota = "0";
                                                            String ava_tata = "0";

                                                            DB_Connection obj_DB_Connection = new DB_Connection();
                                                            Connection connection = obj_DB_Connection.get_connection();
                                                            statement = connection.createStatement();
                                                            String sql = "SELECT * FROM cars WHERE c_status= 0 ";
                                                            resultSet = statement.executeQuery(sql);
                                                            while (resultSet.next()) {

                                                                if (resultSet.getString("c_manufacturer").equals("bmw")) {
                                                                    if (ava_bmw.equals("0")) {
                                                    %><option value="bmw">BMW</option><%
                                                            ava_bmw = "1";
                                                        }
                                                    } else if (resultSet.getString("c_manufacturer").equals("audi")) {
                                                        if (ava_audi.equals("0")) {
                                                    %><option value="audi">AUDI</option><%
                                                            ava_audi = "1";
                                                        }
                                                    } else if (resultSet.getString("c_manufacturer").equals("toyota")) {
                                                        if (ava_toyota.equals("0")) {
                                                    %><option value="toyota">TOYOTA</option><%
                                                            ava_toyota = "1";
                                                        }
                                                    } else if (resultSet.getString("c_manufacturer").equals("tata")) {
                                                        if (ava_tata.equals("0")) {
                                                    %><option value="tata">TATA</option><%
                                                                        ava_tata = "1";
                                                                    }
                                                                } else {
                                                                }
                                                            }

                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <select name="car_type" class="custom-select" required="">
                                                    <option value="notselected">Select</option>
                                                    <%
                                                        try {
                                                            Statement statement = null;
                                                            ResultSet resultSet = null;
                                                            String ava_sedan = "0";
                                                            String ava_suv = "0";
                                                            String ava_mpv = "0";
                                                            String ava_con = "0";
                                                            String ava_hat = "0";

                                                            DB_Connection obj_DB_Connection = new DB_Connection();
                                                            Connection connection = obj_DB_Connection.get_connection();
                                                            statement = connection.createStatement();
                                                            String sql = "SELECT * FROM cars WHERE c_status= 0 ";
                                                            resultSet = statement.executeQuery(sql);
                                                            while (resultSet.next()) {

                                                                if (resultSet.getString("c_type").equals("sedan")) {
                                                                    if (ava_sedan.equals("0")) {
                                                    %><option value="sedan">SEDAN</option><%
                                                            ava_sedan = "1";
                                                        }
                                                    } else if (resultSet.getString("c_type").equals("suv")) {
                                                        if (ava_suv.equals("0")) {
                                                    %><option value="suv">SUV</option><%
                                                            ava_suv = "1";
                                                        }
                                                    } else if (resultSet.getString("c_type").equals("mpv")) {
                                                        if (ava_mpv.equals("0")) {
                                                    %><option value="mpv">MPV</option><%
                                                            ava_mpv = "1";
                                                        }
                                                    } else if (resultSet.getString("c_type").equals("con")) {
                                                        if (ava_con.equals("0")) {
                                                    %><option value="con">CONVER</option><%
                                                            ava_con = "1";
                                                        }
                                                    } else if (resultSet.getString("c_type").equals("hat")) {
                                                        if (ava_hat.equals("0")) {
                                                    %><option value="hat">TRUCK</option><%
                                                                        ava_hat = "1";
                                                                    }
                                                                } else {
                                                                }
                                                            }

                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <!--== Car Choose ==-->
                                    <div class="dnone">
                                        <input type="text" name="placed_by" value="<%=session.getAttribute("user_username")%>" />
                                    </div>

                                    <div class="book-button text-center">
                                        <button class="book-now-btn">Book Now</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="col-lg-7 text-right">
                            <div class="display-table">
                                <div class="display-table-cell">
                                    <div class="slider-right-text">
                                        <h1>BOOK A CAR TODAY!</h1>
                                        <p>FOR AS LOW AS $10 A DAY PLUS 15% DISCOUNT <br> FOR OUR RETURNING CUSTOMERS</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--== slide Item One ==-->
        </section>
        <!--== Slider Area End ==-->

        <!--== About Us Area Start ==-->
        <section id="about-area" class="section-padding">
            <div class="container">
                <div class="row">
                    <!-- Section Title Start -->
                    <div class="col-lg-12">
                        <div class="section-title  text-center">
                            <h2>About us</h2>
                            <span class="title-line"><i class="fa fa-car"></i></span>
                            <p>That wonderful feeling , you start the engine and your adventure begins...</p>
                        </div>
                    </div>
                    <!-- Section Title End -->
                </div>

                <div class="row">
                    <!-- About Content Start -->
                    <div class="col-lg-6">
                        <div class="display-table">
                            <div class="display-table-cell">
                                <div class="about-content">
                                    <p>Renting a car brings you freedom, and we will help you find the right car for you at a great price. But there's much more to us than that. We're here to make renting a car a lot less hassle.</p>

                                    <p> everything we do is about giving you the freedom to discover more. We will move mountains to find you the right rental car, and bring you a smooth, hassle-free experience from start to finish.</p>
                                    <div class="about-btn">
                                        <a href="#">Book a Car</a>
                                        <a href="contact.jsp">Contact Us</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- About Content End -->

                    <!-- About Video Start -->
                    <div class="col-lg-6">
                        <div class="about-video">
                            <iframe src="https://player.vimeo.com/video/121982328?title=0&byline=0&portrait=0"></iframe>
                        </div>
                    </div>
                    <!-- About Video End -->
                </div>
            </div>
        </section>
        <!--== About Us Area End ==-->

        <!--== Partner Area Start ==-->
        <div id="partner-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="partner-content-wrap">
                            <!-- Single Partner Start -->
                            <div class="single-partner">
                                <div class="display-table">
                                    <div class="display-table-cell">
                                        <img src="../assets/img/partner/partner-logo-1.png" alt="JSOFT">
                                    </div>
                                </div>
                            </div>
                            <!-- Single Partner End -->

                            <!-- Single Partner Start -->
                            <div class="single-partner">
                                <div class="display-table">
                                    <div class="display-table-cell">
                                        <img src="../assets/img/partner/partner-logo-2.png" alt="JSOFT">
                                    </div>
                                </div>
                            </div>
                            <!-- Single Partner End -->

                            <!-- Single Partner Start -->
                            <div class="single-partner">
                                <div class="display-table">
                                    <div class="display-table-cell">
                                        <img src="../assets/img/partner/partner-logo-3.png" alt="JSOFT">
                                    </div>
                                </div>
                            </div>
                            <!-- Single Partner End -->

                            <!-- Single Partner Start -->
                            <div class="single-partner">
                                <div class="display-table">
                                    <div class="display-table-cell">
                                        <img src="../assets/img/partner/partner-logo-4.png" alt="JSOFT">
                                    </div>
                                </div>
                            </div>
                            <!-- Single Partner End -->

                            <!-- Single Partner Start -->
                            <div class="single-partner">
                                <div class="display-table">
                                    <div class="display-table-cell">
                                        <img src="../assets/img/partner/partner-logo-5.png" alt="JSOFT">
                                    </div>
                                </div>
                            </div>
                            <!-- Single Partner End -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--== Partner Area End ==-->

        <!--== Services Area Start ==-->
        <section id="service-area" class="section-padding">
            <div class="container">
                <div class="row">
                    <!-- Section Title Start -->
                    <div class="col-lg-12">
                        <div class="section-title  text-center">
                            <h2>Our Services</h2>
                            <span class="title-line"><i class="fa fa-car"></i></span>
                            <p>That wonderful feeling , you start the engine and your adventure begins...</p>
                        </div>
                    </div>
                    <!-- Section Title End -->
                </div>


                <!-- Service Content Start -->
                <div class="row">
                    <!-- Single Service Start -->
                    <div class="col-lg-4 text-center">
                        <div class="service-item">
                            <i class="fa fa-taxi"></i>
                            <h3>RENTAL CAR</h3>
                        </div>
                    </div>
                    <!-- Single Service End -->

                    <!-- Single Service Start -->
                    <div class="col-lg-4 text-center">
                        <div class="service-item">
                            <i class="fa fa-cog"></i>
                            <h3>CAR REPAIR</h3>
                        </div>
                    </div>
                    <!-- Single Service End -->

                    <!-- Single Service Start -->
                    <div class="col-lg-4 text-center">
                        <div class="service-item">
                            <i class="fa fa-map-marker"></i>
                            <h3>TAXI SERVICE</h3>
                        </div>
                    </div>
                    <!-- Single Service End -->

                    <!-- Single Service Start -->
                    <div class="col-lg-4 text-center">
                        <div class="service-item">
                            <i class="fa fa-life-ring"></i>
                            <h3>life insurance</h3>
                        </div>
                    </div>
                    <!-- Single Service End -->

                    <!-- Single Service Start -->
                    <div class="col-lg-4 text-center">
                        <div class="service-item">
                            <i class="fa fa-bath"></i>
                            <h3>car wash</h3>
                        </div>
                    </div>
                    <!-- Single Service End -->

                    <!-- Single Service Start -->
                    <div class="col-lg-4 text-center">
                        <div class="service-item">
                            <i class="fa fa-phone"></i>
                            <h3>call driver</h3>
                        </div>
                    </div>
                    <!-- Single Service End -->
                </div>
                <!-- Service Content End -->
            </div>
        </section>
        <!--== Services Area End ==-->

        <!--== Fun Fact Area Start ==-->
        <section id="funfact-area" class="overlay section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-11 col-md-12 m-auto">
                        <div class="funfact-content-wrap">
                            <div class="row">
                                <!-- Single FunFact Start -->
                                <div class="col-lg-4 col-md-6">
                                    <div class="single-funfact">
                                        <div class="funfact-icon">
                                            <i class="fa fa-smile-o"></i>
                                        </div>
                                        <div class="funfact-content">
                                            <p><span class="counter">550</span>+</p>
                                            <h4>HAPPY CLIENTS</h4>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single FunFact End -->

                                <!-- Single FunFact Start -->
                                <div class="col-lg-4 col-md-6">
                                    <div class="single-funfact">
                                        <div class="funfact-icon">
                                            <i class="fa fa-car"></i>
                                        </div>
                                        <div class="funfact-content">
                                            <p><span class="counter">250</span>+</p>
                                            <h4>CARS IN STOCK</h4>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single FunFact End -->

                                <!-- Single FunFact Start -->
                                <div class="col-lg-4 col-md-6">
                                    <div class="single-funfact">
                                        <div class="funfact-icon">
                                            <i class="fa fa-bank"></i>
                                        </div>
                                        <div class="funfact-content">
                                            <p><span class="counter">50</span>+</p>
                                            <h4>office in cities</h4>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single FunFact End -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--== Fun Fact Area End ==-->

        <!--== Choose Car Area Start ==-->
        <section id="choose-car" class="section-padding">
            <div class="container">
                <div class="row">
                    <!-- Section Title Start -->
                    <div class="col-lg-12">
                        <div class="section-title  text-center">
                            <h2>Choose your Car</h2>
                            <span class="title-line"><i class="fa fa-car"></i></span>
                            <p>That wonderful feeling , you start the engine and your adventure begins...</p>
                        </div>
                    </div>
                    <!-- Section Title End -->
                </div>

                <div class="row">
                    <!-- Choose Area Content Start -->
                    <div class="col-lg-12">
                        <div class="choose-content-wrap">
                            <!-- Choose Area Tab Menu -->
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#popular_cars" role="tab" aria-selected="true">Typs</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#newest_cars" role="tab" aria-selected="false">Manufacturers</a>
                                </li>
                            </ul>
                            <!-- Choose Area Tab Menu -->

                            <!-- Choose Area Tab content -->
                            <div class="tab-content" id="myTabContent">
                                <!-- Popular Cars Tab Start -->
                                <div class="tab-pane fade show active" id="popular_cars" role="tabpanel" aria-labelledby="home-tab">
                                    <!-- Popular Cars Content Wrapper Start -->
                                    <div class="popular-cars-wrap">
                                        <!-- Filtering Menu -->
                                        <div class="popucar-menu text-center">
                                            <a href="#" data-filter="*" class="active">all</a>
                                            <a href="#" data-filter=".sedan">Sedan</a>
                                            <a href="#" data-filter=".suv">SUV</a>
                                            <a href="#" data-filter=".mpv">MPV</a>
                                            <a href="#" data-filter=".con">Conver</a>
                                            <a href="#" data-filter=".hat">Truck</a>
                                        </div>

                                        <!-- Filtering Menu -->

                                        <!-- PopularCars Tab Content Start -->
                                        <div class="row popular-car-gird">

                                            <%
                                                try {
                                                    Statement statement = null;
                                                    ResultSet resultSet = null;

                                                    DB_Connection obj_DB_Connection = new DB_Connection();
                                                    Connection connection = obj_DB_Connection.get_connection();
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM cars ORDER BY c_up_datentime DESC";
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {

                                            %>


                                            <!-- Single Popular Car Start -->
                                            <div class="col-lg-4 col-md-6 <%=resultSet.getString("c_type")%>">
                                                <div class="single-popular-car">
                                                    <div class="p-car-thumbnails">
                                                        <a class="car-hover" href="../<%=resultSet.getString("c_img_url")%>">
                                                            <img src="../<%=resultSet.getString("c_img_url")%>" alt="JSOFT">
                                                        </a>
                                                    </div>

                                                    <div class="p-car-content">
                                                        <h3>
                                                            <a href="javascript:void(0)"><%=resultSet.getString("c_name")%></a>
                                                            <span class="price"><i class="fa fa-tag"></i> $<%=resultSet.getString("c_price")%>/day</span>
                                                            <%
                                                                if (resultSet.getString("c_status").equals("1")) {
                                                            %>
                                                            <h5 style="float:right;color:white;background: red;padding:5px 10px;">Booked <i class="fa fa-bookmark" aria-hidden="true"></i></h5>
                                                                <%
                                                                    }
                                                                %>
                                                        </h3>

                                                        <h5><%=resultSet.getString("c_manufacturer")%></h5>

                                                        <div class="p-car-feature">
                                                            <a href="javascript:void(0)"><%=resultSet.getString("c_description")%></a>
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
                                        <!-- PopularCars Tab Content End -->
                                    </div>
                                    <!-- Popular Cars Content Wrapper End -->
                                </div>
                                <!-- Popular Cars Tab End -->

                                <!-- Newest Cars Tab Start -->
                                <div class="tab-pane fade" id="newest_cars" role="tabpanel" aria-labelledby="profile-tab">
                                    <!-- Newest Cars Content Wrapper Start -->
                                    <div class="popular-cars-wrap">
                                        <!-- Filtering Menu -->
                                        <div class="newcar-menu text-center">
                                            <a href="#" data-filter="*" class="active">all</a>
                                            <a href="#" data-filter=".toyota">toyota</a>
                                            <a href="#" data-filter=".bmw">bmw</a>
                                            <a href="#" data-filter=".audi">audi</a>
                                            <a href="#" data-filter=".tata">Tata</a>
                                        </div>

                                        <!-- Filtering Menu -->

                                        <!-- NewestCars Tab Content Start -->
                                        <div class="row newest-car-gird">
                                            <%
                                                try {
                                                    Statement statement = null;
                                                    ResultSet resultSet = null;

                                                    DB_Connection obj_DB_Connection = new DB_Connection();
                                                    Connection connection = obj_DB_Connection.get_connection();
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM cars ORDER BY c_up_datentime DESC";
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {

                                            %>


                                            <!-- Single Popular Car Start -->
                                            <div class="col-lg-4 col-md-6 <%=resultSet.getString("c_manufacturer")%>">
                                                <div class="single-popular-car">
                                                    <div class="p-car-thumbnails">
                                                        <a class="car-hover" href="../<%=resultSet.getString("c_img_url")%>">
                                                            <img src="../<%=resultSet.getString("c_img_url")%>" alt="JSOFT">
                                                        </a>
                                                    </div>

                                                    <div class="p-car-content">
                                                        <h3>
                                                            <a href="javascript:void(0)"><%=resultSet.getString("c_name")%></a>
                                                            <span class="price"><i class="fa fa-tag"></i> $<%=resultSet.getString("c_price")%>/day</span>
                                                            <%
                                                                if (resultSet.getString("c_status").equals("1")) {
                                                            %>
                                                            <h5 style="float:right;color:white;background: red;padding:5px 10px;">Booked <i class="fa fa-bookmark" aria-hidden="true"></i></h5>
                                                                <%
                                                                    }
                                                                %>
                                                        </h3>

                                                        <h5><%=resultSet.getString("c_type")%></h5>

                                                        <div class="p-car-feature">
                                                            <a href="javascript:void(0)"><%=resultSet.getString("c_description")%></a>
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
                                        <!-- NewestCars Tab Content End -->
                                    </div>
                                    <!-- Newest Cars Content Wrapper End -->
                                </div>
                                <!-- Newest Cars Tab End -->
                            </div>
                            <!-- Choose Area Tab content -->
                        </div>
                    </div>
                    <!-- Choose Area Content End -->
                </div>
            </div>
        </section>
        <!--== Choose Car Area End ==-->

        <!--== Pricing Area Start ==-->
        <section id="pricing-area" class="section-padding overlay">
            <div class="container">
                <div class="row">
                    <!-- Section Title Start -->
                    <div class="col-lg-12">
                        <div class="section-title  text-center">
                            <h2>Only quality for clients</h2>
                            <span class="title-line"><i class="fa fa-car"></i></span>
                            <p>That wonderful feeling , you start the engine and your adventure begins...</p>
                        </div>
                    </div>
                    <!-- Section Title End -->
                </div>

                <!-- Pricing Table Conatent Start -->
                <div class="row">
                    <!-- Single Pricing Table -->
                    <div class="col-lg-4 col-md-6 text-center">
                        <div class="single-pricing-table">
                            <h3>BUSINESS</h3>
                            <h2>$ 55.99</h2>
                            <h5>PER MONTH</h5>

                            <ul class="package-list">
                                <li>FREE VEHICLE DELIVERY</li>
                                <li>WEDDINGS CELEBRATIONS</li>
                                <li>FULL INSURANCE INCLUDED</li>
                                <li>TRANSPORT ABROAD</li>
                                <li>ALL INCLUSIVE MINI BAR</li>
                                <li>CHAUFFER INCLUDED IN PRICE</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Single Pricing Table -->

                    <!-- Single Pricing Table -->
                    <div class="col-lg-4 col-md-6 text-center">
                        <div class="single-pricing-table">
                            <h3>Trial</h3>
                            <h2>Free</h2>
                            <h5>PER MONTH</h5>

                            <ul class="package-list">
                                <li>FREE VEHICLE DELIVERY</li>
                                <li>OTHER CELEBRATIONS</li>
                                <li>FULL INSURANCE</li>
                                <li>TRANSPORT ABROAD</li>
                                <li>MINI BAR</li>
                                <li>INCLUDED IN PRICE</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Single Pricing Table -->

                    <!-- Single Pricing Table -->
                    <div class="col-lg-4 col-md-6 text-center">
                        <div class="single-pricing-table">
                            <h3>standard</h3>
                            <h2>$ 35.99</h2>
                            <h5>PER MONTH</h5>

                            <ul class="package-list">
                                <li>DELIVERY AT AIRPORT</li>
                                <li>WEDDINGS AND OTHER</li>
                                <li>FULL INCLUDED</li>
                                <li>TRANSPORT ABROAD</li>
                                <li>ALL MINI BAR</li>
                                <li>CHAUFFER PRICE</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Single Pricing Table -->
                </div>
                <!-- Pricing Table Conatent End -->
            </div>
        </section>
        <!--== Pricing Area End ==-->

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