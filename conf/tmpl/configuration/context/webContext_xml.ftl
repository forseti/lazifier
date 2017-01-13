<?xml version="1.0" encoding="UTF-8"?>

<beans xmlns="http://www.springframework.org/schema/beans"
	   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	   xmlns:util="http://www.springframework.org/schema/util"
	   xsi:schemaLocation="http://www.springframework.org/schema/beans
					       http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
					       http://www.springframework.org/schema/util
						   http://www.springframework.org/schema/util/spring-util-3.0.xsd">
	<!-- Resource Bundles configurations -->
	<bean id="messageSource"
		class="org.springframework.context.support.ReloadableResourceBundleMessageSource">
		<property name="basenames">
			<list>
				<value>classpath:messages</value>
				<value>classpath:errors</value>
			</list>
		</property>
		<property name="useCodeAsDefaultMessage" value="true" />
	</bean>
	
	<!-- View Resolver -->
	<bean id="viewResolver"
		  class="org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver">
		<property name="cache" value="true" />
		<property name="prefix" value="/" />
		<property name="suffix" value=".ftl" />
		<property name="exposeSpringMacroHelpers" value="true" />
		<property name="requestContextAttribute" value="rc" />
        <property name="order" value="0" />
	</bean>

	<bean id="freemarkerConfig"
		  class="org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer">
		<property name="templateLoaderPath" value="/WEB-INF/freemarker/" />
		<property name="freemarkerSettings">
			<util:properties location="classpath:freemarker.properties" />
		</property>
		<property name="freemarkerVariables">
			<map>
				<entry key="xml_escape">
					<bean class="freemarker.template.utility.XmlEscape" />
				</entry>
			</map>
		</property>
	</bean>
	
	<!-- Creates default conversion service -->
	<bean id="conversionService" class="org.springframework.format.support.FormattingConversionServiceFactoryBean" />
	
	<!-- Creates the JSR-303 Validator -->
	<bean id="validator" class="org.springframework.validation.beanvalidation.LocalValidatorFactoryBean" />
	
	<!-- Handler adapters -->
	<bean class="org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter">
	    <property name="webBindingInitializer">
        	<!-- Configures Spring MVC Binding Initializer -->
        	<bean class="org.springframework.web.bind.support.ConfigurableWebBindingInitializer">
        		<property name="conversionService" ref="conversionService" />
        		<property name="validator" ref="validator" />
        	</bean>
    	</property>
	</bean>
		
	<bean class="org.springframework.web.servlet.mvc.SimpleControllerHandlerAdapter" />
	
	<!-- Handler mappings configurations -->
	<bean class="org.springframework.web.servlet.mvc.annotation.DefaultAnnotationHandlerMapping">
		<property name="useDefaultSuffixPattern" value="false" />
	</bean>
	
	<!-- Resolvers configurations -->
	<bean id="exceptionResolver"
		  class="org.springframework.web.servlet.handler.SimpleMappingExceptionResolver">
		<property name="exceptionMappings">
			<util:properties location="classpath:exceptions.properties" />
		</property>
	</bean>
	
	<bean id="multipartResolver"
		  class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
		<property name="maxUploadSize" value="150000" />
	</bean>
</beans>