package com.swpproject.application;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
//@EnableJpaRepositories(basePackages = "com.swpproject.application.repository")
@EntityScan(basePackages = "com.swpproject.application.model")
@ComponentScan(basePackages = "com.swpproject.application")
public class SwpgymApplication {
	public static void main(String[] args) {
		SpringApplication.run(SwpgymApplication.class, args);
	}
}
