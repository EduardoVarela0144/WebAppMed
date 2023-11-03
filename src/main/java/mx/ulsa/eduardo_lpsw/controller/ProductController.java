package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.Product;
import mx.ulsa.eduardo_lpsw.service.ImageService;
import mx.ulsa.eduardo_lpsw.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;

@Controller
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    ImageService imageService;

    @PostMapping("/saveProduct")
    public String saveProduct(@RequestParam("file") MultipartFile file, Product Product, RedirectAttributes redirectAttributes) throws IOException {

        if(!file.isEmpty()){
            imageService.guardarImagen(file);
            Product.setUrl_image(file.getOriginalFilename());
        }



        if(productService.saveOrUpdateProduct(Product)){
            redirectAttributes.addFlashAttribute("message", "Registro exitoso");
            return "redirect:/dashboard?page=products";
        }
        redirectAttributes.addFlashAttribute("message","Error al registrar Medicina");
        return "redirect:/dashboard?page=products";
    }

    @GetMapping("/deleteProduct/{id}")
    public String deleteProduct(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (productService.deleteProduct(id)) {
            redirectAttributes.addFlashAttribute("message", "Medicina eliminada correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar Medicinas");
        }
        return "redirect:/dashboard?page=products";
    }

    @PostMapping("/editSaveProduct")
    public String editSaveProduct(Product Product, RedirectAttributes redirectAttributes) {
        if (productService.saveOrUpdateProduct(Product)) {
            redirectAttributes.addFlashAttribute("message", "Medicina actualizada correctamente");
            return "redirect:/dashboard?page=products";
        }

        redirectAttributes.addFlashAttribute("message", "Error al actualizar medicina");
        return "redirect:/dashboard?page=products";
    }
}
