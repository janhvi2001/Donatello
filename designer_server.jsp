<%@page import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient,com.mongodb.client.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Designer's Server</title>
    </head>
    <body>
      
        
        <%
            String dname=request.getParameter("dn");
            String mob_no=request.getParameter("pn");
            String exp=request.getParameter("ye");
            String proj=request.getParameter("np");
          
            try{
               
                 MongoClient mongoc=new MongoClient("localhost",27017);
                 MongoDatabase database=mongoc.getDatabase("Artwall");
                 //database.createCollection("designers");
        //System.out.println("student_new collection created...");
        MongoCollection<Document> collection=database.getCollection("designers");
        Document d1=new Document("designer",dname).append("mob_no",mob_no).append("exp",exp).append("proj",proj);
        collection.insertOne(d1);    
        

            out.println("<script>alert('Data Saved.');window.location.assign('designer_data.html');</script>");
            }catch(Exception e){out.println(e);}

        %>
    </body>
</html>
