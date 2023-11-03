package mx.ulsa.eduardo_lpsw.models;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import java.sql.Timestamp;

@Entity
@Table(name="cart")
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cart")
    private Integer id_cart;

    @OneToOne
    @JoinColumn(name = "id_user")
    private User user;

    @CreationTimestamp
    private Timestamp createdTimestamp;

    public Cart(Integer id_cart, User user, Timestamp createdTimestamp) {
        this.id_cart = id_cart;
        this.user = user;
        this.createdTimestamp = createdTimestamp;
    }

    public Cart() {

    }


    public Integer getId_cart() {
        return id_cart;
    }

    public void setId_cart(Integer id_cart) {
        this.id_cart = id_cart;
    }

    public User getId_user() {
        return user;
    }

    public void setId_user(User user) {
        this.user = user;
    }

    public Timestamp getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Timestamp createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id_cart=" + id_cart +
                ", user=" + user +
                ", createdTimestamp=" + createdTimestamp +
                '}';
    }
}
