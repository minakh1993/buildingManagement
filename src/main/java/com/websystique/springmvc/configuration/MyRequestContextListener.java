package com.websystique.springmvc.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestContextListener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.annotation.WebListener;

@Configuration
@WebListener
public class MyRequestContextListener extends RequestContextListener {

    public MyRequestContextListener() {
        super();
    }

    @Override
    public void requestInitialized(ServletRequestEvent requestEvent) {
        super.requestInitialized(requestEvent);
    }

    @Override
    public void requestDestroyed(ServletRequestEvent requestEvent) {
        super.requestDestroyed(requestEvent);
    }
}
