<%-- 
    Document   : feedback
    Created on : Feb 2, 2022, 7:29:31 PM
    Author     : admin
--%>

<%@page import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient,com.mongodb.client.*"%>

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
            String contact=request.getParameter("contact");
            String feedback=request.getParameter("feedback");
            
            
            try{
                
               MongoClient mongoc=new MongoClient("localhost",27017);
                 MongoDatabase database=mongoc.getDatabase("Artwall");
                 
        //System.out.println("student_new collection created...");
        MongoCollection<Document> collection=database.getCollection("feedback");
        Document d1=new Document("name",name).append("email",email).append("phone",contact).append("feedback",feedback);
        collection.insertOne(d1);    
                
//         Class.forName("com.mysql.jdbc.Driver");
//         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UsersDB", "root", "");
//         Statement st = conn.createStatement();
//         int i = st.executeUpdate("insert into feedback(name,email,contact,feedback)values('"+ name + "','" +  email + "','" + contact + "','" + feedback + "')");
        

out.println("<script>alert('Thank you.');window.location.assign('index.jsp');</script>"); 
            }
        catch(Exception e)
        {out.println(e);}
        
        %>
    </body>
</html>
