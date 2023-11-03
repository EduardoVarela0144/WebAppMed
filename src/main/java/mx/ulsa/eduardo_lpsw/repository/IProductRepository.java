package mx.ulsa.eduardo_lpsw.repository;

import mx.ulsa.eduardo_lpsw.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IProductRepository extends JpaRepository<Product, Integer> {
}
