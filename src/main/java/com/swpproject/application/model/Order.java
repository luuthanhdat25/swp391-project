package com.swpproject.application.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.sql.Date;
@Entity
@Table(name = "order")
public class Order {
    @Id
    private Integer orderId;
    private String title;
    private String desc;
    private Date startDay;
    private Date endDay;
    private Integer totalOfMoney;
    private String status;
    private Integer gymerId;
    private Integer ptId;

    public Order() {
    }

    public Order(Integer orderId, String title, String desc, Date startDay, Date endDay, Integer totalOfMoney, String status, Integer gymerId, Integer ptId) {
        this.orderId = orderId;
        this.title = title;
        this.desc = desc;
        this.startDay = startDay;
        this.endDay = endDay;
        this.totalOfMoney = totalOfMoney;
        this.status = status;
        this.gymerId = gymerId;
        this.ptId = ptId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Date getStartDay() {
        return startDay;
    }

    public void setStartDay(Date startDay) {
        this.startDay = startDay;
    }

    public Date getEndDay() {
        return endDay;
    }

    public void setEndDay(Date endDay) {
        this.endDay = endDay;
    }

    public Integer getTotalOfMoney() {
        return totalOfMoney;
    }

    public void setTotalOfMoney(Integer totalOfMoney) {
        this.totalOfMoney = totalOfMoney;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getGymerId() {
        return gymerId;
    }

    public void setGymerId(Integer gymerId) {
        this.gymerId = gymerId;
    }

    public Integer getPtId() {
        return ptId;
    }

    public void setPtId(Integer ptId) {
        this.ptId = ptId;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", title='" + title + '\'' +
                ", desc='" + desc + '\'' +
                ", startDay=" + startDay +
                ", endDay=" + endDay +
                ", totalOfMoney=" + totalOfMoney +
                ", status='" + status + '\'' +
                ", gymerId=" + gymerId +
                ", ptId=" + ptId +
                '}';
    }
}
