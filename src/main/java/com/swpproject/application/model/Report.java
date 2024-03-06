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
	private long id;

	//de tam nhu the nay
	private int personalTrainerID;
	private int gymerID;
	private String title;

	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String description;
	private LocalDateTime dateTime;
}
