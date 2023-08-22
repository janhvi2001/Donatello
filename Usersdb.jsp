
<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient,com.mongodb.client.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.mongodb.*,com.mongodb.client.*,org.bson.Document"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User's Database</title>
        
        <style>
            
            body {
                background:url(u3.jpg);
                background-position: center center;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                
            }
        </style>
    </head>
    <body>
        <h1 align="center">User's Database</h1>
         <%
        try{
//         Class.forName("com.mysql.jdbc.Driver");
//         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UsersDB", "root", "");
//         Statement st = conn.createStatement();
//         ResultSet rs=st.executeQuery("select*from userinfo");

        MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("Artwall");
        MongoCollection<Document> c=database.getCollection("Register");
            
        FindIterable<Document> it=c.find();
            Iterator itr=it.iterator();

         out.println("<table align='center' border='2' cellspacing='10' cellpadding='20'><tr><th>Sr No.</th><th>UserName</th><th>Email</th><th>Password</th></tr>");
         int i=1;
          while(itr.hasNext())
            {
             // int i=1
                
                Document d=(Document)itr.next();
                
         out.println("<tr><td>"+i+"</td><td>"+d.getString("userid")+"</td><td>"+d.getString("e1")+"</td><td>"+d.getString("password")+"</td></tr>");
         i++;
         
         }
         out.println("</table>");
        
        }
        catch(Exception e){out.println(e);}
        %>
    </body>
</html>
