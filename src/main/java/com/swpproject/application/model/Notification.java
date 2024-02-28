package com.swpproject.application.model;

import jakarta.persistence.*;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.time.LocalDateTime;

@Entity
@Table(name = "notificationTest")
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String title;
    @Column(columnDefinition = "NVARCHAR(MAX)")
    private String content;
    private LocalDateTime timeStamp;

    private int fromAccount;
    private int toAccount;

    public Notification() { }
    public Notification(Integer id, String title, String content, LocalDateTime timeStamp,
                        int fromAccount, int toAccount) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.timeStamp = timeStamp;
        this.fromAccount = fromAccount;
        this.toAccount = toAccount;
    }

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public LocalDateTime getTimeStamp() { return timeStamp; }
    public void setTimeStamp(LocalDateTime timeStamp) { this.timeStamp = timeStamp; }
    public int getFromAccount() { return fromAccount; }
    public void setFromAccount(int fromAccount) {this.fromAccount = fromAccount; }
    public int getToAccount() { return toAccount; }
    public void setToAccount(int toAccount) { this.toAccount = toAccount; }
    @Override
    public String toString() {
        return "Notification{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", timeStamp=" + timeStamp +
                ", fromAccount=" + fromAccount +
                ", toAccount=" + toAccount +
                '}';
    }
}
