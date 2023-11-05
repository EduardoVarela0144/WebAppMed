package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.CartElements;
import mx.ulsa.eduardo_lpsw.models.Product;
import mx.ulsa.eduardo_lpsw.repository.ICartProductsRepository;
import mx.ulsa.eduardo_lpsw.repository.IProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    @Autowired
    IProductRepository productRepo;
    @Autowired
    ICartProductsRepository cartProductsRepository;

    public List<Product> getAllProducts(){
        List<Product> catList = new ArrayList<Product>();
        productRepo.findAll().forEach(product -> catList.add(product));
        return catList;
    }


    public Product getProductById(Integer id) {
        return productRepo.findById(id).get();
    }

    public boolean saveOrUpdateProduct(Product product){
        Product updateProduct = productRepo.save(product);

        if(productRepo.findById(updateProduct.getId_product()) != null) {

            return true;

        }

        return false;
    }

    public boolean deleteProduct(Integer id) {
        cartProductsRepository.deleteByProduct(productRepo.findById(id));
        productRepo.deleteById(id);
        if (productRepo.findById(id) != null) {
            return true;
        }
        return false;
    }
}
