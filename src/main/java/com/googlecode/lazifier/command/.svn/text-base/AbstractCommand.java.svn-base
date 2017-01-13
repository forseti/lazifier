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

import java.util.Map;
import java.util.Map.Entry;

import org.kohsuke.args4j.CmdLineException;
import org.springframework.util.Assert;

/**
 * The AbstractCommand class. The most basic class for Command.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public abstract class AbstractCommand implements Command {
	/**
	 * Print items available for options.
	 * 
	 * @param message
	 * @param items
	 */
	protected final void printItems(String message, Map<String, String> items) {
		Assert.notNull(message, "Parameter 'message' cannot be null");

		System.err.println(message);
		
		if (items != null)
			for (Entry<String, String> item: items.entrySet())
				System.err.println("- " + item.getKey() + " (" + item.getValue() + ")");
	}

	/**
	 * Throw cmd line exception.
	 * 
	 * @param flag the flag
	 * @param message the message
	 * 
	 * @throws CmdLineException the cmd line exception
	 */
	protected final void throwCmdLineException(boolean flag, String message) throws CmdLineException {
		if (flag) 
			throw new CmdLineException(message);
	}
}