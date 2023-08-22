<%-- 
    Document   : admin_appointments
    Created on : Feb 5, 2022, 12:45:30 AM
    Author     : admin
--%>

<%@page import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient,com.mongodb.client.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String schedule=request.getParameter("schedule");
             String timeslot=request.getParameter("timeslot");
             String date=request.getParameter("date");
             String contact=request.getParameter("phone");
             String description=request.getParameter("description");
             
            
            
                 
          try{
//         Class.forName("com.mysql.jdbc.Driver");
//         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UsersDB", "root", "");
//         Statement st = conn.createStatement();
//         int i = st.executeUpdate("insert into appointment(name,email,schedule,timeslot,date,contact,description) values('"+ name + "','" +  email + "','" + schedule + "','" + timeslot + "','" + date + "','" + contact + "','" + description+ "')");
//         
            MongoClient mongoc=new MongoClient("localhost",27017);
                 MongoDatabase database=mongoc.getDatabase("Artwall");
                 //database.createCollection("appointments");
       
        MongoCollection<Document> collection=database.getCollection("appointments");
        Document d1=new Document("name",name).append("email",email).append("schedule",schedule).append("timeslot",timeslot).append("date",date).append("phone",contact).append("description",description);
        collection.insertOne(d1);   

         out.println("<script>alert('Thank you, Appointment Booked.');window.location.assign('index.jsp');</script>"); 
            
          
          
          }
        catch(Exception e)
        {out.println(e);}
        
        %>
    </body>
</html>
