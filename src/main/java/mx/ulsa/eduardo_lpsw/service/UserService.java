package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.*;
import mx.ulsa.eduardo_lpsw.repository.IScheduleRepository;
import mx.ulsa.eduardo_lpsw.repository.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    IUserRepository userRepo;
    @Autowired
    IScheduleRepository scheduleRepo;


    public boolean saveOrUpdateUser(User user) {


        if (user.getId_doctor() == null ) {
            user.setId_doctor(null);
        }

        if (user.getId_patient() == null) {
            user.setId_patient(null);
        }



        User updateUser = userRepo.save(user);

        if (userRepo.findById((updateUser.getId_user())) != null) {
            return true;
        }
        return false;
    }

    public List<User> getAllUsers(){
        List<User> catList = new ArrayList<User>();
        userRepo.findAll().forEach(user -> catList.add(user));
        return catList;
    }

    public boolean deleteUser(Integer id) {
        Optional<User> userOptional = userRepo.findById(id);

        if (userOptional.isPresent()) {
            User user = userOptional.get();

            List<Schedules> relatedSchedules = scheduleRepo.findByUser(user);

            for (Schedules schedule : relatedSchedules) {
                scheduleRepo.delete(schedule);
            }

            userRepo.deleteById(id);

            if (!userRepo.existsById(id)) {
                return true;
            }
        }
        return false;

    }

    public User getUserById(Integer id) {
        return userRepo.findById(id).get();
    }


    public List<User> getAllDoctors(){
        List<User> catList = new ArrayList<User>();
        userRepo.findAllDoctors().forEach(user -> catList.add(user));
        return catList;
    }


}
