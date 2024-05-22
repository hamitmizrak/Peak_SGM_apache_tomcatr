package com.hamitmizrak;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

	// http://localhost:9999/home
	@RequestMapping("/home")
	public String index() {
		return "Greetings from Spring Boot & Apache Maven & Apache Tomcat!";
	}

}