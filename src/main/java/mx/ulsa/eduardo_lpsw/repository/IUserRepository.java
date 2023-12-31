package mx.ulsa.eduardo_lpsw.repository;

import mx.ulsa.eduardo_lpsw.models.Doctor;
import mx.ulsa.eduardo_lpsw.models.Patient;
import mx.ulsa.eduardo_lpsw.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface IUserRepository extends JpaRepository<User,Integer> {
    @Query("SELECT u FROM User u WHERE u.email = ?1")
    User findByUsername(String email);

    @Query("SELECT u FROM User u WHERE u.id_doctor IS NOT NULL")
    List<User> findAllDoctors();

    Optional<User> findByEmail( String email );

    @Query("SELECT u FROM User u WHERE u.id_doctor = ?1")
    User findById_doctor(Doctor doctor);

    @Query("SELECT u FROM User u WHERE u.id_patient = ?1")
    User findById_patient(Patient patient);






}



