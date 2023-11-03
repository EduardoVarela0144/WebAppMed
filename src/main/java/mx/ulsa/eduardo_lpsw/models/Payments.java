package mx.ulsa.eduardo_lpsw.models;
import jakarta.persistence.*;


@Entity
@Table(name="paymnets")
public class Payments {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_payments")
	private Integer id_payments;



	@OneToOne
	@JoinColumn(name = "id_appointments" , nullable = false)
	private Appointments appointments;

	@Column(name = "total", nullable = false)
	private Double total;

	public Payments(Integer id_payments,  Appointments appointments, Double total) {
		super();
		this.id_payments = id_payments;
		this.appointments = appointments;
		this.total = total;
	}

	public Payments() {

	}

	public Integer getId_payments() {
		return id_payments;
	}

	public void setId_payments(Integer id_payments) {
		this.id_payments = id_payments;
	}


	public Appointments getAppointments() {
		return appointments;
	}

	public void setAppointments(Appointments appointments) {
		this.appointments = appointments;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "Payments [id_payments=" + id_payments + ", appointments=" + appointments + ", total=" + total + "]";
	}

}
