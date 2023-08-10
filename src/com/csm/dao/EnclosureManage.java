package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Diet;
import com.csm.entity.Enclosure;

public class EnclosureManage {
	 public int insert(Enclosure enclosure) throws ClassNotFoundException, SQLException {
	        int result = -1;

	        // Get connection
	        try (Connection conn = DBManager.getConnection()) {
	            // Prepare statement
	            String sql = "INSERT INTO `gwwb`.`Enclosures` (`Enclosure_Type`, `Location`) VALUES (?, ?)";
	            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	                // Set parameters for the prepared statement
	                pstmt.setString(1, enclosure.getEnclosure_Type());
	                pstmt.setString(2, enclosure.getLocation());

	                // Execute the statement
	                result = pstmt.executeUpdate();
	            }
	        }

	        return result;
	    }


	 public ArrayList<Enclosure> fetchAll() throws ClassNotFoundException, SQLException {
	        ArrayList<Enclosure> enclosures = new ArrayList<>();
	        Enclosure enclosure;

	        // Get connection
	        try (Connection conn = DBManager.getConnection()) {
	            // Prepare statement
	            String sql = "SELECT * FROM `gwwb`.`enclosures`";
	            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	                ResultSet rs = pstmt.executeQuery();

	                while (rs.next()) {
	                    int enclosureId = rs.getInt("Enclosure_Id");
	                    String enclosureType = rs.getString("Enclosure_Type");
	                    String location = rs.getString("Location");
	                    
	                    
	                        enclosure = new Enclosure(enclosureId, enclosureType, location);
	                        enclosures.add(enclosure);
	                }
	            }
	        }

	        return enclosures;
	    }

    public int delete(int EnclosureId) throws ClassNotFoundException, SQLException {
        int result = -1;

        // Get connection
        DBManager dbMgr = new DBManager();
        Connection conn = dbMgr.getConnection();

        // Prepare statement
        String sql = "DELETE FROM `gwwb`.`enclosures` " +
                "WHERE (`Enclosure_Id` = ?)";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, EnclosureId);

        // Execute statement
        result = pstmt.executeUpdate();
        return result;
    }
    
    public int update(Enclosure enclosure) throws ClassNotFoundException, SQLException {
        int result = -1;

        // Get connection
        try (Connection conn = DBManager.getConnection()) {
            // Prepare statement
            String sql = "UPDATE `gwwb`.`enclosures` SET " +
                    "`Enclosure_Type` = ?, " +
                    "`Location` = ? " +
                    "WHERE (`Enclosure_Id` = ?)";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, enclosure.getEnclosure_Type());
                pstmt.setString(2, enclosure.getLocation());
                pstmt.setInt(3, enclosure.getEnclosure_Id());

                // Execute statement
                result = pstmt.executeUpdate();
            }
        }

        return result;
    }

    public Enclosure getById(int EnclosureId) throws ClassNotFoundException, SQLException {
        Enclosure enclosure = null;

        // Get connection
        try (Connection conn = DBManager.getConnection()) {
            // Prepare statement
            String sql = "SELECT * FROM `gwwb`.`enclosures` WHERE (`Enclosure_Id` = ?)";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, EnclosureId);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    int enclosureId = rs.getInt("Enclosure_Id");
                    String enclosureType = rs.getString("Enclosure_Type");
                    String location = rs.getString("Location");
                    
                    enclosure = new Enclosure(enclosureId, enclosureType, location);
                }
            }
        }

        return enclosure;
    }
    
}
