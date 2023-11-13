package mx.ulsa.eduardo_lpsw.repository;

import mx.ulsa.eduardo_lpsw.models.PathImages;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository

public interface IPathImageRepository  extends JpaRepository<PathImages,Integer> {
}
