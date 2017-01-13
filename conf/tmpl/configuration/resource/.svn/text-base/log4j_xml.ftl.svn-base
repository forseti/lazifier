<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE log4j:configuration SYSTEM "log4j.dtd">

[#assign result=project.package?matches("^([a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)*)\\.([a-zA-Z0-9_-]+)$")/]
<log4j:configuration xmlns:log4j="http://jakarta.apache.org/log4j/">
  	<appender name="CONSOLE" class="org.apache.log4j.ConsoleAppender">
    	<param name="target" value="System.out"/>
		<layout class="org.apache.log4j.PatternLayout">
			<param name="ConversionPattern" value="%d %p %c - %m %n" />
		</layout>
	</appender>
	
	<appender name="FILE" class="org.apache.log4j.DailyRollingFileAppender">
		<param name="file" value="[#noparse]${webapp.root}[/#noparse]/WEB-INF/logs/${result?groups[3]}.log"/>
		<param name="append" value="false" />
        <param name="encoding" value="UTF-8" />
		<param name="datePattern" value=".yyyy-MM-dd"/>
		<layout class="org.apache.log4j.PatternLayout">
			<param name="ConversionPattern" value="%d %p %c - %m %n" />
		</layout>
	</appender>
	
	<logger name="${project.package}">
  		<level value="TRACE"/> 
	</logger>
	
	<root>
		<priority value="INFO" />
		<appender-ref ref="[#noparse]${log4j.appender}[/#noparse]" />
	</root>
</log4j:configuration>