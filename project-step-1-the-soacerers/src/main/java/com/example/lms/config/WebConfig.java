// src/main/java/com/example/lms/WebConfig.java
package com.example.lms.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class WebConfig implements WebMvcConfigurer {
  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry
      .addResourceHandler("/uploads/**", "/files/**")
      .addResourceLocations("file:uploads/");
  }
  
}
