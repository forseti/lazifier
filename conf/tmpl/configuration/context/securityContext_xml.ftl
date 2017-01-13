<?xml version="1.0" encoding="UTF-8"?>

<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:security="http://www.springframework.org/schema/security"
  	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  	xsi:schemaLocation="http://www.springframework.org/schema/beans 
  						http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
              			http://www.springframework.org/schema/security 
              			http://www.springframework.org/schema/security/spring-security-3.0.xsd">  

	<bean id="stringDigester" class="org.jasypt.digest.StandardStringDigester">
		<property name="algorithm" value="SHA-1" />
		<property name="iterations" value="100000" />
	</bean>

<!--	   					   
	<bean id="passwordEncoder" class="org.jasypt.spring.security2.PasswordEncoder">
		<property name="stringDigester" ref="stringDigester" />
	</bean>
-->

	<security:http auto-config="true">
		<security:intercept-url pattern="/app/secure/**" access="ROLE_USER" />
	</security:http>
	
	<security:authentication-manager>
		<security:authentication-provider>
	    	<security:user-service>
	        	<security:user name="user" password="user" authorities="ROLE_USER" />
	    	</security:user-service>
		</security:authentication-provider>		
	</security:authentication-manager>
</beans>