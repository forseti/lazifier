package ${loggingAspect_java.packageName};

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.CodeSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class ${loggingAspect_java.className} {
	/** The Constant AFTER. */
	private final static String AFTER  		   = "[AFTER]:";
	
	/** The Constant AFTER_THROWING. */
	private final static String AFTER_THROWING = "[AFTER_THROWING]:";
	
	/** The Constant BEFORE. */
	private final static String BEFORE 		   = "[BEFORE]:";
	
	/** The Constant EXCEPTION. */
	private final static String EXCEPTION	   = "[EXCEPTION]:";
	
	/** The Constant METHOD. */
	private final static String METHOD		   = "[METHOD]:";

	/** The Constant PARAMETER_NAME. */
	private final static String PARAMETER_NAME  = "[PARAMETER_NAME]:";
	
	/** The Constant PARAMETER_TYPE. */
	private final static String PARAMETER_TYPE  = "[PARAMETER_TYPE]:";

	/** The Constant PARAMETER_ARGUMENT. */
	private final static String PARAMETER_VALUE = "[PARAMETER_VALUE]:";
	
	/** The builder. */
	private final StringBuilder builder;
	
	/** The loggers. */
	private final Map<Class<?>, Logger> loggers;
	
	/**
	 * Instantiates a new logging.
	 */
	public ${loggingAspect_java.className}() {
		builder = new StringBuilder();
		loggers = Collections.synchronizedMap(new HashMap<Class<?>, Logger>());
	}
	
	/**
	 * Creates the logger.
	 * 
	 * @param _class the _class
	 * 
	 * @return the logger
	 */	
	private final Logger createLogger(Class<?> _class) {
		return LoggerFactory.getLogger(_class); 		
	}
	
	/**
	 * Retrieve logger.
	 * 
	 * @param joinPoint the join point
	 * 
	 * @return the logger
	 */
	private final Logger retrieveLogger(JoinPoint joinPoint) {		 
		Class<?> _class = joinPoint.getTarget().getClass();
		
		if (!loggers.containsKey(_class)) {
			Logger logger = createLogger(_class);
			loggers.put(_class, logger);
			return logger;
		}
			
		return loggers.get(_class);
	}
	
	/**
	 * Creates the message.
	 * 
	 * @param joinPoint the join point
	 * @param event the event
	 * 
	 * @return the string
	 */
	private final String createMessage(JoinPoint joinPoint, String event) {
		return createMessage(joinPoint, event, null); 
	}
	
	/**
	 * Creates the message.
	 * 
	 * @param joinPoint the join point
	 * @param event the event
	 * 
	 * @return the string
	 */
	private final String createMessage(JoinPoint joinPoint, String event, Exception exception) {
		// Reset the builder
		builder.setLength(0);
	
		Logger logger = retrieveLogger(joinPoint);
		CodeSignature signature = (CodeSignature) joinPoint.getSignature();
		
		// Get class' name.
		String className  = signature.getDeclaringTypeName();
		
		// Get method name and remove the class' name and its parameters.
		String methodName = signature.toLongString();
		methodName = methodName.replace(className.concat("."), "")
							   .replaceAll("\\(.*\\)", "");

		// Append the event and intercepted method.
		if (logger.isTraceEnabled() || (!logger.isTraceEnabled() && logger.isDebugEnabled())) 
			builder.append(event).append(METHOD)
			   	   .append(" ").append(methodName).append("\n");
		
		List<String> types = null;		
		Class<?>[] classes = signature.getParameterTypes();		

		String[] names = signature.getParameterNames();		
		
		for (Class<?> clazz: classes) {
			if (types == null)
				types = new ArrayList<String>();
			
			types.add(clazz.getName());
		}
		
		List<Object> values = null;
		
		// Add all argument.
		for (Object value: joinPoint.getArgs()) {
			if (values == null)
				values = new ArrayList<Object>();
			
			values.add(value);
		}
		
		if (names != null && types != null && values != null) {			
			if (logger.isDebugEnabled()) {
				for (int i = 0; i < names.length; i++) {
					builder.append(PARAMETER_NAME).append(i).append(":").append(names[i]).append("\n")
						   .append(PARAMETER_TYPE).append(i).append(":").append(types.get(i)).append("\n")
						   .append(PARAMETER_VALUE).append(i).append(":").append(values.get(i)).append("\n");
				}
			}
		}
		
		// Append exception.
		if (exception != null)
			builder.append(EXCEPTION).append(" ").append(exception).append("\n");
		
		return builder.toString().trim();
	}
	
	/**
	 * Debug.
	 * 
	 * @param logger the logger
	 * @param message the message
	 */
	private final void debug(JoinPoint joinPoint, String event) {
		Logger logger = retrieveLogger(joinPoint);
		
		if (logger.isDebugEnabled()) {
			String message = createMessage(joinPoint, event);
			logger.debug(message);
		}
	}
	
	/**
	 * Error.
	 * 
	 * @param logger the logger
	 * @param message the message
	 */	
	private final void error(JoinPoint joinPoint, String event, Exception exception) {
		Logger logger = retrieveLogger(joinPoint);
		
		if (logger.isErrorEnabled()) {
			String message = createMessage(joinPoint, event, exception);
			logger.error(message);
		}
	}
	
	/**
	 * Info.
	 * 
	 * @param logger the logger
	 * @param message the message
	 */	
	private final void info(JoinPoint joinPoint, String event) {
		Logger logger = retrieveLogger(joinPoint);
		
		if (logger.isInfoEnabled()) {
			String message = createMessage(joinPoint, event);
			logger.info(message);
		}
	}
	
	/**
	 * Trace.
	 * 
	 * @param logger the logger
	 * @param message the message
	 */
	private final void trace(JoinPoint joinPoint, String event) {
		Logger logger = retrieveLogger(joinPoint);
		
		if (logger.isTraceEnabled()) {
			String message = createMessage(joinPoint, event);
			logger.trace(message);
		}
	}
	
	/**
	 * Warn.
	 * 
	 * @param logger the logger
	 * @param message the message
	 */
	private final void warn(JoinPoint joinPoint, String event) {
		Logger logger = retrieveLogger(joinPoint);
		
		if (logger.isWarnEnabled()) {
			String message = createMessage(joinPoint, event);
			logger.warn(message);
		}
	}

	/**
	 * After.
	 * 
	 * @param joinPoint the join point
	 */
	@After("${architectureAspect_java.qualifiedClassName}.anyExecution()")
	public final void logAfter(JoinPoint joinPoint) {
		trace(joinPoint, AFTER);
		debug(joinPoint, AFTER);
	}

	/**
	 * After throwing.
	 * 
	 * @param joinPoint the join point
	 * @param exception the exception
	 * 
	 * @throws Exception the exception
	 */
	@AfterThrowing(pointcut="${architectureAspect_java.qualifiedClassName}.anyExecution()",
				   throwing="exception")
	public final void logAfterThrowing(JoinPoint joinPoint, Exception exception) throws Exception {
		error(joinPoint, AFTER_THROWING, exception);
		// Throw exception after log it.
		throw exception;
	}

	/**
	 * Before.
	 * 
	 * @param joinPoint the join point
	 */	
	@Before("${architectureAspect_java.qualifiedClassName}.anyExecution()")
	public final void logBefore(JoinPoint joinPoint) {
		trace(joinPoint, BEFORE);
		debug(joinPoint, AFTER);
	}
}