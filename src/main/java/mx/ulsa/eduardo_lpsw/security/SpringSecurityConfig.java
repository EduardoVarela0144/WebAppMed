package mx.ulsa.eduardo_lpsw.security;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


import java.util.Collection;

@Configuration
@RequiredArgsConstructor
@EnableWebSecurity
@EnableMethodSecurity
public class SpringSecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http)
            throws Exception {
        http.
                csrf(AbstractHttpConfigurer::disable);
        http.exceptionHandling((exceptionHandling) ->
                exceptionHandling
                        .accessDeniedPage("/403")
        );
        http
                .authorizeHttpRequests((httpRequests) -> {
                    httpRequests
                            .requestMatchers(new AntPathRequestMatcher("/WEB-INF/**"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/css/**"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/images/**"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/js/**"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/home"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/health"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/medicine"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/news"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/clients"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/signUp"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/signUpSaveUser"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/complete_register"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/completeDoctorAccount/**"))
                            .permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/completePatientAccount/**"))
                            .permitAll()
                            .anyRequest()
                            .authenticated();
                })

                .formLogin((formLogin) -> {
                    formLogin.loginPage("/login")
                            .loginProcessingUrl("/login")
                            .successHandler((request, response, authentication) -> {
                                Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
                                for (GrantedAuthority authority : authorities) {
                                    if (authority.getAuthority().equals("ROLE_ADMIN")) {
                                        response.sendRedirect("dashboard");
                                    } else if (authority.getAuthority().equals("ROLE_DOCTOR")) {
                                        response.sendRedirect("appointments");
                                    } else if (authority.getAuthority().equals("ROLE_PATIENT")){
                                        response.sendRedirect("doctors");

                                    }
                                }
                            })
                            .permitAll();
                })
                .logout((logout) -> {
                    logout.logoutUrl("/logout")
                            .logoutSuccessUrl("/home")
                            .permitAll();
                });


        return http.build();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


}
