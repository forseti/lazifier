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
package com.googlecode.lazifier.help;

import java.util.HashMap;
import java.util.Map;

import com.googlecode.lazifier.command.AbstractCommand;

/**
 * The HelpCommand class. This class will display all the commands available in lazifier.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class HelpCommand extends AbstractCommand {
	// The commands
	private Map<String, String> commands = new HashMap<String, String>();
	
	/**
	 * Set the commands
	 * 
	 * @param commands
	 */
	public void setCommands(Map<String, String> commands) {
		this.commands = commands;
	}
	
	/**
	 * Print all the commands (ignoring the arguments).
	 */
	public void execute(String[] args) {
		// TODO Auto-generated method stub
		printItems("Commands available:", commands);
	}
}