<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.csm.DBManager" %>
<%@ page import = "com.csm.dao.AnimalManage" %>
<%@ page import = "com.csm.entity.Animal" %>
    
<%@ include file="Animal_List.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Animal</title>
</head>
<body>

<%
    String aId = request.getParameter("animal_id");
    String aName = request.getParameter("animal_name");
    String gender = request.getParameter("gender");
    String yearOfArrival = request.getParameter("year_of_arrival");
    String speciesId = request.getParameter("species_id");
    String keeperId = request.getParameter("keeper_id");
    String enclosureId = request.getParameter("enclosure_id");
    String dietId = request.getParameter("diet_id");
    
    out.println(aId);
    out.println(aName);
    out.println(gender);
    out.println(yearOfArrival);
    out.println(speciesId);
    out.println(keeperId);
    out.println(enclosureId);
    out.println(dietId);
    
    AnimalManage dao = new AnimalManage();
    Animal a = new Animal(
        Integer.parseInt(aId),
        aName,
        gender,
        Integer.parseInt(yearOfArrival),
        Integer.parseInt(speciesId),
        Integer.parseInt(keeperId),
        Integer.parseInt(enclosureId),
        Integer.parseInt(dietId)
    );
    
    int rowAffected;
    try {
        rowAffected = dao.update(a);
        out.println("Update record..");
    } catch (ClassNotFoundException ex) {
        out.println(ex.getMessage());
    } catch (SQLException e) {
        out.println(e.getMessage());
    }
%>

</body>
</html>
