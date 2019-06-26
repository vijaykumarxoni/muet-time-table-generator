package com.muet.timetable.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Section;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.SectionDAOImpl;

@Controller
@RequestMapping("/section")
public class SectionController {
	
	
	@Autowired
	SectionDAOImpl sectionDAOImpl;
	
	@Autowired
	BatchDAOImpl batchDAOImpl;

	
	
	@RequestMapping("")
	public String DayPage(Model modele) {
		
		return "section-page";
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 4, Direction.ASC, "id");
		
		return ResponseEntity.ok(sectionDAOImpl.getAllRecords(pageable));

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList() {
		return ResponseEntity.ok(sectionDAOImpl.getAllRecords());

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute Batch batch, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {

		System.out.println(sectionDAOImpl.getRecordById(batch.getId()).toString());
		return ResponseEntity.ok(sectionDAOImpl.getRecordById(batch.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute Section section, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Date date3 = Calendar.getInstance().getTime();
	    SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");

	    java.sql.Date date = null;

	    try {
	        date =new java.sql.Date(df.parse(df.format(date3)).getTime());
	        System.out.println(date);
	    } catch (ParseException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
		
	    section.setCreatedAt(date);
	    section.setUpdatedAt(date);
	    section.setCreatedBy(0);
	    section.setUpdatedBy(0);
	    section.setActive(1);
	    sectionDAOImpl.addRecord(section);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute Section section, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Section updatedsection = sectionDAOImpl.getRecordById(section.getId());
		updatedsection.setName(section.getName());
		Batch batch =batchDAOImpl.getRecordById(section.getBatch().getId());
		updatedsection.setBatch(batch);
		sectionDAOImpl.updateRecord(updatedsection);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute Section section, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Section deletedsection = sectionDAOImpl.getRecordById(section.getId());
		sectionDAOImpl.deleteRecord(deletedsection);
		return ResponseEntity.ok("OK");

	}

	
}
