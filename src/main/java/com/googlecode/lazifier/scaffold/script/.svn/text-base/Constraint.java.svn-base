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

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import org.springframework.util.ReflectionUtils;

import com.thoughtworks.qdox.model.Annotation;
import com.thoughtworks.qdox.model.JavaField;

/**
 * The Constraint class. This class to store constraints required for scaffolding.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class Constraint {
	// The constraint name
	private String name;
	
	// The constraint attributes
	private Map<String, ConstraintValue> attributes;
	
	/**
	 * Instantiate new Constraint object
	 * 
	 * @param name
	 * @throws Exception
	 */
	public Constraint(String name) throws Exception {
		this.name = name;
		attributes = new HashMap<String, ConstraintValue>();
	}
	
	/**
	 * Scan the annotations for constraints
	 * 
	 * @param annotations
	 */
	public void scanAnnotations(Annotation[] annotations) {
		for (Annotation annotation: annotations) {
			for (Method method: this.getClass().getDeclaredMethods()) {
				if (method.getName().startsWith("addAnnotationAs")) {
					method.setAccessible(true);
					ReflectionUtils.invokeMethod(method, this, new Object[] { annotation });
					method.setAccessible(false);
				}
			}
		}
	}
	
	/**
	 * Scan the field for constraints
	 * 
	 * @param field
	 */
	public void scanField(JavaField field) {
		for (Method method: this.getClass().getDeclaredMethods()) {
			if (method.getName().startsWith("addFieldAs")) {
				method.setAccessible(true);
				ReflectionUtils.invokeMethod(method, this, new Object[] { field });
				method.setAccessible(false);
			}
		}		
	}
	
	/**
	 * Get the name
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * Get the attributes
	 * 
	 * @return attributes
	 */
	public Map<String, ConstraintValue> getAttributes() {
		return attributes;
	}
	
	/**
	 * Add an attribute
	 * 
	 * @param key
	 * @param value
	 * @throws Exception
	 */
	protected void addAttribute(String key, ConstraintValue value) throws Exception {
		attributes.put(key, value);
	}
	
	/**
	 * Add attributes
	 * 
	 * @param attributes
	 * @throws Exception
	 */
	protected void addAttributes(Map<String, ConstraintValue> attributes) throws Exception {
		this.attributes.putAll(attributes);
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
	    
	    retValue.append("Constraint ( ")
	        .append(super.toString()).append(TAB)
	        .append("name = ").append(this.name).append(TAB)
	        .append("attributes = ").append(this.attributes).append(TAB)
	        .append(" )");
	    
	    return retValue.toString();
	}
}