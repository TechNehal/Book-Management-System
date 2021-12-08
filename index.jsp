
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
  if (request.getParameter("submit")!=null) 
  {  
    String bname=request.getParameter("btitle");
    String aname=request.getParameter("aname");
    String bprice=request.getParameter("bprice");  
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;    
    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection("jdbc:mysql://localhost/mylib","root","");
    ps=conn.prepareStatement("insert into books(title,author,price)value(?,?,?)");
    ps.setString(1, bname);
    ps.setString(2, aname);
    ps.setString(3, bprice);
    ps.executeUpdate();
  %>
  <script> 
  alert("record added");
  
  </script>
  
  <%
  }
  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Library</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>My Library</h1>
        <br>
        <div class="row" >
            <div class="col-sm-4" >
                <form method="post" action="#">
                    <br>
                    <div align="left" >
                        <label class="form-label" >Book Title</label>
                        <input class="form-control" type="text" placeholder="Book Title" name="btitle" id="btitle" required>
                    </div>
                    <br>
                   <div align="left" >
                        <label class="form-label">Author Name</label>
                        <input class="form-control" type="text" placeholder="Author Name" name="aname" id="aname" required>
                    </div>
                    <br>
                    <div align="left" >
                        <label class="form-label">Book Price</label>
                        <input class="form-control" type="text" placeholder="Book Price" name="bprice" id="bprice" required>
                    </div>
                    <br>
                    <div align="right" >
                    <input type="submit" id="submit" name="submit" value="Submit" class="btn btn-info">
                    <input type="reset" value="Clear All" name="Clear All" id="Clear All" class="btn btn-warning">
                </div>
                </form>   
  </div>
        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-books" class="table table-responsive table bordered" cellpadding="0" width="100%" border="1">
                    <thead>
                        <tr>
                            <th>Book Title</th>
                            <th>Author Name</th>
                            <th>Book Price</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        <%
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;    
    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection("jdbc:mysql://localhost/mylib","root","");   
    String query="select * from books";
    Statement st = conn.createStatement();
    rs= st.executeQuery(query);
    while (rs.next()) {
        String id =rs.getString("id");
        
                        %>
                        <tr>
                            <td><%=rs.getString("title") %></td>
                            <td><%=rs.getString("author") %></td>
                            <td><%=rs.getString("price") %></td>
                            <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                            <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                        </tr>
                        <%  
 }
                        %>
                    </thead>    
                </table>
            </div>
        </div>
        </div>
    </body>
</html>