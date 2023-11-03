package mx.ulsa.eduardo_lpsw.repository;

import jakarta.transaction.Transactional;
import mx.ulsa.eduardo_lpsw.models.Appointments;
import mx.ulsa.eduardo_lpsw.models.Payments;
import mx.ulsa.eduardo_lpsw.models.Schedules;
import mx.ulsa.eduardo_lpsw.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IScheduleRepository extends JpaRepository<Schedules,Integer> {
    List<Schedules> findByUser(User user);

    @Transactional
    void deleteByUser(User user);

    @Query("SELECT s FROM Schedules s " +
            "WHERE s.user.id_user = :doctorId " +
            "AND NOT EXISTS (SELECT a FROM Appointments a " +
            "WHERE a.doctor.id_user = :doctorId " +
            "AND a.hourStart = s.hourStart " +
            "AND a.hourEnd = s.hourEnd " +
            "AND a.appointment_date = s.date_schedule)")
    List<Schedules> findUnscheduledSchedulesByDoctorId(@Param("doctorId") Integer doctorId);


}
