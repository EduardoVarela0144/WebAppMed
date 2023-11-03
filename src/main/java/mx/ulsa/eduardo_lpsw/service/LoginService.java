package mx.ulsa.eduardo_lpsw.service;

import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.repository.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class LoginService {

    @Autowired
    IUserRepository userRepo;

    public User login(String email, String password) {
        User user = null;
        if (email != null) {

            user = userRepo.findByUsername(email);

            if (user != null) {
                if (user.getPassword().equals(password)) {
                    return user;
                }
            }

        }

        return user;

    }
}
