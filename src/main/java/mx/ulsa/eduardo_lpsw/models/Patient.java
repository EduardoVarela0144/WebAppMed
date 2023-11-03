package mx.ulsa.eduardo_lpsw.models;
import jakarta.persistence.*;

@Entity
@Table(name="patient")
public class Patient {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_patient")
	private Integer id_patient;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "phone_number")
	private String phone_number;

	public Patient() {
		
	}

	public Patient(Integer id_patient, String address, String phone_number) {
		super();
		this.id_patient = id_patient;
		this.address = address;
		this.phone_number = phone_number;
	}

	public Integer getId_patient() {
		return id_patient;
	}

	public void setId_patient(Integer id_patient) {
		this.id_patient = id_patient;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	@Override
	public String toString() {
		return "Patient [id_patient=" + id_patient + ", address=" + address + ", phone_number=" + phone_number + "]";
	}
	
	

}
