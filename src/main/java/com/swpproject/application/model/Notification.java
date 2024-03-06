package com.swpproject.application.model;

import jakarta.persistence.*;
import lombok.*;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.time.LocalDateTime;
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
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
}
