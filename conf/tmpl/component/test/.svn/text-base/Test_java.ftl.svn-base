package ${test_java.packageName};
[#if !baseTest_java??]

import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
[/#if]
import org.testng.annotations.Test;
[#if baseTest_java??]

import ${baseTest_java.qualifiedClassName};
[/#if] 

@Test(suiteName="${test_java.name}Suite", testName="${test_java.defaultName}", sequential=true)
public class ${test_java.className} extends [#if baseTest_java??]${baseTest_java.className}[#else]AbstractTestNGSpringContextTests[/#if] {
}