package com.swpproject.application.repository;

import com.swpproject.application.model.Exercise;
import com.swpproject.application.model.Nutrition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

//@Repository
//public interface NutritionRepository extends JpaRepository<Nutrition, Integer> {
//}

@Repository
public class NutritionRepository {
    private final JdbcTemplate jdbcTemplate;

    public NutritionRepository(JdbcTemplate jdbcTemplate) {this.jdbcTemplate = jdbcTemplate;}

    public List<Nutrition> findAll() {
        String sql = "SELECT * FROM nutrition";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Nutrition.class));
    }

    public Nutrition findById(Integer id) {
        String sql = "SELECT * FROM nutrition WHERE nutrition_id = ?";
        return jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Nutrition.class), id);
    }

    public void save(Nutrition nutrition) {
        jdbcTemplate.update("INSERT INTO nutrition (name, protein, fat, carb, calo_in, image_description, is_private, personal_trainer_id) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)", nutrition.getName(), nutrition.getProtein(), nutrition.getFat(),
                nutrition.getCarb(), nutrition.getCaloIn(), nutrition.getImageDescription(), nutrition.getIsPrivate(),
                nutrition.getPersonalTrainer().getId());
    }

    public void deleteById(Integer id) {
        jdbcTemplate.update("DELETE FROM nutrition WHERE nutrition_id = ?", id);
    }

    public void update(Nutrition nutrition) {
        jdbcTemplate.update("UPDATE nutrition SET name = ?, protein = ?, fat = ?, carb = ?, calo_in = ?, image_description = ?, is_private = ?, personal_trainer_id = ? " +
                        "WHERE nutrition_id = ?", nutrition.getName(), nutrition.getProtein(), nutrition.getFat(),
                nutrition.getCarb(), nutrition.getCaloIn(), nutrition.getImageDescription(), nutrition.getIsPrivate(),
                nutrition.getPersonalTrainer().getId(), nutrition.getNutritionId());
    }
}