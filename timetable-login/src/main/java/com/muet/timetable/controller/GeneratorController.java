package com.muet.timetable.controller;


import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Day;
import com.muet.timetable.beans.DaySlot;
import com.muet.timetable.beans.DaySlots;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.NotificationDetails;
import com.muet.timetable.beans.Section;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.TimeSlot;
import com.muet.timetable.beans.TimeSlotDaily;
import com.muet.timetable.beans.TimeTableWithoutRoom;
import com.muet.timetable.beans.User;
import com.muet.timetable.daoImpl.AssignSubjectDAOImpl;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.DayDAOImpl;
import com.muet.timetable.daoImpl.NotificationDetailsDAOImpl;
import com.muet.timetable.daoImpl.SemesterDAOImpl;
import com.muet.timetable.daoImpl.SubjectDAOImpl;
import com.muet.timetable.daoImpl.TimeSlotDailyDAOImpl;
import com.muet.timetable.daoImpl.TimeTableWithoutRoomDAOImpl;
import com.muet.timetable.daoImpl.UserDAOImpl;
import com.muet.timetable.dto.SubjectTransfer;


@Controller
@RequestMapping("/generatetimetable")
public class GeneratorController {

	@Autowired
	SubjectDAOImpl subjectDAOImpl;

	@Autowired
	TimeSlotDailyDAOImpl timeSlotDailyDAOImpl;

	@Autowired
	DayDAOImpl dayDAOImpl;

	@Autowired
	AssignSubject assignSubject;

	@Autowired
	AssignSubjectDAOImpl assignSubjectDAOImpl;

	@Autowired
	TimeTableWithoutRoomDAOImpl timeTableWithoutRoomDAOImpl;

	@Autowired
	TimeTableWithoutRoom timeTableWithoutRoom;

	@Autowired
	Day day;

	@Autowired
	TimeSlot slot;

	List<AssignSubject> assignSubjects;
	List<Day> days;

	@Autowired
	Batch batch;

	@Autowired
	Section section;

	@Autowired
	UserDAOImpl userDAOImpl;

	@Autowired
	BatchDAOImpl batchDAOImpl;
	

	@Autowired
	SemesterDAOImpl semesterDAOImpl;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getData(Model model, @ModelAttribute AssignSubject assignsubject, BindingResult bindingResult,
			HttpServletRequest httpServletRequest, Principal principal) {

		User user = userDAOImpl.findByUsername(principal.getName());
		
		
		//For Side bar
		List<Batch> batchs = batchDAOImpl.getAllRecordsByDept(user.getDepartment());
    	List<Semester> semesters = semesterDAOImpl.getAllRecords();
     	model.addAttribute("batchs",batchs);
    	model.addAttribute("semesters",semesters);
    	//
    	
    	
		batch = assignsubject.getBatch();
		section = assignsubject.getSection();

		days = dayDAOImpl.getAllRecords();
		assignSubjects = assignSubjectDAOImpl.getAllRecordsByBatchAndSectionAndSemester(assignsubject.getBatch(),
				assignsubject.getSection(), assignsubject.getSemester());
		model.addAttribute("listofteachers", assignSubjectDAOImpl.getAllRecordsByBatchAndSectionAndSemester(
				assignsubject.getBatch(), assignsubject.getSection(), assignsubject.getSemester()));

		model.addAttribute("user", user);
		model.addAttribute("batch_id", batch.getId());
		model.addAttribute("section_id", section.getId());
		model.addAttribute("semester_id", assignsubject.getSemester().getId());

		model.addAttribute("listofdays", dayDAOImpl.getAllRecords());
		model.addAttribute("timetablewithoutclass", timeTableWithoutRoomDAOImpl.getAllRecords());
		model.addAttribute("listoftimeslots", timeSlotDailyDAOImpl.getAllRecords());
		
		
		System.out.println(section.getId());
		

		
		
		
		
		model.addAttribute("admin_id",user.getId());

		return "generatetimetable-page";
	}

	@RequestMapping(value = "notify", method = RequestMethod.GET)
	public ResponseEntity<?> sendNotify(Model model, @ModelAttribute AssignSubject assignsubject,
			BindingResult bindingResult, HttpServletRequest httpServletRequest, Principal principal) {

		List<AssignSubject> assignSubjects = assignSubjectDAOImpl.getAllRecordsByBatchAndSectionAndSemester(
				assignsubject.getBatch(), assignsubject.getSection(), assignsubject.getSemester());
		
		for (AssignSubject user:assignSubjects ) {
			
			System.out.println(user.getSubject().getName());
		}
		
		

		/*User user = userDAOImpl.findByUsername(principal.getName());

		NotificationDetails details = new NotificationDetails();
		User reciver = new User();
		reciver.setId(2l);

		details.setSender(user);
		details.setReciver(reciver);
		details.setAssignsubject(assignSubjectDAOImpl.getRecordById(1l));
		details.setDescription("Slot Approval for Batch: " + batch.getName() + " and Section: " + section.getName()
				+ "<br/> <a href='slotsapproval=1' class='btn btn-success'> Click here </a>");
		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		LocalDateTime myDateObj = LocalDateTime.now();
		String datetime = myDateObj.format(myFormatObj);

		details.setDatetime(datetime);

		notificationDetailsDAOImpl.addRecord(details);
		
		*/

		return ResponseEntity.ok("OK");
	}

	
	@PostMapping("/commit")
	public ResponseEntity<?> saveSlotsAndSubjects(Model model,
			@RequestParam(value = "subjects") ArrayList<String> subjects) {
		for (String sub : subjects) {
			try {
				if (sub.split("_")[4] != null) {

					Day day = new Day();
					day.setId(getDayId(sub));

					TimeSlot slot = new TimeSlot();
					slot.setId(getSlotId(sub));

					AssignSubject assignSubject = new AssignSubject();
					assignSubject.setId(getSubjectId(sub));

					TimeTableWithoutRoom tableWithoutRoom = new TimeTableWithoutRoom();
					tableWithoutRoom.setCommited(1);
					tableWithoutRoom.setTimeslot(slot);
					tableWithoutRoom.setDay(day);
					tableWithoutRoom.setAssignsubject(assignSubject);

					timeTableWithoutRoomDAOImpl.addRecord(tableWithoutRoom);

				}

			} catch (Exception e) {
				// e.printStackTrace();
			}

		}

		return ResponseEntity.ok("Commited");
	}
	

	@PostMapping("/uncommit")
	public ResponseEntity<?> deleteSlotsAndSubjects(Model model,
			@RequestParam(value = "id") ArrayList<String> id) {
		
		try {
			
			for (String s:id) {
				timeTableWithoutRoomDAOImpl.deleteCommited(Long.parseLong(s));
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		return ResponseEntity.ok("UnCommited");
	}
	
	@PostMapping("/validatecommit")
	public ResponseEntity<?> validateCommit(Model model,
			@RequestParam(value = "id") ArrayList<String> id) {
		boolean validate=false;
		try {
			
			for (String s:id) {
			TimeTableWithoutRoom room=	timeTableWithoutRoomDAOImpl.getRecordById(Long.parseLong(s));
				if (room.getCommited()==1) {
					validate=true;
				}
				else {
					validate=false;
				}
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		if (validate) { 
		
		return ResponseEntity.ok("commited");
		}
		else {
			return ResponseEntity.ok("uncommited");
		}
	}



	ArrayList<AssignSubject> theorySubjects_list;
	ArrayList<AssignSubject> practicalSubjects_list;

	/**
	 * @param model
	 * @param slots
	 * @param unassigned_subjects_id
	 * @return
	 */
	/**
	 * @param model
	 * @param slots
	 * @param unassigned_subjects_id
	 * @return
	 */
	/**
	 * @param model
	 * @param slots
	 * @param unassigned_subjects_id
	 * @return
	 */
	/**
	 * @param model
	 * @param slots
	 * @param unassigned_subjects_id
	 * @return
	 */
	/**
	 * @param model
	 * @param slots
	 * @param unassigned_subjects_id
	 * @return
	 */
	@PostMapping("/slots")
	public ResponseEntity<?> getSlotsAndSubjects(Model model, @RequestParam(value = "slots") ArrayList<String> slots,
			@RequestParam(value = "unassigned_subjects_id") long[] unassigned_subjects_id) {

		// System.out.println("Total Slots "+getTotalCreditHours(assignSubjects));
		ArrayList<DaySlots> daySlots = calculateDaySlots(getTotalCreditHours(assignSubjects), days);
		
		
		System.out.println("credit hours: "+getTotalCreditHours(assignSubjects));

		ArrayList<AssignSubject> assignSubject = getUnAssignedSubject(unassigned_subjects_id);

		theorySubjects_list = getTheorySubject(assignSubject);
		practicalSubjects_list = getPracticalSubject(assignSubject);
		
		
		for (AssignSubject subject:theorySubjects_list) {
			
			System.out.println("theorySubjects_list: "+subject.getSubject().getName());
		}

		ArrayList<String> subject_allocated = new ArrayList<String>();

		// DAY ARRAYLIST
		ArrayList<String> Monday = new ArrayList<String>();
		ArrayList<String> Tuesday = new ArrayList<String>();
		ArrayList<String> Wednesday = new ArrayList<String>();
		ArrayList<String> Thursday = new ArrayList<String>();
		ArrayList<String> Friday = new ArrayList<String>();

		// Slots Entry Area
		for (String s : slots) {

			if (s.split("_")[1].equals("1")) {

				Monday.add(s);

			}

			if (s.split("_")[1].equals("2")) {

				Tuesday.add(s);

			}

			if (s.split("_")[1].equals("3")) {

				Wednesday.add(s);

			}
			if (s.split("_")[1].equals("4")) {

				Thursday.add(s);

				// CloneTuesday.add(s);

			}

			if (s.split("_")[1].equals("5")) {

				Friday.add(s);

				// CloneTuesday.add(s);

			}

		}

		
		Collections.shuffle(theorySubjects_list);
		Collections.shuffle(practicalSubjects_list);
		for (DaySlots d : daySlots) {

			// Monday
			if (d.getDay().getName().equals("Monday")) {

				int three_empty = 0;
				boolean practical_enable = false;
				boolean theory_enable = true;

				int practical_count = 0;

				int theory_subject = 0;

				for (int i = 0; i < d.getSlots().size(); i++) {

					if (Monday.get(i).contains("unassigned")) {

						three_empty++;
						if (three_empty == 3) {

							practical_enable = true;

							System.out.println("Value of I : " + i + " ===" + Monday.get(i));
							System.out.println("Value of I : " + (i - 1) + " ===" + Monday.get(i - 1));

							Monday.set(i, "unassigned_1_" + (i + 1));
							Monday.set(i - 1, "unassigned_1_" + (i));
							Monday.set(i - 2, "unassigned_1_" + (i - 1));

							theory_enable = false;

							// Monday.clear();
							// Monday=CloneMonday;

							i = i - 2;

						}
						
						
						if (practicalSubjects_list.size()>0) {

						if (practical_enable) {

							Monday.set(i, assignedSlot(Monday.get(i)) + practicalSubjects_list.get(0).getId() + "_"
									+ practicalSubjects_list.get(0).getSubject().getCode() + "_Practical");

							practical_count++;

							if (practical_count == 3) {
								practical_enable = false;
								practicalSubjects_list.remove(0);

								theory_enable = true;
								continue;
							}

						}
						}

					 if (theory_enable) {
							if(theorySubjects_list.size()==theory_subject) {
								theory_subject=0;
							}

							int credit_hour = Integer
									.parseInt(theorySubjects_list.get(theory_subject).getSubject().getCredit_hour());
							if (credit_hour != 0) {

								// credit_hour--;
								// theorySubjects_list.get(theory_subject).getSubject().setCredit_hour(credit_hour+"");
								Monday.set(i,
										assignedSlot(Monday.get(i)) + theorySubjects_list.get(theory_subject).getId()
												+ "_" + theorySubjects_list.get(theory_subject).getSubject().getCode()
												+ "_Theory");

								theory_subject++;

							}
							// else {
							// theorySubjects_list.remove(theory_subject);
							// }
						}

					} else {
						three_empty = 0;

					}

				}
			}

		}

		for (String s : Monday) {

			minusTheoryCreditHour(s);
			subject_allocated.add(s);

			System.out.println("MONDAY: " + s);
			
			Collections.shuffle(theorySubjects_list);
			Collections.shuffle(practicalSubjects_list);
			

			
		}

		for (DaySlots d : daySlots) {

			if (d.getDay().getName().equals("Tuesday")) {

				int three_empty = 0;
				boolean practical_enable = false;
				boolean theory_enable = true;

				int practical_count = 0;

				int theory_subject = 0;

				for (int i = 0; i < d.getSlots().size(); i++) {

					if (Tuesday.get(i).contains("unassigned")) {

						three_empty++;
						if (three_empty == 3) {

							practical_enable = true;

							Tuesday.set(i, "unassigned_2_" + (i + 1));
							Tuesday.set(i - 1, "unassigned_2_" + (i));
							Tuesday.set(i - 2, "unassigned_2_" + (i - 1));

							i = i - 2;
							// System.out.println("Value of i="+i);

							theory_enable = false;
							// Tuesday.clear();
							// Tuesday=CloneTuesday;

						}
						if (practicalSubjects_list.size()>0) {

						if (practical_enable) {

							Tuesday.set(i, assignedSlot(Tuesday.get(i)) + practicalSubjects_list.get(0).getId() + "_"
									+ practicalSubjects_list.get(0).getSubject().getCode() + "_Practical");

							practical_count++;

							if (practical_count == 3) {
								practical_enable = false;
								practicalSubjects_list.remove(0);

								theory_enable = true;
								continue;
							}

						}
						}	

						if (theory_enable) {
							
							if(theorySubjects_list.size()==theory_subject) {
								theory_subject=0;
							}

							int credit_hour = Integer
									.parseInt(theorySubjects_list.get(theory_subject).getSubject().getCredit_hour());
							if (credit_hour != 0) {

							
								Tuesday.set(i,
										assignedSlot(Tuesday.get(i)) + theorySubjects_list.get(theory_subject).getId()
												+ "_" + theorySubjects_list.get(theory_subject).getSubject().getCode()
												+ "_Theory");

								theory_subject++;

							}

							else {
								theorySubjects_list.remove(theory_subject);
							}

						}

					} else {
						three_empty = 0;

					}

				}
			}

		}

		for (String s : Tuesday) {
			minusTheoryCreditHour(s);
			subject_allocated.add(s);

			System.out.println("TUESDAY: " + s);
			
			Collections.shuffle(theorySubjects_list);
			Collections.shuffle(practicalSubjects_list);
		}
		
		
		
		//WEDNESDAY
		for (DaySlots d : daySlots) {

			if (d.getDay().getName().equals("Wednesday")) {

				int three_empty = 0;
				boolean practical_enable = false;
				boolean theory_enable = true;

				int practical_count = 0;

				int theory_subject = 0;

				for (int i = 0; i < d.getSlots().size(); i++) {

					if (Wednesday.get(i).contains("unassigned")) {

						three_empty++;
						if (three_empty == 3) {

						

							Wednesday.set(i, "unassigned_3_" + (i + 1));
							Wednesday.set(i - 1, "unassigned_3_" + (i));
							Wednesday.set(i - 2, "unassigned_3_" + (i - 1));

							i = i - 2;
							// System.out.println("Value of i="+i);
							practical_enable = true;	
							theory_enable = false;
						

						}
						
						
						if (practicalSubjects_list.size()>0) {

						if (practical_enable) {

							Wednesday.set(i, assignedSlot(Wednesday.get(i)) + practicalSubjects_list.get(0).getId() + "_"
									+ practicalSubjects_list.get(0).getSubject().getCode() + "_Practical");

							practical_count++;

							if (practical_count == 3) {
								practical_enable = false;
								practicalSubjects_list.remove(0);

								theory_enable = true;
								continue;
							}

						}
					}
						else {
							theory_enable = true;
						}	
						

						 if (theory_enable) {
							 
								
								if(theorySubjects_list.size()==theory_subject) {
									theory_subject=0;
								}
							int credit_hour = Integer
									.parseInt(theorySubjects_list.get(theory_subject).getSubject().getCredit_hour());
							if (credit_hour != 0) {

								
								Wednesday.set(i,
										assignedSlot(Wednesday.get(i)) + theorySubjects_list.get(theory_subject).getId()
												+ "_" + theorySubjects_list.get(theory_subject).getSubject().getCode()
												+ "_Theory");

								theory_subject++;

							}

							else {
								theorySubjects_list.remove(theory_subject);
							}
							
							
							

						}

					} else {
						three_empty = 0;

					}

				}
			}

		}

		for (String s : Wednesday) {
			minusTheoryCreditHour(s);
			subject_allocated.add(s);

			System.out.println("Wednesday: " + s);
			Collections.shuffle(theorySubjects_list);
			Collections.shuffle(practicalSubjects_list);
		}
		

		//THURSDAY
		for (DaySlots d : daySlots) {

			if (d.getDay().getName().equals("Thursday")) {

				int three_empty = 0;
				boolean practical_enable = false;
				boolean theory_enable = true;

				int practical_count = 0;

				int theory_subject = 0;

				for (int i = 0; i < d.getSlots().size(); i++) {

					if (Thursday.get(i).contains("unassigned")) {

						three_empty++;
						if (three_empty == 3) {

						

							Thursday.set(i, "unassigned_4_" + (i + 1));
							Thursday.set(i - 1, "unassigned_4_" + (i));
							Thursday.set(i - 2, "unassigned_4_" + (i - 1));

							i = i - 2;
							
							practical_enable = true;	
							theory_enable = false;
						

						}
						
						
						if (practicalSubjects_list.size()>0) {

						if (practical_enable) {

							Thursday.set(i, assignedSlot(Thursday.get(i)) + practicalSubjects_list.get(0).getId() + "_"
									+ practicalSubjects_list.get(0).getSubject().getCode() + "_Practical");

							practical_count++;

							if (practical_count == 3) {
								practical_enable = false;
								practicalSubjects_list.remove(0);

								theory_enable = true;
								continue;
							}

						}
					}
						else {
							theory_enable = true;
						}	
						

						 if (theory_enable) {
							 
								
								if(theorySubjects_list.size()==theory_subject) {
									theory_subject=0;
								}
							int credit_hour = Integer
									.parseInt(theorySubjects_list.get(theory_subject).getSubject().getCredit_hour());
							if (credit_hour != 0) {

								
								Thursday.set(i,
										assignedSlot(Thursday.get(i)) + theorySubjects_list.get(theory_subject).getId()
												+ "_" + theorySubjects_list.get(theory_subject).getSubject().getCode()
												+ "_Theory");

								theory_subject++;

							}

							else {
								theorySubjects_list.remove(theory_subject);
							}
							
							
							

						}

					} else {
						three_empty = 0;

					}

				}
			}

		}

		for (String s : Thursday) {
			minusTheoryCreditHour(s);
			subject_allocated.add(s);

			System.out.println("Thursday: " + s);
			Collections.shuffle(theorySubjects_list);
			Collections.shuffle(practicalSubjects_list);
		}
		
		
		//FRIDAY
		for (DaySlots d : daySlots) {

			if (d.getDay().getName().equals("Friday")) {

				int three_empty = 0;
				boolean practical_enable = false;
				boolean theory_enable = true;

				int practical_count = 0;

				int theory_subject = 0;

				for (int i = 0; i < d.getSlots().size(); i++) {

					if (Friday.get(i).contains("unassigned")) {

						three_empty++;
						if (three_empty == 3) {

						

							Friday.set(i, "unassigned_5_" + (i + 1));
							Friday.set(i - 1, "unassigned_5_" + (i));
							Friday.set(i - 2, "unassigned_5_" + (i - 1));

							i = i - 2;
							
							practical_enable = true;	
							theory_enable = false;
						

						}
						
						
						if (practicalSubjects_list.size()>0) {

						if (practical_enable) {

							Friday.set(i, assignedSlot(Friday.get(i)) + practicalSubjects_list.get(0).getId() + "_"
									+ practicalSubjects_list.get(0).getSubject().getCode() + "_Practical");

							practical_count++;

							if (practical_count == 3) {
								practical_enable = false;
								practicalSubjects_list.remove(0);

								theory_enable = true;
								continue;
							}

						}
					}
						else {
							theory_enable = true;
						}	
						

						 if (theory_enable) {
							 
								
								if(theorySubjects_list.size()==theory_subject) {
									theory_subject=0;
								}
							int credit_hour = Integer
									.parseInt(theorySubjects_list.get(theory_subject).getSubject().getCredit_hour());
							if (credit_hour != 0) {

								
								Friday.set(i,
										assignedSlot(Friday.get(i)) + theorySubjects_list.get(theory_subject).getId()
												+ "_" + theorySubjects_list.get(theory_subject).getSubject().getCode()
												+ "_Theory");

								theory_subject++;

							}

							else {
								theorySubjects_list.remove(theory_subject);
							}
							
							
							

						}

					} else {
						three_empty = 0;

					}

				}
			}

		}

		for (String s : Friday) {
			minusTheoryCreditHour(s);
			subject_allocated.add(s);

			System.out.println("Friday: " + s);
			Collections.shuffle(theorySubjects_list);
			Collections.shuffle(practicalSubjects_list);
		}
		
		
	
		
		

		System.out.println("=================================================");
		System.out.println("THEORIES");
		
		for (AssignSubject th: theorySubjects_list) {
			
		System.out.println(th.getSubject().getCode()+" == "+th.getSubject().getCredit_hour());	
		}
		System.out.println("PRACTICALS");
		for (AssignSubject pr: practicalSubjects_list) {
			
			System.out.println(pr.getSubject().getCode()+" == "+pr.getSubject().getCredit_hour());	
			}


		// assignSubjectDAOImpl.getRecordById(id)

		return ResponseEntity.ok(subject_allocated);
	}

	public void minusTheoryCreditHour(String subject_id) {
		int id = 0;
		int credit_hour = 0;
		Collections.shuffle(theorySubjects_list);

		try {
			if (subject_id.split("_")[4] != null) {

				id = Integer.parseInt(subject_id.split("_")[3]);
			}
		} catch (Exception e) {
			// e.printStackTrace();
		}
		for (int i = 0; i < theorySubjects_list.size(); i++) {

			if (theorySubjects_list.get(i).getId() == id) {
				credit_hour = Integer.parseInt(theorySubjects_list.get(i).getSubject().getCredit_hour());
				credit_hour--;
				theorySubjects_list.get(i).getSubject().setCredit_hour("" + credit_hour);
				System.out.println(theorySubjects_list.get(i).getSubject().getCode() + "==="
						+ theorySubjects_list.get(i).getSubject().getCredit_hour());
				if (credit_hour == 0) {

					System.out.println("Size of list before : " + theorySubjects_list.size());

					for (int j = 0; j < theorySubjects_list.size(); j++) {
						System.out.println("Before Subject Name: " + theorySubjects_list.get(j).getSubject().getName()
								+ "==" + theorySubjects_list.get(j).getSubject().getCredit_hour());

					}

					theorySubjects_list.remove(i);

					System.out.println("Size of list After : " + theorySubjects_list.size());

					for (int j = 0; j < theorySubjects_list.size(); j++) {
						System.out.println("After Subject Name: " + theorySubjects_list.get(j).getSubject().getName()
								+ "==" + theorySubjects_list.get(j).getSubject().getCredit_hour());

					}
				}

			}
		}

	}

	public String assignedSlot(String unassigned) {

		String assigned = "assigned" + "_" + unassigned.split("_")[1] + "_" + unassigned.split("_")[2] + "_";

		return assigned;
	}

	public long getDayId(String assigned_id) {

		long day_id = Integer.parseInt(assigned_id.split("_")[1]);

		return day_id;
	}

	public int getSlotId(String assigned_id) {

		int slot_id = Integer.parseInt(assigned_id.split("_")[2]);

		return slot_id;
	}

	public long getSubjectId(String assigned_id) {

		long subject_id = Integer.parseInt(assigned_id.split("_")[3]);

		return subject_id;
	}

	public ArrayList<AssignSubject> getUnAssignedSubject(long[] unassign_subject_ids) {

		ArrayList<AssignSubject> unAssignedSubject = new ArrayList<AssignSubject>();
		for (Long id : unassign_subject_ids) {

			AssignSubject assignSubject = assignSubjectDAOImpl.getRecordById(id);
			unAssignedSubject.add(assignSubject);

		}

		return unAssignedSubject;
	}

	public ArrayList<AssignSubject> getTheorySubject(ArrayList<AssignSubject> assignSubject) {

		ArrayList<AssignSubject> theorySubject = new ArrayList<AssignSubject>();
		for (AssignSubject as : assignSubject) {

			if (as.getSubject().getType().equals("Theory")) {
				theorySubject.add(as);
			}

		}

		return theorySubject;
	}

	public ArrayList<AssignSubject> getPracticalSubject(ArrayList<AssignSubject> assignSubject) {

		ArrayList<AssignSubject> practicalSubject = new ArrayList<AssignSubject>();
		for (AssignSubject as : assignSubject) {

			if (as.getSubject().getType().equals("Practical")) {
				practicalSubject.add(as);
			}

		}

		return practicalSubject;
	}

	public ArrayList<DaySlots> calculateDaySlots(float total_credit_hours, List<Day> days2) {

		ArrayList<DaySlots> daySlots = new ArrayList<DaySlots>();

		float total_days = days2.size();

		System.out.println("days: " + total_days);

		float approx_slots_perday = total_credit_hours / total_days; // 4.6
		int roundoff_floar = (int) approx_slots_perday;

		int total_slots_per_day = (roundoff_floar * (int) total_days);

		int remaining = (int) total_credit_hours - total_slots_per_day;

		for (Day d : days2) {
			DaySlots daySlots2 = new DaySlots();
			ArrayList<Integer> slots = new ArrayList<Integer>();

			if (d.getName().equals("Friday")) {
				for (int i = 0; i < roundoff_floar; i++) {

					if (slots.size() >= 4) {
						remaining++;
						continue;
					} else {
						slots.add(i);
					}
				}

				daySlots2.setDay(d);
				daySlots2.setSlots(slots);
			} else {
				for (int i = 0; i < roundoff_floar; i++) {
					slots.add(i);
				}
				daySlots2.setDay(d);
				daySlots2.setSlots(slots);

			}

			daySlots.add(daySlots2);

		}

		for (int remain = 0; remain < remaining; remain++) {
			ArrayList<Integer> slots = daySlots.get(remain).getSlots();

			if (daySlots.get(remain).getDay().getName().equals("Friday")) {

				if (slots.size() == 4) {
					System.out.print("remain chaala hai");
					remain = 0;
				}

			} else {

				slots.add(remain);
				daySlots.get(remain).setSlots(slots);
			}
		}

		for (DaySlots d : daySlots) {
			System.out.println(d);
		}

		return daySlots;
	}

	public float getTotalCreditHours(List<AssignSubject> assignSubjects2) {

		float total = 0;

		for (AssignSubject as : assignSubjects2) {
			total += Float.parseFloat(as.getSubject().getCredit_hour());

		}
		return total;
	}

}