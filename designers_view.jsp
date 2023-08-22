

<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.model.Filters"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.mongodb.MongoClient,com.mongodb.client.*,org.bson.Document"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Designer's Database</title>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        
        <style>
            
            body {
                background:#ACCFBF;
             
            }
            
            
        </style>
        
    </head>
    
    <body>
        
        <script>
            if(!!window.performance && window.performance.navigation.type == 2)
            {
                window.location.reload(true);
            }
        </script>
        <h1 align="center">Designer's Information</h1>
        
        
        <%
        try{
            
        MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("Artwall");
        MongoCollection<Document> c=database.getCollection("designers");
            
        FindIterable<Document> it=c.find();
            Iterator itr=it.iterator();
         out.println("<table align='center' border='2' cellspacing='10' cellpadding='20'><tr><th>Sr No.</th><th>Designer's Name</th><th>Phone Number</th><th>Years Of Experience</th><th>Number Of Projects Undertaken</th><th>Action</th></tr>");
         int i=1;
         while(itr.hasNext())
            {
            
                Document d=(Document)itr.next();
         out.println("<tr><td>"+i+"</td><td>"+d.getString("designer")+"</td><td>"+d.getString("mob_no")+"</td><td>"+d.getString("exp")+"</td><td>"+d.getString("proj")+"</td><td><input type='hidden' name='c1' value='"+i+"'><form action='removedesigner.jsp' method='POST'><button class='button button2'>Remove <i class='fa fa-trash-o'></i></button></form></td></tr>");
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
