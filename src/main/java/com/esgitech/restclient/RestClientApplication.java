package com.esgitech.restclient;

import com.esgitech.restclient.entity.Student;
import com.esgitech.restclient.repository.StudentRep;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class RestClientApplication {

    public static void main(String[] args) {
        SpringApplication.run(RestClientApplication.class, args);
    }
    @Bean
    CommandLineRunner start(StudentRep studentRep) {
        return args -> {
            studentRep.save(new Student(null, "riahi", "samia"));
            studentRep.save(new Student(null, "ben salah", "mohamed"));
            studentRep.save(new Student(null, "saadi", "ali"));
        };
    }

}
