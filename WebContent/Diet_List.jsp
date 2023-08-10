<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.csm.dao.DietManage" %>
<%@ page import="com.csm.entity.Diet" %>
<%@ page import="com.csm.DBManager" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Diet Lists</title>

    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Your custom styles go here */
        body {
            background-image: url('bgcc1.jpg'); /* Replace with the URL of your background image */
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

        /* Custom table style */
        table {
            border: 2px solid black;
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        th {
            height: 40px;
            background-color: #f2f2f2;
            border: 2px solid black;
        }

        td {
            height: 30px;
            border: 2px solid black;
        }

        /* Delete link style */
        a.delete-link {
            color: #ff0000;
            text-decoration: none;
        }

        a.delete-link:hover {
            color: #cc0000;
            text-decoration: underline;
        }

        .center-content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
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
</head>
<body>

    <div class="header-container">
        <h1 class="header-text">Diet Lists</h1>
    </div>

    <!-- Home link -->
    <a href="Main.jsp" id="home">Home</a>

    <div class="center-content">
        <table>
            <tr>
                <th>Diet ID</th>
                <th>Diet Type</th>
                <th>Number of feed per day</th>
                <th>Delete Diet</th>
                <th>Edit Diet</th>
            </tr>
            <%
                try {
                    DBManager dbMgr = new DBManager();
                    dbMgr.getConnection();

                    DietManage eMgr = new DietManage();
                    ArrayList<Diet> diets = eMgr.fetchAll();

                    for (Diet diet : diets) {
            %>

            <tr>
                <td><%= diet.getDietID() %></td>
                <td><%= diet.getDiet_Type() %></td>
                <td><%= diet.getNo_of_feed() %></td>
                <td><a class="delete-link" href="Diet_Delete.jsp?DietID=<%= diet.getDietID() %>">Delete</a></td>
                <td><a class="edit-link" href="Diet_Edit.jsp?DietID=<%= diet.getDietID() %>">Edit</a></td>
            </tr>

            <%
                    }
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>

</body>
</html>
