<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.dao.DietManage" %>
<%@ page import="com.csm.entity.Diet" %>
<%@ page import="com.csm.DBManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Edit Diet</title>
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
    <h2>Edit form for Diet</h2>
    <form method="POST" action="Diet_update.jsp">
        <%
            String sId = request.getParameter("DietID");
            if (sId == null) {
                out.println("Diet ID is not found");
            } else {
                int id = Integer.parseInt(sId);
                DietManage dao = new DietManage();
                try {
                    Diet c = dao.getById(id);
        %>
                    <input type="hidden" name="diet_id" value="<%=c.getDietID() %>">
                    
                    <label for="diet_type">Diet Type</label><br>
                    <input type="text" name="diet_type" id="diet_type" value="<%=c.getDiet_Type() %>" required><br>
                    
                    <label for="diet_feed">Number of feed per day</label><br>
                    <input type="number" name="diet_feed" id="diet_feed" value="<%=c.getNo_of_feed() %>" required><br>
                    
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
