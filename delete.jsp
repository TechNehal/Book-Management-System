<%@page import="java.sql.*"%>
<%
 
    String id=request.getParameter("id"); 
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;    
    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection("jdbc:mysql://localhost/mylib","root","");
    ps=conn.prepareStatement("delete from books where id=?");
    ps.setString(1, id);
    ps.executeUpdate();
  %>
  <script> 
  alert("record deleted");
  
  </script>
