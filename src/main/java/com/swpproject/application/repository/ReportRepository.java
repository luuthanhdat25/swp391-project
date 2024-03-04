package com.swpproject.application.repository;

import java.util.List;

import com.swpproject.application.model.Report;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReportRepository extends JpaRepository<Report, Integer> {
	Page<Report> findAll(Pageable pageable);
	List<Report> findById(int id);
}
