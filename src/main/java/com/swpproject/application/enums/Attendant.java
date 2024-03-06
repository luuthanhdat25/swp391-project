package com.swpproject.application.enums;

public enum Attendant {
    PRESENT("PRESENT"),WAITING("WAITING"),ABSENT("ABSENT");
    private final String desc;


    Attendant(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }
}
