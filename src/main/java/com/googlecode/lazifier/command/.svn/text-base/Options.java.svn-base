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

import org.kohsuke.args4j.Option;

/**
 * The Options class. The base of all Options classes.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public abstract class Options {
	// The key or the generation type
	private String key;
	
	@Option(name="-type", metaVar="VALUE", required=false, 
			usage="The type to generate.\nUse '-type list' to list the available types")
	private String type = "";
	
	/**
	 * Set the key (or generator name)
	 * 
	 * @param key
	 */
	public void setKey(String key) {
		if (this.key == null)
			this.key = key;
	}
	
	/**
	 * Get the key (or generator name)
	 * 
	 * @return String
	 */
	public String getKey() {
		return key;
	}

	/**
	 * Get the type
	 * 
	 * @return String
	 */
	public String getType() {
		return type;
	}
	
	/**
	 * Set the type.
	 * 
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}
}