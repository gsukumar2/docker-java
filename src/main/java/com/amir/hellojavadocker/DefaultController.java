package com.amir.hellojavadocker;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class DefaultController {
	@RequestMapping
	public String hello(){
		return "Hello";
	}
}
