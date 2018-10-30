package com.websystique.springmvc.configuration;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.websystique.springmvc")
public class AppConfig extends WebMvcConfigurerAdapter {

	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");

		return viewResolver;
	}


	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/js/");
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/css/");
		registry.addResourceHandler("/avatar/**").addResourceLocations("/WEB-INF/avatar/");
		registry.addResourceHandler("/vendor/**").addResourceLocations("/WEB-INF/vendor/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/fonts/");


		//registry.addResourceHandler("/views/**").addResourceLocations("/WEB-INF/views/");
	}


	@Bean
	public MessageSource messageSource() {
	    ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
	    messageSource.setBasename("messages");
		messageSource.setDefaultEncoding("UTF-8");
		return messageSource;
	}

	@Bean
	public LocaleResolver localeResolver(){
		SessionLocaleResolver  resolver = new SessionLocaleResolver();
		resolver.setDefaultLocale(new Locale("fa"));
		return resolver;
	}


	//introducing the global exception handler
//	@Bean
//	HandlerExceptionResolver customExceptionResolver () {
//		return new GlobalExceptionHandler();
//	}


//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new homeInterceptor());
//        //registry.addInterceptor(new TransactionInterceptor()).addPathPatterns("/person/save/*");
//    }

//    @Bean
//    public homeInterceptor pagePopulationInterceptor() {
//        return new homeInterceptor();
//    }

//    @Override
//    public void addFormatters (FormatterRegistry registry) {
//        registry.addConverter(new BasicConverter());
//    }

//    @Bean(name="conversionService")
//    public ConversionService getConversionService() {
//        ConversionServiceFactoryBean bean = new ConversionServiceFactoryBean();
//        bean.setConverters(getConverters());
//        bean.afterPropertiesSet();
//        ConversionService object = bean.getObject();
//        return object;
//    }
//
//    private Set<Converter> getConverters() {
//        Set<Converter> converters = new HashSet<Converter>();
//
//        converters.add(new BasicConverter());
//
//
//        return converters;
//    }

//
//	@Configuration
//	public class MyConfiguration {
//
//		@Bean
//		public FilterRegistrationBean corsFilter() {
//			UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
//			CorsConfiguration config = new CorsConfiguration();
//			config.setAllowCredentials(true);
//			config.addAllowedOrigin("http://domain1.com");
//			config.addAllowedHeader("*");
//			config.addAllowedMethod("*");
//			source.registerCorsConfiguration("/**", config);
//			FilterRegistrationBean bean = new FilterRegistrationBean(new CorsFilter(source));
//			bean.setOrder(0);
//			return bean;
//		}
//	}


}

