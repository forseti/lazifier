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
package com.googlecode.lazifier;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;

import com.googlecode.lazifier.command.CommandLoader;

// TODO: Auto-generated Javadoc
/**
 * The Main class. This is the main class of lazifier.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class Main {
	private static final Logger logger = LoggerFactory.getLogger(Main.class);
	
	public static void main(String[] args) {
		try {
			Assert.isTrue(args.length > 0, "No argument is provided.");
			
			// Retrieve the context location from command line
			String contextLocation = System.getProperty("context.location");
			
			new CommandLoader(contextLocation).execute(args);
			
		} catch(Exception e) {
			logger.error(e.getMessage());
			System.err.println("Usage: lazy command [options...]");
		}
	}
}