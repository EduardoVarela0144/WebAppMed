package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.Cart;
import mx.ulsa.eduardo_lpsw.models.CartElements;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.service.CartProductService;
import mx.ulsa.eduardo_lpsw.service.CartService;
import mx.ulsa.eduardo_lpsw.service.CustomUserDetails;
import mx.ulsa.eduardo_lpsw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class CartProductController {
    @Autowired
    CartProductService cartProductService;
    @Autowired
    UserService userService;
    @Autowired
    CartService cartService;

    @PostMapping("/saveCartProduct")
    public String saveCart(@AuthenticationPrincipal CustomUserDetails customUserDetails, CartElements cart, RedirectAttributes redirectAttributes) {
        User user = userService.getUserById(customUserDetails.getUserId());
        Cart existingCart = cartService.findCartByUserId(user);

        boolean productExistsInCart = false;

        List<CartElements> cartElements = cartProductService.getAllCartsProductsByUser(existingCart);

        for (CartElements existingCartItem : cartElements) {
            if (existingCartItem.getId_product().equals(cart.getId_product())) {
                existingCartItem.setQuantity(existingCartItem.getQuantity() + cart.getQuantity());
                cartProductService.saveOrUpdateCartProduct(existingCartItem);
                productExistsInCart = true;
                break;
            }
        }

        if (!productExistsInCart) {
            cart.setId_cart(existingCart);
            cartProductService.saveOrUpdateCartProduct(cart);
        }

        redirectAttributes.addFlashAttribute("message", "Registro exitoso");
        return "redirect:/user_cart";
    }


    @GetMapping("/deleteCartProduct/{id}")
    public String deleteCart(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (cartProductService.deleteCartProduct(id)) {
            redirectAttributes.addFlashAttribute("message", "Producto del carrito eliminado correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar producto del carrito");
        }
        return "redirect:/user_cart";
    }

    @PostMapping("/editSaveCartProduct")
    public String editSaveCart(CartElements cart, RedirectAttributes redirectAttributes) {
        if (cartProductService.saveOrUpdateCartProduct(cart)) {
            redirectAttributes.addFlashAttribute("message", "Elemento del carrito actualizado correctamente");
            return "redirect:/cart";
        }

        redirectAttributes.addFlashAttribute("message", "Error al actualizar Elemento del carrito");
        return "redirect:/cart";
    }

}
