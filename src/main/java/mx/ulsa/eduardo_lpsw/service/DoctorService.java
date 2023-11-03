package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.Appointments;
import mx.ulsa.eduardo_lpsw.models.Doctor;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DoctorService {

    @Autowired
    IDoctorRepository doctorRepo;
    @Autowired
    IUserRepository userRepository;
    @Autowired
    IScheduleRepository scheduleRepository;
    @Autowired
    IAppointmentRepository appointmentRepository;
    @Autowired
    IAppointmentPaymentRepository appointmentPaymentRepository;


    public List<Doctor> getAllDocotors(){
        List<Doctor> catList = new ArrayList<Doctor>();
        doctorRepo.findAll().forEach(doctor -> catList.add(doctor));
        return catList;
    }


    public Doctor getDoctorById(Integer id) {
        return doctorRepo.findById(id).get();
    }

    public boolean saveOrUpdateDoctor(Doctor doctor){
        Doctor updateDoctor = doctorRepo.save(doctor);

        if(doctorRepo.findById(updateDoctor.getId_doctor()) != null) {

            return true;

        }

        return false;
    }

    public boolean deleteDoctor(Integer id) {

        Doctor doctor = doctorRepo.findById(id).orElse(null);

        if (doctor != null) {
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
            userRepository.deleteById(user.getId_user());
            doctorRepo.deleteById(doctor.getId_doctor());
            return true;
        }


        return  false;


    }
}
