[#import "/macro/jdbc.ftl" as jdbc /]
[#import "/macro/hibernate.ftl" as hibernate /]
[#import "/macro/maven.ftl" as maven /]
[#assign result=project.package?matches("^([a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)*)\\.([a-zA-Z0-9_-]+)$")/]
<profilesXml>     
	<profiles>              		  
		<profile>
			<id>development</id>
			<activation>
				<activeByDefault>true</activeByDefault>
			</activation>
			<properties>
				<!-- JDBC Settings -->
				<!-- Dependency Settings -->
[@maven.jdbc_dependency database="${project.database}"/]
				<!-- Application Settings -->
				<jdbc.driver>[@jdbc.driver database="${project.database}" /]</jdbc.driver>
				<jdbc.url>[@jdbc.url database="${project.database}" name="${result?groups[3]}" /]</jdbc.url>
				<jdbc.username></jdbc.username>
				<jdbc.password></jdbc.password>
				<!-- Hibernate Settings -->
				<hibernate.dialect>[@hibernate.dialect database="${project.database}"/]</hibernate.dialect>
				<hibernate.hbm2ddl.auto>create</hibernate.hbm2ddl.auto>
				<!-- Log4J Settings -->
				<log4j.appender>CONSOLE</log4j.appender>
			</properties>
		</profile>
	
		<profile>
			<id>test</id>
			<properties>
				<!-- JDBC Settings -->
				<!-- Dependency Settings -->
[@maven.jdbc_dependency database="${project.database}"/]
				<!-- Application Settings -->
				<jdbc.driver>[@jdbc.driver database="${project.database}" /]</jdbc.driver>
				<jdbc.url>[@jdbc.url database="${project.database}" name="${result?groups[3]}" /]</jdbc.url>
				<jdbc.username></jdbc.username>
				<jdbc.password></jdbc.password>
				<!-- Hibernate Settings -->
				<hibernate.dialect>[@hibernate.dialect database="${project.database}"/]</hibernate.dialect>
				<hibernate.hbm2ddl.auto>update</hibernate.hbm2ddl.auto>
				<!-- Log4J Settings -->
				<log4j.appender>FILE</log4j.appender>
			</properties>
		</profile>
		
		<profile>
			<id>production</id>
			<properties>
				<!-- JDBC Settings -->
				<!-- Dependency Settings -->
[@maven.jdbc_dependency database="${project.database}"/]
				<!-- Application Settings -->
				<jdbc.driver>[@jdbc.driver database="${project.database}" /]</jdbc.driver>
				<jdbc.url>[@jdbc.url database="${project.database}" name="${result?groups[3]}" /]</jdbc.url>
				<jdbc.username></jdbc.username>
				<jdbc.password></jdbc.password>
				<!-- Hibernate Settings -->
				<hibernate.dialect>[@hibernate.dialect database="${project.database}"/]</hibernate.dialect>
				<hibernate.hbm2ddl.auto>update</hibernate.hbm2ddl.auto>
				<!-- Log4J Settings -->
				<log4j.appender>FILE</log4j.appender>
			</properties>
		</profile>
	</profiles>
</profilesXml>