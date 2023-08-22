<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient,com.mongodb.client.*"%>
<%
String userid = request.getParameter("userid");
String email = request.getParameter("e1");
String password = request.getParameter("password");
String confpass=request.getParameter("p2");

  MongoClient mongo = new MongoClient( "localhost" , 27017 );
	
	// Accessing the database
	MongoDatabase database = mongo.getDatabase("Artwall");
 
	MongoCollection<Document> collection = database.getCollection("Register");
	//out.println("Collection student_data selected successfully");
	
        Document document = new Document("userid",userid)
	.append("e1",email)
        .append("password",password)
        .append("p2",confpass);
        
        
        collection.insertOne(document);
	//out.println("Data Saved Successfully");
        
try {
    if(password!=null && confpass!=null )
    {
        if(!password.equals(confpass))
        {
          out.println("<script>alert('Please confirm your password again.');window.location.assign('login.html');</script>");  
        }
        else
        {
            out.println("<script>alert('Thank you for registering.'); window.location.assign('login.html');</script>");
        }
    }
    
    
    FindIterable<Document> iterDoc = collection.find();
		int i = 1;
		
		Iterator it = iterDoc.iterator();
		while (it.hasNext()) {
			out.println(it.next());
			
			i++;
		}
    
 /*Class.forName("com.mysql.jdbc.Driver");
 Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/userinfo", "root", "");
 Statement st = c.createStatement();*/
 //int i = st.executeUpdate("insert into users(userid,email,password)values('"+ userid + "','" +  email + "','" + password + "')");
  
 //if(i>0)
 //if(document>0)
 //{
//out.println("<script>alert(Thank you for registering !);window.location.assign('login.html');</script>");
//}
} catch (Exception e) {out.print(e);}
%>