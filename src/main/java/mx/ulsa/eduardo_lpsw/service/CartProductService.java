package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.Cart;
import mx.ulsa.eduardo_lpsw.models.CartElements;
import mx.ulsa.eduardo_lpsw.repository.ICartProductsRepository;
import mx.ulsa.eduardo_lpsw.repository.ICartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartProductService {
    @Autowired
    ICartProductsRepository cartProductRepo;
    @Autowired
    ICartRepository cartRepository;

    public List<CartElements> getAllCartProducts(){
        List<CartElements> catList = new ArrayList<CartElements>();
        cartProductRepo.findAll().forEach(cartProduct -> catList.add(cartProduct));
        return catList;
    }


    public CartElements getCartProductById(Integer id) {
        return cartProductRepo.findById(id).get();
    }

    public boolean saveOrUpdateCartProduct(CartElements cartProduct){
        CartElements updateCartProduct = cartProductRepo.save(cartProduct);

        if(cartProductRepo.findById(updateCartProduct.getId_cart_elements()) != null) {

            return true;

        }

        return false;
    }

    public boolean deleteCartProduct(Integer id) {
        cartProductRepo.deleteById(id);
        if (cartProductRepo.findById(id) != null) {
            return true;
        }
        return false;
    }

    public List<CartElements> getAllCartsProductsByUser(Cart cart){
        List<CartElements> catList = new ArrayList<CartElements>();
        cartProductRepo.finByCart(cart).forEach(cartElements -> catList.add(cartElements));
        return catList;
    }





}
