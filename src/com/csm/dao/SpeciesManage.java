package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.csm.DBManager;
import com.csm.entity.Diet;
import com.csm.entity.Species;

public class SpeciesManage {
    public int insert(Species species) throws ClassNotFoundException, SQLException {
        int result = -1;

        try (Connection conn = DBManager.getConnection()) {
            String sql = "INSERT INTO `gwwb`.`species` (`Species_Type`, `Species_Group`, `Lifestyle`, `Conservation_status`) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
                pstmt.setString(1, species.getSpeciesType());
                pstmt.setString(2, species.getSpeciesGroup());
                pstmt.setString(3, species.getLifestyle());
                pstmt.setString(4, species.getConservationStatus());

                result = pstmt.executeUpdate();

                // Get the auto-generated speciesId if needed
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        species.setSpeciesId(rs.getInt(1));
                    }
                }
            }
        }

        return result;
    }

    public List<Species> fetchAll() throws ClassNotFoundException, SQLException {
        List<Species> speciesList = new ArrayList<>();
        
        try (Connection conn = DBManager.getConnection()) {
            String sql = "SELECT * FROM gwwb.species";
            try (PreparedStatement pstmt = conn.prepareStatement(sql);
                 ResultSet rs = pstmt.executeQuery()) {
                
                while (rs.next()) {
                    int speciesId = rs.getInt("Species_Id");
                    String speciesType = rs.getString("Species_Type");
                    String speciesGroup = rs.getString("Species_Group");
                    String lifestyle = rs.getString("Lifestyle");
                    String conservationStatus = rs.getString("Conservation_status");
                    
                    Species species = new Species(speciesId, speciesType, speciesGroup, lifestyle, conservationStatus);
                    speciesList.add(species);
                }
            }
        }

        return speciesList;
    }

    public int delete(int speciesId) throws ClassNotFoundException, SQLException {
        int result = -1;

        try (Connection conn = DBManager.getConnection()) {
            String sql = "DELETE FROM `gwwb`.`species` WHERE (`Species_Id` = ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, speciesId);
                result = pstmt.executeUpdate();
            }
        }

        return result;
    }
    
    public int update(Species species) throws ClassNotFoundException, SQLException {
        int result = -1;

        try (Connection conn = DBManager.getConnection()) {
            String sql = "UPDATE `gwwb`.`species` SET " +
                         "`Species_Type` = ?, " +
                         "`Species_Group` = ?, " +
                         "`Lifestyle` = ?, " +
                         "`Conservation_status` = ?" +
                         " WHERE (`Species_Id` = ?)";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, species.getSpeciesType());
                pstmt.setString(2, species.getSpeciesGroup());
                pstmt.setString(3, species.getLifestyle());
                pstmt.setString(4, species.getConservationStatus());
                pstmt.setInt(5, species.getSpeciesId());

                result = pstmt.executeUpdate();
            }
        }

        return result;
    }

    public Species getById(int speciesId) throws ClassNotFoundException, SQLException {
        Species species = null;

        try (Connection conn = DBManager.getConnection()) {
            String sql = "SELECT * FROM `gwwb`.`species` " +
                         "WHERE (`Species_Id` = ?)";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, speciesId);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    species = new Species(rs.getInt("Species_Id"),
                                          rs.getString("Species_Type"),
                                          rs.getString("Species_Group"),
                                          rs.getString("Lifestyle"),
                                          rs.getString("Conservation_status"));
                }
            }
        }

        return species;
    }
    
}
