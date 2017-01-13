package ${serviceTest_java.packageName};

import static org.easymock.classextension.EasyMock.createStrictMock;

import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

[#if model_java??]
import ${model_java.qualifiedClassName};
[/#if]
[#if repository_java??]
import ${repository_java.qualifiedClassName};
[/#if]
import ${serviceImpl_java.qualifiedClassName};

@Test(suiteName="${serviceTest_java.name}Suite", testName="${serviceTest_java.defaultName}", sequential=true)
public class ${serviceTest_java.className} {
[#if model_java??]
	private ${model_java.className} ${model_java.defaultName};
[/#if]
[#if repository_java??]
	private ${repository_java.className} ${repository_java.defaultName};
[/#if]
	private ${serviceImpl_java.className} ${service_java.defaultName};
	
	@BeforeTest
	public void beforeTest() {
[#if model_java??]
		${model_java.defaultName} = new ${model_java.className}();
[/#if]
[#if repository_java??]
		${repository_java.defaultName} = createStrictMock(${repository_java.className}.class);
[/#if]
		${service_java.defaultName} = new ${serviceImpl_java.className}();
[#if repository_java??]
		${service_java.defaultName}.set${repository_java.className}(${repository_java.defaultName});
[/#if]
	}
}