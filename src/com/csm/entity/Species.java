package com.csm.entity;

public class Species {
    private int speciesId;
    private String speciesType;
    private String speciesGroup;
    private String lifestyle;
    private String conservationStatus;

    public Species(String speciesType, String speciesGroup, String lifestyle, String conservationStatus) {
        super();
        setSpeciesType(speciesType);
        setSpeciesGroup(speciesGroup);
        setLifestyle(lifestyle);
        setConservationStatus(conservationStatus);
    }

    public Species(int speciesId, String speciesType, String speciesGroup, String lifestyle, String conservationStatus) {
        this(speciesType, speciesGroup, lifestyle, conservationStatus);
        this.speciesId = speciesId;
    }

    public int getSpeciesId() {
        return speciesId;
    }

    public void setSpeciesId(int speciesId) {
        this.speciesId = speciesId;
    }

    public String getSpeciesType() {
        return speciesType;
    }

    public void setSpeciesType(String speciesType) {
        this.speciesType = speciesType;
    }

    public String getSpeciesGroup() {
        return speciesGroup;
    }

    public void setSpeciesGroup(String speciesGroup) {
        this.speciesGroup = speciesGroup;
    }

    public String getLifestyle() {
        return lifestyle;
    }

    public void setLifestyle(String lifestyle) {
        this.lifestyle = lifestyle;
    }

    public String getConservationStatus() {
        return conservationStatus;
    }

    public void setConservationStatus(String conservationStatus) {
        this.conservationStatus = conservationStatus;
    }
}
