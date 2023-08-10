<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.csm.dao.EnclosureManage" %>
<%@ page import="com.csm.entity.Enclosure" %>
<%@ page import="com.csm.DBManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Enclosure List</title>

    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa; /* Light Gray */
        }

        .header-container {
            background-color: #007bff; /* Bootstrap primary color */
            padding: 30px;
            color: white;
            text-align: center;
        }

        .header-text {
            font-size: 36px;
            font-weight: bold;
        }

        .table-container {
            margin-top: 40px;
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
        <h1 class="header-text">Enclosure List</h1>
        <a href="main.jsp" class="btn btn-light" id="home">Home</a>
    </div>

    <div class="container table-container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <table class="table table-bordered table-striped mt-4">
                    <thead class="thead-dark">
                        <tr>
                            <th>Enclosure ID</th>
                            <th>Enclosure Type</th>
                            <th>Location</th>
                            <th>Delete Enclosure</th>
                            <th>Edit Enclosure</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            try {
                                DBManager dbMgr = new DBManager();
                                dbMgr.getConnection();

                                EnclosureManage eMgr = new EnclosureManage();
                                ArrayList<Enclosure> enclosures = eMgr.fetchAll();

                                for (Enclosure enclosure : enclosures) {
                        %>
                        <tr>
                            <td><%= enclosure.getEnclosure_Id() %></td>
                            <td><%= enclosure.getEnclosure_Type() %></td>
                            <td><%= enclosure.getLocation() %></td>
                            <td><a href="Enclosure_Delete.jsp?EnclosureId=<%= enclosure.getEnclosure_Id() %>" class="btn btn-danger">Delete</a></td>
                           <td><a href="Enclosure_edit.jsp?Enclosure_Id=<%= enclosure.getEnclosure_Id() %>" class="btn btn-danger">Edit</a></td>
                        </tr>
                        <% 
                                } // End of for loop
                            } catch (ClassNotFoundException | SQLException e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS link (required for Bootstrap features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
