package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.*;
import mx.ulsa.eduardo_lpsw.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.List;

@Controller
public class RouterController {

    @Autowired
    SpecialityService specialityService;
    @Autowired
    PatientService patientService;
    @Autowired
    DoctorService doctorService;
    @Autowired
    UserService userService;
    @Autowired
    ScheduleService scheduleService;
    @Autowired
    AppointmentService appointmentService;
    @Autowired
    ProductService productService;
    @Autowired
    AppointmentPaymentService appointmentPaymentService;
    @Autowired
    CartService cartService;
    @Autowired
    CartProductService cartProductService;



    @GetMapping({"/clients",})
    public String client(){ return "pages/clients"; }

    @GetMapping({"/contact",})
    public String contact(){ return "pages/register"; }

    @GetMapping({"/health",})
    public String health(){ return "pages/health"; }

    @GetMapping({"/","/home"})
    public String home(){return "home";}

    @GetMapping({"/medicine"})
    public String medicine(){
        return "pages/medicine";
    }

    @GetMapping({"/news"})
    public String news(){
        return "pages/news";
    }

    @GetMapping({"/login"})
    public String login(){ return "pages/login"; }

    @PreAuthorize("hasRole('ROLE_DOCTOR')")
    @GetMapping({"/appointments"})
    public String appointments( Model model,  @AuthenticationPrincipal CustomUserDetails customUserDetails){
        model.addAttribute("auth", customUserDetails);
        model.addAttribute("schedule", new Schedules());
        User user =  userService.getUserById(customUserDetails.getUserId());
        model.addAttribute("listAppointments", appointmentService.getAllAppointmentsByDoctor(user));
        List<String> weekDays = Arrays.asList("Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo");
        model.addAttribute("weekDays", weekDays);
        return "pages/appointments";
    }

    @PreAuthorize("hasRole('ROLE_PATIENT')")
    @GetMapping({"/my_appointments"})
    public String my_appointments( Model model,  @AuthenticationPrincipal CustomUserDetails customUserDetails){
        model.addAttribute("auth", customUserDetails);
        User user =  userService.getUserById(customUserDetails.getUserId());
        model.addAttribute("listAppointments", appointmentService.getAllAppointmentsPatient(user));
        return "pages/my_patient_appointments";
    }


    @GetMapping({"/pruebas"})
    public String pruebas(){ return "pruebas"; }

    @GetMapping({"/403"})
    public String not_authorized(){ return "pages/403"; }

    @PreAuthorize("not hasRole('ROLE_ADMIN')")
    @GetMapping({"/cart"})
    public String cart(Model model,  @AuthenticationPrincipal CustomUserDetails customUserDetails){
        model.addAttribute("auth", customUserDetails);

        User user =  userService.getUserById(customUserDetails.getUserId());
        Cart existingCart = cartService.findCartByUserId(user);
        model.addAttribute("listCart", cartProductService.getAllCartsProductsByUser(existingCart));

        List<CartElements> cartProducts = cartProductService.getAllCartsProductsByUser(existingCart);

        double total = cartProducts.stream()
                .mapToDouble(cp -> cp.getProduct().getPrice() * cp.getQuantity())
                .sum();


        DecimalFormat decimalFormat = new DecimalFormat("#.00");
        String totalFormatted = decimalFormat.format(total);

        model.addAttribute("total", totalFormatted);
        model.addAttribute("id_cart", existingCart.getId_cart());


        return "pages/cart";
    }



    @GetMapping("/complete_register")
    public String complete_register(Model model){
        model.addAttribute("patient", new Patient());
        model.addAttribute("doctor", new Doctor());
        model.addAttribute("listSpecialties", specialityService.getAllSpecialties());

        return "pages/complete_register";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/dashboard")
    public String addSpeciality(@ModelAttribute("message") String message, Model model, @AuthenticationPrincipal CustomUserDetails customUserDetails) {
        model.addAttribute("message", message);
        model.addAttribute("speciality", new Specialties());
        model.addAttribute("user", new User());
        model.addAttribute("patient", new Patient());
        model.addAttribute("doctor", new Doctor());
        model.addAttribute("schedule", new Schedules());
        model.addAttribute("appointment", new Appointments());
        model.addAttribute("product", new Product());
        model.addAttribute("payment", new Payments());

        List<String> weekDays = Arrays.asList("Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo");
        model.addAttribute("weekDays", weekDays);


        model.addAttribute("listSpecialties", specialityService.getAllSpecialties());
        model.addAttribute("listPatients", patientService.getAllPatients());
        model.addAttribute("listDoctors", doctorService.getAllDocotors());
        model.addAttribute("listUsers", userService.getAllUsers());
        model.addAttribute("listSchedules",scheduleService.getAllSchedules());
        model.addAttribute("listAppointments",appointmentService.getAllAppointments());
        model.addAttribute("listProducts",productService.getAllProducts());
        model.addAttribute("listPaymentsAppointments", appointmentPaymentService.getAllAppointmentsPayments());

        model.addAttribute("auth", customUserDetails);

        return "pages/dashboard";
    }


    @PreAuthorize("hasRole('ROLE_DOCTOR')")
    @GetMapping("/my_schedules_doctor")
    public String my_schedules_doctor(@ModelAttribute("message") String message, Model model, @AuthenticationPrincipal CustomUserDetails customUserDetails) {

        model.addAttribute("schedule", new Schedules());
        model.addAttribute("auth", customUserDetails);
        User user = userService.getUserById(customUserDetails.getUserId());
        model.addAttribute("listSchedules",scheduleService.getSchedulesByDoctor(user));


        return "components/doctors/schedules/main";
    }


    @PreAuthorize("hasRole('ROLE_PATIENT')")
    @GetMapping("/doctors")
    public String showDoctors( Model model,  @AuthenticationPrincipal CustomUserDetails customUserDetails) {
        model.addAttribute("listDoctors", userService.getAllDoctors());
        model.addAttribute("auth", customUserDetails);
        return "pages/doctors";
    }


    @PreAuthorize("not hasRole('ROLE_ADMIN')")
    @GetMapping("/medicines")
    public String showMedicine( Model model,  @AuthenticationPrincipal CustomUserDetails customUserDetails) {
        model.addAttribute("listMedicines", productService.getAllProducts());
        model.addAttribute("auth", customUserDetails);
        model.addAttribute("product", new CartElements());

        User user =  userService.getUserById(customUserDetails.getUserId());
        Cart existingCart = cartService.findCartByUserId(user);


        if (existingCart == null) {

            Cart newCart = new Cart();
            newCart.setId_user(user);

            cartService.saveOrUpdateCart(newCart);

        }


        return "pages/medicines";
    }

    @PreAuthorize("hasRole('ROLE_X')")
    @GetMapping({"/upload_image"})
    public String upload_image(){ return "pages/imagen"; }

}
