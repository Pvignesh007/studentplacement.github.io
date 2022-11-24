<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.ServletException,
 jakarta.servlet.annotation.WebServlet,
 jakarta.servlet.http.HttpServlet,
 jakarta.servlet.http.HttpServletRequest,
 jakarta.servlet.http.HttpServletResponse,
 java.io.IOException,
 jakarta.servlet.http.HttpSession,
 java.io.PrintWriter,
 java.sql.Connection,
 java.sql.DriverManager,
 java.sql.ResultSet,
 java.sql.SQLException,
 java.sql.Statement" 
 %>

       
<%
            String drivername="com.mysql.jdbc.Driver"; 
            String conurl="jdbc:mysql://localhost:3306/";
            String dbname="studentplacement?useSSL=false&allowPublicKeyRetrieval=true";
            String userid="root";
            String pwd="1234";
            HttpSession session1 = request.getSession(false);
            

            String data[] = {
                request.getParameter("quiz1"),
                request.getParameter("quiz2"),
                request.getParameter("quiz3"),
                request.getParameter("quiz4"),
                request.getParameter("quiz5"),
                request.getParameter("quiz6"),
                request.getParameter("quiz7"),
                request.getParameter("quiz8"),
                request.getParameter("quiz9"),
                request.getParameter("quiz10")
            };
            
            if (session1.getAttribute("username") == null) 
            {
                response.sendRedirect("/studentproject");
            }
            
            String options[] = {"a1","b1","c1","d1","e1","f1","g1","h1","i1","j1"};
            
            int total = 0;
            
            
            Class.forName(drivername);
            
            Connection con = null;
            Statement stmt = null;
            con = DriverManager.getConnection(conurl+dbname,userid,pwd);
            stmt=con.createStatement();
                
%>

<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
<body>
    <h2>Thanks for taking the quiz</h2>
    <h2><%= session1.getAttribute("username") %></h2>
    <% for(int i = 0;i<10;i++){ %>
        <%try{
            if(data[i].equals(options[i])) total++;
        %>
               <%= data[i] %>
    <% }
    catch(Exception e){ %>
    <h2>Not selected the options</h2>
<% break;}finally{

}
}%>
    <h3>
        Your mark: <%= total %>
    </h3>
    <%
        String query = "update login set quizmark = "+total+" where username = '"+session1.getAttribute("username")+"' "; 
        stmt.executeUpdate(query);
    %>
</body>
</html>