package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.*;
import mx.ulsa.eduardo_lpsw.service.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")

public class RestControllers {
    private final SpecialityService specialityService;
    private final PatientService patientService;
    private final DoctorService doctorService;
    private final UserService userService;
    private final ScheduleService scheduleService;

    private final AppointmentService appointmentService;

    private final AppointmentPaymentService appointmentPaymentService;

    private final CartService cartService;
    private final CartProductService cartProductService;
    private final ProductService productService;
    private final PathImageService pathImageService;


    public
    RestControllers(
            SpecialityService specialityService,
            PatientService patientService,
            DoctorService doctorService,
            UserService userService,
            ScheduleService scheduleService,
            AppointmentService appointmentService,
            AppointmentPaymentService appointmentPaymentService,
            CartService cartService,
            CartProductService cartProductService,
            ProductService productService,
            PathImageService pathImageService
    ) {
        this.specialityService = specialityService;
        this.patientService = patientService;
        this.doctorService = doctorService;
        this.userService = userService;
        this.scheduleService = scheduleService;
        this.appointmentService = appointmentService;
        this.appointmentPaymentService = appointmentPaymentService;
        this.cartService = cartService;
        this.cartProductService = cartProductService;
        this.productService = productService;
        this.pathImageService = pathImageService;
    }

    @GetMapping("/specialties/{id}")
    public Specialties getSpeciality(@PathVariable Integer id) {
        return specialityService.getSpecialtyById(id);
    }

    @GetMapping("/patients/{id}")
    public Patient getPatient(@PathVariable Integer id) {
        return patientService.getPatientById(id);
    }

    @GetMapping("/doctors/{id}")
    public Doctor getDoctor(@PathVariable Integer id) {
        return doctorService.getDoctorById(id);
    }

    @GetMapping("/users/{id}")
    public User getUser(@PathVariable Integer id) {
        return userService.getUserById(id);
    }

    @GetMapping("/schedules/{id}")
    public Schedules getSchedule(@PathVariable Integer id) {
        return scheduleService.getScheduleById(id);
    }

    @GetMapping("/schedulesByDoctor/{user}")
    public Schedules getScheduleByDoctor(@PathVariable User user) {
        return scheduleService.getScheduleByDoctor(user);
    }

    @GetMapping("/appointments/{id}")
    public Appointments getAppointment(@PathVariable Integer id) {
        return appointmentService.getAppointmentById(id);
    }

    @GetMapping("/appointmentsPayments/{id}")
    public Payments getAppointmentPayments(@PathVariable Integer id) {
        return appointmentPaymentService.getPaymentById(id);
    }

    @GetMapping("/products/{id}")
    public Product getProducts(@PathVariable Integer id) {
        return productService.getProductById(id);
    }

    @GetMapping("/carts/{id}")
    public Cart getCart(@PathVariable Integer id) {
        return cartService.getCartById(id);
    }

    @GetMapping("/cartsProducts/{id}")
    public CartElements getCartProduct(@PathVariable Integer id) {
        return cartProductService.getCartProductById(id);
    }

    @GetMapping("/path/{id}")
    public PathImages getPathImage(@PathVariable Integer id) {
        return pathImageService.getPathById(id);
    }

}
