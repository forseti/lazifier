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
package com.googlecode.lazifier.project;

import static org.springframework.util.StringUtils.hasText;

import java.util.Map;

import org.kohsuke.args4j.CmdLineException;

import com.googlecode.lazifier.generate.GenerateCommand;

/**
 * The ProjectCommand class. This class is a command for initializing a project.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class ProjectCommand extends GenerateCommand<ProjectOptions> {
	// Default database provider
	private String defaultDatabase = "";
	
	// Database providers available
	private Map<String, String> databases;
	
	/**
	 * Instantiate the ProjectCommand object.
	 */
	public ProjectCommand() {
		// TODO Auto-generated constructor stub
		super("lazy configure [-type value] [-database value] -package value");
	}

	/**
	 * Set the default database
	 * 
	 * @param defaultDatabase
	 */
	public void setDefaultDatabase(String defaultDatabase) {
		if (this.defaultDatabase == "" && defaultDatabase != null)
			this.defaultDatabase = defaultDatabase;
	}
	
	/**
	 * Set the database providers
	 * 
	 * @param databases
	 */
	public void setDatabases(Map<String, String> databases) {
		if (this.databases == null)
			this.databases = databases;
	}

	/**
	 * Validate the options
	 */
	protected boolean validateOptions(ProjectOptions options) throws CmdLineException {
		String type = options.getType().toLowerCase();
		String database = options.getDatabase().toLowerCase();
		
		if (!hasText(type)) {
			type = getDefaultType();
			options.setType(type);
		}
		
		if (!hasText(database)) {
			database = defaultDatabase;
			options.setDatabase(database);
		}
		
		if (type.equals("list")) {
			printItems("Types available: ", getTypes());
			return false;
		}

		if (database.equals("list")) {
			printItems("Databases available: ", databases);
			return false;
		}
		
		throwCmdLineException(!hasText(options.getPackage()),
							  "'package' is not provided.");
		
		throwCmdLineException((getTypes().get(type) == null),
				  			  "'type' is not available. Use '-type list'" + 
				  			  " to list the available types");
		
		throwCmdLineException((databases.get(database) == null),
		  					  "'database' is not available. Use '-database list'" + 
		  					  " to list the available databases");
		
		return true;
	}
}