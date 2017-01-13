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
package com.googlecode.lazifier.scaffold;

import org.kohsuke.args4j.Option;

import com.googlecode.lazifier.command.Options;

/**
 * The ScaffoldOptions class. The class to holds scaffold options from command line
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class ScaffoldOptions extends Options {
	// The scaffold's target name
	@Option(name="-name", metaVar="VALUE", required=false, usage="The scaffold's target name")
	private String name = "";

	// The scaffold's target package
	@Option(name="-package", metaVar="VALUE", required=false, usage="The scaffold's target package")
	private String _package = "";
	
	/**
	 * Get the name
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * Get the package
	 * 
	 * @return package
	 */
	public String getPackage() {
		return _package;
	}

	/**
	 * Constructs a <code>String</code> with all attributes
	 * in name = value format.
	 *
	 * @return a <code>String</code> representation 
	 * of this object.
	 */
	public String toString()
	{
	    final String TAB = "    ";
	
	    StringBuilder retValue = new StringBuilder();
	    
	    retValue.append("ScaffoldOptions ( ")
	        .append(super.toString()).append(TAB)
	        .append("name = ").append(this.name).append(TAB)
	        .append("_package = ").append(this._package).append(TAB)
	        .append("type = ").append(this.getType()).append(TAB)
	        .append(" )");
	    
	    return retValue.toString();
	}
}