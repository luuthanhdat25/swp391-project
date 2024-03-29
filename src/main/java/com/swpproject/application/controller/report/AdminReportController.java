package com.swpproject.application.controller.report;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.model.Report;
import com.swpproject.application.repository.GymerRepository;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.repository.ReportRepository;
import com.swpproject.application.service.GymerService;
import com.swpproject.application.service.PersonalTrainerService;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminReportController {
    public static List<TemplateReport> templateReports = new ArrayList<>();

    static {
        templateReports.add(new TemplateReport(1, "Personal trainers tend to adjust their training programs arbitrarily"));
        templateReports.add(new TemplateReport(2, "Personal trainers are often unprofessional in communicating with customers"));
        templateReports.add(new TemplateReport(3, "Personal trainer does not prepare exercise programs to suit your needs"));
        templateReports.add(new TemplateReport(4, "Personal trainer advertises falsely and makes promises that cannot be fulfilled"));
        templateReports.add(new TemplateReport(5, "Personal trainers frequently use disrespectful language"));
        templateReports.add(new TemplateReport(6, "Other reason"));
    }

    @Autowired
    private ReportRepository reportRepository;
    @Autowired
    private PersonalTrainerRepository personalTrainerRepository;

    @RequestMapping(value = "personal-trainer/add-report", method = RequestMethod.GET)
    public String addNewReport(HttpServletRequest request,
                               @RequestParam(name = "Reason") Integer reasonId,
                               @RequestParam(name = "PersonalTrainerID") Integer personalTrainerID,
                               HttpSession session) {
        String reason;
        Report report = new Report();

        String description = request.getParameter("Description");
        if (reasonId == templateReports.size()) reason = request.getParameter("OtherReason");
        else reason = templateReports.get(reasonId - 1).getContent();

        Gymer gymer = (Gymer) session.getAttribute("gymer");
        PersonalTrainer personalTrainerAccount = personalTrainerRepository.findById(personalTrainerID).get();

        report.setReason(reason);
        report.setDescription(description);
        report.setTimeStamp(LocalDateTime.now());
        report.setGymerAccount(gymer);
        report.setPersonalTrainerAccount(personalTrainerAccount);

        reportRepository.save(report);
        return "redirect:/personal-trainer/details?id=" + personalTrainerID;
    }

    @RequestMapping(value = "admin-home/manage-report", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String viewReportListAndDetail(ModelMap modelMap, Report report,
                                          @RequestParam(name = "papeNo", defaultValue = "1", required = false) int papeNo,
                                          @RequestParam(name = "reportId", defaultValue = "-1", required = false) int reportID,
                                          @RequestParam(name = "reason", defaultValue = "") String reason) {
        int pageSize = 8;
        Pageable pageable = PageRequest.of(papeNo - 1, pageSize);
        Page<Report> reports = Page.empty();

        modelMap.put("TemplateReports", templateReports);
        modelMap.put("ReportLists", reports);
        modelMap.put("IndexStarting", pageSize * (papeNo - 1) + 1);
        modelMap.addAttribute("CurrentPage", papeNo);
        modelMap.addAttribute("reason", reason);

        if (reportID != -1) {
            Report reportDetail = reportRepository.findById(reportID).get(0);
            modelMap.put("ReportDetail", reportDetail);
        }

        if (reason == null || reason.isEmpty()) {
            List<Report> ReportList = reportRepository.findAll();
            Collections.sort(ReportList, Comparator.comparing(Report::getTimeStamp).reversed());

            int fromIndex = Math.min((papeNo - 1) * pageSize, ReportList.size() - 1);
            int toIndex = Math.min(fromIndex + pageSize - 1, ReportList.size() - 1);
            if (fromIndex >= 0) {
                List<Report> pageContent = ReportList.subList(fromIndex, toIndex + 1);
                reports = new PageImpl<>(pageContent, pageable, ReportList.size());
            }
        } else {
            String reasonLowerCase = reason.toLowerCase();
            List<Report> reportFilter = reportRepository.findAll().stream()
                    .filter(reportObject -> reportObject.getReason().toLowerCase().contains(reasonLowerCase))
                    .collect(Collectors.toList());

            if (reportFilter.isEmpty()) {
                modelMap.addAttribute("TotalPage", reports.getTotalPages());
                return "report/admin-home-manage-report";
            }

            Collections.sort(reportFilter, Comparator.comparing(Report::getTimeStamp).reversed());
            int fromIndex = Math.min((papeNo - 1) * pageSize, reportFilter.size() - 1);
            int toIndex = Math.min(fromIndex + pageSize - 1, reportFilter.size() - 1);

            if (fromIndex >= 0) {
                List<Report> pageContent = reportFilter.subList(fromIndex, toIndex + 1);
                reports = new PageImpl<>(pageContent, pageable, reportFilter.size());
            }
        }

        modelMap.put("ReportLists", reports);
        modelMap.addAttribute("TotalPage", reports.getTotalPages());
        return "report/admin-home-manage-report";
    }

    @RequestMapping(value = "admin-home/delete-report", method = RequestMethod.GET)
    public String deleteReport(@RequestParam(name = "deleteReportDetail") Integer id) {
        reportRepository.deleteById(id);
        return "redirect:manage-report";
    }

    @ResponseBody
    @GetMapping(value = "/get-report-detail")
    public ResponseEntity<ReportDTO> getReportDetail(@RequestParam int reportID) {
        Report report = reportRepository.findById(reportID).get(0);
        ReportDTO reportDTO = new ReportDTO();
        reportDTO.setId(report.getId());
        reportDTO.setPersonalTrainerID(report.getPersonalTrainerAccount().getId());
        reportDTO.setReason(report.getReason());
        reportDTO.setDescription(report.getDescription());
        reportDTO.setTimeStamp(report.getTimeStamp());
        reportDTO.setGymerImage(report.getGymerAccount().getAccount().getAvatarImage());
        reportDTO.setPersonalTrainerImage(report.getPersonalTrainerAccount().getAccount().getAvatarImage());
        reportDTO.setGymerName(report.getGymerAccount().getAccount().getFullName());
        reportDTO.setPersonalTrainerName(report.getPersonalTrainerAccount().getAccount().getFullName());
        return ResponseEntity.ok().body(reportDTO);
    }
}

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
class ReportDTO {
    private Integer id;
    private Integer personalTrainerID;
    private String reason;
    private String description;
    private LocalDateTime timeStamp;
    private byte[] personalTrainerImage;
    private byte[] gymerImage;
    private String personalTrainerName;
    private String gymerName;
}