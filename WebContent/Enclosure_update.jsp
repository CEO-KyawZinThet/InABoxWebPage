<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.dao.EnclosureManage" %>
<%@ page import="com.csm.entity.Enclosure" %>
<%@ page import="com.csm.DBManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Update Enclosure</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
        }

        .message {
            margin-top: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .back-link {
            display: block;
            margin-top: 10px;
            color: #005580;
            text-decoration: none;
        }

        .back-link:hover {
            color: #00bfff;
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Update Enclosure</h2>

        <%
            int enclosureId = Integer.parseInt(request.getParameter("Enclosure_Id"));
            String enclosureType = request.getParameter("enclosureType");
            String location = request.getParameter("location");
            
            EnclosureManage dao = new EnclosureManage();
            Enclosure enclosure = new Enclosure(enclosureId, enclosureType, location);

            int rowsAffected = dao.update(enclosure);
        %>

        <div class="message">
            <% if (rowsAffected > 0) { %>
                Enclosure updated successfully!
            <% } else { %>
                An error occurred while updating the enclosure.
            <% } %>
            <a class="back-link" href="Enclosure_List.jsp">Back to Enclosure List</a>
        </div>
    </div>

</body>
</html>
