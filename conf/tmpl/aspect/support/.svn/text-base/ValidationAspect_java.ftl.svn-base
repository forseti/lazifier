[#assign validationPackage]
	${validationAspect_java.packageName};
[/#assign]
[#assign validateablePackage]
	${validateable_java.packageName};
[/#assign]
package ${validationAspect_java.packageName};

import java.lang.annotation.Annotation;

import org.apache.commons.lang.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
[#if validationPackage != validateablePackage]

import ${validateable_java.qualifiedClassName};
[/#if]

@Aspect
public class ${validationAspect_java.className} implements ApplicationContextAware {
	private Logger logger = LoggerFactory.getLogger(${validationAspect_java.className}.class);
	private ApplicationContext applicationContext;
	
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		// TODO Auto-generated method stub
		if (this.applicationContext == null)
			this.applicationContext = applicationContext;
	}

	private void validate(String[] validators, Object target, BindingResult result) {
		for (String validator: validators) {
			// Get the validator bean from application context and validate the target bean
			if (applicationContext != null) {
				((Validator) applicationContext.getBean(validator)).validate(target, result);
				
				if (result.hasErrors())
					break;
			} else {
				logger.error("Application context is not provided therefore the validation is skipped");
				break;
			}
		}
	}

	@Before("execution(* (@org.springframework.stereotype.Controller *..*Controller).*(..)) && " +
		 	"@annotation(validateable)")
	public void validate(JoinPoint joinPoint, ${validateable_java.className} validateable) throws Throwable {
		Object target = null;
		BindingResult result = null;
		
		// Get validators' id/names
		String[] validators = validateable.validators();
		
		// Get the arguments
		Object[] args = joinPoint.getArgs();
		
		// Get annotations of the arguments
		Annotation[][] annotations = ((MethodSignature) joinPoint.getSignature()).getMethod()
																			   	 .getParameterAnnotations();

		// Check arguments array and retrieve the target bean and the BindingResult object
		for (int i = 0; i < args.length; i++) {
			if (target != null && result != null)
				break;			
			else if (args[i] instanceof BindingResult && result == null)
				result = (BindingResult) args[i];
			else if (annotations[i].length > 0 && target == null) {
				for (Annotation annotation: annotations[i])
					if (annotation.annotationType().isAssignableFrom(ModelAttribute.class)) {
						target = args[i];
						break;
					}
			} 
		}
		
		Assert.notNull(target, "Cannot find a parameter annotated by @ModelAttribute.");
		Assert.notNull(result, "Cannot find a parameter with BindingResult type.");
		
		if (validators.length == 0)
			validators = new String[] { StringUtils.uncapitalize(target.getClass().getSimpleName())
											  									  .concat("Validator") };
		
		validate(validators, target, result);
	}
}