package ${facadeTest_java.packageName};

import org.easymock.classextension.EasyMock;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

[#if data_java??]
import ${data_java.qualifiedClassName};
[/#if]
[#if model_java??]
import ${model_java.qualifiedClassName};
[/#if]
import ${facadeImpl_java.qualifiedClassName};
[#if service_java??]
import ${service_java.qualifiedClassName};
[/#if]

@Test(suiteName="${facadeTest_java.name}Suite", testName="${facadeTest_java.defaultName}", sequential=true)
public class ${facadeTest_java.className} {
[#if model_java??]
	private ${model_java.className} ${model_java.defaultName};
[/#if]
[#if data_java??]
	private ${data_java.className} ${data_java.defaultName};
[/#if]
	private ${facadeImpl_java.className} ${facade_java.defaultName};
[#if service_java??]
	private ${service_java.className} ${service_java.defaultName};
[/#if]
	
	@BeforeTest
	public void beforeTest() {
[#if model_java??]
		${model_java.defaultName} = new ${model_java.className}();
[/#if]
[#if data_java??]
		${data_java.defaultName} = new ${data_java.className}();
[/#if]
		${facade_java.defaultName} = new ${facadeImpl_java.className}();
[#if service_java??]
		${service_java.defaultName} = EasyMock.createStrictMock(${service_java.className}.class);
[/#if]
	}
}