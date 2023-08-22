
<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient,com.mongodb.client.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Products</title>
        <!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


                <style>
            body {
                margin: 0;
                background:#ACCFBF;
                background-size: 2000px 1350px;
            }

ul.sidenav {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 25%;
  background-color: #71797E;
  position: fixed;
  height: 100%;
  overflow: auto;
}

ul.sidenav li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}
 
ul.sidenav li a.active {
  background-color: #ACCFBF;
  color: white;
}

ul.sidenav li a:hover:not(.active) {
  background-color: #555;
  color: white;
}

div.content {
  margin-left: 25%;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 900px) {
  ul.sidenav {
    width: 100%;
    height: auto;
    position: relative;
  }
  
  ul.sidenav li a {
    float: left;
    padding: 15px;
  }
  
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  ul.sidenav li a {
    text-align: center;
    float: none;
  }
}
            .button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}
.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #abb0ac;
}

.button2:hover {
  background-color: #abb0ac;
  color: white;
}

            body {
  font-family: Arial, Helvetica, sans-serif;
}

.flip-box {
  background-color: transparent;
  width: 300px;
  height: 200px;
  border: 1px solid #f1f1f1;
  perspective: 1000px;
}

.flip-box-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

.flip-box:hover .flip-box-inner {
  transform: rotateY(180deg);
}

.flip-box-front, .flip-box-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}

.flip-box-front {
  background-color: #bbb;
  color: black;
}

.flip-box-back {
  background-color: #404541;
  color: white;
  transform: rotateY(180deg);
}
        </style>
    </head>
    <body>
        <ul class="sidenav">
  <li><a href="Usersdb.jsp">Users Database</a></li>
                    <li><a href="AdHome.html">Homepage</a></li>
                    <li><a href="admin_feedback.jsp" >Feedback</a></li>
                    <li><a href="view_appointments.jsp">Appointment</a></li>
                    <li><a href="Product.html">Add Products</a></li>
                    <li><a href="designer_data.html">Designer's Form</a></li>
                    <li><a href="designers_view.jsp">Designer's Database</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
</ul>
     
        <div class="content">
            <h1>PRODUCT LIST</h1>
        <%
        try{
            //String s1=request.getParameter("s1");
            //String pid=request.getParameter("pid");
             MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("Artwall");
        MongoCollection<Document> c=database.getCollection("product");
                    
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection c=DriverManager.getConnection("jdbc:mysql://localhost/products","root","");
//            Statement st=c.createStatement();

FindIterable<Document> it=c.find();
            Iterator itr=it.iterator();
            out.println("<table border=0 align='center' cellspacing=40 cellpadding=40><tr>"); 
            int i=0;
            while(itr.hasNext())
            {
              
                Document d=(Document)itr.next();
  
                if(d.getString("bd")!=null)
                {
//----------------------------------
            
//            ResultSet rs=st.executeQuery("select * from stocks");
//            out.println("<table border=0 align='center' cellspacing=40 cellpadding=40><tr>");
//            int i=0;
//           
//            while(rs.next())
//            {
               // String prodid=d.getString(8);
                //String mn=d.getString(2);
                //String ct=rs.getString(3);
               // String sp=d.getString(4);
              out.println("<td>"+ "<div class='flip-box'><div class='flip-box-inner'><div class='flip-box-front'><img src='"+d.getString("bd")+"' width=298 height=198></div>"
                        + " <div class='flip-box-back'>Company :"+d.getString("cn")+"<hr><br>Model Name:"+d.getString("mn")+"<input type='hidden' value='"+d.getString("mn")+"' name='model'><br>Price :"+d.getString("sp")+"<input type='hidden' name='price' value='"+d.getString("sp")+"'><hr>Description :"+d.getString("sp")+"<hr>"+ "Enter Quantity :<input type='number' value='1' id='qt' name='qt1'><hr><br><form action='Delete_prod.jsp' method='post'><input type='hidden' value='"+d.getString("mn")+"' name='mn' id='mn"+i+"'><button class='button button2'>Remove <i class='fa fa-trash-o'></i></button> </form><input type='hidden' value='"+d.getString("mn")+"' name='pid' id='pid"+i+"'></form></div></div></div></td>");
                
                }

                i++;
                if(i%2==0)
                {
                    out.println("</tr><tr>");
                    out.println("</tr><tr>");
                }

            }
             
            out.println("</table>");
            
                    
            
        }catch(Exception e){out.println(e);}
        %>
        </div>
    </body>
</html>
