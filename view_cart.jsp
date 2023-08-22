
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.mongodb.*,com.mongodb.MongoClient.*,org.bson.Document,java.util.Iterator"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            
            body {
                background:#ACCFBF;
            }
            
            .right {
                top:10px;
                position:absolute;
                left:1220px;
            }
            
            right1 {
                top:5px;
                left:500px;
                position:absolute;
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
  background-color: #333; 
  color: white; 
  border: 2px solid #abb0ac;
}

.button2:hover {
  background-color: #abb0ac;
  color: white;
}

            body {
  font-family: Arial, Helvetica, sans-serif;
}
body {margin: 0;}

ul.topnav {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

ul.topnav li {float: left;}

ul.topnav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

ul.topnav li a:hover:not(.active) {background-color: #838585;}

ul.topnav li a.active {background-color: #838585;}

ul.topnav li.right {float: right;}

@media screen and (max-width: 600px) {
  ul.topnav li.right, 
  ul.topnav li {float: none;}
}
        </style>
        <script>
            function incr(i,price)
            {
                
                var qty=document.getElementById("qt"+i).innerHTML; 
                //var cid=document.getElementById("cid"+i).value;
                var cid1=document.getElementById("cid"+i).value;
               
                 if(Number(qty)<5)
                    {
                    qty=Number(qty)+1;
                    var p=Number(qty)*Number(price);
                    document.getElementById("total"+i).innerHTML=p;
                    document.getElementById("qt"+i).innerHTML=qty;
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() 
                    {
                        if (this.readyState === 4 && this.status === 200) 
                        {
                            document.getElementById("output").innerHTML = this.responseText;
                        }
                    };
                    xhttp.open("GET", "modify_qty_total.jsp?qt1="+qty+"&t="+p+"&cart="+cid1, true);
                    xhttp.send();
                
                
                var tot=document.getElementById("tt").value;
                var gt=0;
                for(var x=1; x<=tot;x++ )
                {
                    gt+=Number(document.getElementById("total"+x).innerHTML);
                }
                document.getElementById("grand_total").innerHTML=gt;
            }
            }
            function decr(i,price)
            {
                var qty=document.getElementById("qt"+i).innerHTML;
                var cid=document.getElementById("cid"+i).value;
                
                if(Number(qty)>1)
                {
                    qty=Number(qty)-1;
                    var p=Number(qty)*Number(price);
                    document.getElementById("total"+i).innerHTML=p;
                    document.getElementById("qt"+i).innerHTML=qty;     
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() 
                    {
                        if (this.readyState == 4 && this.status == 200) 
                        {
                            document.getElementById("output").innerHTML = this.responseText;
                         }
                    };
                    xhttp.open("GET", "modify_qty_total.jsp?q="+qty+"&t="+p+"&cart="+cid, true);
                    xhttp.send();
                    
                    
                    var tot=document.getElementById("tt").value;
                var gt=0;
                for(var x=1; x<=tot;x++ )
                {
                    gt+=Number(document.getElementById("total"+x).innerHTML);
                }
                document.getElementById("grand_total").innerHTML=gt;
            
                }
            }
        </script>
        
    </head>
    <body>
        <script>
            if(!!window.performance && window.performance.navigation.type == 2)
            {
                window.location.reload(true);
            }
         </script>
         
         
         
        
        <ul class="topnav">
  <li><a  href="index.jsp">Home</a></li>
  <li><a href="product_view.jsp">Product</a></li>
  <li><a class="active" href="view_cart.jsp">View Cart</a></li>
  <li class="right" style="color: white">Welcome <%=session.getAttribute("user_name")%></li>
  <li class="right1"><a href="logout.jsp">Logout</a></li>
</ul>
        <div style="padding:0 16px;"><br><br>
            <h2 align="center">Cart Details</h2>
        <%
            
        try{
            
             MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("Artwall");
        MongoCollection<Document> c=database.getCollection("cart");
            
        FindIterable<Document> it=c.find();
            Iterator itr=it.iterator();
            out.println("<table border=1 align='center' cellspacing=20 cellpadding=20><tr><td>Sr. No</td><td>Product Image</td><td>Company Name</td><td>Model Name</td><td>Price</td><td>Total Price</td><td>Action</td></tr>"); //<td>Quantity</td>
             int gt=0;
            int i=0;
            int j=1;
            while(itr.hasNext())
            {
             // int i=1
                
                Document d=(Document)itr.next();
                
               String modname=d.getString("model");
               session.setAttribute("mdname",modname);
                
                int t=d.getInteger("t");
              
               int quantity=d.getInteger("qt1");
               session.setAttribute("qty",quantity);
               
               int price=d.getInteger("price");
               gt=gt+t;
                session.setAttribute("tot",gt);
                out.println("<tr><td>"+j+"</td><td><img src='"+d.getString("img")+"' width=100 height=100></td><td><input type='hidden' name='c1' value='"+j+"' id='cid"+i+"'>"+d.getString("cn")+"</td><td>"+modname+"</td><hr></td><td>"+price+"</td><td><div id='total"+i+"'>"+t+"</div></td><td><form action='removecart.jsp' method='POST'><button class='button button2'>Remove <i class='fa fa-trash-o'></i></button></form></td></tr>");
//<div><input type='button' value='-' id='dec' onclick='decr("+i+","+price+")'>&nbsp;&nbsp;&nbsp;<input type='button' value='+' id='inc' onclick='incr("+i+","+price+")'></div>                
//<td><div id='qt"+i+"'>"+quantity+"</div>
                i++;
                j++;
            }
                out.println("<script><input type='hidden' id='tt' value="+(i-1)+"></script>");
                       out.println("<tr><td colspan=5>Grand Total</td><td><div id='grand_total'>"+gt+"</div></td><td><a href='product_view.jsp'><input type='submit' class='button button2' name='add_more' value='Add More Items'></a><br><br></td></tr><table>");

             // if(session.getAttribute("user_name")==null)
              //{
//               out.println("<tr><td>"+j+"</td><td><img src='"+d.getString("img")+"' width=100 height=100></td><td><input type='hidden' name='c1' value='"+j+"' id='cid"+i+"' >"+d.getString("cn")+"</td><td>"+modname+"</td><td><div id='qt"+i+"'>"+quantity+"</div><hr><div><input type='button' value='-' id='dec' onclick='decr("+i+","+price+")'>&nbsp;&nbsp;&nbsp;<input type='button' value='+' id='inc' onclick='incr("+i+","+price+")'></div></td><td>"+price+"</td><td><div id='total"+i+"'>"+t+"</div></td><td><form action='removecart.jsp' method='POST'><button class='button button2'>Remove <i class='fa fa-trash-o'></i></button></form></td></tr>");
//               
//               i++;
//               j++;
               //}  


        }
         catch(Exception e){out.println(e);}
        %>
    
       
        <br><hr><br>
        </div>
<div id="output">
            <h2 align="center">Delivery Details</h2>
            <form action="place_order.jsp" method="POST">
            <table border="1" align="center">
                <tr><td>Enter Email :</td><td><input type='email' name="email"></td></tr>
                <tr><td>Enter Receiver Name :</td><td>
                <input type='text' name="rec_name"></td></tr>
                <tr><td>Enter Receiver Address :</td><td>
                <textarea rows="3" cols="30" name="rec_add"> </textarea>  </td></tr>
                <tr><td>Enter Mobile No :</td><td> 
                <input type='text' name='mob_no'></td></tr>
                <tr><td>Payment Mode:</td><td><label>COD(only)</label></td></tr>
                <tr><td colspan="2" align='center'>
               <input type='submit' class='button button2' name='save1' 
                  value="Place Order">  </td></tr>

             </table>
            </form>     
        </div>

        <br><br>
        </div>
        
    </body>
</html>
