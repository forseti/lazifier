package ${baseTest_java.packageName};

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;

@ContextConfiguration(locations={"classpath*:${applicationContext_xml.fileName}",
								 "classpath*:${persistenceContext_xml.fileName}"})
public abstract class ${baseTest_java.className} extends AbstractTestNGSpringContextTests {
}