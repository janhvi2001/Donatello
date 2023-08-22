
<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.bson.conversions.Bson, com.mongodb.client.model.UpdateOptions,com.mongodb.client.model.Updates,com.mongodb.client.result.UpdateResult;
"%>
<%@page import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient,com.mongodb.client.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String qty=request.getParameter("q");
            String total=request.getParameter("t");
            String cart=request.getParameter("cart");
            //out.println("quantity :"+qty+" and total="+total+" cartid="+cart+"");
            try{
                MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("Artwall");      
        MongoCollection<Document> collection=database.getCollection("cart");
        
        Document query=new Document();
        query.append("q",qty).append("t", total).append("cart", cart);
    
        Document setData=new Document();
        setData.append("q",qty).append("t", total).append("cart", cart);
        
        Document update=new Document();
        update.append("$set", setData);
        collection.updateOne(query, update);
        
         String contextPath = request.getContextPath();
            response.sendRedirect(response.encodeRedirectURL(contextPath + "/view_cart.jsp"));
        
        
//        Bson filter = Filters.eq("q", "t");
//Bson update = Updates.set$("t", total);
//out.println(collection.updateOne(filter, update));
//FindIterable<Document> it=collection.find();
//        Iterator itr=it.iterator();
//            int i=0;
//            while(itr.hasNext())
//            {          
//i++;
//            out.println("<script>alert('Updated!');window.location.assign('view_cart.jsp');</script>");
//            
//            }
            }catch(Exception e){out.println(e);}
        %>
    </body>
</html>
