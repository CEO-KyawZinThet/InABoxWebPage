<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.csm.dao.KeeperManage" %>
<%@ page import="com.csm.entity.Keeper" %>
<%@ page import="com.csm.DBManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Keeper</title>
</head>
<body>

<%
    String keeperIdString = request.getParameter("Keeper_Id");
    String keeperName = request.getParameter("keeper_name");
    String dateOfBirthString = request.getParameter("date_of_birth");
    String rank = request.getParameter("rank");
    
    if (keeperIdString != null) {
        int keeperId = Integer.parseInt(keeperIdString);
        LocalDate dateOfBirth = LocalDate.parse(dateOfBirthString);

        Keeper keeper = new Keeper(keeperId, keeperName, dateOfBirth, rank);
        KeeperManage dao = new KeeperManage();

        int rowsAffected;
        try {
            rowsAffected = dao.update(keeper);
            out.println("Update successful. Rows affected: " + rowsAffected);
        } catch (ClassNotFoundException | SQLException e) {
            out.println(e.getMessage());
        }
    } else {
        out.println("Keeper ID is not found");
    }
%>

</body>
</html>
