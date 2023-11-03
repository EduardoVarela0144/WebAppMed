package mx.ulsa.eduardo_lpsw.repository;

import jakarta.transaction.Transactional;
import mx.ulsa.eduardo_lpsw.models.Cart;
import mx.ulsa.eduardo_lpsw.models.CartElements;
import mx.ulsa.eduardo_lpsw.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ICartProductsRepository extends JpaRepository<CartElements, Integer> {
    @Query("SELECT u FROM CartElements u WHERE u.cart = ?1")
    List<CartElements> finByCart(Cart cart);

    @Transactional
    void deleteByCart(Optional<Cart> cart);




}
