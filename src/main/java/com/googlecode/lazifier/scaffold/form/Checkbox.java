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
package com.googlecode.lazifier.scaffold.form;

import com.thoughtworks.qdox.model.Type;

/**
 * The Checkbox class. 
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class Checkbox extends Input {
	// The CHECKBOX_TYPE constant
	private static final String CHECKBOX_TYPE = "^(boolean|java\\.lang\\.Boolean)$";
	
	/**
	 * Instantiate the Checkbox object
	 * 
	 * @param name
	 * @param type
	 * @throws Exception
	 */
	public Checkbox(String name, Type type) throws Exception {
		// TODO Auto-generated constructor stub
		super(name, type);
		isCheckboxType(type);
	}
	
	/**
	 * Check if the type is checkbox type
	 * 
	 * @param type
	 * @throws Exception
	 */
	private void isCheckboxType(Type type) throws Exception {
		if (!type.getValue().matches(CHECKBOX_TYPE))
			throw new Exception("'" + this.getType() + "' is not a valid checkbox type");
	}
}