package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.Appointments;
import mx.ulsa.eduardo_lpsw.models.Doctor;
import mx.ulsa.eduardo_lpsw.models.Payments;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.service.AppointmentPaymentService;
import mx.ulsa.eduardo_lpsw.service.AppointmentService;
import mx.ulsa.eduardo_lpsw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AppointmentController {

    @Autowired
    AppointmentService appointmentService;
    @Autowired
    AppointmentPaymentService appointmentPaymentService;



    @PostMapping("/saveAppointment")
    public String saveAppointment(Appointments appointment, RedirectAttributes redirectAttributes) {
        try {
            if (appointmentService.saveOrUpdateAppointment(appointment)) {
                redirectAttributes.addFlashAttribute("message", "Registro exitoso");
                return "redirect:/dashboard?page=appointments";
            } else {
                redirectAttributes.addFlashAttribute("message", "Error al registrar cita");
                return "redirect:/dashboard?page=appointments";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error inesperado al registrar cita");
            return "redirect:/dashboard?page=appointments";
        }
    }


    @GetMapping("/deleteAppointment/{id}")
    public String deleteAppointment(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (appointmentService.deleteAppointment(id)) {
            redirectAttributes.addFlashAttribute("message", "cita eliminada correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar cita");
        }
        return "redirect:/dashboard?page=appointments";
    }

    @PostMapping("/editSaveAppointment")
    public String editSaveAppointment(Appointments appointment, RedirectAttributes redirectAttributes) {
        if (appointmentService.saveOrUpdateAppointment(appointment)) {
            redirectAttributes.addFlashAttribute("message", "Cita actualizada correctamente");
            return "redirect:/dashboard?page=appointments";
        }

        redirectAttributes.addFlashAttribute("message", "Error al actualizar Cita");
        return "redirect:/dashboard?page=appointments";
    }

    @GetMapping("/deleteAppointmentPatient/{id}")
    public String deleteAppointmentPatient(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (appointmentService.deleteAppointment(id)) {
            redirectAttributes.addFlashAttribute("message", "cita eliminada correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar cita");
        }
        return "redirect:/my_appointments";
    }

    @GetMapping("/deleteAppointmentDoctor/{id}")
    public String deleteAppointmentDoctor(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (appointmentService.deleteAppointment(id)) {
            redirectAttributes.addFlashAttribute("message", "cita eliminada correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar cita");
        }
        return "redirect:/appointments";
    }

    @PostMapping("/saveAppointmentFromClient")
    public String saveAppointmentFromClient(Appointments appointment, RedirectAttributes redirectAttributes) {
        try {
            if (appointmentService.saveOrUpdateAppointment(appointment)) {
                redirectAttributes.addFlashAttribute("message", "Registro exitoso");


                User user = appointment.getId_doctor();
                Doctor doctor = user.getId_doctor();


                Payments payments = new Payments(null,appointment,doctor.getCost());
                appointmentPaymentService.saveOrUpdateAppointmentPayment(payments);


                return "redirect:/my_appointments";
            } else {
                redirectAttributes.addFlashAttribute("message", "Error al registrar cita");
                return "redirect:/my_appointments";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error inesperado al registrar cita");
            return "redirect:/my_appointments";
        }
    }



}
