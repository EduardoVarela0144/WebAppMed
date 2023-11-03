package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.Cart;
import mx.ulsa.eduardo_lpsw.models.CartElements;
import mx.ulsa.eduardo_lpsw.models.Product;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Objects;

@Controller
public class CartController {
    @Autowired
    CartService cartService;
    @Autowired
    UserService userService;
    @Autowired
    CartProductService cartProductService;
    @Autowired
    ProductService productService;



    @GetMapping("/user_cart")
    public String saveCart(@AuthenticationPrincipal CustomUserDetails customUserDetails, RedirectAttributes redirectAttributes, Model model) {


        User user =  userService.getUserById(customUserDetails.getUserId());
        Cart existingCart = cartService.findCartByUserId(user);

        if (existingCart != null) {
            redirectAttributes.addFlashAttribute("message", "El usuario ya tiene un carrito asociado.");
            model.addAttribute("listCart", cartProductService.getAllCartsProductsByUser(existingCart));


        } else {
            Cart newCart = new Cart();
            newCart.setId_user(user);
            if (cartService.saveOrUpdateCart(newCart)) {
                redirectAttributes.addFlashAttribute("message", "Registro exitoso");
            } else {
                redirectAttributes.addFlashAttribute("message", "Error al registrar el carrito");
            }
        }

        return "redirect:/cart";
    }


    @GetMapping("/deleteCart/{id}")
    public String deleteCart(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (cartService.deleteCart(id)) {
            redirectAttributes.addFlashAttribute("message", "Carrito eliminado correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar carrito");
        }
        return "redirect:/cart";
    }

    @PostMapping("/editSaveCart")
    public String editSaveCart(Cart cart, RedirectAttributes redirectAttributes) {
        if (cartService.saveOrUpdateCart(cart)) {
            redirectAttributes.addFlashAttribute("message", "Carrito actualizado correctamente");
            return "redirect:/cart";
        }

        redirectAttributes.addFlashAttribute("message", "Error al actualizar Carrito");
        return "redirect:/cart";
    }

    @PostMapping("/cleanCart/{id}")
    public String cleanCart(@PathVariable Integer id, RedirectAttributes redirectAttributes, @AuthenticationPrincipal CustomUserDetails customUserDetails) {

        User user = userService.getUserById(customUserDetails.getUserId());
        Cart existingCart = cartService.findCartByUserId(user);


        List<CartElements> cartElements = cartProductService.getAllCartsProductsByUser(existingCart);

        for (CartElements existingCartItem : cartElements) {
            Product product = productService.getProductById(existingCartItem.getProduct().getId_product());
            if(Objects.equals(product.getId_product(), existingCartItem.getProduct().getId_product())){
                product.setStock(product.getStock() - existingCartItem.getQuantity());
            }

        }

        if (cartService.cleanCart(id)) {
            redirectAttributes.addFlashAttribute("message", "Carrito eliminado correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar carrito");
        }
        return "redirect:/cart";
    }

    @PostMapping("/addToCart/{id}")
    public String addToCart(@PathVariable Integer id, RedirectAttributes redirectAttributes) {

        CartElements cartElements = cartProductService.getCartProductById(id);

        if (cartElements.getQuantity() < cartElements.getProduct().getStock()) {
            cartElements.setQuantity(cartElements.getQuantity() + 1);
            cartProductService.saveOrUpdateCartProduct(cartElements);
        }

        return "redirect:/cart";
    }

    @PostMapping("/removeToCart/{id}")
    public String removeToCart(@PathVariable Integer id, RedirectAttributes redirectAttributes) {

        CartElements cartElements = cartProductService.getCartProductById(id);

        if (cartElements.getQuantity() > 1) {
            cartElements.setQuantity(cartElements.getQuantity() - 1);
            cartProductService.saveOrUpdateCartProduct(cartElements);
        }

        return "redirect:/cart";
    }




}
