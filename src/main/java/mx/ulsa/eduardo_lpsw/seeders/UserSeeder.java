package mx.ulsa.eduardo_lpsw.seeders;

import mx.ulsa.eduardo_lpsw.models.*;
import mx.ulsa.eduardo_lpsw.repository.*;
import mx.ulsa.eduardo_lpsw.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class UserSeeder implements ApplicationRunner {

    @Autowired
    IUserRepository userRepo;
    @Autowired
    ISpecialityRepository specialityRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    IDoctorRepository doctorRepository;
    @Autowired
    IPatientRepository patientRepository;
    @Autowired
    IProductRepository productRepository;
    @Autowired
    IPathImageRepository pathImageRepository;


    @Override
    public void run(ApplicationArguments args) throws Exception {

        // Create user Admin
        User admin = new User(1,"Eduardo","Varela", "Hernandez","Hombre","admin@mail.com","admin",null,null,"Admin");
        String hashedPassword = passwordEncoder.encode(admin.getPassword());
        admin.setPassword(hashedPassword);
        userRepo.save(admin);

        // Create specialties
        Specialties spe_1 = new Specialties(1,"Cardiología","Los cardiólogos se especializan en el diagnóstico y tratamiento de enfermedades del corazón y del sistema circulatorio.");
        specialityRepository.save(spe_1);
        Specialties spe_2 = new Specialties(2,"Dermatología","Los dermatólogos se centran en el diagnóstico y tratamiento de trastornos de la piel, cabello y uñas, así como en la detección temprana del cáncer de piel.");
        specialityRepository.save(spe_2);
        Specialties spe_3 = new Specialties(3,"Ginecología","Los ginecólogos se dedican a la salud del sistema reproductivo femenino, tratando condiciones como la endometriosis, los fibromas uterinos y brindando atención prenatal.");
        specialityRepository.save(spe_3);
        Specialties spe_4 = new Specialties(4,"Neurología","Los neurólogos se enfocan en el diagnóstico y tratamiento de trastornos neurológicos, como migrañas, epilepsia, enfermedad de Alzheimer y esclerosis múltiple.");
        specialityRepository.save(spe_4);
        Specialties spe_5 = new Specialties(5,"Cirugía","Los cirujanos generales realizan una variedad de procedimientos quirúrgicos, como apendicectomías, cirugía de vesícula biliar y reparación de hernias.");
        specialityRepository.save(spe_5);
        Specialties spe_6 = new Specialties(6,"Psiquiatria","Los psiquiatras diagnostican y tratan trastornos mentales, como la depresión, la ansiedad y la esquizofrenia, a menudo utilizando terapia y medicamentos.");
        specialityRepository.save(spe_6);
        Specialties spe_7 = new Specialties(7,"Pediatría","Los pediatras se especializan en la atención médica de niños y adolescentes, brindando atención preventiva, diagnóstico y tratamiento de enfermedades infantiles.");
        specialityRepository.save(spe_7);
        Specialties spe_8 = new Specialties(8,"Oftalmología","Los oftalmólogos se centran en el diagnóstico y tratamiento de trastornos oculares y visuales, como cataratas, glaucoma y degeneración macular.");
        specialityRepository.save(spe_8);
        Specialties spe_9 = new Specialties(9,"Ortopedia","Los ortopedistas se ocupan de las lesiones y enfermedades del sistema musculoesquelético, incluyendo la reparación de fracturas y la cirugía de reemplazo articular.");
        specialityRepository.save(spe_9);
        Specialties spe_10 = new Specialties(10,"otorrinolaringología","Los otorrinolaringólogos tratan trastornos del oído, la nariz, la garganta y la cabeza y cuello, incluyendo infecciones del oído, ronquidos y cáncer de cabeza y cuello.");
        specialityRepository.save(spe_10);

        // Create doctors
        Doctor doctor1 = new Doctor(1, "123 Main Street", "555-123-4567", spe_1, 500.0);
        doctorRepository.save(doctor1);
        Doctor doctor2 = new Doctor(2, "456 Elm Street", "555-987-6543", spe_2, 600.0);
        doctorRepository.save(doctor2);
        Doctor doctor3 = new Doctor(3, "789 Oak Avenue", "555-567-8901", spe_3, 700.0);
        doctorRepository.save(doctor3);
        Doctor doctor4 = new Doctor(4, "456 Pine Road", "555-234-5678", spe_1, 550.0);
        doctorRepository.save(doctor4);
        Doctor doctor5 = new Doctor(5, "321 Cedar Lane", "555-345-6789", spe_2, 600.0);
        doctorRepository.save(doctor5);
        Doctor doctor6 = new Doctor(6, "987 Willow Street", "555-789-0123", spe_3, 750.0);
        doctorRepository.save(doctor6);
        Doctor doctor7 = new Doctor(7, "234 Birch Avenue", "555-456-7890", spe_1, 600.0);
        doctorRepository.save(doctor7);
        Doctor doctor8 = new Doctor(8, "789 Maple Road", "555-567-1234", spe_2, 650.0);
        doctorRepository.save(doctor8);
        Doctor doctor9 = new Doctor(9, "543 Oak Avenue", "555-123-8901", spe_3, 700.0);
        doctorRepository.save(doctor9);
        Doctor doctor10 = new Doctor(10, "321 Elm Street", "555-789-2345", spe_1, 550.0);
        doctorRepository.save(doctor10);


        // Create user Doctors
        User user_doctor1 = new User(2, "Alfredo", "Quiñones", "Hinojosa", "Hombre", "hinojosa@mail.com", "doctor", null, doctor1, "Doctor");
        String doctor1Password = "doctor";
        String hashedPassword1 = passwordEncoder.encode(doctor1Password);
        user_doctor1.setPassword(hashedPassword1);
        userRepo.save(user_doctor1);

        User user_doctor2 = new User(3, "Maria", "González", "López", "Mujer", "maria@mail.com", "doctor", null, doctor2, "Doctor");
        String doctor2Password = "doctor";
        String hashedPassword2 = passwordEncoder.encode(doctor2Password);
        user_doctor2.setPassword(hashedPassword2);
        userRepo.save(user_doctor2);

        User user_doctor3 = new User(4, "Carlos", "Rodríguez", "Sánchez", "Hombre", "carlos@mail.com", "doctor", null, doctor3, "Doctor");
        String doctor3Password = "doctor";
        String hashedPassword3 = passwordEncoder.encode(doctor3Password);
        user_doctor3.setPassword(hashedPassword3);
        userRepo.save(user_doctor3);

        User user_doctor4 = new User(5, "Laura", "Fernández", "Gómez", "Mujer", "laura@mail.com", "doctor", null, doctor4, "Doctor");
        String doctor4Password = "doctor";
        String hashedPassword4 = passwordEncoder.encode(doctor4Password);
        user_doctor4.setPassword(hashedPassword4);
        userRepo.save(user_doctor4);

        User user_doctor5 = new User(6, "Juan", "Martínez", "Pérez", "Hombre", "juan@mail.com", "doctor", null, doctor5, "Doctor");
        String doctor5Password = "doctor";
        String hashedPassword5 = passwordEncoder.encode(doctor5Password);
        user_doctor5.setPassword(hashedPassword5);
        userRepo.save(user_doctor5);

        User user_doctor6 = new User(7, "Sofía", "Sánchez", "Hernández", "Mujer", "sofia@mail.com", "doctor", null, doctor6, "Doctor");
        String doctor6Password = "doctor";
        String hashedPassword6 = passwordEncoder.encode(doctor6Password);
        user_doctor6.setPassword(hashedPassword6);
        userRepo.save(user_doctor6);

        User user_doctor7 = new User(8, "Pedro", "López", "González", "Hombre", "pedro@mail.com", "doctor", null, doctor7, "Doctor");
        String doctor7Password = "doctor";
        String hashedPassword7 = passwordEncoder.encode(doctor7Password);
        user_doctor7.setPassword(hashedPassword7);
        userRepo.save(user_doctor7);

        User user_doctor8 = new User(9, "Ana", "Ramírez", "Fernández", "Mujer", "ana@mail.com", "doctor", null, doctor8, "Doctor");
        String doctor8Password = "doctor";
        String hashedPassword8 = passwordEncoder.encode(doctor8Password);
        user_doctor8.setPassword(hashedPassword8);
        userRepo.save(user_doctor8);

        User user_doctor9 = new User(10, "Miguel", "Gómez", "Rodríguez", "Hombre", "miguel@mail.com", "doctor", null, doctor9, "Doctor");
        String doctor9Password = "doctor";
        String hashedPassword9 = passwordEncoder.encode(doctor9Password);
        user_doctor9.setPassword(hashedPassword9);
        userRepo.save(user_doctor9);

        User user_doctor10 = new User(11, "María", "Hernández", "Sánchez", "Mujer", "maria2@mail.com", "doctor", null, doctor10, "Doctor");
        String doctor10Password = "doctor";
        String hashedPassword10 = passwordEncoder.encode(doctor10Password);
        user_doctor10.setPassword(hashedPassword10);
        userRepo.save(user_doctor10);

        // Save patient
        Patient patient = new Patient(1, "123 Main Street", "555-123-4567");
        patientRepository.save(patient);

        // Save User
        User user_patient1 = new User(12, "Francisco", "Varela", "Merlin", "Hombre", "francisco@mail.com", "francisco", patient, null, "Patient");
        String doctor11Password = "patient";
        String hashedPassword11 = passwordEncoder.encode(doctor11Password);
        user_patient1.setPassword(hashedPassword11);
        userRepo.save(user_patient1);


        Product medicamento1 = new Product(1, "Aspirina", "Analgésico para el alivio del dolor", 5.99f, 10, "https://res-console.cloudinary.com/dx2kgjjmf/thumbnails/transform/v1/image/upload/Yl9hdXRvOnByZWRvbWluYW50LGNfcGFkLGhfMzAwLHdfMzAwLGZfanBnLGZsX2xvc3N5LmFueV9mb3JtYXQucHJlc2VydmVfdHJhbnNwYXJlbmN5LnByb2dyZXNzaXZl/v1/bWVkaWNpbmVzL2xqaHB2aXdpaXJuMzlpbnRrYzZy/template_primary");
        productRepository.save(medicamento1);
        Product medicamento2 = new Product(2, "Ibuprofeno", "Antiinflamatorio y analgésico", 6.99f, 10, "https://res-console.cloudinary.com/dx2kgjjmf/thumbnails/transform/v1/image/upload/Yl9hdXRvOnByZWRvbWluYW50LGNfcGFkLGhfMzAwLHdfMzAwLGZfanBnLGZsX2xvc3N5LmFueV9mb3JtYXQucHJlc2VydmVfdHJhbnNwYXJlbmN5LnByb2dyZXNzaXZl/v1/bWVkaWNpbmVzL3lkbzg3cGtoYnBwcW96NGlvOGg2/template_primary");
        productRepository.save(medicamento2);
        Product medicamento3 = new Product(3, "Paracetamol", "Alivio de fiebre y dolor", 4.49f, 10, "https://res-console.cloudinary.com/dx2kgjjmf/thumbnails/transform/v1/image/upload/Yl9hdXRvOnByZWRvbWluYW50LGNfcGFkLGhfMzAwLHdfMzAwLGZfanBnLGZsX2xvc3N5LmFueV9mb3JtYXQucHJlc2VydmVfdHJhbnNwYXJlbmN5LnByb2dyZXNzaXZl/v1/bWVkaWNpbmVzL2tnY3FpMmV6OGlkeGh5a3lldXlt/template_primary");
        productRepository.save(medicamento3);
        Product medicamento4 = new Product(4, "Omeprazol", "Antiácido para problemas gástricos", 7.29f, 10, "https://res-console.cloudinary.com/dx2kgjjmf/thumbnails/transform/v1/image/upload/Yl9hdXRvOnByZWRvbWluYW50LGNfcGFkLGhfMzAwLHdfMzAwLGZfanBnLGZsX2xvc3N5LmFueV9mb3JtYXQucHJlc2VydmVfdHJhbnNwYXJlbmN5LnByb2dyZXNzaXZl/v1/bWVkaWNpbmVzL3U2dG5jMzlybzU2ZGhibDY3bXlq/template_primary");
        productRepository.save(medicamento4);
        Product medicamento5 = new Product(5, "Amoxicilina", "Antibiótico de amplio espectro", 9.99f, 10, "https://res-console.cloudinary.com/dx2kgjjmf/thumbnails/transform/v1/image/upload/Yl9hdXRvOnByZWRvbWluYW50LGNfcGFkLGhfMzAwLHdfMzAwLGZfanBnLGZsX2xvc3N5LmFueV9mb3JtYXQucHJlc2VydmVfdHJhbnNwYXJlbmN5LnByb2dyZXNzaXZl/v1/bWVkaWNpbmVzL2dsam55Y216cGRpdHRrN2FmcXpu/template_primary");
        productRepository.save(medicamento5);
        Product medicamento6 = new Product(6, "Loratadina", "Antihistamínico para alergias", 8.49f, 10, "https://res-console.cloudinary.com/dx2kgjjmf/thumbnails/transform/v1/image/upload/Yl9hdXRvOnByZWRvbWluYW50LGNfcGFkLGhfMzAwLHdfMzAwLGZfanBnLGZsX2xvc3N5LmFueV9mb3JtYXQucHJlc2VydmVfdHJhbnNwYXJlbmN5LnByb2dyZXNzaXZl/v1/bWVkaWNpbmVzL29saHBmcnZ5dWdndWJmZGs0amcx/template_primary");
        productRepository.save(medicamento6);
        Product medicamento7 = new Product(7, "Cetirizina", "Antihistamínico para alergias", 7.99f, 10, "https://res-console.cloudinary.com/dx2kgjjmf/thumbnails/transform/v1/image/upload/Yl9hdXRvOnByZWRvbWluYW50LGNfcGFkLGhfMzAwLHdfMzAwLGZfanBnLGZsX2xvc3N5LmFueV9mb3JtYXQucHJlc2VydmVfdHJhbnNwYXJlbmN5LnByb2dyZXNzaXZl/v1/bWVkaWNpbmVzL2VvZTd4d2JndnlheG1qaDN2bG00/template_primary");
        productRepository.save(medicamento7);
        Product medicamento8 = new Product(8, "Salbutamol", "Broncodilatador para el asma", 10.49f, 10, "https://res-console.cloudinary.com/dx2kgjjmf/thumbnails/transform/v1/image/upload/Yl9hdXRvOnByZWRvbWluYW50LGNfcGFkLGhfMzAwLHdfMzAwLGZfanBnLGZsX2xvc3N5LmFueV9mb3JtYXQucHJlc2VydmVfdHJhbnNwYXJlbmN5LnByb2dyZXNzaXZl/v1/bWVkaWNpbmVzL2t1Z3BmZHB6anA5Mm5hcndhOWFs/template_primary");
        productRepository.save(medicamento8);
        Product medicamento9 = new Product(9, "Vitamina C", "Suplemento vitamínico", 3.99f, 10, "https://res-console.cloudinary.com/dx2kgjjmf/thumbnails/transform/v1/image/upload/Yl9hdXRvOnByZWRvbWluYW50LGNfcGFkLGhfMzAwLHdfMzAwLGZfanBnLGZsX2xvc3N5LmFueV9mb3JtYXQucHJlc2VydmVfdHJhbnNwYXJlbmN5LnByb2dyZXNzaXZl/v1/bWVkaWNpbmVzL3JneDl0Z2ZnYWZlbnpua3BqYXls/template_primary");
        productRepository.save(medicamento9);
        Product medicamento10 = new Product(10, "Diazepam", "Ansiolítico y sedante", 12.99f, 10, "https://res-console.cloudinary.com/dx2kgjjmf/thumbnails/transform/v1/image/upload/Yl9hdXRvOnByZWRvbWluYW50LGNfcGFkLGhfMzAwLHdfMzAwLGZfanBnLGZsX2xvc3N5LmFueV9mb3JtYXQucHJlc2VydmVfdHJhbnNwYXJlbmN5LnByb2dyZXNzaXZl/v1/bWVkaWNpbmVzL2JqcXUzeXRwYmV5cGlyNGN1bXZq/template_primary");
        productRepository.save(medicamento10);

        // Create path
        PathImages path = new PathImages(1,"/opt/homebrew/etc/tomcat/webapps/images");
        pathImageRepository.save(path);

        //ImageService.UPLOAD_DIR = path.getPath_image();



    }
}
