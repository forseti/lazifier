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

import org.kohsuke.args4j.Option;

import com.googlecode.lazifier.command.Options;

/**
 * The CreateOptions class. This class is to store options from command line.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class CreateOptions extends Options {
	// Component's name
	@Option(name="-name", metaVar="VALUE", required=false, usage="The component's name")
	private String name = "";

	// Component's package
	@Option(name="-package", metaVar="VALUE", required=false, usage="The component's package")
	private String _package = "";

	/**
	 * Get the component's name
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * Get the component's package
	 * 
	 * @return package
	 */
	public String getPackage() {
		return _package;
	}
}