package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.Payments;
import mx.ulsa.eduardo_lpsw.repository.IAppointmentPaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service

public class AppointmentPaymentService {

    @Autowired
    IAppointmentPaymentRepository appointmentPaymentRepo;

    public List<Payments> getAllAppointmentsPayments(){
        List<Payments> catList = new ArrayList<Payments>();
        appointmentPaymentRepo.findAll().forEach(payment -> catList.add(payment));
        return catList;
    }


    public Payments getPaymentById(Integer id) {
        return appointmentPaymentRepo.findById(id).get();
    }

    public boolean saveOrUpdateAppointmentPayment(Payments payments){
        Payments updateAppointmentPayment = appointmentPaymentRepo.save(payments);

        if(appointmentPaymentRepo.findById(updateAppointmentPayment.getId_payments()) != null) {

            return true;

        }

        return false;
    }

    public boolean deleteAppointmentPayment(Integer id) {
        appointmentPaymentRepo.deleteById(id);
        if (appointmentPaymentRepo.findById(id) != null) {
            return true;
        }
        return false;
    }

}
