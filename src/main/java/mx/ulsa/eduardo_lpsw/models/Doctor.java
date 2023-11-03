package mx.ulsa.eduardo_lpsw.models;
import jakarta.persistence.*;

@Entity
@Table(name="doctor")
public class Doctor {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_doctor")
	private Integer id_doctor;

	@Column(name = "clinic_address")
	private String clinic_address;

	@Column(name = "clininc_number")
	private String clinic_number;

	@ManyToOne()
	@JoinColumn(name = "id_specialties",  nullable = false)
	private Specialties specialties;

	@Column(name = "cost")
	private Double cost;



	public Doctor(Integer id_doctor, String clinic_address, String clinic_number, Specialties specialties,
			Double cost) {
		super();
		this.id_doctor = id_doctor;
		this.clinic_address = clinic_address;
		this.clinic_number = clinic_number;
		this.specialties = specialties;
		this.cost = cost;
	}

	public Doctor() {

	}

	public Integer getId_doctor() {
		return id_doctor;
	}

	public void setId_doctor(Integer id_doctor) {
		this.id_doctor = id_doctor;
	}

	public String getClinic_address() {
		return clinic_address;
	}

	public void setClinic_address(String clinic_address) {
		this.clinic_address = clinic_address;
	}

	public String getClinic_number() {
		return clinic_number;
	}

	public void setClinic_number(String clinic_number) {
		this.clinic_number = clinic_number;
	}

	public Specialties getSpecialties() {
		return specialties;
	}

	public void setSpecialties(Specialties specialties) {
		this.specialties = specialties;
	}

	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

	@Override
	public String toString() {
		return "Doctor [id_doctor=" + id_doctor + ", clinic_address=" + clinic_address + ", clinic_number="
				+ clinic_number + ", specialties=" + specialties + ", cost=" + cost + "]";
	}

}
