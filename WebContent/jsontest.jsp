<%@ page session="false" %>
<%@ page import="java.sql.*" %>
<%
	String dbUrl = "jdbc:mysql://mysql2.hosting.paran.com:3306/wbr76_db"; 
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(dbUrl, "wbr76","strato56");
	
	Statement stmt = conn.createStatement();

	String sql = "select addon, is_used, date_format(regdate, '%Y%m%d') as regdate from xe_addons where is_used = 'Y' ";
	

	ResultSet rs = stmt.executeQuery(sql);
	
%>
<!DOCTYPE html>

<html >
    <head>
        <title>sss</title>
        <link href="favicon.ico" rel="icon" type="image/x-icon" />
        <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <link href="tomcat.css" rel="stylesheet" type="text/css" />
        <meta charset="utf-8">
    </head>

    <body>

<%
while(rs.next()){
	
	out.print(rs.getString("addon"));
	out.print(" || ");
	out.print(rs.getString("is_used"));
	out.print(" || ");
	out.print(rs.getString("regdate"));
	out.print("<br>");
	
	
}
stmt.close();
conn.close();
%>
    </body>

</html>
