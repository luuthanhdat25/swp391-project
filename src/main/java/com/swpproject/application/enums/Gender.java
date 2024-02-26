package com.swpproject.application.enums;

public enum Gender {
    M("Male"), F("Female"), O("Other");
    private final String desc;

    Gender(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }
}
