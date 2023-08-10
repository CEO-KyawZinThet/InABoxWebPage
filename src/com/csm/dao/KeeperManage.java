package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Diet;
import com.csm.entity.Keeper;

public class KeeperManage {
    public int insert(Keeper keeper) throws ClassNotFoundException, SQLException {
        int result = -1;

        // Get connection
        try (Connection conn = DBManager.getConnection()) {
            // Prepare statement
            String sql = "INSERT INTO `gwwb`.`Keeper` (`Keeper_Name`, `Date_of_Birth`, `Rank`) VALUES (?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                // Set parameters for the prepared statement
                pstmt.setString(1, keeper.getKeeperName());
                pstmt.setString(2, keeper.getDateOfBirth().toString()); // Convert LocalDate to string
                pstmt.setString(3, keeper.getRank()); // Use parameter index 3 for Rank
                // Execute the statement
                result = pstmt.executeUpdate();
            }
        }

        return result;
    }

    public ArrayList<Keeper> fetchAll() throws ClassNotFoundException, SQLException {

        ArrayList<Keeper> keepers = new ArrayList<>();
        Keeper k;

        // Get connection
        try (Connection conn = DBManager.getConnection()) {
            // Prepare statement
            String sql = "SELECT * FROM `gwwb`.`Keeper`";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    k = new Keeper(rs.getInt("Keeper_Id"),
                            rs.getString("Keeper_Name"),
                            LocalDate.parse(rs.getString("Date_of_Birth")), // Convert string to LocalDate
                            rs.getString("Rank"));

                    keepers.add(k);
                }
            }
        }

        return keepers;
    }

    public int delete(int KeeperId) throws ClassNotFoundException, SQLException {
        int result = -1;

        // Get connection
        try (Connection conn = DBManager.getConnection()) {
            // Prepare statement
            String sql = "DELETE FROM `gwwb`.`Keeper` " +
                    "WHERE (`Keeper_Id` = ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, KeeperId);

                // Execute statement
                result = pstmt.executeUpdate();
            }
        }

        return result;
    }
    
    public int update(Keeper keeper) throws ClassNotFoundException, SQLException {
        int result = -1;

        // Get connection
        try (Connection conn = DBManager.getConnection()) {
            // Prepare statement
            String sql = "UPDATE `gwwb`.`Keeper` SET " +
                         "`Keeper_Name` = ?, " +
                         "`Date_of_Birth` = ?, " +
                         "`Rank` = ?" +
                         " WHERE (`Keeper_Id` = ?)";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, keeper.getKeeperName());
                pstmt.setString(2, keeper.getDateOfBirth().toString());
                pstmt.setString(3, keeper.getRank());
                pstmt.setInt(4, keeper.getKeeperId());

                // Execute statement
                result = pstmt.executeUpdate();
            }
        }

        return result;
    }

    public Keeper getById(int keeperId) throws ClassNotFoundException, SQLException {
        Keeper keeper = null;

        // Get connection
        try (Connection conn = DBManager.getConnection()) {
            // Prepare statement
            String sql = "SELECT * FROM `gwwb`.`Keeper` " +
                         "WHERE (`Keeper_Id` = ?)";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, keeperId);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    keeper = new Keeper(rs.getInt("Keeper_Id"),
                                        rs.getString("Keeper_Name"),
                                        LocalDate.parse(rs.getString("Date_of_Birth")),
                                        rs.getString("Rank"));
                }
            }
        }

        return keeper;
    }

    
}
