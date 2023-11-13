package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.PathImages;
import mx.ulsa.eduardo_lpsw.service.ImageService;
import mx.ulsa.eduardo_lpsw.service.PathImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller

public class PathImageController {
    @Autowired
    PathImageService pathImageService;


    @PostMapping("/savePathImage")
    public String savePathImage(PathImages path, RedirectAttributes redirectAttributes) {
        try {
            if (pathImageService.saveOrUpdatePathImages(path)) {
                redirectAttributes.addFlashAttribute("message", "Registro exitoso");
                return "redirect:/dashboard?page=path";
            } else {
                redirectAttributes.addFlashAttribute("message", "Error al guardar path");
                return "redirect:/dashboard?page=path";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error inesperado al guardar path");
            return "redirect:/dashboard?page=path";
        }
    }


    @GetMapping("/deletePathImage/{id}")
    public String deletePathImage(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (pathImageService.deletePathImages(id)) {
            redirectAttributes.addFlashAttribute("message", "Path eliminado correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar path");
        }
        return "redirect:/dashboard?page=path";
    }

    @PostMapping("/editSavePathImage")
    public String editSavePathImage(PathImages path, RedirectAttributes redirectAttributes) {
        if (pathImageService.saveOrUpdatePathImages(path)) {

            //ImageService.UPLOAD_DIR = path.getPath_image();

            redirectAttributes.addFlashAttribute("message", "Path actualizado correctamente");
            return "redirect:/dashboard?page=path";
        }

        redirectAttributes.addFlashAttribute("message", "Error al actualizar Path");
        return "redirect:/dashboard?page=path";
    }
}
