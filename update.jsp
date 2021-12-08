<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
  if (request.getParameter("submit")!=null) 
  {  
    String id=request.getParameter("id");
    String bname=request.getParameter("btitle");
    String aname=request.getParameter("aname");
    String bprice=request.getParameter("bprice");  
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;    
    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection("jdbc:mysql://localhost/mylib","root","");
    ps=conn.prepareStatement("update books set title=?,author=?,price=? where id=?");
    ps.setString(1, bname);
    ps.setString(2, aname);
    ps.setString(3, bprice);
    ps.setString(4, id);
    ps.executeUpdate();
  %>
  <script> 
  alert("record updated");
  
  </script>
  
  <%
  }
  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Update BookDetails </h1>
        <div class="row">
          <div class="col-sm-4" >
                <form method="post" action="#">
                    <%
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;    
    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection("jdbc:mysql://localhost/mylib","root","");
    String id = request.getParameter("id");
    ps=conn.prepareStatement("select*from books where id=?");
    ps.setString(1, id);
    rs=ps.executeQuery();
    while (rs.next()) {
            
        
                    %>
                    <br>
                    <div align="left" >
                        <label class="form-label" >Book Title</label>
                        <input class="form-control" type="text" placeholder="Book Title" name="btitle" id="btitle" value="<%= rs.getString("title")%>" required>
                    </div>
                    <br>
                   <div align="left" >
                        <label class="form-label">Author Name</label>
                        <input class="form-control" type="text" placeholder="Author Name" name="aname" id="aname" value="<%= rs.getString("author") %>"required>
                    </div>
                    <br>
                    <div align="left" >
                        <label class="form-label">Book Price</label>
                        <input class="form-control" type="text" placeholder="Book Price" name="bprice" id="bprice" value="<%= rs.getString("price") %>"required>
                    </div>
                    <%}%>
                    <br>
                    <div align="left" >
                    <input type="submit" id="submit" name="submit" value="Submit" class="btn btn-info">
                    <input type="reset" value="Clear All" name="Clear All" id="Clear All" class="btn btn-warning">
                </div>
                    <div align="right">
                        <p><a href="index.jsp" >Click Back</a></p>    
                    </div>
                </form>   
                </div>  
                </div>
    </body>
</html>
