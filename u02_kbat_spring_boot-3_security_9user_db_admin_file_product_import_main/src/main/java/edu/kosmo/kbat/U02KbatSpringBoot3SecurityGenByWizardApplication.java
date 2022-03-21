package edu.kosmo.kbat;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

import edu.kosmo.kbat.service.StorageProperties;
import edu.kosmo.kbat.service.StorageService;

@SpringBootApplication
@EnableConfigurationProperties(StorageProperties.class)
public class U02KbatSpringBoot3SecurityGenByWizardApplication {

	public static void main(String[] args) {
		SpringApplication.run(U02KbatSpringBoot3SecurityGenByWizardApplication.class, args);
	}
	/*
	@Bean
	CommandLineRunner init(StorageService storageService) {
		return (args) -> {
			storageService.deleteAll();
			storageService.init();
		};
	}
	*/
}
