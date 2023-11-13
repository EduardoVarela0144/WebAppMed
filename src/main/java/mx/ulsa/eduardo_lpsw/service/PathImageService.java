package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.PathImages;
import mx.ulsa.eduardo_lpsw.repository.IPathImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service

public class PathImageService {

    @Autowired
    IPathImageRepository pathImageRepo;

    public List<PathImages> getAllPathImage(){
        List<PathImages> catList = new ArrayList<PathImages>();
        pathImageRepo.findAll().forEach(payment -> catList.add(payment));
        return catList;
    }


    public PathImages getPathById(Integer id) {
        return pathImageRepo.findById(id).get();
    }

    public boolean saveOrUpdatePathImages(PathImages payments){
        PathImages updatePathImages = pathImageRepo.save(payments);

        if(pathImageRepo.findById(updatePathImages.getId_path()) != null) {

            return true;

        }

        return false;
    }

    public boolean deletePathImages(Integer id) {
        pathImageRepo.deleteById(id);
        if (pathImageRepo.findById(id) != null) {
            return true;
        }
        return false;
    }
}
