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
package com.googlecode.lazifier.create;

import static org.springframework.util.StringUtils.hasText;

import org.kohsuke.args4j.CmdLineException;
import org.springframework.util.StringUtils;

import com.googlecode.lazifier.generate.GenerateCommand;

/**
 * The CreateCommand class. This command is for creating components of an application.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class CreateCommand extends GenerateCommand<CreateOptions> {
	/**
	 * Instantiate the CreateCommand object.
	 */
	public CreateCommand() {
		super("lazy create -type value -package value -name value");
	}
	
	/**
	 * Validate the options.
	 * 
	 * @return boolean
	 */
	protected boolean validateOptions(CreateOptions options) throws CmdLineException {
		String type = options.getType().toLowerCase();
		
		if (!hasText(type)) {
			type = getDefaultType();
			options.setType(type);
		}		
		
		if (type.equals("list")) {
			printItems("Types available: ", getTypes());
			
			return false;
		}
		
		throwCmdLineException(!StringUtils.hasText(options.getName()),
							  "'name' is not provided.");

		throwCmdLineException(!StringUtils.hasText(options.getPackage()),
							  "'package' is not provided.");

		throwCmdLineException(!StringUtils.hasText(options.getType()),
							  "'type' is not provided. Use '-type list'" + 
							  " to list the available types");
		
		throwCmdLineException((getTypes().get(type) == null),
		  					  "'type' is not available. Use: '-type list'" + 
		  					  " to list the available types");
		
		return true;
	}
}