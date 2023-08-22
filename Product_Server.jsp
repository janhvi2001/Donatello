


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
            String cn=request.getParameter("cn");
            String mn=request.getParameter("mn");
            String ct=request.getParameter("ct");
            String cp=request.getParameter("cp");
            String sp=request.getParameter("sp");
            String mi=request.getParameter("bd");
            String ds=request.getParameter("ds");
            try{
           
            
             MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("Artwall");
       // database.createCollection("products");
        //System.out.println("student_new collection created...");
        MongoCollection<Document> collection=database.getCollection("product");
        Document d1=new Document("cn",cn).append("mn",mn).append("ct", ct).append("cp",cp).append("sp",sp).append("bd",mi).append("ds",ds);
        collection.insertOne(d1);
       // out.println("Document Inserted");
            
            out.println("<script>alert('Data Saved.');window.location.assign('Product.html');</script>");
            }catch(Exception e){out.println(e);}

        %>
    </body>
</html>
