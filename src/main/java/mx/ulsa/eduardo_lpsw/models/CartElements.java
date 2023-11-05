package mx.ulsa.eduardo_lpsw.models;
import jakarta.persistence.*;

@Entity
@Table(name="cart_elements")
public class CartElements {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cart_elements")
    private Integer id_cart_elements;

    @ManyToOne
    @JoinColumn(name = "id_cart")
    private Cart cart;

    @ManyToOne
    @JoinColumn(name = "id_product")
    private Product product;

    @Column(name = "unitary_price")
    private Float unitary_price;

    @Column(name = "quantity")
    private Integer quantity;

    public CartElements(Integer id_cart_elements, Cart cart, Product id_product, Float unitary_price, Integer quantity) {
        this.id_cart_elements = id_cart_elements;
        this.cart= cart;
        this.product = id_product;
        this.unitary_price = unitary_price;
        this.quantity = quantity;
    }

    public CartElements(){}

    public Integer getId_cart_elements() {
        return id_cart_elements;
    }

    public void setId_cart_elements(Integer id_cart_elements) {
        this.id_cart_elements = id_cart_elements;
    }

    public Cart getId_cart() {
        return cart;
    }

    public void setId_cart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }


    public Product getId_product() {
        return product;
    }

    public void setId_product(Product id_product) {
        this.product = id_product;
    }

    public Float getUnitary_price() {
        return unitary_price;
    }

    public void setUnitary_price(Float unitary_price) {
        this.unitary_price = unitary_price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "CartElements{" +
                "id_cart_elements=" + id_cart_elements +
                ", cart=" + cart +
                ", id_product=" + product +
                ", unitary_price=" + unitary_price +
                ", quantity=" + quantity +
                '}';
    }
}
