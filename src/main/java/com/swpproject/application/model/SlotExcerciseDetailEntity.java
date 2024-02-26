package com.swpproject.application.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Slot_excercise_detail")
public class SlotExcerciseDetailEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;



}
