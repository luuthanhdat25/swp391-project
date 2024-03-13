package com.swpproject.application.model;

import java.time.LocalDateTime;

import jakarta.persistence.*;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
@Table(name = "report")
public class Report {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "reason", columnDefinition = "NVARCHAR(255)")
	private String reason;

	@Column(name = "description", columnDefinition = "NVARCHAR(MAX)")
	private String description;

	@Column(name = "time_stamp")
	private LocalDateTime timeStamp;

	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "personal_trainer_id",referencedColumnName = "id", nullable = false)
	private PersonalTrainer personalTrainerAccount;

	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gymer_id",referencedColumnName = "id", nullable = false)
	private Gymer gymerAccount;
}
