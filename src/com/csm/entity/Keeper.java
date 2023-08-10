package com.csm.entity;

import java.time.LocalDate;

public class Keeper {
    private int keeperId;
    private String keeperName;
    private LocalDate dateOfBirth;
    private String rank;

    public Keeper() {
    }

    public Keeper(String keeperName, LocalDate dateOfBirth, String rank) {
        this.keeperName = keeperName;
        this.dateOfBirth = dateOfBirth;
        this.rank = rank;
    }

    public Keeper(int keeperId, String keeperName, LocalDate dateOfBirth, String rank) {
        this.keeperId = keeperId;
        this.keeperName = keeperName;
        this.dateOfBirth = dateOfBirth;
        this.rank = rank;
    }

    // Getters and setters for all properties

    public int getKeeperId() {
        return keeperId;
    }

    public void setKeeperId(int keeperId) {
        this.keeperId = keeperId;
    }

    public String getKeeperName() {
        return keeperName;
    }

    public void setKeeperName(String keeperName) {
        this.keeperName = keeperName;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }
}
