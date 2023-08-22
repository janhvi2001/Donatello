<%@page import="java.util.Date"%>
<%@page import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient,com.mongodb.client.*; "%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place Order</title>
      if(!!window.performance && window.performance.navigation.type == 2)
            {
                window.location.reload(true);
            }
    </head>
    <body>
        <%
           
            String username=session.getAttribute("user_name").toString();
            String email=request.getParameter("email");
            String name=request.getParameter("rec_name");
            String address=request.getParameter("rec_add");
            String mob=request.getParameter("mob_no");
            String modname=session.getAttribute("mdname").toString();
            String t=session.getAttribute("tot").toString();
            int tot=Integer.parseInt(t);
            String qt=session.getAttribute("qty").toString();
            int qty=Integer.parseInt(qt);
            
            try{
            
               MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("Artwall");
        //database.createCollection("orders");
        //System.out.println("student_new collection created...");
       
        MongoCollection<Document> collection=database.getCollection("orders");
        
        //Document d1=new Document("email",email).append("rec_name",name).append("rec_add",address).append("mob_no",mob).append("user_name",username);
        Document d1=new Document("email",email).append("rec_name",name).append("rec_add",address).append("mob_no",mob).append("user_name",username).append("date",new Date()).append("mdname",modname).append("qt",qty).append("tot",tot);
        collection.insertOne(d1);       
           out.println("<script>alert('Order Placed Successfully !!.');window.location.assign('product_view.jsp');</script>");
         
            }catch(Exception e){//out.println(e);
                
            }
        %>
       
    </body>
</html>