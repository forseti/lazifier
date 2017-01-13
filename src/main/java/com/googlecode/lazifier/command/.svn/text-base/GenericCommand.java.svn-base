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

import java.lang.reflect.Array;
import java.lang.reflect.ParameterizedType;

import org.kohsuke.args4j.CmdLineException;
import org.kohsuke.args4j.CmdLineParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// TODO: Auto-generated Javadoc
/**
 * The GenericCommand class. Extend this class to create a new command class.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public abstract class GenericCommand<O extends Options> extends AbstractCommand {
	/** The Constant logger. */
	private static final Logger logger = LoggerFactory.getLogger(GenericCommand.class);
	
	/** The clazz. */
	private final Class<O> clazz;
	
	/** The usage. */
	private String usage;

	/**
	 * Instantiates a new GenericCommand object.
	 * 
	 * @param usage the usage
	 */
	@SuppressWarnings("unchecked")
	public GenericCommand(String usage) {
		// TODO Auto-generated constructor stub
		clazz = (Class<O>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		this.usage = usage;
	}
	
	/* (non-Javadoc)
	 * @see com.googlecode.lazifier.command.Command#execute(java.lang.String[])
	 */
	public void execute(String[] args) {
		// TODO Auto-generated method stub
		CmdLineParser parser = null;
		
		try {
			// Instantiate the Options object.
			O options = clazz.newInstance();
			
			parser = new CmdLineParser(options);
			
			// Set the key (or generator name) to the Options object
			((Options) options).setKey(args[0]);
			
			// Remove the first argument because we no longer need it.
			args = removeFirstIndexOfArguments(args);
			
			parser.parseArgument(args);
			
			if (validateOptions(options))
				processOptions(options);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage());
		} catch (IllegalAccessException e) {
			logger.error(e.getMessage());
		} catch (CmdLineException e) {
			logger.error(e.getMessage());
			System.err.println("Usage: " + usage);
			System.err.println("Options available:");
			parser.printUsage(System.err);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	/**
	 * Remove the first index of arguments.
	 * 
	 * @param args
	 * @return
	 */
    private final String[] removeFirstIndexOfArguments(final String[] args) {
        if (args == null)
        	return args;
    	
    	Object source = (Object) args;
        
        int length = Array.getLength(source);
        
        Object target = Array.newInstance(source.getClass().getComponentType(), length - 1);
        
        System.arraycopy(source, 0, target, 0, 0);
        
        if (0 < length - 1)
            System.arraycopy(source, 1, target, 0, length - 1);
        
        return (String[]) target;
    }
	
	/**
	 * Process options.
	 * 
	 * @param options the options
	 */
	protected abstract void processOptions(O options) throws Exception;
	
	/**
	 * Validate options.
	 * 
	 * @param options the options
	 * 
	 * @throws CmdLineException the cmd line exception
	 */
	protected abstract boolean validateOptions(O options) throws CmdLineException;
}