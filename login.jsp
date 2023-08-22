
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%@page import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient,com.mongodb.client.*"%>
<%@page import="java.util.Iterator"%>



<%
    try{
            String user = request.getParameter("userid1");
            String password = request.getParameter("password1");

            
             MongoClient mongo = new MongoClient( "localhost" , 27017 );
	
	
	MongoDatabase database = mongo.getDatabase("Artwall");
	
            MongoCollection<Document> collection = database.getCollection("Register");
            FindIterable<Document> iterDoc = collection.find();
		int i = 0;
		
		Iterator it = iterDoc.iterator();
                 i++;
		while (it.hasNext()) {
                    

                  
                    //out.println(it.next());
                    
                    Document d=(Document)it.next();
                    String uid=d.getString("userid");
                    String pass=d.getString("password");
                    
           
 if (user.equals(uid) && password.equals(pass)) {
     String userid=d.getString("userid");
     session.setAttribute("user_name",userid);
     response.sendRedirect("index.jsp");
 } 
 else if(user.equals("ADMIN123") && password.equals("ADMIN123"))
             {
                 response.sendRedirect("AdHome.html");
              }
  else {
   out.println("<script>alert('incorrect username or password'); window.location.assign('login.html');</script>");
 }}
                   
          
           
    } 
    catch (Exception e) {
        out.println(e);
    }
        
%>




