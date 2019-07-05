package com.muet.timetable.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.muet.timetable.beans.Day;
import com.muet.timetable.beans.DaySlot;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.TimeSlotDaily;
import com.muet.timetable.daoImpl.DayDAOImpl;
import com.muet.timetable.daoImpl.SubjectDAOImpl;
import com.muet.timetable.daoImpl.TimeSlotDailyDAOImpl;

@Controller
@RequestMapping("/timetable")
public class TimeTableGenerator {
	
	
	@Autowired
	SubjectDAOImpl subjectDAOImpl; 
	
	@Autowired
	TimeSlotDailyDAOImpl timeSlotDailyDAOImpl;
	

	@Autowired
	DayDAOImpl dayDAOImpl;
	
	@RequestMapping("")
	public String DayPage(Model modele) {
		
		/*Department department = new Department();
		department.setId(1);
		
		
		Semester semester = new Semester();
		semester.setId(6l);
		int totalCreditHours=subjectDAOImpl.getCreaditHour(department,semester);
		int slotsForFriday=timeSlotDailyDAOImpl.gettimeSlotsForFriday();
		List<Day> days= dayDAOImpl.getAllRecords();
		List<TimeSlotDaily> timeSlotsForReqular = timeSlotDailyDAOImpl.getAllRecords();
		System.out.println(subjectDAOImpl.getCreaditHour(department,semester));
		System.out.println("Time Slots for friday: "+timeSlotDailyDAOImpl.gettimeSlotsForFriday());
		
		for (TimeSlotDaily daily : timeSlotDailyDAOImpl.gettimeSlotsForRegular()) {
			System.out.println("Time Slots for dialy: "+daily.getTotalSlots());
			
		}
		calculateDay(27,slotsForFriday,days,timeSlotsForReqular);
		*/
		
		return "timetable-page";
	}

	
	
	
	 public ArrayList <Day> calculateDay(Integer totalCreditHours ,int slotsForFriday,List<Day> days,List<TimeSlotDaily> timeSlotsForReqular){
		 List<DaySlot> daySlots=new ArrayList<DaySlot>();
		 int slotPerDay=totalCreditHours/days.size();
		 
		 
		 
		 
		 
		 for (int i = 1; i <= days.size(); i++) {
            daySlots.add(new DaySlot(i,slotPerDay));			
		}
		 
		 
		 int temp=0;
		 if(daySlots.get(4).getNumOfSlots()>slotsForFriday){
		  temp=slotPerDay-slotsForFriday;
		 for(int j=0;j<temp;j++){
			 daySlots.get(j).setNumOfSlots(daySlots.get(j).getNumOfSlots()+1);
			 daySlots.get(4).setNumOfSlots( daySlots.get(4).getNumOfSlots()-1); 

		 }
		 
		 int totalSlot=0;
		 //
		 for(int k=0;k<daySlots.size();k++){
			 totalSlot+=daySlots.get(k).getNumOfSlots();
		 }

		 if(totalSlot<totalCreditHours){
			 int remainingSlots=totalCreditHours-totalSlot;
			 for (int n = temp; n <=remainingSlots; n++) {
				 daySlots.get(n).setNumOfSlots(daySlots.get(n).getNumOfSlots()+1);

			}
		 }
		   
			 
		 }

		   ArrayList<Day> daysList=new ArrayList<Day>();
		   //TimeSlotDaily daily =new TimeSlotDaily();
		   for (DaySlot slot: daySlots) {
			   
			   System.out.println(slot);
		   }
		   
		   for (int i = 0; i < daySlots.size(); i++) {
			   ArrayList<TimeSlotDaily> daily=new ArrayList<TimeSlotDaily>();
		   for (int j = 0; j < daySlots.get(i).getNumOfSlots(); j++) {
			   
			   //System.out.println(daySlots(j));
			   //daily.add(timeSlotsForReqular.get(j));
			// System.out.println( "Time Slots: "+ timeSlotsForReqular.get(j).getDay().getName());
			   
			
		}
		   
			//daysList.add(new Day(days.get(i).id,days.get(i).getName(), daily));
		}

		   	return daysList;	 
	 }
	
	 

	
	
	
}
