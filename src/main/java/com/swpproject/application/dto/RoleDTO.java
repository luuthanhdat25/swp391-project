package com.swpproject.application.dto;

import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.PersonalTrainer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class RoleDTO {
    private Role role;
    private Integer id;

    public static RoleDTO getRoleDTOFromHttpServletRequest(HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        if(session == null) return null;

        Account account = (Account) session.getAttribute("account");
        if(account == null) return null;

        RoleDTO roleDTO = new RoleDTO(account.getRole(), null);

        if(roleDTO.getRole() == Role.ADMIN) return roleDTO;

        if(roleDTO.getRole() == Role.PT){
            PersonalTrainer personalTrainer = (PersonalTrainer) session.getAttribute("personalTrainer");
            roleDTO.setId(personalTrainer.getId());
        }else{
            Gymer gymer = (Gymer) session.getAttribute("gymer");
            roleDTO.setId(gymer.getGymerId());
        }

        return roleDTO;
    }
}
