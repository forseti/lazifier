<?xml version="1.0" encoding="UTF-8"?>

<beans xmlns="http://www.springframework.org/schema/beans"
	   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	   xmlns:aop="http://www.springframework.org/schema/aop"
	   xmlns:context="http://www.springframework.org/schema/context"
	   xsi:schemaLocation="http://www.springframework.org/schema/beans
	   					   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
	   					   http://www.springframework.org/schema/aop
	   					   http://www.springframework.org/schema/aop/spring-aop-3.0.xsd
	   					   http://www.springframework.org/schema/context
	   					   http://www.springframework.org/schema/context/spring-context-3.0.xsd">
	<context:property-placeholder location="classpath*:application.properties" />   					   
	   					   
	<aop:aspectj-autoproxy />
	<context:annotation-config />
	<context:spring-configured />

	<context:component-scan base-package="${project.package}" />
	
	<bean class="org.springframework.scripting.support.ScriptFactoryPostProcessor">
		<property name="defaultRefreshCheckDelay" value="500" />
	</bean>
</beans>