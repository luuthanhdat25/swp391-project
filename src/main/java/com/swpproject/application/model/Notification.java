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
@Table(name = "notification")
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "title", columnDefinition = "NVARCHAR(255)")
    private String title;

    @Column(name = "content", columnDefinition = "NVARCHAR(MAX)")
    private String content;

    @Column(name = "time_stamp")
    private LocalDateTime timeStamp;

   	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "from_account_id",referencedColumnName = "id", nullable = false)
	private Account fromAccount;

	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "to_account_id",referencedColumnName = "id", nullable = false)
	private Account toAccount;

    @Column(name = "group_number")
    private Integer groupNumber;
}
