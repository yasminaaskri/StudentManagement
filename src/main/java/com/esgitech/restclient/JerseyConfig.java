package com.esgitech.restclient;
import com.esgitech.restclient.controller.StudentRest;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.servlet.ServletProperties;
import org.springframework.stereotype.Component;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class JerseyConfig extends ResourceConfig {
    public JerseyConfig() {
        register(StudentRest.class);
        // Enable forwarding on 404 errors
        property(ServletProperties.FILTER_FORWARD_ON_404, true);

    }
}

