package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.*;
import mx.ulsa.eduardo_lpsw.repository.IAppointmentPaymentRepository;
import mx.ulsa.eduardo_lpsw.repository.IAppointmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class AppointmentService {

    @Autowired
    IAppointmentRepository appointmentRepo;
    @Autowired
    IAppointmentPaymentRepository paymentRepo;

    public List<Appointments> getAllAppointments(){
        List<Appointments> catList = new ArrayList<Appointments>();
        appointmentRepo.findAll().forEach(appointment -> catList.add(appointment));
        return catList;
    }


    public Appointments getAppointmentById(Integer id) {
        return appointmentRepo.findById(id).get();
    }

    public boolean saveOrUpdateAppointment(Appointments appointments){
        Appointments updateAppointment = appointmentRepo.save(appointments);

        if(appointmentRepo.findById(updateAppointment.getId_appointments()) != null) {

            return true;

        }

        return false;
    }

    public boolean deleteAppointment(Integer id) {
        Optional<Appointments> appointmentOptional = appointmentRepo.findById(id);

        if (appointmentOptional.isPresent()) {
            Appointments appointment = appointmentOptional.get();

            List<Payments> relatedPayments = paymentRepo.findByAppointments(appointment);

            for (Payments payment : relatedPayments) {
                paymentRepo.delete(payment);
            }

            appointmentRepo.deleteById(id);

            if (!appointmentRepo.existsById(id)) {
                return true;
            }
        }
        return false;
    }

    public List<Appointments> getAllAppointmentsByDoctor(User user){
        List<Appointments> catList = new ArrayList<Appointments>();
        appointmentRepo.findByDoctor(user).forEach(appointments -> catList.add(appointments));
        return catList;
    }

    public List<Appointments> getAllAppointmentsPatient(User user){
        List<Appointments> catList = new ArrayList<Appointments>();
        appointmentRepo.findByPatient(user).forEach(appointments -> catList.add(appointments));
        return catList;
    }

}
