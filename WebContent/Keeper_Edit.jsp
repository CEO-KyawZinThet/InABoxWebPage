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
    <title>Edit Keeper</title>
     <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa; /* Light Gray */
        }

        .container {
            margin-top: 50px;
        }

        .form-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-save {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>

    <h2>Edit Form for Keeper</h2>
    
    <%
    String keeperIdString = request.getParameter("Keeper_Id");
    if (keeperIdString != null) {
        try {
            int keeperId = Integer.parseInt(keeperIdString);
            KeeperManage keeperManage = new KeeperManage();
            Keeper keeper = keeperManage.getById(keeperId);
    %>
    <div class="container">
    <div class="form-container">
        <h2 class="text-center">Edit Keeper</h2>
        <form method="POST" action="Keeper_update.jsp">
            <div class="form-group">
                <label for="keeperName">Keeper Name</label>
                <input type="text" class="form-control" id="keeperName" name="keeperName" value="<%=keeper.getKeeperName()%>" required>
            </div>
            <div class="form-group">
                <label for="dateOfBirth">Date of Birth</label>
                <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" value="<%=keeper.getDateOfBirth()%>" required>
            </div>
            <div class="form-group">
                <label for="rank">Rank</label>
                <input type="text" class="form-control" id="rank" name="rank" value="<%=keeper.getRank()%>" required>
            </div>
            <input type="hidden" name="keeperId" value="<%=keeperId%>">
            <button type="submit" class="btn btn-save">Save</button>
        </form>
    </div>
</div>
    <%
            } catch (ClassNotFoundException | SQLException e) {
                out.println(e.getMessage());
            }
        } else {
            out.println("Keeper ID is not found");
        }
    %>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</html>
