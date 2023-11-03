package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.Cart;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.repository.ICartProductsRepository;
import mx.ulsa.eduardo_lpsw.repository.ICartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CartService {
    
    @Autowired
    ICartRepository cartProductRepo;
    @Autowired
    ICartProductsRepository realCartProductRepository;


    public List<Cart> getAllCart(){
        List<Cart> catList = new ArrayList<Cart>();
        cartProductRepo.findAll().forEach(cartProduct -> catList.add(cartProduct));
        return catList;
    }


    public Cart getCartById(Integer id) {
        return cartProductRepo.findById(id).get();
    }

    public boolean saveOrUpdateCart(Cart cartProduct){
        Cart updateCart = cartProductRepo.save(cartProduct);

        if(cartProductRepo.findById(updateCart.getId_cart()) != null) {

            return true;

        }

        return false;
    }

    public boolean deleteCart(Integer id) {
        cartProductRepo.deleteById(id);
        if (cartProductRepo.findById(id) != null) {
            return true;
        }
        return false;
    }

    public Cart findCartByUserId(User user) {
        Optional<Cart> cartOptional = cartProductRepo.findByUser(user);
        return cartOptional.orElse(null);
    }

    public boolean cleanCart(Integer id) {
        realCartProductRepository.deleteByCart(cartProductRepo.findById(id));
        if (cartProductRepo.findById(id) != null) {
            return true;
        }
        return false;
    }


}
