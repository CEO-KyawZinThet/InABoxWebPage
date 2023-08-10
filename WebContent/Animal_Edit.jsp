<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.dao.AnimalManage" %>
<%@ page import="com.csm.entity.Animal" %>
<%@ page import="com.csm.DBManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Edit Animal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            background-color: #005580;
            color: white;
            border: none;
            border-radius: 3px;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #00bfff;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Edit form for Animal</h2>
    <form method="POST" action="Animal_update.jsp">
        <%
            String sId = request.getParameter("AnimalID");
            if (sId == null) {
                out.println("Animal ID is not found");
            } else {
                int id = Integer.parseInt(sId);
                AnimalManage dao = new AnimalManage();
                try {
                    Animal a = dao.getById(id);
        %>
                    <input type="hidden" name="animal_id" value="<%=a.getAnimal_Id() %>">
                    
                    <label for="animal_name">Animal Name</label><br>
                    <input type="text" name="animal_name" id="animal_name" value="<%=a.getAnimal_Name() %>" required><br>
                    
                    <label for="gender">Gender</label><br>
                    <input type="text" name="gender" id="gender" value="<%=a.getGender() %>" required><br>
                    
                    <label for="year_of_arrival">Year of Arrival</label><br>
                    <input type="number" name="year_of_arrival" id="year_of_arrival" value="<%=a.getYear_of_Arrival() %>" required><br>
                    
                    <label for="species_id">Species ID</label><br>
                    <input type="number" name="species_id" id="species_id" value="<%=a.getSpecies_Species_Id() %>" required><br>
                    
                    <label for="keeper_id">Keeper ID</label><br>
                    <input type="number" name="keeper_id" id="keeper_id" value="<%=a.getKeeper_Keeper_Id() %>" required><br>
                    
                    <label for="enclosure_id">Enclosure ID</label><br>
                    <input type="number" name="enclosure_id" id="enclosure_id" value="<%=a.getEnclosures_Enclosure_Id() %>" required><br>
                    
                    <label for="diet_id">Diet ID</label><br>
                    <input type="number" name="diet_id" id="diet_id" value="<%=a.getDiet_Diet_Id() %>" required><br>
                    
                    <input type="submit" value="Update">
        <%
                } catch (ClassNotFoundException ex) {
                    out.println(ex.getMessage());
                } catch (SQLException e) {
                    out.println(e.getMessage());
                }
            }
        %>
    </form>
</div>

</body>
</html>
