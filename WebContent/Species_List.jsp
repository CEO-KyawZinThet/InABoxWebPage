<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.csm.dao.SpeciesManage" %>
<%@ page import="com.csm.entity.Species" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Species Lists</title>
</head>

<style>
        /* Your custom styles go here */
        body {
            background-color: #f8f9fa; /* Light Gray */
            background-image: url('https://example.com/path-to-your-image.jpg'); /* Replace with your image URL */
            background-repeat: no-repeat;
            background-size: cover;
        }

        #home {
            border: 2px solid;
            border-radius: 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: #005580;
            background-color: #8a8a5c;
            position: fixed;
            top: 20px;
            right: 20px;
        }

        #home:hover {
            color: #ff8080;
        }

        .header-container {
            background-color: rgba(0, 0, 0, 0.5); /* Dark transparent overlay */
            padding: 30px;
            color: white;
            text-align: center;
        }

        .header-text {
            font-size: 36px;
            font-weight: bold;
        }

        .text-center {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-weight: 600;
        }

        /* Custom table style */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Delete link style */
        .delete-link {
            color: #ff0000;
            text-decoration: none;
        }

        .delete-link:hover {
            color: #cc0000;
            text-decoration: underline;
        }
         a.edit-link {
            color: #005580;
            text-decoration: none;
        }

        a.edit-link:hover {
            color: #00bfff;
            text-decoration: underline;
        }
    </style>

<body>
      <a href="main.jsp" id="home">Home</a>

    <div class="header-container">
        <h1 class="header-text">Species Lists</h1>
    </div>

 <%
    try {
        SpeciesManage speciesMgr = new SpeciesManage();
        List<Species> speciesList = speciesMgr.fetchAll();
%>


   <center>
        <table border="1">
            <tr>
                <th>Species ID</th>
                <th>Species Type</th>
                <th>Species Group</th>
                <th>LifeStyle</th>
                <th>Conservation Status</th>
                <th>Delete Species</th>
                <th>Edit Species</th>
            </tr>
            <% for (Species species : speciesList) { %>
                <tr>
                    <td><%= species.getSpeciesId() %></td>
                    <td><%= species.getSpeciesType() %></td>
                    <td><%= species.getSpeciesGroup() %></td>
                    <td><%= species.getLifestyle() %></td>
                    <td><%= species.getConservationStatus() %></td>
                    <td><a class ="delete-link" href="Species_Delete.jsp?SpeciesId=<%= species.getSpeciesId() %>">Delete</a></td>
                    <td><a class="edit-link" href="Species_edit.jsp?Species_Id=<%= species.getSpeciesId() %>">Edit</a></td>
                </tr>
            <% } %>
        </table>
    </center>

    <%
        } catch (ClassNotFoundException e) {
            // Handle ClassNotFoundException
            // Redirect to an error page or show a user-friendly message
            response.sendRedirect("error.jsp?message=Unable%20to%20load%20class");
        } catch (SQLException e) {
            // Handle SQLException
            // Redirect to an error page or show a user-friendly message
            response.sendRedirect("error.jsp?message=Unable%20to%20fetch%20data%20from%20the%20database");
        }
    %>

</body>
</html>
