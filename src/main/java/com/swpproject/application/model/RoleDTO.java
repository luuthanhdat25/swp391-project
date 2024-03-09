package com.swpproject.application.model;

import com.swpproject.application.enums.Role;
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

        RoleDTO roleDTO = new RoleDTO();
        roleDTO.setRole(account.getRole());

        if(account.getRole() == Role.PT){
            PersonalTrainer personalTrainer = (PersonalTrainer) session.getAttribute("personalTrainer");
            roleDTO.setId(personalTrainer.getId());
            return roleDTO;
        }

        Gymer gymer = (Gymer) session.getAttribute("gymer");
        roleDTO.setId(gymer.getGymerId());
        return roleDTO;
    }
}
