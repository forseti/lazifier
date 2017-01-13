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
 * The ConstraintValue class. This class contains constraint message and value
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class ConstraintValue {
	// The value
	private final String value;
	
	// The message
	private final String message;
	
	/**
	 * Instantiate a new ConstraintValue object.
	 * 
	 * @param value
	 * @param message
	 * @throws Exception
	 */
	public ConstraintValue(Object value, String message) throws Exception {
		// TODO Auto-generated constructor stub
		if (!(value instanceof Boolean) && !(value instanceof Double) &&
			!(value instanceof Float) && !(value instanceof Integer) &&
			!(value instanceof Long) && !(value instanceof String))
			throw new Exception("Constraint value must be one of Boolean, Folat, Double, Integer, Long, or String");
		
		this.value = String.valueOf(value);
		this.message = message;
	}
	
	/**
	 * Get the value.
	 * 
	 * @return value
	 */
	public String getValue() {
		return value;
	}

	/**
	 * Get the message
	 * 
	 * @return message
	 */
	public String getMessage() {
		return message;
	}
}