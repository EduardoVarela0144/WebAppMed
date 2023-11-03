package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.Payments;
import mx.ulsa.eduardo_lpsw.service.AppointmentPaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AppointmentPaymentController {

    @Autowired
    AppointmentPaymentService appointmentPaymentService;

    @PostMapping("/saveAppointmentPayment")
    public String saveAppointmentPayment(Payments payments, RedirectAttributes redirectAttributes) {
        try {
            if (appointmentPaymentService.saveOrUpdateAppointmentPayment(payments)) {
                redirectAttributes.addFlashAttribute("message", "Registro exitoso");
                return "redirect:/dashboard?page=payments";
            } else {
                redirectAttributes.addFlashAttribute("message", "Error al generar pago");
                return "redirect:/dashboard?page=payments";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error inesperado al generar pago");
            return "redirect:/dashboard?page=payments";
        }
    }


    @GetMapping("/deleteAppointmentPayment/{id}")
    public String deleteAppointmentPayment(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (appointmentPaymentService.deleteAppointmentPayment(id)) {
            redirectAttributes.addFlashAttribute("message", "Pago eliminado correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar pago");
        }
        return "redirect:/dashboard?page=payments";
    }

    @PostMapping("/editSaveAppointmentPayment")
    public String editSaveAppointmentPayment(Payments payments, RedirectAttributes redirectAttributes) {
        if (appointmentPaymentService.saveOrUpdateAppointmentPayment(payments)) {
            redirectAttributes.addFlashAttribute("message", "Pago actualizado correctamente");
            return "redirect:/dashboard?page=payments";
        }

        redirectAttributes.addFlashAttribute("message", "Error al actualizar Pago");
        return "redirect:/dashboard?page=payments";
    }
}
