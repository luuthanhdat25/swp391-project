package com.swpproject.application.repository;

import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Exercise;
import com.swpproject.application.model.RoleDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

@Repository
public interface ExerciseRepository extends JpaRepository<Exercise, Integer> {}

