<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.dao.DietManage" %>
<%@ page import="com.csm.entity.Diet" %>
<%@ page import="com.csm.DBManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
    String dt = request.getParameter("type");
    String feedParam = request.getParameter("feed");
    int df;
    
    try {
        df = Integer.parseInt(feedParam);
    } catch (NumberFormatException ex) {
        out.println("Invalid input for 'feed'. Please enter a valid integer.");
        return; // Stop processing further since the input is invalid
    }

    //calling DBManager 
    DBManager dbMgr = new DBManager();
    
    //using object calling jdbc getconnection
    dbMgr.getConnection();
    
    //two parameters passing 
    Diet c = new Diet(dt, df);
    
    //calling DietManage
    DietManage eMag = new DietManage();
    int affect = -1;
    
    //calling dao 
    affect = eMag.insert(c);
    
    if (affect == 1) {
        out.println("Successfully Inserted.");
    } else {
        out.println("Failed to insert the data.");
    }

} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException e) {
    e.printStackTrace();
}
%>
</body>
</html>
