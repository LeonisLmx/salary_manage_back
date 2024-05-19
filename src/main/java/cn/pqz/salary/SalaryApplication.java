package cn.pqz.salary;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.core.io.ClassPathResource;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.util.ResourceUtils;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

@SpringBootApplication
@EnableCaching
@EnableScheduling
@EnableTransactionManagement(proxyTargetClass = true)
public class SalaryApplication {


    public static void main(String[] args) throws IOException {
        SpringApplication.run(SalaryApplication.class, args);
    }
}
