package mx.ulsa.eduardo_lpsw.repository;

import jakarta.transaction.Transactional;
import mx.ulsa.eduardo_lpsw.models.Appointments;
import mx.ulsa.eduardo_lpsw.models.Payments;
import mx.ulsa.eduardo_lpsw.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAppointmentPaymentRepository extends JpaRepository<Payments, Integer> {
    List<Payments> findByAppointments(Appointments appointments);
    @Transactional
    void deleteByAppointments(Appointments appointments);

}
