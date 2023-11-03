package mx.ulsa.eduardo_lpsw.models;
import jakarta.persistence.*;


@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_user")
	private Integer id_user;

	@Column(name = "name", nullable = false)
	private String name;

	@Column(name = "ape_pat", nullable = false)
	private String ape_pat;

	@Column(name = "ape_mat", nullable = false)
	private String ape_mat;

	@Column(name = "gender", nullable = false)
	private String gender;

	@Column(name = "email", unique = true)
	private String email;

	@Column(name = "password", nullable = false)
	private String password;

	//@OneToOne
	@OneToOne( cascade = CascadeType.REMOVE)
	@JoinColumn(name = "id_patient", nullable= true)
	private Patient id_patient;

	//@OneToOne
	@OneToOne( cascade = CascadeType.REMOVE)
	@JoinColumn(name = "id_doctor", nullable= true)
	private Doctor id_doctor;

	@Column(name = "type")
	private String type;



	public User() {
	}

	public User(Integer id_user, String name, String ape_pat, String ape_mat, String gender, String email,
			String password, Patient id_patient, Doctor id_doctor, String type) {
		super();
		this.id_user = id_user;
		this.name = name;
		this.ape_pat = ape_pat;
		this.ape_mat = ape_mat;
		this.gender = gender;
		this.email = email;
		this.password = password;
		this.id_patient = id_patient;
		this.id_doctor = id_doctor;
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getId_user() {
		return id_user;
	}

	public void setId_user(Integer id_user) {
		this.id_user = id_user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getApe_pat() {
		return ape_pat;
	}

	public void setApe_pat(String ape_pat) {
		this.ape_pat = ape_pat;
	}

	public String getApe_mat() {
		return ape_mat;
	}

	public void setApe_mat(String ape_mat) {
		this.ape_mat = ape_mat;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Patient getId_patient() {
		return id_patient;
	}

	public void setId_patient(Patient id_patient) {
		this.id_patient = id_patient;
	}

	public Doctor getId_doctor() {
		return id_doctor;
	}

	public void setId_doctor(Doctor id_doctor) {
		this.id_doctor = id_doctor;
	}

	@Override
	public String toString() {
		return "User [id_user=" + id_user + ", name=" + name + ", ape_pat=" + ape_pat + ", ape_mat=" + ape_mat
				+ ", gender=" + gender + ", email=" + email + ", password=" + password + ", id_patient=" + id_patient
				+ ", id_doctor=" + id_doctor + ", type=" + type + "]";
	}

}
