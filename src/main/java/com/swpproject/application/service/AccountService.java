package com.swpproject.application.service;

import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface AccountService {
    List<Account> getAccounts();

    Optional<Account> getAccountByEmail(String email);

    List<Account> findAccountByRole(Role role);

    void save(Account account);

    List<Account> findAllAcount();

    Optional<Account> getAccountById(Integer id);


    Optional<Account> getAccountByPersonalTrainerId(Integer id);

    Optional<Account> getAccountByGymerId(Integer id);
}
