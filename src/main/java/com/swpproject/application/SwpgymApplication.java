package com.swpproject.application;

import jakarta.persistence.Entity;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = "com.swpproject.application.model")
@EnableJpaRepositories(basePackages = "com.swpproject.application.repository")
public class SwpgymApplication {
	public static void main(String[] args) {
		SpringApplication.run(SwpgymApplication.class, args);
	}
}