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
package com.googlecode.lazifier.generate;

import java.util.Map;

import com.googlecode.lazifier.command.GenericCommand;
import com.googlecode.lazifier.command.Options;

/**
 * The GenerateCommand class. Extend the class to create a new command.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public abstract class GenerateCommand<O extends Options> extends GenericCommand<O> {
	// The generator
	private Generator<O> generator;

	// The types available
	private Map<String, String> types;
	
	// The default type
	private String defaultType = "";

	/**
	 * Instantiate GenerateCommand object.
	 * 
	 * @param usage
	 */
	public GenerateCommand(String usage) {
		super(usage);
	}
	
	/**
	 * Return the Generator
	 * 
	 * @return the generator
	 */
	protected Generator<O> getGenerator() {
		return generator;
	}
	
	/**
	 * Set the generator
	 * @param generator
	 */
	public void setGenerator(Generator<O> generator) {
		if (this.generator == null)
			this.generator = generator;
	}	
	
	/**
	 * 
	 * @return
	 */
	protected String getDefaultType() {
		return defaultType;
	}
		
	/**
	 * Set the types available.
	 * 
	 * @param types
	 */
	public void setTypes(Map<String, String> types) {
		if (this.types == null)
			this.types = types;
	}
	
	/**
	 * Get the types available
	 * 
	 * @return
	 */
	public Map<String, String> getTypes() {
		return types;
	}
	
	/**
	 * 
	 * @param defaultType
	 */
	public void setDefaultType(String defaultType) {
		if (this.defaultType == "" && defaultType != null)
			this.defaultType = defaultType;
	}
	
	/**
	 * Process the options.
	 */
	protected void processOptions(O options) throws Exception {
		preGenerate(options);
		generator.execute(options);
		postGenerate(options);
	}
	
	/**
	 * Pre generation process. Implement this class to do things before generation.
	 * 
	 * @param options
	 */
	protected void preGenerate(O options) {};
	
	/**
	 * Post generation process. Implement this class to do things after generation.
	 * 
	 * @param options
	 */
	protected void postGenerate(O options) {};
}