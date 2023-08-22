<%-- 
    Document   : admin_vieworders
    Created on : Feb 10, 2022, 1:59:22 AM
    Author     : admin
--%>

<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.model.Filters"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.mongodb.*,com.mongodb.MongoClient.*,org.bson.Document"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
     <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" href="css/styles.css">
        
        <style>
           
            body {
                background:url(feed-bg.jfif);
                background-size: 2000px 700px;
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
                    <li><a href="view_appointments.jsp">Appointment</a></li>
                    <li><a href="Product.html">Add Products</a></li>
                    <li><a href="adminproduct_view.jsp">View Products</a></li>
                    <li><a href="designer_data.html">Designer's Form</a></li>
                    <li><a href="designers_view.jsp">Designer's Database</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
                </ul>

            </nav>

        </header>
        
        <h1 align="center">Orders Placed By User</h1>
        
        
        <%

        MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("Artwall");
        MongoCollection<Document> c=database.getCollection("orders");
            
        FindIterable<Document> it=c.find();
            Iterator itr=it.iterator();
           

out.println("<table border=1 align='center' cellspacing=10 cellpadding=20 ><tr><td> Sr. No</td><td>Model_Name</td><td>Quantity</td><td>Total</td><td>Receiver</td><td>Address</td><td>Date</td><td>Username</td></tr>");
  int i=1;
         while(itr.hasNext())
            {
            
                Document d=(Document)itr.next();
        
//{
//int t=Integer.parseInt(rs.getString(3));
//int quantity=Integer.parseInt(rs.getString(2));
//String modname=rs.getString(1);
//String email=rs.getString(4);
//String recname=rs.getString(5);
//String add=rs.getString(6);
//String mob=rs.getString(7);
//String date=rs.getString(8);
//String username=rs.getString(9);
out.println("<tr><td>"+i+"</td><td>"+d.getString("mdname")+"</td><td>"+d.getInteger("qt")+"</td><td>"+d.getInteger("tot") +"</td><td>"+d.getString("rec_name")+"</td><td>"+d.getString("rec_add")+"</td><td>"+d.getDate("date")+"</td><td>"+d.getString("user_name")+"</td></tr>");
i++;
}
//<td>"+d.getString("email")+"</td>

        %>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
       
    </body>
</html>
