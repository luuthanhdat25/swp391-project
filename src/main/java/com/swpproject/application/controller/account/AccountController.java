package com.swpproject.application.controller.account;

import com.swpproject.application.dto.AccountDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AccountController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private AccountRepository accountRepository; // luoi qua nen xai tam :)))

    @ResponseBody
    @GetMapping(value = "/search-account-by-name")
    public ResponseEntity<List<AccountDTO>> getAccountsByName(@RequestParam String name) {

        List<AccountDTO> accountDTOS = new ArrayList<>();
        List<Account> accounts = accountService.getAccounts().stream()
                .filter(account -> account.getFullName().toLowerCase().contains(name.toLowerCase()))
                .collect(Collectors.toList());

        for (Account account : accounts) {
            if (account.getRole().equals(Role.ADMIN)) continue;
            AccountDTO accountDTO = new AccountDTO();
            accountDTO.setId(account.getId());
            accountDTO.setImage(account.getAvatarImage());
            accountDTO.setFullName(account.getFullName());
            accountDTO.setRole(account.getRole().getLabel());
            accountDTOS.add(accountDTO);
        }
        return ResponseEntity.ok().body(accountDTOS);
    }

    @ResponseBody
    @GetMapping(value = "/get-account-detail")
    public ResponseEntity<AccountDTO> getAccountById(@RequestParam int accountID) {
        Account account = accountRepository.findById(accountID).get();
        AccountDTO accountDTO = new AccountDTO();

        accountDTO.setId(account.getId());
        accountDTO.setImage(account.getAvatarImage());
        accountDTO.setFullName(account.getFullName());
        accountDTO.setRole(account.getRole().getLabel());
        return ResponseEntity.ok().body(accountDTO);
    }
}

