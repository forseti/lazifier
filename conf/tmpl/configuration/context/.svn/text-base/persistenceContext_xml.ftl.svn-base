<beans xmlns="http://www.springframework.org/schema/beans"
	   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	   xmlns:aop="http://www.springframework.org/schema/aop"
	   xmlns:tx="http://www.springframework.org/schema/tx"
	   xmlns:util="http://www.springframework.org/schema/util"
	   xsi:schemaLocation="http://www.springframework.org/schema/beans
	   					   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
	   					   http://www.springframework.org/schema/aop
						   http://www.springframework.org/schema/aop/spring-aop-3.0.xsd
	   					   http://www.springframework.org/schema/tx
						   http://www.springframework.org/schema/tx/spring-tx-3.0.xsd
					       http://www.springframework.org/schema/util
						   http://www.springframework.org/schema/util/spring-util-3.0.xsd">
	<bean id="dataSource"
		  class="org.springframework.jdbc.datasource.LazyConnectionDataSourceProxy">
		<property name="targetDataSource">
		    <bean class="com.mchange.v2.c3p0.ComboPooledDataSource"
				  destroy-method="close">
[#noparse]
		        <property name="driverClass" value="${jdbc.driver}" />
		        <property name="jdbcUrl" value="${jdbc.url}" />
		        <property name="user" value="${jdbc.username}" />
		        <property name="password" value="${jdbc.password}" />
[/#noparse]
		    </bean>
		</property>
	</bean>
	
	<bean id="lobHandler" class="org.springframework.jdbc.support.lob.DefaultLobHandler" />
	
	<bean id="sessionFactory" class="org.springframework.orm.hibernate3.annotation.AnnotationSessionFactoryBean"
		  depends-on="dataSource" destroy-method="destroy">
		<property name="configLocation" value="classpath:hibernate.cfg.xml" />  
		<property name="dataSource" ref="dataSource" />
		<property name="lobHandler" ref="lobHandler" />
		<property name="mappingLocations" value="classpath*:${project.package?replace(".","/")}/**/*.hbm.xml" />
		<property name="packagesToScan" value="${project.package?replace(".","/")}/**/*" />
		<property name="hibernateProperties">
			<util:properties location="classpath:hibernate.properties" />
		</property>
	</bean>		
			
	<bean class="org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor" />
	
	<bean id="transactionManager" class="org.springframework.orm.hibernate3.HibernateTransactionManager"
		  depends-on="sessionFactory">
		<property name="sessionFactory" ref="sessionFactory" />
	</bean>
	
	<tx:annotation-driven transaction-manager="transactionManager" mode="aspectj" />
	
	<bean id="transactionTemplate" class="org.springframework.transaction.support.TransactionTemplate"
		  depends-on="transactionManager">
		<property name="transactionManager" ref="transactionManager" />
	</bean>
	
	<bean id="jdbcTemplate"
		  class="org.springframework.jdbc.core.JdbcTemplate"
		  depends-on="dataSource">
		<property name="dataSource" ref="dataSource" />
	</bean>
	
	<bean id="namedParameterJdbcTemplate"
		  class="org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate"
		  depends-on="jdbcTemplate">
		<constructor-arg ref="jdbcTemplate" />
	</bean>
	
	<bean id="simpleJdbcTemplate"
		  class="org.springframework.jdbc.core.simple.SimpleJdbcTemplate"
		  depends-on="jdbcTemplate">
		<constructor-arg ref="jdbcTemplate" />
	</bean>
</beans>