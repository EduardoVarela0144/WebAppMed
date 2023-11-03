package mx.ulsa.eduardo_lpsw.repository;

import mx.ulsa.eduardo_lpsw.models.Doctor;
import mx.ulsa.eduardo_lpsw.models.Specialties;
import mx.ulsa.eduardo_lpsw.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IDoctorRepository extends JpaRepository<Doctor,Integer> {
    List<Doctor> findBySpecialties(Specialties specialties);

}
