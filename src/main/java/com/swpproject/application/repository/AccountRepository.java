package com.swpproject.application.repository;

import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AccountRepository extends JpaRepository<Account, Integer> {

    Optional<Account> findAccountByEmail(String email);

    
    List<Account> findAccountByRole(Role role);


    Boolean existsByEmail(String email);

}
