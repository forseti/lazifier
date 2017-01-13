package ${repositoryImpl_java.packageName};

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

[#if baseRepositoryImpl_java??]
[#assign import=true /]
import ${baseRepositoryImpl_java.qualifiedClassName};
[#if entity_java?? && entity_java.packageName != repositoryImpl_java.packageName]
[#assign import=true /]
import ${entity_java.qualifiedClassName};
[/#if]
[/#if]
[#if repository_java.packageName != repositoryImpl_java.packageName]
[#assign import=true /]
import ${repository_java.qualifiedClassName};
[/#if]
[#if import??]

[/#if]
@Repository("${repository_java.defaultName}")
[@compress single_line=true]public class ${repositoryImpl_java.className}[#if baseRepositoryImpl_java??] extends ${baseRepositoryImpl_java.className}<[#t]
[#if entity_java??]${entity_java.className}, ${form.id.typeClassName}[#else],[/#if]>[/#if] implements ${repository_java.className} {[/@compress]
[#if baseRepositoryImpl_java??]
	@Autowired(required=true)
	public void setSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
[#else]
	private SessionFactory SessionFactory;

	@Autowired(required=true)
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.SessionFactory = sessionFactory;
	}
[/#if]
}