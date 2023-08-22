


<%@page import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient,com.mongodb.client.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <%
            int qty=Integer.parseInt(request.getParameter("qt1"));
            String model=request.getParameter("model");
            String cn=request.getParameter("cname");
            String img=request.getParameter("img");
            int price=Integer.parseInt(request.getParameter("price"));
            int t=qty*price;
            int total=t;
            
             try{
           MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("Artwall");
        //database.createCollection("cart");
        //System.out.println("student_new collection created...");
        MongoCollection<Document> collection=database.getCollection("cart");
        
        Document d1=new Document("qt1",qty).append("cn",cn).append("model",model).append("img",img).append("price",price).append("t",total).append("status","NO").append("user",session.getAttribute("user_name").toString());
        collection.insertOne(d1);

        out.println("<script>alert('Product Added into Cart Successfully');window.location.assign('product_view.jsp');</script>");
        
        

          

            
            
            
             }catch(Exception e){out.println(e);}
        %>
    </body>
</html>
