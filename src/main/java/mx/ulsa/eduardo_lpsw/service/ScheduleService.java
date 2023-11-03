package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.Schedules;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.repository.IScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ScheduleService {

    @Autowired
    IScheduleRepository scheduleRepo;

    public List<Schedules> getAllSchedules(){
        List<Schedules> catList = new ArrayList<Schedules>();
        scheduleRepo.findAll().forEach(schedule -> catList.add(schedule));
        return catList;
    }


    public Schedules getScheduleById(Integer id) {
        return scheduleRepo.findById(id).get();
    }

    public boolean saveOrUpdateSchedule(Schedules schedule){
        Schedules updateSchedule = scheduleRepo.save(schedule);

        if(scheduleRepo.findById(updateSchedule.getId_schedules()) != null) {

            return true;

        }

        return false;
    }

    public boolean deleteSchedule(Integer id) {
        scheduleRepo.deleteById(id);
        if (scheduleRepo.findById(id) != null) {
            return true;
        }
        return false;
    }

    public Schedules getScheduleByDoctor(User user) {
        return scheduleRepo.findByUser(user).get(0);
    }

    public List<Schedules> getSchedulesByDoctor(User user){
        List<Schedules> catList = new ArrayList<Schedules>();
        scheduleRepo.findByUser(user).forEach(schedule -> catList.add(schedule));
        return catList;
    }

    public List<Schedules> getSchedulesByDoctorFromPatient(User user){
        List<Schedules> catList = new ArrayList<Schedules>();
        scheduleRepo.findUnscheduledSchedulesByDoctorId(user.getId_user()).forEach(schedule -> catList.add(schedule));
        return catList;
    }

}
