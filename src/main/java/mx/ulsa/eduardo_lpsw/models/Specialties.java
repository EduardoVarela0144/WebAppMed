package mx.ulsa.eduardo_lpsw.models;
import jakarta.persistence.*;

@Entity
@Table(name="specialties")
public class Specialties {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_speciality")
	private Integer id_speciality;

	@Column(name = "name")
	private String name;

	@Column(name = "description")
	private String description;


	public Specialties(Integer id_speciality, String name, String description) {
		super();
		this.id_speciality = id_speciality;
		this.name = name;
		this.description = description;
	}

	public Specialties() {

	}

	public Integer getId_speciality() {
		return id_speciality;
	}

	public void setId_speciality(Integer id_speciality) {
		this.id_speciality = id_speciality;
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Specialties [id_speciality=" + id_speciality + ", name=" + name + ", description="
				+ description + "]";
	}

}
