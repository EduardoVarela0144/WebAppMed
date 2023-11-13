package mx.ulsa.eduardo_lpsw.models;

import jakarta.persistence.*;

@Entity
@Table(name="path_images")
public class PathImages {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_path")
    private Integer id_path;

    @Column(name = "path_image")
    private String path_image;

    public PathImages() {

    }

    public PathImages(Integer id_path, String path_image) {
        this.id_path = id_path;
        this.path_image = path_image;
    }

    public Integer getId_path() {
        return id_path;
    }

    public void setId_path(Integer id_path) {
        this.id_path = id_path;
    }

    public String getPath_image() {
        return path_image;
    }

    public void setPath_image(String path_image) {
        this.path_image = path_image;
    }

    @Override
    public String toString() {
        return "PathImages{" +
                "id_path=" + id_path +
                ", path_image='" + path_image + '\'' +
                '}';
    }
}
