package com.csm.entity;

public class Enclosure {
    private int enclosure_Id;
    private String enclosure_Type;
    private String location;

    public Enclosure(int enclosure_Id, String enclosure_Type, String location) {
        this.enclosure_Id = enclosure_Id;
        this.enclosure_Type = enclosure_Type;
        this.location = location;
    }

    // Getters and setters for all properties

    public int getEnclosure_Id() {
        return enclosure_Id;
    }

    public Enclosure(String enclosure_Type, String location) {
		super();
		this.enclosure_Type = enclosure_Type;
		this.location = location;
	}

	public void setEnclosure_Id(int enclosure_Id) {
        this.enclosure_Id = enclosure_Id;
    }

    public String getEnclosure_Type() {
        return enclosure_Type;
    }

    public void setEnclosure_Type(String enclosure_Type) {
        this.enclosure_Type = enclosure_Type;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
