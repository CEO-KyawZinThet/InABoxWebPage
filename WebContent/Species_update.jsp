<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.csm.dao.SpeciesManage" %>
<%@ page import="com.csm.entity.Species" %>
<%@ page import="com.csm.DBManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Species</title>
</head>
<body>

<%
    String speciesIdString = request.getParameter("Species_Id");
    String speciesType = request.getParameter("speciesType");
    String speciesGroup = request.getParameter("speciesGroup");
    String lifestyle = request.getParameter("lifestyle");
    String conservationStatus = request.getParameter("conservationStatus");
    
    if (speciesIdString != null) {
        int speciesId = Integer.parseInt(speciesIdString);

        Species species = new Species(speciesId, speciesType, speciesGroup, lifestyle, conservationStatus);
        SpeciesManage dao = new SpeciesManage();

        int rowsAffected;
        try {
            rowsAffected = dao.update(species);
            out.println("Update successful. Rows affected: " + rowsAffected);
        } catch (ClassNotFoundException | SQLException e) {
            out.println(e.getMessage());
        }
    } else {
        out.println("Species ID is not found");
    }
%>

</body>
</html>
