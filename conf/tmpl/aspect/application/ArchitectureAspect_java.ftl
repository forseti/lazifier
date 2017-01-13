package ${architectureAspect_java.packageName};

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class ${architectureAspect_java.className} {
	@Pointcut("execution(* (@org.springframework.stereotype.Controller ${project.package}..*Controller).*(..))")
	public final void controllerExecution() {}
	
	@Pointcut("execution(* (@javax.persistence.Entity ${project.package}..*).*(..))")
	public final void entityExecution() {}

	@Pointcut("execution(* (@org.springframework.stereotype.Repository ${project.package}..*Repository*).*(..))")
	public final void repositoryExecution() {}

	@Pointcut("execution(* (@org.springframework.stereotype.Service ${project.package}..*Service*).*(..))")
	public final void serviceExecution() {}

	@Pointcut("controllerExecution() || "
			  + "entityExecution() || "
			  + "repositoryExecution() || "
			  + "serviceExecution()")
	public void anyExecution() {}
}