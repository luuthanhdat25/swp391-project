package com.swpproject.application.service;

import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface AccountService {
    @Transactional
    List<Account> getAccounts();

    @Transactional
    Optional<Account> getAccountByEmail(String email);

    @Transactional
    List<Account> findAccountByRole(Role role);

    @Transactional
    Account loginByEmail(String email, String password);

    @Transactional
    void save(Account account);

    @Transactional
    Boolean existsByEmail(String email);
}
