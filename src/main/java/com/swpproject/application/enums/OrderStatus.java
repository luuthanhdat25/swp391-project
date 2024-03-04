package com.swpproject.application.enums;

public enum OrderStatus {

    Pending("Pending"),
    OnDoing("On Doing"),;
    private final String desc;


    OrderStatus(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }
}
