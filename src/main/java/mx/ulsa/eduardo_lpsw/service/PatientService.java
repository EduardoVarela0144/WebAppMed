package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.Appointments;
import mx.ulsa.eduardo_lpsw.models.Doctor;
import mx.ulsa.eduardo_lpsw.models.Patient;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PatientService {

    @Autowired
    IPatientRepository patientRepo;
    @Autowired
    IScheduleRepository scheduleRepository;
    @Autowired
    IAppointmentRepository appointmentRepository;
    @Autowired
    IAppointmentPaymentRepository appointmentPaymentRepository;
    @Autowired
    IUserRepository userRepository;
    @Autowired
    IPatientRepository patientRepository;

    public List<Patient> getAllPatients(){
        List<Patient> catList = new ArrayList<Patient>();
        patientRepo.findAll().forEach(patient -> catList.add(patient));
        return catList;
    }


    public Patient getPatientById(Integer id) {
        return patientRepo.findById(id).get();
    }

    public boolean saveOrUpdatePatient(Patient patient){
        Patient updatePatient = patientRepo.save(patient);

        if(patientRepo.findById(updatePatient.getId_patient()) != null) {

            return true;

        }

        return false;
    }

    public boolean deletePatient(Integer id) {

        Patient patient = patientRepo.findById(id).orElse(null);

        if (patient != null) {
            User user = userRepository.findById_patient(patient);


            // Delete schedules doctor
            scheduleRepository.deleteByUser(user);

            // Delete appointment that have doctorId
            List<Appointments> appointmentsDoctor = appointmentRepository.findByPatient(user);


            for (Appointments appointments : appointmentsDoctor) {

                //Delete payments appointments
                appointmentPaymentRepository.deleteByAppointments(appointments);

                appointmentRepository.deleteById(appointments.getId_appointments());

            }
            userRepository.deleteById(user.getId_user());
            patientRepo.deleteById(patient.getId_patient());
            return true;
        }


        return  false;



    }
}
