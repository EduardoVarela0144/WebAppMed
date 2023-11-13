package mx.ulsa.eduardo_lpsw.models;
import jakarta.persistence.*;

@Entity
@Table(name="product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_product")
    private Integer id_product;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "price")
    private Float price;

    @Column(name = "stock")
    private Integer stock;

    @Column(name = "url_image", nullable = true, length = 1024)
    private String url_image;

    public Product(Integer id_product, String name, String description, Float price, Integer stock, String url_image) {
        this.id_product = id_product;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.url_image = url_image;
    }


    public Product() {

    }

    public Integer getId_product() {
        return id_product;
    }

    public void setId_product(Integer id_product) {
        this.id_product = id_product;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getUrl_image() {
        return url_image;
    }

    public void setUrl_image(String url_image) {
        this.url_image = url_image;
    }

    @Override
    public String toString() {
        return "Producto{" +
                "id_product=" + id_product +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", stock='" + stock + '\'' +
                ", url_image='" + url_image + '\'' +
                '}';
    }
}

