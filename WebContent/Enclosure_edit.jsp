<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.dao.EnclosureManage" %>
<%@ page import="com.csm.entity.Enclosure" %>
<%@ page import="com.csm.DBManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Edit Enclosure</title>
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

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #005580;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #00bfff;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Edit Enclosure</h2>

        <%
            String enclosureIdString = request.getParameter("Enclosure_Id");
            int enclosureId = Integer.parseInt(enclosureIdString);

            EnclosureManage dao = new EnclosureManage();
            Enclosure enclosure = null;

            try {
                enclosure = dao.getById(enclosureId);
            } catch (ClassNotFoundException ex) {
                out.println(ex.getMessage());
            } catch (SQLException e) {
                out.println(e.getMessage());
            }

            if (enclosure == null) {
        %>
            <h3>Enclosure with ID <%= enclosureId %> not found!</h3>
            <a href="Enclosure_List.jsp">Back to Enclosure List</a>
        <%
            } else {
        %>
            <form action="Enclosure_update.jsp" method="post">
                <input type="hidden" name="Enclosure_Id" value="<%= enclosure.getEnclosure_Id() %>">
                <label for="enclosureType">Enclosure Type</label>
                <input type="text" id="enclosureType" name="enclosureType" value="<%= enclosure.getEnclosure_Type() %>" required>
                <label for="location">Location</label>
                <input type="text" id="location" name="location" value="<%= enclosure.getLocation() %>" required>
                <input type="submit" value="Update">
            </form>
            <a href="Enclosure_List.jsp">Back to Enclosure List</a>
        <%
            }
        %>
    </div>

</body>
</html>
