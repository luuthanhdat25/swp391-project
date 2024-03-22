package com.swpproject.application.model;

import jakarta.persistence.*;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
@Table(name = "chat_box")
public class ChatBox {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_1_id",referencedColumnName = "id", nullable = false)
    private Account account_1;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_2_id",referencedColumnName = "id", nullable = false)
    private Account account_2;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "last_message_id",referencedColumnName = "id", nullable = true)
    private Message lastMessage;
}
