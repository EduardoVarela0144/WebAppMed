package mx.ulsa.eduardo_lpsw.repository;

import mx.ulsa.eduardo_lpsw.models.Appointments;
import mx.ulsa.eduardo_lpsw.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAppointmentRepository extends JpaRepository<Appointments,Integer> {
    List<Appointments> findByDoctor(User user);
    List<Appointments> findByPatient(User User);

}
