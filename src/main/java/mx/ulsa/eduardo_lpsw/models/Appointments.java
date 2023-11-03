package mx.ulsa.eduardo_lpsw.models;
import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import java.sql.Timestamp;

@Entity
@Table(name="appointments")
public class Appointments {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_appointments")
	private Integer id_appointments;

	@ManyToOne()
	@JoinColumn(name = "id_doctor", nullable = false)
	private User doctor;

	@ManyToOne()
	@JoinColumn(name = "id_patient", nullable = false)
	private User patient;

	@Column(name = "appointment_date", nullable = false)
	private String appointment_date;

	@Column(name = "hourStart")
	private String hourStart;

	@Column(name = "hourEnd")
	private String hourEnd;


	@CreationTimestamp
	private Timestamp createdTimestamp;

	@UpdateTimestamp
	private Timestamp updatedTimestamp;


	public Appointments(Integer id_appointments, User id_doctor, User id_patient, String appointment_date,
			Timestamp createdTimestamp, Timestamp updatedTimestamp, String hourStart, String hourEnd) {
		super();
		this.id_appointments = id_appointments;
		this.doctor = id_doctor;
		this.patient = id_patient;
		this.appointment_date = appointment_date;
		this.createdTimestamp = createdTimestamp;
		this.updatedTimestamp = updatedTimestamp;
		this.hourStart = hourStart;
		this.hourEnd = hourEnd;
	}

	public Appointments() {

	}

	public Integer getId_appointments() {
		return id_appointments;
	}

	public void setId_appointments(Integer id_appointments) {
		this.id_appointments = id_appointments;
	}

	public User getId_doctor() {
		return doctor;
	}

	public void setId_doctor(User id_doctor) {
		this.doctor = id_doctor;
	}

	public User getId_patient() {
		return patient;
	}

	public void setId_patient(User id_patient) {
		this.patient = id_patient;
	}

	public String getAppointment_date() {
		return appointment_date;
	}

	public void setAppointment_date(String appointment_date) {
		this.appointment_date = appointment_date;
	}



	public Timestamp getCreatedTimestamp() {
		return createdTimestamp;
	}

	public void setCreatedTimestamp(Timestamp createdTimestamp) {
		this.createdTimestamp = createdTimestamp;
	}

	public Timestamp getUpdatedTimestamp() {
		return updatedTimestamp;
	}

	public void setUpdatedTimestamp(Timestamp updatedTimestamp) {
		this.updatedTimestamp = updatedTimestamp;
	}

	public String getHourStart() {
		return hourStart;
	}

	public void setHourStart(String hourStart) {
		this.hourStart = hourStart;
	}

	public String getHourEnd() {
		return hourEnd;
	}

	public void setHourEnd(String hourEnd) {
		this.hourEnd = hourEnd;
	}

	@Override
	public String toString() {
		return "Appointments [id_appointments=" + id_appointments + ", id_doctor=" + doctor + ", id_patient="
				+ patient + ", appointment_date=" + appointment_date + ", remarks="
				+ createdTimestamp + ", updatedTimestamp=" + updatedTimestamp + hourStart + ", hourEnd=" + hourEnd + "]";
	}

}
