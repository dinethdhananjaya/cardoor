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
                                        if (resultSet.getString("b_placed_by").equals(session.getAttribute("user_username"))) {
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
                                                        <button type="button" class="btn cursorp" style="border: none;" onclick='document.getElementById("editcard<%=resultSet.getString("b_id")%>").style.display = "block";document.getElementById("detailscard<%=resultSet.getString("b_id")%>").style.display = "none";'><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                                                        <button class="btn cursorp" style="background-color: red; border: none;color: white;"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                                        <input class="dnone" name="book_id" type="text" value="<%=resultSet.getString("b_id")%>">
                                                        <input class="dnone" name="car_id" type="text" value="<%=resultSet.getString("b_car_id")%>">
                                                    </form>
                                                </div>

                                                <div class="car-list-info dnone" id="editcard<%=resultSet.getString("b_id")%>"><!-------------editcard-->
                                                    <form action="../updateABookingServlet" method="POST">
                                                        <h2><a href="javascript:void(0)"><i class="fa fa-bookmark"></i> Booking ID - <%=resultSet.getString("b_id")%></a></h2>
                                                        <h5>
                                                            <input type="text" name="pick_up_location" class="custom-input" id="location_input" required="" placeholder="Location" value="<%=resultSet.getString("b_pick_up_location")%>"/>
                                                        </h5>
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

                                                        <h5>
                                                            <p id="due_dis<%=resultSet.getString("b_id")%>" style="color:gray;"><%=resultSet.getString("b_duration_days")%> days</p>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <input type="date" id="str_date<%=resultSet.getString("b_id")%>" class="custom-input" placeholder="Pick Up Date" required="" onchange="cal_duration2(<%=resultSet.getString("b_id")%>)"/>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <input type="date" id="ret_date<%=resultSet.getString("b_id")%>" class="custom-input"  placeholder="Return Date" required="" onchange="cal_duration2(<%=resultSet.getString("b_id")%>)"/>
                                                                    <input type="text" placeholder="duration" name="duration" id="time_duration<%=resultSet.getString("b_id")%>" class="dnone" value="<%=resultSet.getString("b_duration_days")%>"/>
                                                                </div>
                                                            </div>
                                                        </h5>
                                                        <input class="dnone" name="pick_up_date" type="text" value="<%=resultSet.getString("b_pick_up_date")%>" id="str_date_val<%=resultSet.getString("b_id")%>">
                                                        <input class="dnone" name="return_date" type="text" value="<%=resultSet.getString("b_return_date")%>" id="ret_date_val<%=resultSet.getString("b_id")%>">
                                                        <script>
                                                            var str1 = "<%=resultSet.getString("b_pick_up_date")%>";
                                                            var mm1 = str1.substring(0, 2);
                                                            var dd1 = str1.substring(3, 5);
                                                            var yy1 = str1.substring(6, 10);
                                                            document.getElementById("str_date<%=resultSet.getString("b_id")%>").value = yy1 + "-" + mm1 + "-" + dd1;

                                                            var str2 = "<%=resultSet.getString("b_return_date")%>";
                                                            var mm2 = str2.substring(0, 2);
                                                            var dd2 = str2.substring(3, 5);
                                                            var yy2 = str2.substring(6, 10);
                                                            document.getElementById("ret_date<%=resultSet.getString("b_id")%>").value = yy2 + "-" + mm2 + "-" + dd2;
                                                        </script>
                                                        <h5>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <select name="car_manufacturer" class="custom-select" required="" style="font-variant: small-caps;">
                                                                        <option value="<%=resultSet.getString("b_car_manufacturer")%>" style="font-variant: small-caps;"><%=resultSet.getString("b_car_manufacturer")%></option>
                                                                        <%
                                                                            try {
                                                                                Statement statement3 = null;
                                                                                ResultSet resultSet3 = null;
                                                                                String ava_bmw = "0";
                                                                                String ava_audi = "0";
                                                                                String ava_toyota = "0";
                                                                                String ava_tata = "0";

                                                                                DB_Connection obj_DB_Connection3 = new DB_Connection();
                                                                                Connection connection3 = obj_DB_Connection3.get_connection();
                                                                                statement3 = connection3.createStatement();
                                                                                String sql3 = "SELECT * FROM cars WHERE c_status= 0 ";
                                                                                resultSet3 = statement3.executeQuery(sql3);
                                                                                while (resultSet3.next()) {

                                                                                    if (resultSet3.getString("c_manufacturer").equals("bmw")) {
                                                                                        if (ava_bmw.equals("0")) {
                                                                        %><option value="bmw">BMW</option><%
                                                                                ava_bmw = "1";
                                                                            }
                                                                        } else if (resultSet3.getString("c_manufacturer").equals("audi")) {
                                                                            if (ava_audi.equals("0")) {
                                                                        %><option value="audi">AUDI</option><%
                                                                                ava_audi = "1";
                                                                            }
                                                                        } else if (resultSet3.getString("c_manufacturer").equals("toyota")) {
                                                                            if (ava_toyota.equals("0")) {
                                                                        %><option value="toyota">TOYOTA</option><%
                                                                                ava_toyota = "1";
                                                                            }
                                                                        } else if (resultSet3.getString("c_manufacturer").equals("tata")) {
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
                                                                    <select name="car_type" class="custom-select" required="" style="font-variant: small-caps;">
                                                                        <option value="<%=resultSet.getString("b_car_type")%>" style="font-variant: small-caps;"><%=resultSet.getString("b_car_type")%></option>
                                                                        <%
                                                                            try {
                                                                                Statement statement4 = null;
                                                                                ResultSet resultSet4 = null;
                                                                                String ava_sedan = "0";
                                                                                String ava_suv = "0";
                                                                                String ava_mpv = "0";
                                                                                String ava_con = "0";
                                                                                String ava_hat = "0";

                                                                                DB_Connection obj_DB_Connection4 = new DB_Connection();
                                                                                Connection connection4 = obj_DB_Connection4.get_connection();
                                                                                statement4 = connection4.createStatement();
                                                                                String sql4 = "SELECT * FROM cars WHERE c_status= 0 ";
                                                                                resultSet4 = statement4.executeQuery(sql4);
                                                                                while (resultSet4.next()) {

                                                                                    if (resultSet4.getString("c_type").equals("sedan")) {
                                                                                        if (ava_sedan.equals("0")) {
                                                                        %><option value="sedan">SEDAN</option><%
                                                                                ava_sedan = "1";
                                                                            }
                                                                        } else if (resultSet4.getString("c_type").equals("suv")) {
                                                                            if (ava_suv.equals("0")) {
                                                                        %><option value="suv">SUV</option><%
                                                                                ava_suv = "1";
                                                                            }
                                                                        } else if (resultSet4.getString("c_type").equals("mpv")) {
                                                                            if (ava_mpv.equals("0")) {
                                                                        %><option value="mpv">MPV</option><%
                                                                                ava_mpv = "1";
                                                                            }
                                                                        } else if (resultSet4.getString("c_type").equals("con")) {
                                                                            if (ava_con.equals("0")) {
                                                                        %><option value="con">CONVER</option><%
                                                                                ava_con = "1";
                                                                            }
                                                                        } else if (resultSet4.getString("c_type").equals("hat")) {
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
                                                        </h5>
                                                        <input class="dnone" name="id" type="text" value="<%=resultSet.getString("b_id")%>">
                                                        <input class="dnone" name="prev_car_manufacturer" type="text" value="<%=resultSet.getString("b_car_manufacturer")%>">
                                                        <input class="dnone" name="prev_car_type" type="text" value="<%=resultSet.getString("b_car_type")%>">
                                                        <input class="dnone" name="prev_car_id" type="text" value="<%=resultSet.getString("b_car_id")%>">
                                                        <input class="dnone" name="prev_car_price" type="text" value="<%=pb_prev_car_price%>">
                                                        <button type="button" class="btn cursorp" style="border: none;"><a href='bookings.jsp' ><i class="fa fa-times" aria-hidden="true"></i></a></button>
                                                        <button type="submit" class="btn cursorp" style="background-color: MediumSeaGreen; border: none;color: white;"><i class="fa fa-check-square-o" aria-hidden="true"></i></button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Car info -->
                                </div>
                            </div>
                            <!-- Single Car End -->

                            <%        } else {

                                        }
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
                                <h3>BOOK NOW</h3>

                                <div class="sidebar-body">
                                    <form action="../addABookingServlet" method="POST">
                                        <!--== Pick Up Location ==-->
                                        <div class="pickup-location book-item">
                                            <h6>PICK-UP LOCATION:</h6>
                                            <input type="text" name="pick_up_location" class="custom-input" id="location_input2" required="" placeholder="Location"/>
                                        </div>
                                        <!--== Pick Up Location ==-->

                                        <script>
                                            var searchInput = 'location_input2';

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
                                            <h6>PICK-UP DATE:</h6>
                                            <input type="text" id="startDate" name="pick_up_date" placeholder="Pick Up Date" required="" onchange="cal_duration()"/>
                                            <div class="return-car">
                                                <h6>Return DATE: <label id="due_dis" style="float:right;"></label></h6>
                                                <input type="text" id="endDate" name="return_date" placeholder="Return Date" required="" onchange="cal_duration()"/>
                                            </div>
                                            <input type="text" placeholder="duration" name="duration" id="time_duration" class="dnone"/>
                                        </div>
                                        <!--== Pick Up Location ==-->

                                        <!--== Car Choose ==-->
                                        <div class="choose-car-type book-item">
                                            <h6>CHOOSE CAR:</h6>
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
                            <!-- Single Sidebar End -->

                            <!-- Single Sidebar Start -->
                            <div class="single-sidebar">
                                <h3>How was it ?</h3>

                                <div class="sidebar-body">
                                    <form action="../makeAReviewServlet" method="POST">
                                        <textarea class="custom-input" name="review_message"  cols="40" rows="10" placeholder="Make a Review..." minlength="10" required=""></textarea>
                                        <input type="text" name='review_user' value="<%=session.getAttribute("user_username")%>" class="dnone">
                                        <div class="text-center">
                                            <br>
                                            <button class="book-now-btn" style="font-size:15px; background: gray; color: white">Review us</button>
                                        </div>
                                    </form>
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