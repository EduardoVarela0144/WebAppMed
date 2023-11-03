package mx.ulsa.eduardo_lpsw.service;

import lombok.AllArgsConstructor;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.repository.IUserRepository;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Service
@AllArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private IUserRepository userRepository;



    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {


        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("User not exists by Username or Email"));


        Set<GrantedAuthority> authorities = new HashSet<>();

        if(Objects.equals(user.getType(), "Admin")){
            authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        } else if (Objects.equals(user.getType(), "Doctor")) {
            authorities.add(new SimpleGrantedAuthority("ROLE_DOCTOR"));
        }else {
            authorities.add(new SimpleGrantedAuthority("ROLE_PATIENT"));
        }

        CustomUserDetails customUserDetails = new CustomUserDetails(
                email,
                user.getPassword(),
                authorities
        );

        customUserDetails.setUserId(user.getId_user());
        customUserDetails.setFullName(user.getName() + ' ' +  user.getApe_pat() + ' ' + user.getApe_mat());

        return customUserDetails;



    }


}