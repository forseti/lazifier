package ${repositoryTest_java.packageName};

import static org.easymock.classextension.EasyMock.createStrictMock;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

[#if model_java??]
import ${model_java.qualifiedClassName};
[/#if]
import ${repositoryImpl_java.qualifiedClassName};

@Test(suiteName="${repositoryTest_java.name}Suite", testName="${repositoryTest_java.defaultName}", sequential=true)
public class ${repositoryTest_java.className} {
	private Session session;
	private SessionFactory sessionFactory;
[#if model_java??]
	private ${model_java.className} ${model_java.defaultName};
[/#if]
	private ${repositoryImpl_java.className} ${repository_java.defaultName};
	
	@BeforeTest
	public void beforeTest() {
		session = createStrictMock(Session.class);
		sessionFactory = createStrictMock(SessionFactory.class);
[#if model_java??]
		${model_java.defaultName} = new ${model_java.className}();
[/#if]
		${repository_java.defaultName} = new ${repositoryImpl_java.className}();
		${repository_java.defaultName}.setSessionFactory(sessionFactory);
	}
}