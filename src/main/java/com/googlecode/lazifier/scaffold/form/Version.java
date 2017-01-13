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
 * The Version class.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class Version extends Input {
	private static final String VERSION_TYPE = "^(int|long|short|java\\.(lang\\.(Integer|Long|Short)))$";
	
	/**
	 * Instantiate a new Version object
	 * 
	 * @param name
	 * @param type
	 * @throws Exception
	 */
	public Version(String name, Type type) throws Exception {
		// TODO Auto-generated constructor stub
		super(name, type);
		isVersionType(type);
	}
	
	/**
	 * Check if the type is a Version
	 * 
	 * @param type
	 * @throws Exception
	 */
	private void isVersionType(Type type) throws Exception {
		if (!type.getValue().matches(VERSION_TYPE))
			throw new Exception("'" + this.getType() + "' is not a valid version type");
	}
}