package com.swpproject.application.enums;

public enum Role {
    ADMIN("Admin"), PT("Personal Trainer"), GYMER("Gymer");

    private final String label;

    Role(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
