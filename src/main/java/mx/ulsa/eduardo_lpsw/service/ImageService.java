package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.Image;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Service
public class ImageService {
    private static final String UPLOAD_DIR = "src/main/webapp/images/";


    public void guardarImagen(MultipartFile file) throws IOException {
        byte[] bytes = file.getBytes();
        Path path = Paths.get(UPLOAD_DIR + file.getOriginalFilename());
        Files.write(path, bytes);
    }

    public List<Image> getAllImages() {
        File imageDir = new File(UPLOAD_DIR);
        File[] imageFiles = imageDir.listFiles();
        List<Image> images = new ArrayList<>();

        if (imageFiles != null) {
            for (File file : imageFiles) {
                Image image = new Image();
                image.setName(file.getName());
                images.add(image);
            }
        }

        return images;
    }

    public void saveImage(MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            File imageFile = new File(UPLOAD_DIR + file.getOriginalFilename());
            file.transferTo(imageFile);
        }
    }


}
