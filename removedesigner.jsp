
<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.model.Filters"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.mongodb.MongoClient,com.mongodb.client.*,org.bson.Document"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         try{
            String c1=request.getParameter("c1");

            
             MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("Artwall");      
        MongoCollection<Document> collection=database.getCollection("designers");
        collection.deleteOne(Filters.eq("c1",c1));
        FindIterable<Document> iterDoc = collection.find();
      int i = 0;    
      Iterator it = iterDoc.iterator();
      while (it.hasNext()) {
         out.println(it.next());
         i++;
      }
                out.println("<script>alert('Designer removed!');window.location.assign('designers_view.jsp');</script>");
            
         }catch(Exception e)
         {
             out.println(e); 
         }
        %>
       
    </body>
</html>