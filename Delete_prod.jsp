<%-- 
    Document   : Delete_prod
    Created on : Jan 26, 2022, 12:37:49 PM
    Author     : admin
--%>


<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient,com.mongodb.client.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             try{
            String mn=request.getParameter("mn");
            
            MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("Artwall");      
        MongoCollection<Document> collection=database.getCollection("product");
        collection.deleteOne(Filters.eq("mn", mn));
        FindIterable<Document> iterDoc = collection.find();
      int i = 0;    
      Iterator it = iterDoc.iterator();
      while (it.hasNext()) {
         out.println(it.next());
         i++;
      }
          out.println("<script>alert('Item removed');window.location.assign('adminproduct_view.jsp');</script>");  
            
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection c=DriverManager.getConnection("jdbc:mysql://localhost/products","root","");
//            Statement st=c.createStatement();
//            //p.setString(2,m);
//              st.executeUpdate("delete from stocks where prod_id="+p);
//            // if(i>0)
//             {
              
            // }
             /*else
             {
                 out.println("<script>alert('Something is wrong');window.location.assign('product_view.jsp');</script>");
             }*/
             
             }
             catch(Exception e){
             out.println(e);
             }
        %>
    </body>
</html>
