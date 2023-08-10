<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.dao.SpeciesManage" %>
<%@ page import="com.csm.entity.Species" %>
<%@ page import="com.csm.DBManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Species</title>
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

    <h2>Edit Form for Species</h2>
    
    <%
    String speciesIdString = request.getParameter("Species_Id");
    if (speciesIdString != null) {
        try {
            int speciesId = Integer.parseInt(speciesIdString);
            SpeciesManage speciesManage = new SpeciesManage();
            Species species = speciesManage.getById(speciesId);
    %>
    <div class="container">
    <div class="form-container">
        <h2 class="text-center">Edit Species</h2>
        <form method="POST" action="Species_update.jsp">
            <div class="form-group">
                <label for="speciesType">Species Type</label>
                <input type="text" class="form-control" id="speciesType" name="speciesType" value="<%=species.getSpeciesType()%>" required>
            </div>
            <div class="form-group">
                <label for="speciesGroup">Species Group</label>
                <input type="text" class="form-control" id="speciesGroup" name="speciesGroup" value="<%=species.getSpeciesGroup()%>" required>
            </div>
            <div class="form-group">
                <label for="lifestyle">Lifestyle</label>
                <input type="text" class="form-control" id="lifestyle" name="lifestyle" value="<%=species.getLifestyle()%>" required>
            </div>
            <div class="form-group">
                <label for="conservationStatus">Conservation Status</label>
                <input type="text" class="form-control" id="conservationStatus" name="conservationStatus" value="<%=species.getConservationStatus()%>" required>
            </div>
            <input type="hidden" name="speciesId" value="<%=speciesId%>">
            <button type="submit" class="btn btn-save">Save</button>
        </form>
    </div>
</div>
    <%
            } catch (ClassNotFoundException | SQLException e) {
                out.println(e.getMessage());
            }
        } else {
            out.println("Species ID is not found");
        }
    %>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</html>
