<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient,com.mongodb.client.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Appointments</title>
        
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" href="css/styles.css">
        
        <style>
         body {
                background:url(u5.jpg);
                background-position: center center;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                opacity:20;
                filter:alpha(opacity=10);
            }
            
            table {
                top: 150px;
                left:100px;
                position:absolute;
                width:80%; 
                border: 2px solid black;
            }
            
            td,tr,th {
                border: 2px solid black;
            }
        </style>
    </head>
    <body class="top">
        
        <div id="preloader">
        <div id="loader">
        </div>
    </div>


    <!-- page wrap
    ================================================== -->
    <div id="page" class="s-pagewrap">


        <!-- # site header 
        ================================================== -->
        <header class="s-header">

            <div class="s-header__logo">
                <a class="logo" href="AdHome.html">
                    <img src="images/logo.svg" alt="Homepage">
                </a>
            </div>

            
            
            <a class="s-header__menu-toggle" href="#0">
                <span class="s-header__menu-text">Menu</span>
                <span class="s-header__menu-icon"></span>
            </a>

            <nav class="s-header__nav">

                <a href="#0" class="s-header__nav-close-btn" title="close"><span>Close</span></a>
                <h3>Redecor.</h3>

                <ul class="s-header__nav-list">
                    <li><a href="Usersdb.jsp">Users Database</a></li>
                    <li><a href="admin_feedback.jsp" >Feedback</a></li>
                    <li><a href="Product.html">Add Products</a></li>
                    <li><a href="pending_orders.jsp">Order Dispatch</a></li>
                    <li><a href="adminproduct_view.jsp">View Products</a></li>
                    <li><a href="designer_data.html">Designer's Form</a></li>
                    <li><a href="designers_view.jsp">Designer's Database</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
                </ul>

            </nav>

        </header>
        
        <%
        try{
                 MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("Artwall");
        MongoCollection<Document> c=database.getCollection("appointments");
            
        FindIterable<Document> it=c.find();
            Iterator itr=it.iterator();
         out.println("<table align='center' border='2' cellspacing='10' cellpadding='20'><tr><th>Sr No.</th><th>Name</th><th>Email</th><th>Schedule</th><th>Timeslot</th><th>Date</th><th>Contact</th><th>Description</th></tr>");
         int i=1;
         while(itr.hasNext())
            {
             // int i=1
                
                Document d=(Document)itr.next();
         out.println("<tr><td><b>"+i+"</b></td><td><b>"+d.getString("name")+"</b></td><td><b>"+d.getString("email")+"</b></td><td><b>"+d.getString("schedule")+"</b></td><td><b>"+d.getString("timeslot")+"</b></td><td><b>"+d.getString("date")+"</b></td><td><b>"+d.getString("phone")+"</b></td><td><b>"+d.getString("description")+"</b></td></tr>");
         i++;
         
         }
         out.println("</table>");
        
        }
        catch(Exception e){out.println(e);}
        %>
        
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
        
    </body>
</html>
