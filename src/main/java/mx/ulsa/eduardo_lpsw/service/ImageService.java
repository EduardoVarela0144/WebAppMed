package mx.ulsa.eduardo_lpsw.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import mx.ulsa.eduardo_lpsw.models.Image;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ImageService {

    public  static  String UPLOAD_DIR = "/opt/homebrew/etc/tomcat/webapps/";


    public ImageService() {
    }

    private static final String CLOUD_NAME = "dx2kgjjmf";
    private static final String API_KEY = "697595945272171";
    private static final String API_SECRET = "WrVSbjorHuscT_uCeJlXDbHulpI";

    private static final String CLOUDINARY_FOLDER = "medicines/";


    public String guardarImagen(MultipartFile file) throws IOException {
        //byte[] bytes = file.getBytes();
        //Path path = Paths.get(UPLOAD_DIR + file.getOriginalFilename());
        //Files.write(path, bytes);

        byte[] bytes = file.getBytes();

        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", CLOUD_NAME,
                "api_key", API_KEY,
                "api_secret", API_SECRET
                ));

        Map uploadResult = cloudinary.uploader().upload(bytes, ObjectUtils.asMap(
                "folder", CLOUDINARY_FOLDER
        ));

        String imageUrl = (String) uploadResult.get("secure_url");

        return imageUrl;

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
