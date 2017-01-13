/*
 * Copyright 2010 Donny A. Wijaya
 *  
 * Licensed under the Apache License, Version 2.0 (the "License"); 
 * you may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at 
 * 
 * http://www.apache.org/licenses/LICENSE-2.0 
 * 
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
 * See the License for the specific language governing permissions and 
 * limitations under the License. 
 */
package com.googlecode.lazifier.command;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.BeanCreationException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

// TODO: Auto-generated Javadoc
/**
 * The CommandLoader class. The loader class loads command from Spring container.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class CommandLoader {
	/** The Constant logger. */
	private static final Logger logger = LoggerFactory.getLogger(CommandLoader.class);
	
	/** The context. */
	private ApplicationContext context;

	/**
	 * Instantiates a new command loader.
	 * 
	 * @param mainContextLocation the context location
	 */
	public CommandLoader(String contextLocation) {
		context = new ClassPathXmlApplicationContext("classpath:" + contextLocation);
		
		((ConfigurableApplicationContext) context).registerShutdownHook();
	}

	/**
	 * Execute the Command by loading it with arguments.
	 * 
	 * @param args
	 */
	public void execute(String[] args) {
		try {
			Command command = (Command) context.getBean(args[0], Command.class);
			command.execute(args);
		} catch (NoSuchBeanDefinitionException e) {
			logger.error("Command '{}' doesn't exist", args[0]);
		} catch (BeanCreationException e) {
			logger.error(e.getRootCause().getMessage());
		}
	}
}