<project xmlns="http://maven.apache.org/POM/4.0.0"
		 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		 xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
  		 			    	 http://maven.apache.org/maven-v4_0_0.xsd">
[#assign result=project.package?matches("^([a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)*)\\.([a-zA-Z0-9_-]+)$")/]
	<modelVersion>4.0.0</modelVersion>
	<groupId>${result?groups[1]}</groupId>
	<artifactId>${result?groups[3]}</artifactId>
	<version>0.0.1</version>
	<name>${result?groups[3]}</name>
	<description>${result?groups[3]}</description>
	<url>http://</url>
	<packaging>war</packaging>

	<build>
		<directory>target</directory>
		<outputDirectory>target/classes</outputDirectory>
		<testOutputDirectory>target/test-classes</testOutputDirectory>
		
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-compiler-plugin</artifactId>
				<configuration>
					<compilerVersion>1.6</compilerVersion>
					<source>1.6</source>
					<target>1.6</target>
				</configuration>
			</plugin>

			<plugin>
				<groupId>org.codehaus.mojo</groupId>
				<artifactId>aspectj-maven-plugin</artifactId>
				<version>1.1</version>
				<executions>
					<execution>
						<id>compile</id>
						<phase>compile</phase>
						<configuration>
							<source>1.6</source>
							<target>1.6</target>
							<verbose>false</verbose>
							<outxml>true</outxml>
							<aspectLibraries>
								<aspectLibrary>
									<groupId>org.springframework</groupId>
									<artifactId>spring-aspects</artifactId>
								</aspectLibrary>
							</aspectLibraries>
						</configuration>
						<goals>
							<goal>compile</goal>
							<goal>test-compile</goal>
						</goals>
					</execution>
				</executions>
				<dependencies>
					<dependency>
						<groupId>org.aspectj</groupId>
						<artifactId>aspectjtools</artifactId>
						<version>1.6.4</version>
					</dependency>
					<dependency>
						<groupId>org.aspectj</groupId>
						<artifactId>aspectjweaver</artifactId>
						<version>1.6.4</version>
					</dependency>
				</dependencies>
			</plugin>

			<plugin>
				<artifactId>maven-antrun-plugin</artifactId>
			   	<executions>
			    	<execution>
			    		<id>clean-logs</id>
			        	<phase>prepare-package</phase>
			            <configuration>
			            	<tasks>
								<delete dir="src/main/webapp/WEB-INF/logs" includeemptydirs="true" quiet="true" />
			              	</tasks>
			            </configuration>
			        	<goals>
			            	<goal>run</goal>
			            </goals>
			    	</execution>
				</executions>
			</plugin>			

			<plugin>
				<groupId>org.codehaus.mojo</groupId>
				<artifactId>build-helper-maven-plugin</artifactId>
				<version>1.1</version>
				<executions>
					<execution>
						<id>add-source</id>
						<phase>generate-sources</phase>
						<goals>
							<goal>add-source</goal>
						</goals>
						<configuration>
							<sources>
								<source>src/main/java</source>
								<source>src/main/resources</source>
							</sources>
						</configuration>
					</execution>
					<execution>
						<id>add-test-source</id>
						<phase>generate-sources</phase>
						<goals>
							<goal>add-test-source</goal>
						</goals>
						<configuration>
							<sources>
								<source>src/test/java</source>
								<source>src/test/resources</source>
							</sources>
						</configuration>
					</execution>
				</executions>
			</plugin>
			
			<plugin>
		    	<groupId>org.apache.maven.plugins</groupId>
		    	<artifactId>maven-surefire-plugin</artifactId>
		    	<configuration>
		        	<testFailureIgnore>true</testFailureIgnore>
		     	</configuration>
		    </plugin>
		</plugins>
		
		<resources>
			<resource>
				<directory>src/main/java</directory>
				<filtering>false</filtering>
				<excludes>
					<exclude>**/*.java</exclude>
				</excludes>
			</resource>
			<resource>
				<directory>src/main/resources</directory>
				<filtering>true</filtering>
				<excludes>
					<exclude>**/*Context.xml</exclude>
				</excludes>
			</resource>
			<resource>
				<directory>src/main/resources</directory>
				<filtering>false</filtering>
				<includes>
					<include>**/*Context.xml</include>
				</includes>
			</resource>
		</resources>
	</build>
[#noparse]

	<dependencies>
		<!-- Container Dependencies -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-beans</artifactId>
			<version>${spring.framework.version}</version>
			<scope>compile</scope>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
			<version>${spring.framework.version}</version>
			<scope>compile</scope>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-core</artifactId>
			<version>${spring.framework.version}</version>
			<scope>compile</scope>
		</dependency>
		
		<dependency>
			<groupId>javax.annotation</groupId>
			<artifactId>jsr250-api</artifactId>
			<version>${annotation.version}</version>
		</dependency>

		<dependency>
			<groupId>javax.inject</groupId>
			<artifactId>inject-api</artifactId>
			<version>${inject.version}</version>
		</dependency> 

		<!-- AOP Dependencies -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-aop</artifactId>
			<version>${spring.framework.version}</version>
			<scope>compile</scope>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-aspects</artifactId>
			<version>${spring.framework.version}</version>
			<scope>compile</scope>
			<exclusions>
				<exclusion>
					<groupId>org.apache.ant</groupId>
					<artifactId>ant-optionals</artifactId>
				</exclusion>
				<exclusion>
					<groupId>aspectj</groupId>
					<artifactId>aspectjrt</artifactId>
				</exclusion>
				<exclusion>
					<groupId>org.aspectj</groupId>
					<artifactId>aspectjweaver</artifactId>
				</exclusion>
			</exclusions>
		</dependency>

		<dependency>
			<groupId>aopalliance</groupId>
			<artifactId>aopalliance</artifactId>
			<version>${aopalliance.version}</version>
			<scope>compile</scope>
		</dependency>

		<dependency>
			<groupId>org.aspectj</groupId>
			<artifactId>aspectjrt</artifactId>
			<version>${aspectj.version}</version>
			<scope>compile</scope>
		</dependency>
		
		<dependency>
			<groupId>org.aspectj</groupId>
			<artifactId>aspectjweaver</artifactId>
			<version>${aspectj.version}</version>
			<scope>compile</scope>
		</dependency>
		
		<!-- Persistence Dependencies -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-jdbc</artifactId>
			<version>${spring.framework.version}</version>
			<scope>compile</scope>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-orm</artifactId>
			<version>${spring.framework.version}</version>
			<scope>compile</scope>
		</dependency>

		<dependency>
			<groupId>c3p0</groupId>
			<artifactId>c3p0</artifactId>
			<version>${c3p0.version}</version>
			<scope>runtime</scope>
		</dependency>

        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-core</artifactId>
            <version>${hibernate.core.version}</version>
            <scope>compile</scope>
            <exclusions>
                <exclusion>
                    <groupId>javax.transaction</groupId>
                    <artifactId>jta</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>cglib</groupId>
                    <artifactId>cglib</artifactId>
                </exclusion>                
                <exclusion>
                    <groupId>cglib</groupId>
                    <artifactId>cglib-nodep</artifactId>
                </exclusion>
            </exclusions>
        </dependency>
        
        <dependency>
    		<groupId>org.hibernate</groupId>
    		<artifactId>hibernate-annotations</artifactId>
    		<version>${hibernate.annotations.version}</version>
            <scope>compile</scope>
		</dependency>
		
		<dependency>
    		<groupId>org.hibernate.javax.persistence</groupId>
    		<artifactId>hibernate-jpa-2.0-api</artifactId>
    		<version>${persistence.version}</version>
    		<scope>compile</scope>
		</dependency>

		<dependency>
		    <groupId>${jdbc.groupId}</groupId>
		    <artifactId>${jdbc.artifactId}</artifactId>
		    <version>${jdbc.version}</version>
		    <scope>runtime</scope>
		</dependency> 

		<!-- Transaction Dependencies -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-tx</artifactId>
			<version>${spring.framework.version}</version>
			<scope>compile</scope>
		</dependency>

		<dependency>
			<groupId>javax.transaction</groupId>
			<artifactId>jta</artifactId>
			<version>${transaction.version}</version>
			<scope>runtime</scope>
		</dependency>
		
		<!-- Server-side dependencies -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-web</artifactId>
			<version>${spring.framework.version}</version>
			<scope>compile</scope>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>${spring.framework.version}</version>
			<scope>compile</scope>
            <exclusions>
                <exclusion>
                    <groupId>javax.validation</groupId>
                    <artifactId>com.springsource.javax.validation</artifactId>
                </exclusion>
            </exclusions>
		</dependency>
		
		<dependency>
			<groupId>org.springframework.webflow</groupId>
			<artifactId>spring-js</artifactId>
			<version>${spring.js.version}</version>
			<scope>runtime</scope>
		</dependency>
		
		<dependency>
    		<groupId>javax.servlet</groupId>
    		<artifactId>servlet-api</artifactId>
    		<version>${servlet.version}</version>
			<scope>provided</scope>
		</dependency>
		
		<dependency>
			<groupId>org.tuckey</groupId>
			<artifactId>urlrewritefilter</artifactId>
			<version>${urlrewritefilter.version}</version>						
		</dependency>	

		<dependency>
			<groupId>org.freemarker</groupId>
			<artifactId>freemarker</artifactId>
			<version>${freemarker.version}</version>
		    <scope>runtime</scope>
			<exclusions>
				<exclusion>
					<groupId>org.apache.ant</groupId>
					<artifactId>ant</artifactId>
				</exclusion>
				<exclusion>
					<groupId>org.apache.ant</groupId>
					<artifactId>ant-launcher</artifactId>
				</exclusion>
			</exclusions>
		</dependency>

		<dependency>
		    <groupId>opensymphony</groupId>
		    <artifactId>sitemesh</artifactId>
		    <version>${sitemesh.version}</version>
		    <scope>runtime</scope>
		</dependency>
		
		<dependency>
    		<groupId>commons-fileupload</groupId>
    		<artifactId>commons-fileupload</artifactId>
    		<version>${commons.fileupload.version}</version>
    		<scope>compile</scope>
		</dependency>
		
		<!-- Security Dependencies -->
		<dependency>
			<groupId>org.springframework.security</groupId>
			<artifactId>spring-security-core</artifactId>
			<version>${spring.security.version}</version>
			<scope>compile</scope>
			<exclusions>
				<exclusion>
					<groupId>org.springframework</groupId>
					<artifactId>spring-support</artifactId>
				</exclusion>
			</exclusions>
		</dependency>

		<dependency>
			<groupId>org.springframework.security</groupId>
			<artifactId>spring-security-config</artifactId>
			<version>${spring.security.version}</version>
			<scope>compile</scope>
		</dependency>
		
		<dependency>
			<groupId>org.springframework.security</groupId>
			<artifactId>spring-security-web</artifactId>
			<version>${spring.security.version}</version>
			<scope>compile</scope>
		</dependency>
				
		<dependency>
			<groupId>org.springframework.security</groupId>
			<artifactId>spring-security-acl</artifactId>
			<version>${spring.security.version}</version>
			<scope>compile</scope>
		</dependency>
		
		<dependency>
			<groupId>org.springframework.security</groupId>
			<artifactId>spring-security-taglibs</artifactId>
			<version>${spring.security.version}</version>
			<scope>compile</scope>
		</dependency>

		<dependency>
			<groupId>org.jasypt</groupId>
			<artifactId>jasypt</artifactId>
			<version>${jasypt.version}</version>
			<scope>compile</scope>
		</dependency>

		<!-- Integration Dependencies -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context-support</artifactId>
			<version>${spring.framework.version}</version>
			<scope>compile</scope>
		</dependency>
		
		<!-- Validation Dependencies -->
		<dependency>
    		<groupId>org.hibernate</groupId>
    		<artifactId>hibernate-validator</artifactId>
    		<version>${hibernate.validator.version}</version>
    		<scope>compile</scope>
		</dependency>

		<!-- Utility Dependencies -->
    	<dependency>
    		<groupId>cglib</groupId>
    		<artifactId>cglib-nodep</artifactId>
    		<version>${cglib.version}</version>
    		<scope>runtime</scope>
		</dependency>
		
		<dependency>
			<groupId>commons-lang</groupId>
			<artifactId>commons-lang</artifactId>
			<version>${commons.lang.version}</version>
			<scope>compile</scope>
		</dependency>

		<dependency>
			<groupId>commons-collections</groupId>
			<artifactId>commons-collections</artifactId>
			<version>${commons.collections.version}</version>
			<scope>compile</scope>
		</dependency>
		
		<dependency>
    		<groupId>org.apache.commons</groupId>
    		<artifactId>commons-io</artifactId>
    		<version>${commons.io.version}</version>
    		<scope>compile</scope>
		</dependency> 
		
		<dependency>
    		<groupId>net.sf.ehcache</groupId>
    		<artifactId>ehcache</artifactId>
    		<version>${ehcache.version}</version>
    		<scope>runtime</scope>
		</dependency>

		<dependency>
    		<groupId>javassist</groupId>
    		<artifactId>javassist</artifactId>
    		<version>${javassist.version}</version>
    		<scope>runtime</scope>
		</dependency> 
		
		<dependency>
			<groupId>jdom</groupId>
			<artifactId>jdom</artifactId>
			<version>${jdom.version}</version>
			<scope>compile</scope>
		</dependency>

		<dependency>
			<groupId>org.codehaus.groovy</groupId>
			<artifactId>groovy-all</artifactId>
			<version>${groovy.version}</version>
			<scope>compile</scope>
			<exclusions>
				<exclusion>
					<groupId>org.apache.ant</groupId>
					<artifactId>ant</artifactId>
				</exclusion>
				<exclusion>
					<groupId>org.apache.ant</groupId>
					<artifactId>ant-launcher</artifactId>
				</exclusion>
				<exclusion>
					<groupId>jline</groupId>
					<artifactId>jline</artifactId>
				</exclusion>
			</exclusions>
		</dependency>

		<dependency>
			<groupId>joda-time</groupId>
			<artifactId>joda-time</artifactId>
			<version>${joda.time.version}</version>
			<scope>compile</scope>
		</dependency>

		<!-- Logging Dependencies -->
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-api</artifactId>
			<version>${slf4j.version}</version>
			<scope>compile</scope>
		</dependency>

		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-log4j12</artifactId>
			<version>${slf4j.version}</version>
			<scope>compile</scope>
		</dependency>

		<!-- Test dependencies -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-test</artifactId>
			<version>${spring.framework.version}</version>
			<scope>test</scope>
		</dependency>

		<dependency>
			<groupId>org.testng</groupId>
			<artifactId>testng</artifactId>
			<version>${testng.version}</version>
			<classifier>jdk15</classifier>
			<scope>test</scope>
		</dependency>
		
		<dependency>
		    <groupId>org.easymock</groupId>
		    <artifactId>easymock</artifactId>
		    <version>${easymock.version}</version>
		    <scope>test</scope>
		</dependency>
		
		<dependency>
    		<groupId>org.easymock</groupId>
    		<artifactId>easymockclassextension</artifactId>
    		<version>${easymock.version}</version>
		    <scope>test</scope>
		</dependency>
		
		<dependency>
		    <groupId>junit</groupId>
		    <artifactId>junit</artifactId>
		    <version>${junit.version}</version>
			<scope>test</scope>
		</dependency>
	</dependencies>
[/#noparse]
	
	<profiles>
		<profile>
			<activation>
				<property>
					<name>project</name>
					<value>refresh</value>
				</property>
			</activation>
			<build>
				<plugins>
					<plugin>
						<artifactId>maven-antrun-plugin</artifactId>
					   	<executions>
					    	<execution>
					    		<id>create-directories</id>
					        	<phase>clean</phase>
					            <configuration>
					            	<tasks>
										<mkdir dir="src/main/java" />
										<mkdir dir="src/main/resources" />
										<mkdir dir="src/main/webapp/images" />
										<mkdir dir="src/main/webapp/scripts" />
										<mkdir dir="src/main/webapp/scripts/local" />
										<mkdir dir="src/main/webapp/styles" />
										<mkdir dir="src/main/webapp/styles/local" />
										<mkdir dir="src/main/webapp/WEB-INF/decorators" />
										<mkdir dir="src/main/webapp/WEB-INF/freemarker" />
										<mkdir dir="src/test/java" />
										<mkdir dir="src/test/resources" />
					              	</tasks>
					            </configuration>
					        	<goals>
					            	<goal>run</goal>
					            </goals>
					    	</execution>
					    </executions>
					</plugin>
					
					<plugin>
						<groupId>org.apache.maven.plugins</groupId>
						<artifactId>maven-dependency-plugin</artifactId>
						<executions>
							<execution>
								<id>unpack-css</id>
								<phase>clean</phase>
								<configuration>
									<artifactItems>
										<artifactItem>
											<groupId>com.googlecode</groupId>
											<artifactId>css4mvc</artifactId>
											<version>[#noparse]${css4mvc.version}[/#noparse]</version>
											<type>jar</type>
											<overWrite>false</overWrite>
										</artifactItem>
									</artifactItems>
									<includes>emastic/**/*, fugue-sprite/**/*</includes>
									<outputDirectory>src/main/webapp/styles</outputDirectory>
								</configuration>
								<goals>
									<goal>unpack</goal>
								</goals>
							</execution>
							<execution>
								<id>unpack-js</id>
								<phase>clean</phase>
								<configuration>
									<artifactItems>
										<artifactItem>
											<groupId>com.googlecode</groupId>
											<artifactId>js4mvc</artifactId>
											<version>[#noparse]${js4mvc.version}[/#noparse]</version>
											<type>jar</type>
											<overWrite>false</overWrite>
										</artifactItem>
									</artifactItems>
									<includes>jquery/**/*</includes>
									<outputDirectory>src/main/webapp/scripts</outputDirectory>
								</configuration>
								<goals>
									<goal>unpack</goal>
								</goals>
							</execution>
						</executions>
					</plugin>
														
					<plugin>
		          		<groupId>org.apache.maven.plugins</groupId>
		          		<artifactId>maven-eclipse-plugin</artifactId>
		          		<version>2.5.1</version>
					   	<executions>
					    	<execution>
					        	<phase>clean</phase>
					        	<configuration>
					        		<workspace>../</workspace>
									<!-- <downloadSources>true</downloadSources>
          							<downloadJavadocs>true</downloadJavadocs> -->
									<projectnatures>
										<projectnature>org.eclipse.jdt.core.javanature</projectnature>
										<projectnature>org.springframework.ide.eclipse.core.springnature</projectnature>
									</projectnatures>
									<buildcommands>
										<buildcommand>org.eclipse.jdt.core.javabuilder</buildcommand>
										<buildcommand>org.springframework.ide.eclipse.core.springbuilder</buildcommand>
									</buildcommands>
					        	</configuration>
					        	<goals>
					            	<goal>configure-workspace</goal>
					            	<goal>clean</goal>
					            	<goal>eclipse</goal>
					            </goals>
					    	</execution>
						</executions>
		        	</plugin>
				</plugins>
			</build>
		</profile>
	</profiles>
	
	<properties>
		<!-- Spring dependencies -->
		<spring.framework.version>3.0.2.RELEASE</spring.framework.version>
		<!-- Container dependencies -->
		<annotation.version>1.0</annotation.version>
		<inject.version>1.0.0-PRD</inject.version>
		<!-- AOP dependencies -->
		<aopalliance.version>1.0</aopalliance.version>
		<aspectj.version>1.6.4</aspectj.version>
		<!-- Persistence dependencies -->
		<hibernate.core.version>3.5.0-Final</hibernate.core.version>
		<hibernate.annotations.version>3.5.0-Final</hibernate.annotations.version>
		<c3p0.version>0.9.1.2</c3p0.version>
		<persistence.version>1.0.0.Final</persistence.version>
		<transaction.version>1.1</transaction.version>
		<!-- Security dependencies -->
		<spring.security.version>3.0.2.RELEASE</spring.security.version>
		<jasypt.version>1.5</jasypt.version>
		<!-- Web dependencies -->
		<spring.js.version>2.0.7.RELEASE</spring.js.version>
		<servlet.version>2.5</servlet.version>
		<commons.fileupload.version>1.2.1</commons.fileupload.version>
		<freemarker.version>2.3.16</freemarker.version>
		<sitemesh.version>2.4.2</sitemesh.version>
		<urlrewritefilter.version>3.1.0</urlrewritefilter.version>
		<css4mvc.version>0.0.3</css4mvc.version>
		<js4mvc.version>0.0.3</js4mvc.version>
		<!-- Validation dependencies -->
		<hibernate.validator.version>4.0.2.GA</hibernate.validator.version>
		<!-- Utility dependencies -->
		<cglib.version>2.2</cglib.version>
		<commons.lang.version>2.4</commons.lang.version>
		<commons.io.version>1.3.2</commons.io.version>
		<commons.collections.version>3.2.1</commons.collections.version>
		<ehcache.version>1.6.0</ehcache.version>
		<groovy.version>1.6.2</groovy.version>
		<javassist.version>3.11.0.GA</javassist.version>
		<jdom.version>1.0</jdom.version>
		<joda.time.version>1.5.2</joda.time.version>
		<slf4j.version>1.5.6</slf4j.version>
		<!-- Test dependencies -->
		<testng.version>5.8</testng.version>
		<easymock.version>2.4</easymock.version>
		<junit.version>4.6</junit.version>
	</properties>

	<repositories>
		<repository>
			<id>ibiblio</id>
			<url>http://mirrors.ibiblio.org/pub/mirrors/maven2/</url>
		</repository>

		<repository>
			<id>java.net</id>
			<url>http://download.java.net/maven/2</url>
		</repository>

		<repository>
			<id>spring</id>
			<url>http://s3.amazonaws.com/maven.springframework.org/release</url>
		</repository>
		
		<repository>
  			<id>spring-milestone</id>
  			<url>http://maven.springframework.org/milestone</url>
 		</repository>

		<repository>
			<id>jboss</id>
			<url>http://repository.jboss.com/maven2/</url>
		</repository>		
		
		<repository>
			<id>css4mvc</id>
			<url>http://css4mvc.googlecode.com/svn/repo</url>
		</repository>
		
		<repository>
			<id>js4mvc</id>
			<url>http://js4mvc.googlecode.com/svn/repo</url>
		</repository>
	</repositories>	
</project>