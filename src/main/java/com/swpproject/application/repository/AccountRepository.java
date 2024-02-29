package com.swpproject.application.repository;

import com.swpproject.application.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AccountRepository extends JpaRepository<Account, Integer> {

    Optional<Account> findAccountByEmail(String email);

    @Query("SELECT a FROM Account a WHERE a.role = :role")
    List<Account> findAccountByRole(String role);
}
