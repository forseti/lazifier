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
package com.googlecode.lazifier.scaffold.script;

/**
 * The Include class. This class contains informations for scaffolding process.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class Include {
	// The name of the JavaScript framework
	private String name;
	
	// Include date
	private boolean date = false;
	
	// Include validation
	private boolean validation = false;
	
	/**
	 * Get the name
	 * 
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * Set the name
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * Get date
	 * 
	 * @return date
	 */
	public boolean isDate() {
		return date;
	}
	
	/**
	 * Set date
	 * 
	 * @param date
	 */
	public void setDate(boolean date) {
		this.date = date;
	}
	
	/**
	 * Get validation
	 * 
	 * @return validation
	 */
	public boolean isValidation() {
		return validation;
	}
	
	/**
	 * Set validation
	 * 
	 * @param validation
	 */
	public void setValidation(boolean validation) {
		this.validation = validation;
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
	    
	    retValue.append("Include ( ")
	        .append(super.toString()).append(TAB)
	        .append("date = ").append(this.date).append(TAB)
	        .append("validation = ").append(this.validation).append(TAB)
	        .append(" )");
	    
	    return retValue.toString();
	}
	
	
}