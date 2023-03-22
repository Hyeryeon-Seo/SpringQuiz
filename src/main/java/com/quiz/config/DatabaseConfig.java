package com.quiz.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@MapperScan(basePackages = "com.quiz.*")  // mapper scan 추가!!!
@Configuration
public class DatabaseConfig {

	 @Bean // 맨 아래 걸로 springframework.core. ..보라색 import
	    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
	        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
	        sessionFactory.setDataSource(dataSource);

	        // 아래 classpath대로 패키지-xml 만들기, *자리에 테이블명
	        Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*Mapper.xml");
	        sessionFactory.setMapperLocations(res);

	        return sessionFactory.getObject();
	    }
	 
}
