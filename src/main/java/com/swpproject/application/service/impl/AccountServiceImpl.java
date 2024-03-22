package com.swpproject.application.service.impl;

import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;

@Service
public class AccountServiceImpl implements AccountService {


    @Autowired
    private AccountRepository accountRepository;

    @Override
    public List<Account> getAccounts() {
        return accountRepository.findAll();
    }

    @Override
    public Optional<Account> getAccountByEmail(String email) {
        return accountRepository.findAccountByEmail(email);
    }

    @Override
    public  List<Account> findAccountByRole(Role role){
        return accountRepository.findAccountByRole(role);
    }

    @Override
    public void save(Account account) {
        accountRepository.save(account);
    }

    @Override
    public List<Account> findAllAcount() {
        return accountRepository.findAll();
    }

    @Override
    public Optional<Account> getAccountById(Integer id) {
        return accountRepository.findById(id);
    }

    @Override
    public Optional<Account> getAccountByPersonalTrainerId(Integer id) {
        return Optional.empty();
    }

    @Override
    public Optional<Account> getAccountByGymerId(Integer id) {
        return Optional.empty();
    }
}
