package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.Appointments;
import mx.ulsa.eduardo_lpsw.models.Doctor;
import mx.ulsa.eduardo_lpsw.models.Specialties;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SpecialityService
{

    @Autowired
    ISpecialityRepository specialityRepo;
    @Autowired
    IDoctorRepository doctorRepository;
    @Autowired
    IUserRepository userRepository;
    @Autowired
    IScheduleRepository scheduleRepository;
    @Autowired
    IAppointmentRepository appointmentRepository;
    @Autowired
    IAppointmentPaymentRepository appointmentPaymentRepository;

    public List<Specialties> getAllSpecialties(){
        List<Specialties> catList = new ArrayList<Specialties>();
        specialityRepo.findAll().forEach(speciality -> catList.add(speciality));
        return catList;
    }


    public Specialties getSpecialtyById(Integer id) {
        return specialityRepo.findById(id).get();
    }

    public boolean saveOrUpdateSpeciality(Specialties speciality){
        Specialties updateSpeciality = specialityRepo.save(speciality);

        if(specialityRepo.findById(updateSpeciality.getId_speciality()) != null) {

            return true;

        }

        return false;
    }

    public boolean deleteSpeciality(Integer id) {
        Specialties speciality = specialityRepo.findById(id).orElse(null);

        if (speciality != null) {
            List<Doctor> doctorsWithSpeciality = doctorRepository.findBySpecialties(speciality);

            for (Doctor doctor : doctorsWithSpeciality) {

                User user = userRepository.findById_doctor(doctor);

                // Delete schedules doctor
                scheduleRepository.deleteByUser(user);

                // Delete appointment that have doctorId
                List<Appointments> appointmentsDoctor = appointmentRepository.findByDoctor(user);

                for (Appointments appointments : appointmentsDoctor) {

                    //Delete payments appointments
                    appointmentPaymentRepository.deleteByAppointments(appointments);

                    appointmentRepository.deleteById(appointments.getId_appointments());

                }

                // Delete User cascade
                userRepository.deleteById(user.getId_user());

            }
            // Delete speciality
            specialityRepo.delete(speciality);
            return true;
        }
        return false;
    }
}
