<?xml version="1.0" encoding="ISO-8859-1"?>
<web-app xmlns="http://java.sun.com/xml/ns/j2ee"
		 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		 xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd"
		 version="2.4">
	<!-- Context Parameters configurations -->
	<context-param>
		<param-name>webAppRootKey</param-name>
		<param-value>webapp.root</param-value>
	</context-param>

	<context-param>
		<param-name>log4jConfigLocation</param-name>
		<param-value>classpath:log4j.xml</param-value>
	</context-param>
	
	<context-param>
		<param-name>contextConfigLocation</param-name>
		<param-value>classpath*:*Context.xml</param-value>
	</context-param>
		 
	<!-- Filters configurations -->
	<filter>
		<filter-name>UrlRewriteFilter</filter-name>
		<filter-class>org.tuckey.web.filters.urlrewrite.UrlRewriteFilter</filter-class>
	</filter>
	
	<filter>
        <filter-name>encoding</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
        <init-param>
            <param-name>forceEncoding</param-name>
            <param-value>true</param-value>
        </init-param>
    </filter>

	<filter>
  		<filter-name>springSecurityFilterChain</filter-name>
  		<filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
	</filter>
   
    <filter>
        <filter-name>sitemesh</filter-name>
        <filter-class>com.opensymphony.sitemesh.webapp.SiteMeshFilter</filter-class>
    </filter>

	<filter-mapping>
		<filter-name>UrlRewriteFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
	            
    <filter-mapping>
        <filter-name>encoding</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>
  
  	<filter-mapping>
  		<filter-name>springSecurityFilterChain</filter-name>
  		<url-pattern>/*</url-pattern>
	</filter-mapping>   
    
    <filter-mapping>
        <filter-name>sitemesh</filter-name>
        <url-pattern>/*</url-pattern>
        <dispatcher>FORWARD</dispatcher>
        <dispatcher>REQUEST</dispatcher>
    </filter-mapping>
    
    <!-- Listeners configurations -->
    <listener>
        <listener-class>org.springframework.web.util.IntrospectorCleanupListener</listener-class>
    </listener>

    <listener>
		<listener-class>org.springframework.web.util.Log4jConfigListener</listener-class>
	</listener>
	
    <listener>
		<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
	</listener>

    <!-- Servlets configurations -->
	<servlet>
		<servlet-name>sitemesh-freemarker</servlet-name>
		<servlet-class>com.opensymphony.module.sitemesh.freemarker.FreemarkerDecoratorServlet</servlet-class>
		<init-param>
			<param-name>TemplatePath</param-name>
			<param-value>/</param-value>
		</init-param>
		<init-param>
			<param-name>default_encoding</param-name>
			<param-value>ISO-8859-1</param-value>
		</init-param>
		<init-param>
			<param-name>tag_syntax</param-name>
			<param-value>square_bracket</param-value>
		</init-param>
		<load-on-startup>1</load-on-startup>
	</servlet>	

	<servlet>
		<servlet-name>dispatcher</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value></param-value>
		</init-param>
		<load-on-startup>2</load-on-startup>
	</servlet>
	
	<servlet-mapping>
		<servlet-name>sitemesh-freemarker</servlet-name>
		<url-pattern>*.ftl</url-pattern>
	</servlet-mapping>
				
	<servlet-mapping>
		<servlet-name>dispatcher</servlet-name>
		<url-pattern>/app/*</url-pattern>
	</servlet-mapping>
	
	<welcome-file-list>
		<welcome-file>welcome.html</welcome-file>
	</welcome-file-list>
</web-app>