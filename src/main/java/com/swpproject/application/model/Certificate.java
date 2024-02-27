package com.swpproject.application.model;

import jakarta.persistence.*;

import java.util.Arrays;

@Entity
@Table(name = "CERTIFICATE")
public class Certificate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CERTIFICATE_ID")
    private Integer certificateId;

    @Column(name = "TITLE", nullable = false)
    private String title;

    @Column(name = "ORGANIZER", nullable = false)
    private String organizer;

    @Lob
    @Column(name = "[IMAGE]", nullable = false)
    private byte[] image;

    @ManyToOne
    @JoinColumn(name = "PT_ID", nullable = false)
    private PersonalTrainer personalTrainer;

    // Getter and setter methods
}
