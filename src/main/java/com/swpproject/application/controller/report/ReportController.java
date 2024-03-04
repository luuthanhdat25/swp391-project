package com.swpproject.application.controller.report;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.swpproject.application.model.Report;
import com.swpproject.application.repository.ReportRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ReportController {
	public static List<TemplateReport> templateReports = new ArrayList<>();
	static {
		templateReports.add(new TemplateReport(1, "Personal trainers tend to adjust their training programs arbitrarily"));
		templateReports.add(new TemplateReport(2, "Personal trainers are often unprofessional in communicating with customers"));
		templateReports.add(new TemplateReport(3, "Personal trainer does not prepare exercise programs to suit your needs"));
		templateReports.add(new TemplateReport(4, "Personal trainer advertises falsely and makes promises that cannot be fulfilled"));
		templateReports.add(new TemplateReport(5, "Personal trainers frequently use disrespectful language"));
		templateReports.add(new TemplateReport(6, "Other reason"));
	}
	private ReportRepository reportRepository;
	public ReportController(ReportRepository reportRepository) {
		super();
		this.reportRepository = reportRepository;
	}
	@RequestMapping(value = "/admin-home/manage-report", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String viewManageReport(ModelMap modelMap) {
        List<Report> reports = reportRepository.findAll();
        modelMap.addAttribute("ReportLists", reports);
        return "admin/admin-home-manage-report";
    }

	@RequestMapping(value = "add-report", method = RequestMethod.GET)
	public String addNewReport(HttpServletRequest request,
			@RequestParam(name = "Reason") int reasonId) {

		String title = new String();
		String description = (String) request.getParameter("Description");
		if (reasonId == templateReports.size()) title = request.getParameter("OtherReason");
		else title = templateReports.get(reasonId - 1).getContent();

		Report report = new Report();
		report.setGymerID(0);
		report.setPersonalTrainerID(0);
		report.setTitle(title);
		report.setDescription(description);
		report.setDateTime(LocalDateTime.now());

		reportRepository.save(report);
		return "redirect:view-report-list-and-detail";
	}

	@RequestMapping(value = "view-report-list-and-detail", method = RequestMethod.GET)
	public String viewReportListAndDetail(ModelMap model, Report report,
			@RequestParam(name = "papeNo", defaultValue = "1") int papeNo,
			@RequestParam(name = "reportId", defaultValue = "-1") int reportID) {

		if (reportID != -1) {
			Report reportDetail = reportRepository.findById(reportID).get(0);
			model.put("ReportDetail", reportDetail);
		}

		Pageable pageable = PageRequest.of(papeNo - 1, 5);
		Page<Report> reports = reportRepository.findAll(pageable);
		model.put("Reports", reports);
		model.put("TemplateReports", templateReports);
		model.addAttribute("TotalPage", reports.getTotalPages());
		model.addAttribute("CurrentPage", papeNo);
		return "report/ViewReportList";
	}

	@RequestMapping(value = "delete-report", method = RequestMethod.GET)
	public String deleteReport(@RequestParam int id) {
		reportRepository.deleteById(id);
		return "redirect:view-report-list-and-detail";
	}
}