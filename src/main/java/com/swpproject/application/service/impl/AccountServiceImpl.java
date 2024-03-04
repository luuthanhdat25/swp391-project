package com.swpproject.application.service.impl;

import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AccountServiceImpl implements AccountService {


    @Autowired
    private AccountRepository accountRepository;

    @Override
    public List<Account> getAccounts() {
        return accountRepository.findAll();
    }

    @Override
    public Optional<Account> findAccountByEmail(String email) {
        return accountRepository.findAccountByEmail(email);
    }


    public  List<Account> findAccountByRole(Role role){
        return accountRepository.findAccountByRole(role);
    }

    @Override
    public Account loginByEmail(String email, String password) {
        Optional<Account> optAccount = accountRepository.findAccountByEmail(email);
        if (optAccount.isPresent()) {
            Account account = optAccount.get();
            if (account.getPassword().equals(password)) {
                return account;
            } else {
                throw new IllegalArgumentException("Incorrect password");
            }
        } else {
            throw new IllegalArgumentException("Account not found for email: " + email);
        }
    }

    @Override
    public void save(Account account) {
        accountRepository.save(account);
    }

}
