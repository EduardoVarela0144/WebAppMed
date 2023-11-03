package mx.ulsa.eduardo_lpsw.models;
import jakarta.persistence.*;

@Entity
@Table(name="schedules")
public class Schedules {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_schedules")
	private Integer id_schedules;

	@ManyToOne
	@JoinColumn(name = "id_doctor")
	private User user;

	@Column(name = "date_schedule")
	private String date_schedule;

	@Column(name = "hourStart")
	private String hourStart;

	@Column(name = "hourEnd")
	private String hourEnd;

	public Schedules(Integer id_schedules, User user, String date_schedule, String hourStart, String hourEnd) {
		super();
		this.id_schedules = id_schedules;
		this.user = user;
		this.date_schedule = date_schedule;
		this.hourStart = hourStart;
		this.hourEnd = hourEnd;
	}

	public Schedules() {

	}

	public Integer getId_schedules() {
		return id_schedules;
	}

	public void setId_schedules(Integer id_schedules) {
		this.id_schedules = id_schedules;
	}

	public User getId_doctor() {
		return user;
	}

	public void setId_doctor(User user) {
		this.user = user;
	}

	public String getDate_schedule() {
		return date_schedule;
	}

	public void setDate_schedule(String date_schedule) {
		this.date_schedule = date_schedule;
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
		return "Schedules [id_schedules=" + id_schedules + ", user=" + user + ", date_schedule=" + date_schedule
				+ ", hourStart=" + hourStart + ", hourEnd=" + hourEnd + "]";
	}

}
