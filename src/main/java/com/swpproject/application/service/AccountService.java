package com.swpproject.application.service;

import com.swpproject.application.model.Account;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface AccountService {

    List<Account> getAccounts();
    Optional<Account> getAccountByEmail(String email);
    List<Account> findAccountByRole(String role);
    Account loginByEmail(String email,String password);
    void save(Account account);
    Boolean existsByEmail(String email);

}
